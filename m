From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES] cpufreq updates for cpufreq-bk
Date: Fri, 19 Dec 2003 22:11:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031219211102.GA4011@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============38991180712875106=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: davej@redhat.com, cpufreq@www.linux.org.uk


--===============38991180712875106==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline


--UHN/qo2QbUvPLonB
Content-Type: multipart/mixed; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The following patches, all tested on two test systems (speedstep-smi and
p4-clockmod), are not yet merged into cpufreq-bk. Dave, could you merge=20
them, please? And push them -- along the other pieces in bk already --
to Andrew and Linus for 2.6.1, please?

cpufreq-2.6.0-tsc
- [i386-timing] on P4s no TSC adjustment is necessary

cpufreq-2.6.0-speedstep-smi-disable_debug_output
- [speedstep-smi] Disable debug output

cpufreq-2.6.0-speedstep-smi-spelling_fix
- [speedstep-smi] Spelling fix

cpufreq-2.6.0-speedstep-smi-bugfix-1422
- [speedstep-smi] Disable smi_detect_freqs() call on systems=20
	which do not support it [BUG #1422]

cpufreq-2.6.0-speedstep-lib-533mhz_fsb
- [speedstep-lib] Support for 533 MHz FSB

cpufreq-2.6.0-p4_clockmod-detect_speed
- [p4-clockmod] Detect CPU speed without relying on cpu_khz

cpufreq-2.6.0-clean_headers
- [core] remove unneeded #ifdefs in include/linux/cpufreq.h

cpufreq-2.6.0-latency
- [drivers] latency in nanoseconds -- sometimes nanoseconds are used,=20
	sometimes microseconds, sometimes even something else.

cpufreq-2.6.0-speedstep-smi-reduce_failures
- [speedstep-smi] Do something about "cpufreq: change failed"


	Dominik

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-clean_headers"
Content-Transfer-Encoding: quoted-printable

There's no need for some #ifdefs in cpufreq.h
=20
 include/linux/cpufreq.h |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)
=20
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufre=
q.h
--- linux-original/include/linux/cpufreq.h	2003-12-19 19:37:40.221768536 +0=
100
+++ linux/include/linux/cpufreq.h	2003-12-19 21:30:36.753579112 +0100
@@ -231,17 +231,18 @@
 /* the proc_intf.c needs this */
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy, stru=
ct cpufreq_governor **governor);
=20
-#if defined(CONFIG_CPU_FREQ_GOV_USERSPACE) || defined(CONFIG_CPU_FREQ_GOV_=
USERSPACE_MODULE)
+
 /*********************************************************************
  *                      CPUFREQ USERSPACE GOVERNOR                   *
  *********************************************************************/
 int cpufreq_gov_userspace_init(void);
=20
+#ifdef CONFIG_CPU_FREQ_24_API
+
 int cpufreq_setmax(unsigned int cpu);
 int cpufreq_set(unsigned int kHz, unsigned int cpu);
 unsigned int cpufreq_get(unsigned int cpu);
=20
-#ifdef CONFIG_CPU_FREQ_24_API
=20
 /* /proc/sys/cpu */
 enum {
@@ -289,8 +290,6 @@
=20
 #endif /* CONFIG_CPU_FREQ_24_API */
=20
-#endif /* CONFIG_CPU_FREQ_GOV_USERSPACE */
-
=20
 /*********************************************************************
  *                       CPUFREQ DEFAULT GOVERNOR                    *
@@ -305,6 +304,7 @@
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
 #endif
=20
+
 /*********************************************************************
  *                     FREQUENCY TABLE HELPERS                       *
  *********************************************************************/
@@ -318,7 +318,6 @@
 				    * order */
 };
=20
-#if defined(CONFIG_CPU_FREQ_TABLE) || defined(CONFIG_CPU_FREQ_TABLE_MODULE)
 int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 				    struct cpufreq_frequency_table *table);
=20
@@ -340,5 +339,4 @@
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
=20
=20
-#endif /* CONFIG_CPU_FREQ_TABLE */
 #endif /* _LINUX_CPUFREQ_H */

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-latency"
Content-Transfer-Encoding: quoted-printable

Even though the core stated that cpuinfo.transition_latency needs to be
in 10^(-9) s, hardly any driver set it to nanoseconds but to microseconds.
So, fix up the drivers.
=20
 arch/arm/mach-integrator/cpu.c             |    2 +-
 arch/i386/kernel/cpu/cpufreq/acpi.c        |    4 ++--
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |    2 +-
 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |    6 +++++-
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |    7 ++++---
 include/linux/cpufreq.h                    |    2 +-
 6 files changed, 14 insertions(+), 9 deletions(-)
=20
diff -ruN linux-original/arch/arm/mach-integrator/cpu.c linux/arch/arm/mach=
-integrator/cpu.c
--- linux-original/arch/arm/mach-integrator/cpu.c	2003-12-19 19:37:28.82750=
0728 +0100
+++ linux/arch/arm/mach-integrator/cpu.c	2003-12-19 21:37:13.949196200 +0100
@@ -172,7 +172,7 @@
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.max_freq =3D 160000;
 	policy->cpuinfo.min_freq =3D 12000;
-	policy->cpuinfo.transition_latency =3D 1000; /* 1 ms, assumed */
+	policy->cpuinfo.transition_latency =3D 1000000; /* 1 ms, assumed */
 	policy->cur =3D policy->min =3D policy->max =3D
 		icst525_khz(&cclk_params, vco); /* current freq */
=20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c linux/arch/i38=
6/kernel/cpu/cpufreq/acpi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-12-19 19:37:27.=
586689360 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-12-19 21:37:13.950196048=
 +0100
@@ -578,8 +578,8 @@
 	/* detect transition latency */
 	policy->cpuinfo.transition_latency =3D 0;
 	for (i=3D0;i<perf->state_count;i++) {
-		if (perf->states[i].transition_latency > policy->cpuinfo.transition_late=
ncy)
-			policy->cpuinfo.transition_latency =3D perf->states[i].transition_laten=
cy;
+		if ((perf->states[i].transition_latency * 1000) > policy->cpuinfo.transi=
tion_latency)
+			policy->cpuinfo.transition_latency =3D perf->states[i].transition_laten=
cy * 1000;
 	}
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cur =3D perf->states[pr->limit.state.px].core_frequency * 1000;
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/a=
rch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-12-19 21=
:30:26.404152464 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-12-19 21:37:13.95=
0196048 +0100
@@ -255,7 +255,7 @@
 =09
 	/* cpuinfo and default policy values */
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency =3D 1000;
+	policy->cpuinfo.transition_latency =3D 1000000; /* assumed */
 	policy->cur =3D stock_freq;
=20
 	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/a=
rch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-12-19 19=
:37:27.586689360 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-12-19 21:37:13.95=
1195896 +0100
@@ -386,7 +386,11 @@
 				minimum_speed, maximum_speed);
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency =3D latency;
+
+	/* latency is in 10 ns (look for SGTC above) for each VID
+	 * and FID transition, so multiply that value with 20 */
+	policy->cpuinfo.transition_latency =3D latency * 20;
+
 	policy->cur =3D maximum_speed;
=20
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/a=
rch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-12-19 19=
:37:27.587689208 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-12-19 21:37:13.95=
2195744 +0100
@@ -957,9 +957,10 @@
=20
 	pol->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
=20
-	/* Take a crude guess here. */
-	pol->cpuinfo.transition_latency =3D ((rvo + 8) * vstable * VST_UNITS_20US)
-	    + (3 * (1 << irt) * 10);
+	/* Take a crude guess here.=20
+	 * That guess was in microseconds, so multply with 1000 */
+	pol->cpuinfo.transition_latency =3D (((rvo + 8) * vstable * VST_UNITS_20U=
S)
+	    + (3 * (1 << irt) * 10)) * 1000;
=20
 	if (query_current_values_with_pending_wait())
 		return -EIO;
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufre=
q.h
--- linux-original/include/linux/cpufreq.h	2003-12-19 21:34:59.371655096 +0=
100
+++ linux/include/linux/cpufreq.h	2003-12-19 21:37:13.953195592 +0100
@@ -57,7 +57,7 @@
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
-	unsigned int		transition_latency; /* in 10^(-9) s */
+	unsigned int		transition_latency; /* in 10^(-9) s =3D nanoseconds */
 };
=20
 struct cpufreq_real_policy {

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-p4_clockmod-detect_speed"
Content-Transfer-Encoding: quoted-printable

Other cpufreq drivers don't rely on cpu_khz, but use the "decoded"/theoreti=
cal=20
CPU frequency as base for all calculations.
=20
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   66 +++++++++++++++++++++++-=
-----
 1 files changed, 53 insertions(+), 13 deletions(-)

=20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/a=
rch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-12-19 19=
:37:27.586689360 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-12-19 21:28:19.24=
5483520 +0100
@@ -48,8 +48,7 @@
=20
=20
 static int has_N44_O17_errata[NR_CPUS];
-static int stock_freq;
-
+static unsigned int stock_freq;
=20
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
@@ -175,6 +174,54 @@
 	return cpufreq_frequency_table_verify(policy, &p4clockmod_table[0]);
 }
=20
+/* copied from speedstep_lib, made SMP-compatible */
+static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
+{
+	u32 msr_lo, msr_hi, mult;
+	unsigned int fsb =3D 0;
+
+	if (c->x86 !=3D 0xF) {
+		printk(KERN_DEBUG PFX "Unknown P4. Please send an e-mail to <linux@brodo=
=2Ede>\n");
+		return 0;
+	}
+
+	rdmsr(0x2c, msr_lo, msr_hi);
+
+	/* printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo=
, msr_hi); */
+	/* decode the FSB: see IA-32 Intel (C) Architecture Software=20
+	 * Developer's Manual, Volume 3: System Prgramming Guide,
+	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
+	 * Intel Xeon Processors, on page B-4 and B-5.
+	 */
+	if (c->x86_model < 2)
+		fsb =3D 100 * 1000;
+	else {
+		u8 fsb_code =3D (msr_lo >> 16) & 0x7;
+		switch (fsb_code) {
+		case 0:
+			fsb =3D 100 * 1000;
+			break;
+		case 1:
+			fsb =3D 13333 * 10;
+			break;
+		case 2:
+			fsb =3D 200 * 1000;
+			break;
+		}
+	}
+
+	if (!fsb) {
+		printk(KERN_DEBUG PFX "couldn't detect FSB speed. Please send an e-mail =
to <linux@brodo.de>\n");
+		printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, =
msr_hi);
+	}
+
+	/* Multiplier. */
+	mult =3D msr_lo >> 24;
+
+	return (fsb * mult);
+}
+
+=20
=20
 static int cpufreq_p4_cpu_init(struct cpufreq_policy *policy)
 {
@@ -192,15 +239,10 @@
 		has_N44_O17_errata[policy->cpu] =3D 1;
 	}
 =09
-	/* get frequency */
-	if (!stock_freq) {
-		if (cpu_khz)
-			stock_freq =3D cpu_khz;
-		else {
-			printk(KERN_INFO PFX "unknown core frequency - please use module parame=
ter 'stock_freq'\n");
-			return -EINVAL;
-		}
-	}
+	/* get max frequency */
+	stock_freq =3D cpufreq_p4_get_frequency(c);
+	if (!stock_freq)
+		return -EINVAL;
=20
 	/* table init */
 	for (i=3D1; (p4clockmod_table[i].frequency !=3D CPUFREQ_TABLE_END); i++) {
@@ -269,8 +311,6 @@
 }
=20
=20
-MODULE_PARM(stock_freq, "i");
-
 MODULE_AUTHOR ("Zwane Mwaikambo <zwane@commfireservices.com>");
 MODULE_DESCRIPTION ("cpufreq driver for Pentium(TM) 4/Xeon(TM)");
 MODULE_LICENSE ("GPL");

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-speedstep-lib-533mhz_fsb"
Content-Transfer-Encoding: quoted-printable

I don't know whether there's a P4-M with 533 or 800 MHz FSB out there yet,
but let's prepare the speedstep-lib for these FSBs anyways.
=20
 arch/i386/kernel/cpu/cpufreq/speedstep-lib.c |   37 ++++++++++++++++++++++=
++---
 arch/i386/kernel/cpu/cpufreq/speedstep-lib.h |    2 -
 2 files changed, 35 insertions(+), 4 deletions(-)
=20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-12-19 =
19:37:27.587689208 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2003-12-19 21:24:11.=
043216000 +0100
@@ -106,14 +106,45 @@
=20
 static unsigned int pentium4_get_frequency(void)
 {
-	u32 msr_lo, msr_hi;
+	struct cpuinfo_x86 *c =3D &boot_cpu_data;
+	u32 msr_lo, msr_hi, mult;
+	unsigned int fsb =3D 0;
=20
 	rdmsr(0x2c, msr_lo, msr_hi);
=20
 	dprintk(KERN_DEBUG "speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n=
", msr_lo, msr_hi);
=20
-	msr_lo >>=3D 24;
-	return (msr_lo * 100000);
+	/* decode the FSB: see IA-32 Intel (C) Architecture Software=20
+	 * Developer's Manual, Volume 3: System Prgramming Guide,
+	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
+	 * Intel Xeon Processors, on page B-4 and B-5.
+	 */
+	if (c->x86_model < 2)
+		fsb =3D 100 * 1000;
+	else {
+		u8 fsb_code =3D (msr_lo >> 16) & 0x7;
+		switch (fsb_code) {
+		case 0:
+			fsb =3D 100 * 1000;
+			break;
+		case 1:
+			fsb =3D 13333 * 10;
+			break;
+		case 2:
+			fsb =3D 200 * 1000;
+			break;
+		}
+	}
+
+	if (!fsb)
+		printk(KERN_DEBUG "speedstep-lib: couldn't detect FSB speed. Please send=
 an e-mail to <linux@brodo.de>\n");
+
+	/* Multiplier. */
+	mult =3D msr_lo >> 24;
+
+	dprintk(KERN_DEBUG "speedstep-lib: P4 - FSB %u kHz; Multiplier %u\n", fsb=
, mult);
+
+	return (fsb * mult);
 }
=20
 =20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2003-12-19 =
19:37:27.587689208 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2003-12-19 21:24:11.=
043216000 +0100
@@ -15,7 +15,7 @@
 #define SPEEDSTEP_PROCESSOR_PIII_C_EARLY	0x00000001  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_C		0x00000002  /* Coppermine core */
 #define SPEEDSTEP_PROCESSOR_PIII_T 		0x00000003  /* Tualatin core */
-#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M with 100 MHz FSB */
+#define SPEEDSTEP_PROCESSOR_P4M			0x00000004  /* P4-M  */
=20
 /* speedstep states -- only two of them */
=20

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-speedstep-smi-bugfix-1422"
Content-Transfer-Encoding: quoted-printable

The SMI call in speedstep_smi_get_freqs causes hangs on certain notebooks. A
failure of the function itself is non-critical, as a workaround exists.
=20
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    6 ++++++
 1 files changed, 6 insertions(+)
=20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 =
19:56:10.960910520 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 19:56:33.=
746446592 +0100
@@ -85,6 +85,9 @@
=20
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
+ * Only available on later SpeedStep-enabled systems, returns false result=
s or
+ * even hangs [cf. bugme.osdl.org # 1422] on earlier systems. Empirical te=
sting
+ * shows that the latter occurs if !(ist_info.event & 0xFFFF).
  *
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
@@ -93,6 +96,9 @@
 	u32 state=3D0;
 	u32 function =3D GET_SPEEDSTEP_FREQS;
=20
+	if (!(ist_info.event & 0xFFFF))
+		return -ENODEV;
+
 	command =3D (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
=20
 	__asm__ __volatile__("movl $0, %%edi\n"

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-speedstep-smi-disable_debug_output"
Content-Transfer-Encoding: quoted-printable

speedstep-smi is getting more and more stable, so disable verbose debug
output.
=20
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 =
19:37:27.587689208 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 19:50:27.=
797079352 +0100
@@ -54,7 +54,7 @@
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
-#define SPEEDSTEP_DEBUG
+//#define SPEEDSTEP_DEBUG
=20
 #ifdef SPEEDSTEP_DEBUG
 #define dprintk(msg...) printk(msg)

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-speedstep-smi-reduce_failures"
Content-Transfer-Encoding: quoted-printable

Transitions initiated by speedstep-smi currently fail often if system load
is high. Bruno Ducrot and I have found out that the failures disappear if
DMA is disabled. As disabling (U)DMA isn't something nice, here's a
workaround which (almost) always works: retrying the SMI call up to five
times, and waiting some time before doing so. Please note that this will
completely mess up real-time-critical tasks or dynamic scaling. But
speedstep-smi (1st generation of speedstep) wasn't meant to be used
for that anyway.
=20
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   32 +++++++++++++++++++---=
-----
 1 files changed, 23 insertions(+), 9 deletions(-)
=20
=20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 =
19:59:28.398895384 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 21:40:48.=
152632328 +0100
@@ -19,6 +19,7 @@
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <asm/ist.h>
=20
 #include "speedstep-lib.h"
@@ -51,6 +52,10 @@
 #define SET_SPEEDSTEP_STATE 2
 #define GET_SPEEDSTEP_FREQS 4
=20
+/* how often shall the SMI call be tried if it failed, e.g. because
+ * of DMA activity going on? */
+#define SMI_TRIES 5
+
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
@@ -140,10 +145,11 @@
  */
 static void speedstep_set_state (unsigned int state, unsigned int notify)
 {
-	unsigned int old_state, result, command, new_state;
+	unsigned int old_state, result =3D 0, command, new_state;
 	unsigned long flags;
 	struct cpufreq_freqs freqs;
 	unsigned int function=3DSET_SPEEDSTEP_STATE;
+	unsigned int retry =3D 0;
=20
 	if (state > 0x1)
 		return;
@@ -163,20 +169,28 @@
 	local_irq_save(flags);
=20
 	command =3D (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
-	__asm__ __volatile__(
-		"movl $0, %%edi\n"
-		"out %%al, (%%dx)\n"
-		: "=3Db" (new_state), "=3DD" (result)
-		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
-	);
+
+	do {
+		if (retry) {
+			dprintk(KERN_INFO "cpufreq: retry %u, previous result %u\n", retry, res=
ult);
+			mdelay(retry * 50);
+		}
+		retry++;
+		__asm__ __volatile__(
+			"movl $0, %%edi\n"
+			"out %%al, (%%dx)\n"
+			: "=3Db" (new_state), "=3DD" (result)
+			: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+			);
+	} while ((new_state !=3D state) && (retry <=3D SMI_TRIES));
=20
 	/* enable IRQs */
 	local_irq_restore(flags);
=20
 	if (new_state =3D=3D state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded\n", (freqs.new / =
1000));
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries wi=
th result %u\n", (freqs.new / 1000), retry, result);
 	} else {
-		printk(KERN_ERR "cpufreq: change failed\n");
+		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\=
n", new_state, result);
 	}
=20
 	if (notify)

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-speedstep-smi-spelling_fix"
Content-Transfer-Encoding: quoted-printable

The reporter of bug 1422 noted this spelling fix -- thanks!
=20
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)
=20
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 =
19:51:29.435708856 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-19 19:54:41.=
988436392 +0100
@@ -168,7 +168,7 @@
 	local_irq_restore(flags);
=20
 	if (new_state =3D=3D state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1=
000));
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded\n", (freqs.new / =
1000));
 	} else {
 		printk(KERN_ERR "cpufreq: change failed\n");
 	}

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-tsc"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 04, 2003 at 04:47:30PM +0800, Li, Shaohua <shaohua.li@intel.com=
> wrote:
> TSC frequency doesn't change under P4 and above when CPU frequency
> changes, which caused some problems. Attached patch will handle this
> problem. How about it?

A few cleanups were added to this patch:
- cpufreq_register_notifier() shouldn't be called during time_init()
        because it shouldn't be called while we're in atomic context
- the p4 detection code should only be used when cpufreq is used
- also cyc2us and loops_per_jiffy are affected (I think)
- the patch had an invalid header

 timer_tsc.c |   35 +++++++++++++++++++++++++++--------
 1 files changed, 27 insertions(+), 8 deletions(-)

diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i38=
6/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2003-12-19 19:37:27.=
589688904 +0100
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2003-12-19 19:44:29.394564816=
 +0100
@@ -306,9 +306,17 @@
 }
 #endif
=20
+
 #ifdef CONFIG_CPU_FREQ
+/* If the CPU frequency is scaled, TSC-based delays will need a different
+ * loops_per_jiffy value to function properly. An exception to this
+ * are modern Intel Pentium 4 processors, where the TSC runs at a constant
+ * speed independent of frequency scaling.=20
+ */
+
 static unsigned int  ref_freq =3D 0;
 static unsigned long loops_per_jiffy_ref =3D 0;
+static unsigned int  variable_tsc =3D 1;
=20
 #ifndef CONFIG_SMP
 static unsigned long fast_gettimeoffset_ref =3D 0;
@@ -333,12 +341,15 @@
=20
 	if ((val =3D=3D CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
 	    (val =3D=3D CPUFREQ_POSTCHANGE && freq->old > freq->new)) {
-		cpu_data[freq->cpu].loops_per_jiffy =3D cpufreq_scale(loops_per_jiffy_re=
f, ref_freq, freq->new);
+		if (variable_tsc)
+			cpu_data[freq->cpu].loops_per_jiffy =3D cpufreq_scale(loops_per_jiffy_r=
ef, ref_freq, freq->new);
 #ifndef CONFIG_SMP
 		if (use_tsc) {
-			fast_gettimeoffset_quotient =3D cpufreq_scale(fast_gettimeoffset_ref, f=
req->new, ref_freq);
 			cpu_khz =3D cpufreq_scale(cpu_khz_ref, ref_freq, freq->new);
-			set_cyc2ns_scale(cpu_khz/1000);
+			if (variable_tsc) {
+				fast_gettimeoffset_quotient =3D cpufreq_scale(fast_gettimeoffset_ref, =
freq->new, ref_freq);
+				set_cyc2ns_scale(cpu_khz/1000);
+			}
 		}
 #endif
 	}
@@ -350,7 +361,19 @@
 static struct notifier_block time_cpufreq_notifier_block =3D {
 	.notifier_call	=3D time_cpufreq_notifier
 };
-#endif
+
+
+static int __init cpufreq_tsc(void)
+{
+	/* P4 and above CPU TSC freq doesn't change when CPU frequency changes*/
+	if ((boot_cpu_data.x86 >=3D 15) && (boot_cpu_data.x86_vendor =3D=3D X86_V=
ENDOR_INTEL))
+		variable_tsc =3D 0;
+
+	return cpufreq_register_notifier(&time_cpufreq_notifier_block, CPUFREQ_TR=
ANSITION_NOTIFIER);
+}
+core_initcall(cpufreq_tsc);
+
+#endif=20
=20
=20
 static int __init init_tsc(char* override)
@@ -392,10 +415,6 @@
  	 *	some CPU's have a TSC. Thats never worked and nobody has
  	 *	moaned if you have the only one in the world - you fix it!
  	 */
-=20
-#ifdef CONFIG_CPU_FREQ
-	cpufreq_register_notifier(&time_cpufreq_notifier_block, CPUFREQ_TRANSITIO=
N_NOTIFIER);
-#endif
=20
 	count2 =3D LATCH; /* initialize counter for mark_offset_tsc() */
=20

--envbJBWh7q8WU6mo--

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/42llZ8MDCHJbN8YRAoBfAJ9gy7xwiFhtpn26Hmd0RFUsPJCM9gCfTkXH
3c312prOeFpnJbxZWxqPj7s=
=UkNR
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--


--===============38991180712875106==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============38991180712875106==--

