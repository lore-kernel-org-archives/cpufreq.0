From: Sascha Kloss <sascha.kloss@gmx.de>
Subject: Solution for Dothan-CPU speedstep,
 Frequency below 600MHz and dynamic Vcore change
Date: Mon, 30 Jan 2006 21:01:32 +0000
Message-ID: <43DE7EAC.5000901@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020304060108040801020406"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------020304060108040801020406
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello all,

as already discovered by many others, the dothan core pentium m's are
fixed to frequencys listed by ACPI.

Patching the speedstep-centrino.c and turning off
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI mostly resulted in a non-working
cpufreq module.

The attached speedstep-centrino.c incorperates the sysfs-patch from
http://avkrok.net to dynamically change the Vcore and I added the 08
stepping revision which was neccesary to run cpufreq on my platform.

The file also enables frequencys below 600 MHz for the Pentium M 725
(see lines beginning from 265). Works pretty nice, but enhances the
battery life only a little bit (+20 Minutes on my first run fixed to
100Mhz).

Kind regards from Germany,
	Sascha Klo=DF

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFD3n6rSaINjT6N32YRAofHAJ40xsgFnx71Oo9AjxoltIoSqadSogCfcXE8
4cVDWKtfPnT4Y589dffq6tE=3D
=3D7Guv
-----END PGP SIGNATURE-----

--------------020304060108040801020406
Content-Type: text/plain;
 name="speedstep-centrino.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep-centrino.c"

/*
 * cpufreq driver for Enhanced SpeedStep, as found in Intel's Pentium
 * M (part of the Centrino chipset).
 *
 * Despite the "SpeedStep" in the name, this is almost entirely unlike
 * traditional SpeedStep.
 *
 * Modelled on speedstep.c
 *
 * Copyright (C) 2003 Jeremy Fitzhardinge <jeremy@goop.org>
 *
 * WARNING WARNING WARNING
 *
 * This driver manipulates the PERF_CTL MSR, which is only somewhat
 * documented.  While it seems to work on my laptop, it has not been
 * tested anywhere else, and it may not work for you, do strange
 * things or simply crash.
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/cpufreq.h>
#include <linux/config.h>
#include <linux/delay.h>
#include <linux/compiler.h>
#include <linux/ctype.h>

#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
#include <linux/acpi.h>
#include <acpi/processor.h>
#endif

#include <asm/msr.h>
#include <asm/processor.h>
#include <asm/cpufeature.h>

#include "speedstep-est-common.h"

#define PFX		"speedstep-centrino: "
#define MAINTAINER	"Jeremy Fitzhardinge <jeremy@goop.org>"

#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "speedstep-centrino", msg)


struct cpu_id
{
	__u8	x86;            /* CPU family */
	__u8	x86_model;	/* model */
	__u8	x86_mask;	/* stepping */
};

enum {
	CPU_BANIAS,
	CPU_DOTHAN_A1,
	CPU_DOTHAN_A2,
	CPU_DOTHAN_B0,
	CPU_DOTHAN_C0,
	CPU_DOTHAN_08,
};

static const struct cpu_id cpu_ids[] = {
	[CPU_BANIAS]	= { 6,  9, 5 },
	[CPU_DOTHAN_A1]	= { 6, 13, 1 },
	[CPU_DOTHAN_A2]	= { 6, 13, 2 },
	[CPU_DOTHAN_B0]	= { 6, 13, 6 },
	[CPU_DOTHAN_C0]	= { 6, 13, 8 },
	[CPU_DOTHAN_08]	= { 6, 13, 8 },
};
#define N_IDS	(sizeof(cpu_ids)/sizeof(cpu_ids[0]))

struct cpu_model
{
	const struct cpu_id *cpu_id;
	const char	*model_name;
	unsigned	max_freq; /* max clock in kHz */

	struct cpufreq_frequency_table *op_points; /* clock/voltage pairs */
};
static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x);

/* Operating points for current CPU */
static struct cpu_model *centrino_model[NR_CPUS];
static const struct cpu_id *centrino_cpu[NR_CPUS];

static struct cpufreq_driver centrino_driver;

#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE

#define VOLTAGE_TO_VID(mv) (((mv) - 700) / 16)
#define VID_TO_VOLTAGE(vid) ((vid) * 16 + 700)

/* Computes the correct form for IA32_PERF_CTL MSR for a particular
   frequency/voltage operating point; frequency in MHz, volts in mV.
   This is stored as "index" in the structure. */
#define OP(mhz, mv)							\
	{								\
		.frequency = (mhz) * 1000,				\
		.index = (((mhz)/100) << 8) | VOLTAGE_TO_VID(mv)		\
	}

/*
 * These voltage tables were derived from the Intel Pentium M
 * datasheet, document 25261202.pdf, Table 5.  I have verified they
 * are consistent with my IBM ThinkPad X31, which has a 1.3GHz Pentium
 * M.
 */

/* Ultra Low Voltage Intel Pentium M processor 900MHz (Banias) */
static struct cpufreq_frequency_table banias_900[] =
{
	OP(600,  844),
	OP(800,  988),
	OP(900, 1004),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Ultra Low Voltage Intel Pentium M processor 1000MHz (Banias) */
static struct cpufreq_frequency_table banias_1000[] =
{
	OP(600,   844),
	OP(800,   972),
	OP(900,   988),
	OP(1000, 1004),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Low Voltage Intel Pentium M processor 1.10GHz (Banias) */
static struct cpufreq_frequency_table banias_1100[] =
{
	OP( 600,  956),
	OP( 800, 1020),
	OP( 900, 1100),
	OP(1000, 1164),
	OP(1100, 1180),
	{ .frequency = CPUFREQ_TABLE_END }
};


/* Low Voltage Intel Pentium M processor 1.20GHz (Banias) */
static struct cpufreq_frequency_table banias_1200[] =
{
	OP( 600,  956),
	OP( 800, 1004),
	OP( 900, 1020),
	OP(1000, 1100),
	OP(1100, 1164),
	OP(1200, 1180),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 1.30GHz (Banias) */
static struct cpufreq_frequency_table banias_1300[] =
{
	OP( 600,  956),
	OP( 800, 1260),
	OP(1000, 1292),
	OP(1200, 1356),
	OP(1300, 1388),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 1.40GHz (Banias) */
static struct cpufreq_frequency_table banias_1400[] =
{
	OP( 600,  956),
	OP( 800, 1180),
	OP(1000, 1308),
	OP(1200, 1436),
	OP(1400, 1484),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 1.50GHz (Banias) */
static struct cpufreq_frequency_table banias_1500[] =
{
	OP( 600,  956),
	OP( 800, 1116),
	OP(1000, 1228),
	OP(1200, 1356),
	OP(1400, 1452),
	OP(1500, 1484),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 1.60GHz (Banias) */
static struct cpufreq_frequency_table banias_1600[] =
{
	OP( 600,  956),
	OP( 800, 1036),
	OP(1000, 1164),
	OP(1200, 1276),
	OP(1400, 1420),
	OP(1600, 1484),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 1.70GHz (Banias) */
static struct cpufreq_frequency_table banias_1700[] =
{
	OP( 600,  956),
	OP( 800, 1004),
	OP(1000, 1116),
	OP(1200, 1228),
	OP(1400, 1308),
	OP(1700, 1484),
	{ .frequency = CPUFREQ_TABLE_END }
};
#undef OP

/* Dothan processor datasheet 30218903.pdf defines 4 voltages for each
   frequency (VID#A through VID#D) - this macro allows us to define all
   of these but we only use the VID#C voltages at compile time - this may
   need some work if we want to select the voltage profile at runtime. */

#define OP(mhz, mva, mvb, mvc, mvd)					\
	{								\
		.frequency = (mhz) * 1000,				\
		.index = (((mhz)/100) << 8) | ((mvc - 700) / 16)       	\
	}

/* Intel Pentium M processor 710 / 1.40GHz (Dothan) */
static struct cpufreq_frequency_table dothan_1400[] =
{
	OP( 600,  700,  700,  700,  700),
	OP( 800,  770,  770,  770,  770),
	OP(1000,  840,  840,  840,  840),
	OP(1200,  910,  910,  910,  910),
	OP(1400,  980,  980,  980,  980),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 715 / 1.50GHz (Dothan) */
static struct cpufreq_frequency_table dothan_1500[] =
{
	OP( 600,  988,  988,  988,  988),
	OP( 800, 1068, 1068, 1068, 1052),
	OP(1000, 1148, 1148, 1132, 1116),
	OP(1200, 1228, 1212, 1212, 1180),
	OP(1500, 1340, 1324, 1308, 1276),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 725 / 1.60GHz (Dothan) */
static struct cpufreq_frequency_table dothan_1600[] =
{
	OP( 100,  700,  700,  700,  700),
	OP( 200,  700,  700,  700,  700),
	OP( 266,  700,  700,  700,  700),
	OP( 333,  700,  700,  700,  700),
	OP( 400,  700,  700,  700,  700),
	OP( 533,  700,  700,  700,  700),
	OP( 600,  700,  700,  700,  700),
	OP( 800, 1000, 1000,  950,  950),
	OP(1000, 1100, 1100, 1050, 1050),
	OP(1200, 1212, 1196, 1180, 1164),
	OP(1400, 1276, 1260, 1244, 1228),
	OP(1600, 1340, 1324, 1308, 1276),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Funktionierende FreqTable...
static struct cpufreq_frequency_table dothan_1600[] =
{
	OP( 100,  706,  706,  706,  706),
	OP( 200,  706,  706,  706,  706),
	OP( 266,  706,  706,  706,  706),
	OP( 333,  706,  706,  706,  706),
	OP( 400,  706,  706,  706,  706),
	OP( 533,  706,  706,  706,  706),
	OP( 600,  706,  706,  706,  706),
	OP( 800, 1068, 1068, 1052, 1052),
	OP(1000, 1132, 1132, 1116, 1116),
	OP(1200, 1212, 1196, 1180, 1164),
	OP(1400, 1276, 1260, 1244, 1228),
	OP(1600, 1340, 1324, 1308, 1276),
	{ .frequency = CPUFREQ_TABLE_END }
};
*/

/* Intel Pentium M processor 735 / 1.70GHz (Dothan) */
static struct cpufreq_frequency_table dothan_1700[] =
{
	OP( 600,  988,  988,  988,  988),
	OP( 800, 1052, 1052, 1052, 1052),
	OP(1000, 1116, 1116, 1116, 1100),
	OP(1200, 1180, 1180, 1164, 1148),
	OP(1400, 1244, 1244, 1228, 1212),
	OP(1700, 1340, 1324, 1308, 1276),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 745 / 1.80GHz (Dothan) */
static struct cpufreq_frequency_table dothan_1800[] =
{
	OP( 600,  988,  988,  988,  988),
	OP( 800, 1052, 1052, 1052, 1036),
	OP(1000, 1116, 1100, 1100, 1084),
	OP(1200, 1164, 1164, 1148, 1132),
	OP(1400, 1228, 1212, 1212, 1180),
	OP(1600, 1292, 1276, 1260, 1228),
	OP(1800, 1340, 1324, 1308, 1276),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 755 / 2.00GHz (Dothan) */
static struct cpufreq_frequency_table dothan_2000[] =
{
	OP( 600,  988,  988,  988,  988),
	OP( 800, 1052, 1036, 1036, 1036),
	OP(1000, 1100, 1084, 1084, 1084),
	OP(1200, 1148, 1132, 1132, 1116),
	OP(1400, 1196, 1180, 1180, 1164),
	OP(1600, 1244, 1228, 1228, 1196),
	OP(1800, 1292, 1276, 1276, 1244),
	OP(2000, 1340, 1324, 1308, 1276),
	{ .frequency = CPUFREQ_TABLE_END }
};

/* Intel Pentium M processor 750 / 1.86GHz (Dothan) */
static struct cpufreq_frequency_table dothan_1867[] =
{
	OP( 800,  880,  880,  880,  880),
	OP(1333, 1010, 1010, 1010, 1010),
	OP(1867, 1120, 1120, 1120, 1120),
	{ .frequency = CPUFREQ_TABLE_END }
};
#undef OP

#define _BANIAS(cpuid, max, name)	\
{	.cpu_id		= cpuid,	\
	.model_name	= "Intel(R) Pentium(R) M processor " name "MHz", \
	.max_freq	= (max)*1000,	\
	.op_points	= banias_##max,	\
}
#define BANIAS(max)	_BANIAS(&cpu_ids[CPU_BANIAS], max, #max)

#define DOTHAN(cpuid, max, name)	\
{	.cpu_id		= cpuid,	\
	.model_name	= "Intel(R) Pentium(R) M processor " name "GHz", \
	.max_freq	= (max)*1000,	\
	.op_points	= dothan_##max,	\
}

/* CPU models, their operating frequency range, and freq/voltage
   operating points */
static struct cpu_model models[] =
{
	_BANIAS(&cpu_ids[CPU_BANIAS], 900, " 900"),
	BANIAS(1000),
	BANIAS(1100),
	BANIAS(1200),
	BANIAS(1300),
	BANIAS(1400),
	BANIAS(1500),
	BANIAS(1600),
	BANIAS(1700),
	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1400, "1.40"),	
	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1500, "1.50"),
	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1600, "1.60"),
	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1700, "1.70"),
	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 1800, "1.80"),
	DOTHAN(&cpu_ids[CPU_DOTHAN_B0], 2000, "2.00"),
	DOTHAN(&cpu_ids[CPU_DOTHAN_C0], 1867, "1.86"),
	DOTHAN(&cpu_ids[CPU_DOTHAN_08], 1600, "1.60"),
	
	/* NULL model_name is a wildcard */
	{ &cpu_ids[CPU_DOTHAN_A1], NULL, 0, NULL },
	{ &cpu_ids[CPU_DOTHAN_A2], NULL, 0, NULL },
	{ &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
	{ &cpu_ids[CPU_DOTHAN_C0], NULL, 0, NULL },
	{ &cpu_ids[CPU_DOTHAN_08], NULL, 0, NULL },

	{ NULL, }
};
#undef _BANIAS
#undef BANIAS
#undef DOTHAN

static int centrino_cpu_init_table(struct cpufreq_policy *policy)
{
	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
	struct cpu_model *model;

	for(model = models; model->cpu_id != NULL; model++)
		if (centrino_verify_cpu_id(cpu, model->cpu_id) &&
		    (model->model_name == NULL ||
		     strcmp(cpu->x86_model_id, model->model_name) == 0))
			break;

	if (model->cpu_id == NULL) {
		/* No match at all */
		dprintk(KERN_INFO PFX "no support for CPU model \"%s\": "
		       "send /proc/cpuinfo to " MAINTAINER "\n",
		       cpu->x86_model_id);
		return -ENOENT;
	}

	if (model->op_points == NULL) {
		/* Matched a non-match */
		dprintk(KERN_INFO PFX "no table support for CPU model \"%s\": \n",
		       cpu->x86_model_id);
#ifndef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
		dprintk(KERN_INFO PFX "try compiling with CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI enabled\n");
#endif
		return -ENOENT;
	}

	centrino_model[policy->cpu] = model;

	dprintk("found \"%s\": max frequency: %dkHz\n",
	       model->model_name, model->max_freq);

	return 0;
}

#else
static inline int centrino_cpu_init_table(struct cpufreq_policy *policy) { return -ENODEV; }
#endif /* CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE */

static int centrino_verify_cpu_id(const struct cpuinfo_x86 *c, const struct cpu_id *x)
{
	if ((c->x86 == x->x86) &&
	    (c->x86_model == x->x86_model) &&
	    (c->x86_mask == x->x86_mask))
		return 1;
	return 0;
}

/* To be called only after centrino_model is initialized */
static unsigned extract_clock(unsigned msr, unsigned int cpu, int failsafe)
{
	int i;

	/*
	 * Extract clock in kHz from PERF_CTL value
	 * for centrino, as some DSDTs are buggy.
	 * Ideally, this can be done using the acpi_data structure.
	 */
	if ((centrino_cpu[cpu] == &cpu_ids[CPU_BANIAS]) ||
	    (centrino_cpu[cpu] == &cpu_ids[CPU_DOTHAN_A1]) ||
	    (centrino_cpu[cpu] == &cpu_ids[CPU_DOTHAN_B0]) ||
	    (centrino_cpu[cpu] == &cpu_ids[CPU_DOTHAN_C0]) ||
	    (centrino_cpu[cpu] == &cpu_ids[CPU_DOTHAN_08] 	    
	    )) {
		msr = (msr >> 8) & 0xff;
		return msr * 100000;
	}

	if ((!centrino_model[cpu]) || (!centrino_model[cpu]->op_points))
		return 0;

	msr &= 0xffff;
	for (i=0;centrino_model[cpu]->op_points[i].frequency != CPUFREQ_TABLE_END; i++) {
		if (msr == centrino_model[cpu]->op_points[i].index)
			return centrino_model[cpu]->op_points[i].frequency;
	}
	if (failsafe)
		return centrino_model[cpu]->op_points[i-1].frequency;
	else
		return 0;
}

/* Return the current CPU frequency in kHz */
static unsigned int get_cur_freq(unsigned int cpu)
{
	unsigned l, h;
	unsigned clock_freq;
	cpumask_t saved_mask;

	saved_mask = current->cpus_allowed;
	set_cpus_allowed(current, cpumask_of_cpu(cpu));
	if (smp_processor_id() != cpu)
		return 0;

	rdmsr(MSR_IA32_PERF_STATUS, l, h);
	clock_freq = extract_clock(l, cpu, 0);

	if (unlikely(clock_freq == 0)) {
		/*
		 * On some CPUs, we can see transient MSR values (which are
		 * not present in _PSS), while CPU is doing some automatic
		 * P-state transition (like TM2). Get the last freq set 
		 * in PERF_CTL.
		 */
		rdmsr(MSR_IA32_PERF_CTL, l, h);
		clock_freq = extract_clock(l, cpu, 1);
	}

	set_cpus_allowed(current, saved_mask);
	return clock_freq;
}


#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI

static struct acpi_processor_performance p;

/*
 * centrino_cpu_init_acpi - register with ACPI P-States library
 *
 * Register with the ACPI P-States library (part of drivers/acpi/processor.c)
 * in order to determine correct frequency and voltage pairings by reading
 * the _PSS of the ACPI DSDT or SSDT tables.
 */
static int centrino_cpu_init_acpi(struct cpufreq_policy *policy)
{
	union acpi_object		arg0 = {ACPI_TYPE_BUFFER};
	u32				arg0_buf[3];
	struct acpi_object_list		arg_list = {1, &arg0};
	unsigned long			cur_freq;
	int				result = 0, i;
	unsigned int			cpu = policy->cpu;

	/* _PDC settings */
	arg0.buffer.length = 12;
	arg0.buffer.pointer = (u8 *) arg0_buf;
	arg0_buf[0] = ACPI_PDC_REVISION_ID;
	arg0_buf[1] = 1;
	arg0_buf[2] = ACPI_PDC_EST_CAPABILITY_SMP | ACPI_PDC_EST_CAPABILITY_MSR;

	p.pdc = &arg_list;

	/* register with ACPI core */
	if (acpi_processor_register_performance(&p, cpu)) {
		dprintk(KERN_INFO PFX "obtaining ACPI data failed\n");
		return -EIO;
	}

	/* verify the acpi_data */
	if (p.state_count <= 1) {
		dprintk("No P-States\n");
		result = -ENODEV;
		goto err_unreg;
	}

	if ((p.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
	    (p.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
		dprintk("Invalid control/status registers (%x - %x)\n",
			p.control_register.space_id, p.status_register.space_id);
		result = -EIO;
		goto err_unreg;
	}

	for (i=0; i<p.state_count; i++) {
		if (p.states[i].control != p.states[i].status) {
			dprintk("Different control (%x) and status values (%x)\n",
				p.states[i].control, p.states[i].status);
			result = -EINVAL;
			goto err_unreg;
		}

		if (!p.states[i].core_frequency) {
			dprintk("Zero core frequency for state %u\n", i);
			result = -EINVAL;
			goto err_unreg;
		}

		if (p.states[i].core_frequency > p.states[0].core_frequency) {
			dprintk("P%u has larger frequency (%u) than P0 (%u), skipping\n", i,
				p.states[i].core_frequency, p.states[0].core_frequency);
			p.states[i].core_frequency = 0;
			continue;
		}
	}
/*
	centrino_model[cpu]->op_points[1].index = 0x040D;
	centrino_model[cpu]->op_points[1].frequency = 400000;
	p.states[1].core_frequency = 400;
*/
	centrino_model[cpu] = kmalloc(sizeof(struct cpu_model), GFP_KERNEL);
	if (!centrino_model[cpu]) {
		result = -ENOMEM;
		goto err_unreg;
	}
	memset(centrino_model[cpu], 0, sizeof(struct cpu_model));

	centrino_model[cpu]->model_name=NULL;
	centrino_model[cpu]->max_freq = p.states[0].core_frequency * 1000;
	centrino_model[cpu]->op_points =  kmalloc(sizeof(struct cpufreq_frequency_table) *
					     (p.state_count + 1), GFP_KERNEL);
        if (!centrino_model[cpu]->op_points) {
                result = -ENOMEM;
                goto err_kfree;
        }

        for (i=0; i<p.state_count; i++) {
		centrino_model[cpu]->op_points[i].index = p.states[i].control;
		centrino_model[cpu]->op_points[i].frequency = p.states[i].core_frequency * 1000;
		dprintk("adding state %i with frequency %u and control value %04x\n", 
			i, centrino_model[cpu]->op_points[i].frequency, centrino_model[cpu]->op_points[i].index);
	}
	centrino_model[cpu]->op_points[p.state_count].frequency = CPUFREQ_TABLE_END;

	cur_freq = get_cur_freq(cpu);

	for (i=0; i<p.state_count; i++) {
		if (!p.states[i].core_frequency) {
			dprintk("skipping state %u\n", i);
			centrino_model[cpu]->op_points[i].frequency = CPUFREQ_ENTRY_INVALID;
			continue;
		}
		
		if (extract_clock(centrino_model[cpu]->op_points[i].index, cpu, 0) !=
		    (centrino_model[cpu]->op_points[i].frequency)) {
			dprintk("Invalid encoded frequency (%u vs. %u)\n",
				extract_clock(centrino_model[cpu]->op_points[i].index, cpu, 0),
				centrino_model[cpu]->op_points[i].frequency);
			result = -EINVAL;
			goto err_kfree_all;
		}

		if (cur_freq == centrino_model[cpu]->op_points[i].frequency)
			p.state = i;
	}

	/* notify BIOS that we exist */
	acpi_processor_notify_smm(THIS_MODULE);

	return 0;

 err_kfree_all:
	kfree(centrino_model[cpu]->op_points);
 err_kfree:
	kfree(centrino_model[cpu]);
 err_unreg:
	acpi_processor_unregister_performance(&p, cpu);
	dprintk(KERN_INFO PFX "invalid ACPI data\n");
	return (result);
}
#else
static inline int centrino_cpu_init_acpi(struct cpufreq_policy *policy) { return -ENODEV; }
#endif

static int centrino_cpu_init(struct cpufreq_policy *policy)
{
	struct cpuinfo_x86 *cpu = &cpu_data[policy->cpu];
	unsigned freq;
	unsigned l, h;
	int ret;
	int i;

	/* Only Intel makes Enhanced Speedstep-capable CPUs */
	if (cpu->x86_vendor != X86_VENDOR_INTEL || !cpu_has(cpu, X86_FEATURE_EST))
		return -ENODEV;

	for (i = 0; i < N_IDS; i++)
		if (centrino_verify_cpu_id(cpu, &cpu_ids[i]))
			break;

	if (i != N_IDS)
		centrino_cpu[policy->cpu] = &cpu_ids[i];

	if (is_const_loops_cpu(policy->cpu)) {
		centrino_driver.flags |= CPUFREQ_CONST_LOOPS;
	}

	if (centrino_cpu_init_acpi(policy)) {
		if (policy->cpu != 0)
			return -ENODEV;

		if (!centrino_cpu[policy->cpu]) {
			dprintk(KERN_INFO PFX "found unsupported CPU with "
			"Enhanced SpeedStep: send /proc/cpuinfo to "
			MAINTAINER "\n");
			return -ENODEV;
		}

		if (centrino_cpu_init_table(policy)) {
			return -ENODEV;
		}
	}

	/* Check to see if Enhanced SpeedStep is enabled, and try to
	   enable it if not. */
	rdmsr(MSR_IA32_MISC_ENABLE, l, h);

	if (!(l & (1<<16))) {
		l |= (1<<16);
		dprintk("trying to enable Enhanced SpeedStep (%x)\n", l);
		wrmsr(MSR_IA32_MISC_ENABLE, l, h);

		/* check to see if it stuck */
		rdmsr(MSR_IA32_MISC_ENABLE, l, h);
		if (!(l & (1<<16))) {
			printk(KERN_INFO PFX "couldn't enable Enhanced SpeedStep\n");
			return -ENODEV;
		}
	}

	freq = get_cur_freq(policy->cpu);

	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
	policy->cpuinfo.transition_latency = 10000; /* 10uS transition latency */
	policy->cur = freq;

	dprintk("centrino_cpu_init: cur=%dkHz\n", policy->cur);

	ret = cpufreq_frequency_table_cpuinfo(policy, centrino_model[policy->cpu]->op_points);
	if (ret)
		return (ret);

	cpufreq_frequency_table_get_attr(centrino_model[policy->cpu]->op_points, policy->cpu);

	return 0;
}

static int centrino_cpu_exit(struct cpufreq_policy *policy)
{
	unsigned int cpu = policy->cpu;

	if (!centrino_model[cpu])
		return -ENODEV;

	cpufreq_frequency_table_put_attr(cpu);

#ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
	if (!centrino_model[cpu]->model_name) {
		dprintk("unregistering and freeing ACPI data\n");
		acpi_processor_unregister_performance(&p, cpu);
		kfree(centrino_model[cpu]->op_points);
		kfree(centrino_model[cpu]);
	}
#endif

	centrino_model[cpu] = NULL;

	return 0;
}

/**
 * centrino_verify - verifies a new CPUFreq policy
 * @policy: new policy
 *
 * Limit must be within this model's frequency range at least one
 * border included.
 */
static int centrino_verify (struct cpufreq_policy *policy)
{
	return cpufreq_frequency_table_verify(policy, centrino_model[policy->cpu]->op_points);
}

/**
 * centrino_setpolicy - set a new CPUFreq policy
 * @policy: new policy
 * @target_freq: the target frequency
 * @relation: how that frequency relates to achieved frequency (CPUFREQ_RELATION_L or CPUFREQ_RELATION_H)
 *
 * Sets a new CPUFreq policy.
 */
static int centrino_target (struct cpufreq_policy *policy,
			    unsigned int target_freq,
			    unsigned int relation)
{
	unsigned int    newstate = 0;
	unsigned int	msr, oldmsr, h, cpu = policy->cpu;
	struct cpufreq_freqs	freqs;
	cpumask_t		saved_mask;
	int			retval;

	if (centrino_model[cpu] == NULL)
		return -ENODEV;

	/*
	 * Support for SMP systems.
	 * Make sure we are running on the CPU that wants to change frequency
	 */
	saved_mask = current->cpus_allowed;
	set_cpus_allowed(current, policy->cpus);
	if (!cpu_isset(smp_processor_id(), policy->cpus)) {
		dprintk("couldn't limit to CPUs in this domain\n");
		return(-EAGAIN);
	}

	if (cpufreq_frequency_table_target(policy, centrino_model[cpu]->op_points, target_freq,
					   relation, &newstate)) {
		retval = -EINVAL;
		goto migrate_end;
	}

	msr = centrino_model[cpu]->op_points[newstate].index;
	rdmsr(MSR_IA32_PERF_CTL, oldmsr, h);

	if (msr == (oldmsr & 0xffff)) {
		retval = 0;
		dprintk("no change needed - msr was and needs to be %x\n", oldmsr);
		goto migrate_end;
	}

	freqs.cpu = cpu;
	freqs.old = extract_clock(oldmsr, cpu, 0);
	freqs.new = extract_clock(msr, cpu, 0);

	dprintk("target=%dkHz old=%d new=%d msr=%04x\n",
		target_freq, freqs.old, freqs.new, msr);

	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

	/* all but 16 LSB are "reserved", so treat them with
	   care */
	oldmsr &= ~0xffff;
	msr &= 0xffff;
	oldmsr |= msr;

	wrmsr(MSR_IA32_PERF_CTL, oldmsr, h);

	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);

	retval = 0;
migrate_end:
	set_cpus_allowed(current, saved_mask);
	return (retval);
}

/* sysfs things for altering voltages */
static ssize_t show_scaling_voltages(struct cpufreq_policy *policy, char *buf)
{
	unsigned int cpu;
	int i, j;

	if (!policy)
	    return -ENODEV;
	cpu = policy->cpu;
	if (!centrino_model[cpu] || !centrino_model[cpu]->op_points)
	    return -ENODEV;

	j=snprintf(buf, PAGE_SIZE, "# frequency voltage\n");

	for (i=0; centrino_model[cpu]->op_points[i].frequency
		     != CPUFREQ_TABLE_END; i++) {
		/* Print lines of frequency and voltage */
		j += snprintf(&buf[j], PAGE_SIZE-j, "%u %u\n", 
			      centrino_model[cpu]->op_points[i].frequency,
			      VID_TO_VOLTAGE(centrino_model[cpu]->op_points[i].index & 0xff));
	}
	buf[PAGE_SIZE-1] = 0;
	return j;
}

static ssize_t store_scaling_voltages(struct cpufreq_policy *policy, 
		const char *buf, size_t count)
{
	unsigned int cpu;
	unsigned int frequency, voltage;
	int ret, i, j;
	int msr, vid;
	unsigned int cur_freq;
	static struct cpufreq_frequency_table **original_table = NULL;

	if (!policy)
	    return -ENODEV;
	cpu = policy->cpu;
	if (!centrino_model[cpu] || !centrino_model[cpu]->op_points)
	    return -ENODEV;

	/* Remember the original voltages, and don't let the user
	 * raise the voltages above those. As stated in
	 * centrino_init(), be paranoid about releasing people's
	 * valuable magic smoke. */

	if (!original_table) {
		original_table = 
			kmalloc(sizeof(struct cpufreq_frequency_table *)*NR_CPUS, 
				GFP_KERNEL);
		for (i=0; i < NR_CPUS; i++)
			original_table[i] = NULL;
	}

	if (!original_table[cpu]) {
		/* Count number of frequencies and allocate memory for a copy */
		for (i=0; centrino_model[cpu]->op_points[i].frequency 
			     != CPUFREQ_TABLE_END; i++);
		original_table[cpu] = (struct cpufreq_frequency_table*) 
			kmalloc(sizeof(struct cpufreq_frequency_table)*(i+1), 
				GFP_KERNEL);
		
		/* Make copy of frequency/voltage pairs */
		for (i=0; centrino_model[cpu]->op_points[i].frequency
			     != CPUFREQ_TABLE_END; i++) {
			original_table[cpu][i].frequency = 
				centrino_model[cpu]->op_points[i].frequency;
			original_table[cpu][i].index = 
				centrino_model[cpu]->op_points[i].index;
		}
		original_table[cpu][i].frequency = CPUFREQ_TABLE_END;
	}
	
	/* Don't use sscanf, since we want to return the actual number
	 * of characters read. I don't feel comfortable using
	 * simple_stroul either, since I'm not sure that the buf
	 * really is zero-terminated. */

	/* Eat non-digits */
	for (ret = 0; ret < count && !isdigit(buf[ret]); ret++);
	if (ret == count)
	    return ret;
	/* Read frequency */
	for (frequency = 0; ret < count && isdigit(buf[ret]); ret++)
		frequency = 10*frequency + buf[ret] - '0';
	/* Eat non-digits */
	for (; ret < count && !isdigit(buf[ret]); ret++);
	/* Read new voltage */
	for (voltage = 0; ret < count && isdigit(buf[ret]); ret++)
		voltage = 10*voltage + buf[ret] - '0';

	if (frequency == 0 || voltage < 700)
		return -EINVAL;

	/* Check so that the voltage is not higher than the original one */
	for (j=0; original_table[cpu][j].frequency != CPUFREQ_TABLE_END; j++)
		if (frequency == original_table[cpu][j].frequency) 
			break;
	if (original_table[cpu][j].frequency == CPUFREQ_TABLE_END)
		return -EINVAL;
	if (voltage > VID_TO_VOLTAGE(original_table[cpu][j].index & 0xff)) 
		return -EINVAL;

	for (i=0; centrino_model[cpu]->op_points[i].frequency
		     != CPUFREQ_TABLE_END; i++) {
		if (frequency == centrino_model[cpu]->op_points[i].frequency) 
			break;
	}

	if (centrino_model[cpu]->op_points[i].frequency == CPUFREQ_TABLE_END)
		return -EINVAL;

	msr = centrino_model[cpu]->op_points[i].index;
	vid = VOLTAGE_TO_VID(voltage);
	msr = (msr & ~0xff) | (vid & 0xff);

	/* Double check so that the voltage id is not higher than the original one */
	if (vid > (original_table[cpu][j].index & 0xff)) 
		return -EINVAL;

	dprintk(KERN_INFO PFX "altering centrino cpufreq table, to make %u kHz have "
		"voltage %u mV (VID=%u)\n", frequency, voltage, vid);

	centrino_model[cpu]->op_points[i].index = msr;


	/* If the updated voltage applies to the frequency currently
	 * used, tell the CPU about the new voltage */
	cur_freq = cpufreq_get(policy->cpu);
	if (cur_freq == frequency)
	    centrino_target(policy, cur_freq, CPUFREQ_RELATION_L);
	
	return ret;
}

#define define_one_rw(_name) \
static struct freq_attr _name = \
__ATTR(_name, 0644, show_##_name, store_##_name)

define_one_rw(scaling_voltages);

/* end of sysfs voltage things */

static struct freq_attr* centrino_attr[] = {
	&scaling_voltages,
	&cpufreq_freq_attr_scaling_available_freqs,
	NULL,
};

static struct cpufreq_driver centrino_driver = {
	.name		= "centrino", /* should be speedstep-centrino,
					 but there's a 16 char limit */
	.init		= centrino_cpu_init,
	.exit		= centrino_cpu_exit,
	.verify		= centrino_verify,
	.target		= centrino_target,
	.get		= get_cur_freq,
	.attr           = centrino_attr,
	.owner		= THIS_MODULE,
};


/**
 * centrino_init - initializes the Enhanced SpeedStep CPUFreq driver
 *
 * Initializes the Enhanced SpeedStep support. Returns -ENODEV on
 * unsupported devices, -ENOENT if there's no voltage table for this
 * particular CPU model, -EINVAL on problems during initiatization,
 * and zero on success.
 *
 * This is quite picky.  Not only does the CPU have to advertise the
 * "est" flag in the cpuid capability flags, we look for a specific
 * CPU model and stepping, and we need to have the exact model name in
 * our voltage tables.  That is, be paranoid about not releasing
 * someone's valuable magic smoke.
 */
static int __init centrino_init(void)
{
	struct cpuinfo_x86 *cpu = cpu_data;

	if (!cpu_has(cpu, X86_FEATURE_EST))
		return -ENODEV;

	return cpufreq_register_driver(&centrino_driver);
}

static void __exit centrino_exit(void)
{
	cpufreq_unregister_driver(&centrino_driver);
}

MODULE_AUTHOR ("Jeremy Fitzhardinge <jeremy@goop.org>");
MODULE_DESCRIPTION ("Enhanced SpeedStep driver for Intel Pentium M processors.");
MODULE_LICENSE ("GPL");

late_initcall(centrino_init);
module_exit(centrino_exit);

--------------020304060108040801020406
Content-Type: text/x-vcard; charset=utf-8;
 name="sascha.kloss.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sascha.kloss.vcf"

begin:vcard
fn;quoted-printable:Sascha Klo=C3=9F
n;quoted-printable:Klo=C3=9F;Sascha
email;internet:sascha.kloss@gmx.de
tel;cell:0174 4311303
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------020304060108040801020406
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------020304060108040801020406--

