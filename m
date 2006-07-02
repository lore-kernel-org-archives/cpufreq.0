From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Use hardware support
Date: Sun, 02 Jul 2006 22:51:36 +0200
Message-ID: <44A831D8.7040902@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Hardware is stopping bus masters. There is no need to=20
implement this in Linux kernel. I tested it really hard.
Even doing md5sum on my files before and after. No corruption.=20
2 days without even single lockup. No "dma broken" messages.
My system: Epia M10000 (CLE266 chipset) with VIA Nehemiah 1GHz.

Changes in Kconfig:
1. ACPI_PROCESSOR - this code need ACPI C3 state working,
2. !X86_UP_APIC - (un)patched "longhaul" isn't APIC compatible,
3. !SMP - (un)patched "longhaul" isn't SMP compatible. First=20
step would be APIC support. Second - per CPU private data.

Changes in longhaul.h:
- clock tables merged - differences are little, "longhaul"
will do errata for detected CPU,
- eblcr tables merged - reason above,
- format of voltage tables changed,
- added mobile vrm.

Changes in longhaul.c:
- most important - now C3 state is causing transition,
- code resopnsible for clearing "bus master" bit removed,
- protect bcr2 transition in the same way as longhaul,
- check if Longhaul MSR is present, don't assume that this
stepping have this MSR, and other don't,
- voltage scaling added. By default disabled because is=20
untested. Looks like processors on Epia mainboards don't
support voltage scaling,
- some FSB scaling compatibility,
- some minor changes.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/Kconfig linux-2.6.17-git20/arc=
h/i386/kernel/cpu/cpufreq/Kconfig
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-06=
-18 03:49:35.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-07-02 19:4=
8:40.000000000 +0200
@@ -202,7 +202,7 @@ config X86_LONGRUN
 config X86_LONGHAUL
 	tristate "VIA Cyrix III Longhaul"
 	select CPU_FREQ_TABLE
-	depends on BROKEN
+	depends on !SMP && !X86_UP_APIC && ACPI_PROCESSOR
 	help
 	  This adds the CPUFreq driver for VIA Samuel/CyrixIII,
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T
diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.17-git20/=
arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006=
-07-02 19:41:52.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-02 2=
1:29:44.000000000 +0200
@@ -29,11 +29,14 @@
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/pci.h>
=20
+#include <asm/delay.h>
 #include <asm/msr.h>
 #include <asm/timex.h>
 #include <asm/io.h>
+#include <asm/acpi.h>
+#include <linux/acpi.h>
+#include <acpi/processor.h>
=20
 #include "longhaul.h"
=20
@@ -43,35 +46,38 @@
 #define TYPE_LONGHAUL_V2	2
 #define TYPE_POWERSAVER		3
=20
-#define	CPU_SAMUEL	1
-#define	CPU_SAMUEL2	2
-#define	CPU_EZRA	3
-#define	CPU_EZRA_T	4
-#define	CPU_NEHEMIAH	5
-
-static int cpu_model;
-static unsigned int numscales=3D16, numvscales;
-static unsigned int fsb;
-static int minvid, maxvid;
+#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longha=
ul", msg)
+
+/*  Module parameters */
+static int dont_scale_voltage =3D 1;
+/*		      */
+
+static unsigned int numscales =3D 16, numvscales;
+static unsigned int fsb, fsb_min;
+static struct mV_pos minvid, maxvid;
 static unsigned int minmult, maxmult;
-static int can_scale_voltage;
+static int can_scale_voltage =3D 0;
+static int can_scale_fsb =3D 0;
 static int vrmrev;
+static int old_speed;
=20
-/* Module parameters */
-static int dont_scale_voltage;
-
-
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longha=
ul", msg)
-
+static struct acpi_processor *pr =3D NULL;
+static struct acpi_processor_cx *cx =3D NULL;
=20
-/* Clock ratios multiplied by 10 */
-static int clock_ratio[32];
-static int eblcr_table[32];
-static int voltage_table[32];
+static struct mV_pos vrm_mV_table[32];
+static unsigned char mV_vrm_table[32];
+struct f_msr {
+	unsigned char fsb;
+	unsigned char vrm;
+};
+static struct f_msr f_msr_table[32];
 static unsigned int highest_speed, lowest_speed; /* kHz */
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
=20
+static unsigned int eblcr_fsb_table_v1[] =3D { 666, 1332, 999, -1 };
+static unsigned int eblcr_fsb_table_v2[] =3D { 1332, 999, 1998, 666 };
+
 #ifdef CONFIG_CPU_FREQ_DEBUG
 static char speedbuffer[8];
=20
@@ -93,13 +99,10 @@ static char *print_speed(int speed)
 }
 #endif
=20
-
-static unsigned int calc_speed(int mult)
+static unsigned int calc_speed(int mult, int fsb)
 {
 	int khz;
-	khz =3D (mult/10)*fsb;
-	if (mult%10)
-		khz +=3D fsb/2;
+	khz =3D (mult * fsb + 50) / 100;
 	khz *=3D 1000;
 	return khz;
 }
@@ -118,84 +121,75 @@ static int longhaul_get_cpu_mult(void)
 	return eblcr_table[invalue];
 }
=20
+/* For processor with BCR2 MSR */
=20
-static void do_powersaver(union msr_longhaul *longhaul,
-			unsigned int clock_ratio_index)
+static void do_longhaul1(int cx_address, unsigned int clock_ratio_index)
 {
-	struct pci_dev *dev;
-	unsigned long flags;
-	unsigned int tmp_mask;
-	int version;
-	int i;
-	u16 pci_cmd;
-	u16 cmd_state[64];
+	union msr_bcr2 bcr2;
+	u32 t;
=20
-	switch (cpu_model) {
-	case CPU_EZRA_T:
-		version =3D 3;
-		break;
-	case CPU_NEHEMIAH:
-		version =3D 0xf;
-		break;
-	default:
-		return;
-	}
+	rdmsrl(MSR_VIA_BCR2, bcr2.val);
+	/* Enable software clock multiplier */
+	bcr2.bits.ESOFTBF =3D 1;
+	bcr2.bits.CLOCKMUL =3D clock_ratio_index;
=20
-	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	longhaul->bits.SoftBusRatio =3D clock_ratio_index & 0xf;
-	longhaul->bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
-	longhaul->bits.EnableSoftBusRatio =3D 1;
-	longhaul->bits.RevisionKey =3D 0;
+	/* Sync to timer tick */
+	safe_halt();
+	ACPI_FLUSH_CPU_CACHE();
+	/* Change frequency on next halt or sleep */
+	wrmsrl(MSR_VIA_BCR2, bcr2.val);
+	/* Invoke C3 */
+	inb(cx_address);
+	/* Dummy op - must do something useless after P_LVL3 read */
+	t =3D inl(acpi_fadt.xpm_tmr_blk.address);
=20
-	preempt_disable();
-	local_irq_save(flags);
+	/* Disable software clock multiplier */
+	local_irq_disable();
+	rdmsrl(MSR_VIA_BCR2, bcr2.val);
+	bcr2.bits.ESOFTBF =3D 0;
+	wrmsrl(MSR_VIA_BCR2, bcr2.val);
+}
=20
-	/*
-	 * get current pci bus master state for all devices
-	 * and clear bus master bit
-	 */
-	dev =3D NULL;
-	i =3D 0;
-	do {
-		dev =3D pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
-		if (dev !=3D NULL) {
-			pci_read_config_word(dev, PCI_COMMAND, &pci_cmd);
-			cmd_state[i++] =3D pci_cmd;
-			pci_cmd &=3D ~PCI_COMMAND_MASTER;
-			pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
-		}
-	} while (dev !=3D NULL);
+/* For processor with Longhaul MSR */
=20
-	tmp_mask=3Dinb(0x21);	/* works on C3. save mask. */
-	outb(0xFE,0x21);	/* TMR0 only */
-	outb(0xFF,0x80);	/* delay */
+static void do_powersaver(int cx_address,
+			unsigned int clock_ratio_index,
+			unsigned int table_index)
+{
+	union msr_longhaul longhaul;
+	u32 t;
+
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;
+	longhaul.bits.SoftBusRatio =3D clock_ratio_index & 0xf;
+	longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
+	longhaul.bits.EnableSoftBusRatio =3D 1;
+	if (can_scale_fsb) {
+		longhaul.bits.SoftBSEL =3D f_msr_table[table_index].fsb;
+		longhaul.bits.EnableSoftBSEL =3D 1;
+	}
+	if (can_scale_voltage) {
+		longhaul.bits.SoftVID =3D f_msr_table[table_index].vrm;
+		longhaul.bits.EnableSoftVID =3D 1;
+	}
=20
+	/* Sync to timer tick */
 	safe_halt();
-	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	halt();
+	ACPI_FLUSH_CPU_CACHE();
+	/* Change frequency on next halt or sleep */
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+	/* Invoke C3 */
+	inb(cx_address);
+	/* Dummy op - must do something useless after P_LVL3 read */
+	t =3D inl(acpi_fadt.xpm_tmr_blk.address);
=20
+	/* Disable bus ratio bit */
 	local_irq_disable();
-
-	outb(tmp_mask,0x21);	/* restore mask */
-
-	/* restore pci bus master state for all devices */
-	dev =3D NULL;
-	i =3D 0;
-	do {
-		dev =3D pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
-		if (dev !=3D NULL) {
-			pci_cmd =3D cmd_state[i++];
-			pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
-		}
-	} while (dev !=3D NULL);
-	local_irq_restore(flags);
-	preempt_enable();
-
-	/* disable bus ratio bit */
-	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	longhaul->bits.EnableSoftBusRatio =3D 0;
-	longhaul->bits.RevisionKey =3D version;
-	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;
+	longhaul.bits.EnableSoftBusRatio =3D 0;
+	longhaul.bits.EnableSoftBSEL =3D 0;
+	longhaul.bits.EnableSoftVID =3D 0;
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 }
=20
 /**
@@ -205,27 +199,32 @@ static void do_powersaver(union msr_long
  * Sets a new clock ratio.
  */
=20
-static void longhaul_setstate(unsigned int clock_ratio_index)
+static void longhaul_setstate(unsigned int table_index)
 {
-	int speed, mult;
 	struct cpufreq_freqs freqs;
-	union msr_longhaul longhaul;
-	union msr_bcr2 bcr2;
-	static unsigned int old_ratio=3D-1;
+	unsigned int clock_ratio_index =3D 0;
+	unsigned long flags;
+	int speed, mult, fsb;
+	unsigned int pic1_mask, pic2_mask;
=20
-	if (old_ratio =3D=3D clock_ratio_index)
-		return;
-	old_ratio =3D clock_ratio_index;
+	clock_ratio_index =3D longhaul_table[table_index].index & 0xFF;
=20
 	mult =3D clock_ratio[clock_ratio_index];
-	if (mult =3D=3D -1)
-		return;
+	if (mult =3D=3D -1)	return;
+=09
+	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
+		fsb =3D eblcr_fsb_table_v2[f_msr_table[table_index].fsb];
+	} else {
+		fsb =3D eblcr_fsb_table_v1[f_msr_table[table_index].fsb];
+	}
=20
-	speed =3D calc_speed(mult);
-	if ((speed > highest_speed) || (speed < lowest_speed))
+	speed =3D calc_speed(mult, fsb);
+	if ( (speed =3D=3D old_speed)
+		|| (speed > highest_speed)
+		|| (speed < lowest_speed) )
 		return;
=20
-	freqs.old =3D calc_speed(longhaul_get_cpu_mult());
+	freqs.old =3D old_speed;
 	freqs.new =3D speed;
 	freqs.cpu =3D 0; /* longhaul.c is UP only driver */
=20
@@ -234,8 +233,21 @@ static void longhaul_setstate(unsigned i
 	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
 			fsb, mult/10, mult%10, print_speed(speed/1000));
=20
-	switch (longhaul_version) {
+	preempt_disable();
+	local_irq_save(flags);
+
+	pic2_mask =3D inb(0xA1);
+	pic1_mask =3D inb(0x21);	/* works on C3. save mask. */
+	outb(0xFF,0xA1);	/* Overkill */
+	outb(0xFE,0x21);	/* TMR0 only */
+
+	/* Disable bus master arbitration */
+	if (pr->flags.bm_check) {
+		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 1,
+				  ACPI_MTX_DO_NOT_LOCK);
+	}
=20
+	switch (longhaul_version) {
 	/*
 	 * Longhaul v1. (Samuel[C5A] and Samuel2 stepping 0[C5B])
 	 * Software controlled multipliers only.
@@ -245,22 +257,8 @@ static void longhaul_setstate(unsigned i
 	 */
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
-		rdmsrl (MSR_VIA_BCR2, bcr2.val);
-		/* Enable software clock multiplier */
-		bcr2.bits.ESOFTBF =3D 1;
-		bcr2.bits.CLOCKMUL =3D clock_ratio_index;
-		local_irq_disable();
-		wrmsrl (MSR_VIA_BCR2, bcr2.val);
-		safe_halt();
-
-		/* Disable software clock multiplier */
-		rdmsrl (MSR_VIA_BCR2, bcr2.val);
-		bcr2.bits.ESOFTBF =3D 0;
-		local_irq_disable();
-		wrmsrl (MSR_VIA_BCR2, bcr2.val);
-		local_irq_enable();
+		do_longhaul1(cx->address, clock_ratio_index);
 		break;
-
 	/*
 	 * Longhaul v3 (aka Powersaver). (Ezra-T [C5M] & Nehemiah [C5N])
 	 * We can scale voltage with this too, but that's currently
@@ -273,11 +271,24 @@ static void longhaul_setstate(unsigned i
 	 * to work in practice.
 	 */
 	case TYPE_POWERSAVER:
-		do_powersaver(&longhaul, clock_ratio_index);
+		do_powersaver(cx->address, clock_ratio_index, table_index);
 		break;
 	}
=20
+	/* Enable bus master arbitration */
+	if (pr->flags.bm_check) {
+		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 0,
+				  ACPI_MTX_DO_NOT_LOCK);
+	}
+
+	outb(pic2_mask,0xA1);	/* restore mask */
+	outb(pic1_mask,0x21);
+
+	local_irq_restore(flags);
+	preempt_enable();
+
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	old_speed =3D speed;
 }
=20
 /*
@@ -289,126 +300,73 @@ static void longhaul_setstate(unsigned i
  * was calculated at boot time. Really ugly, but no other way to do this.
  */
=20
-#define ROUNDING	0xf
-
-static int _guess(int guess)
-{
-	int target;
-
-	target =3D ((maxmult/10)*guess);
-	if (maxmult%10 !=3D 0)
-		target +=3D (guess/2);
-	target +=3D ROUNDING/2;
-	target &=3D ~ROUNDING;
-	return target;
-}
-
-
-static int guess_fsb(void)
-{
-	int speed =3D (cpu_khz/1000);
-	int i;
-	int speeds[3] =3D { 66, 100, 133 };
-
-	speed +=3D ROUNDING/2;
-	speed &=3D ~ROUNDING;
-
-	for (i=3D0; i<3; i++) {
-		if (_guess(speeds[i]) =3D=3D speed)
-			return speeds[i];
-	}
-	return 0;
-}
-
-
 static int __init longhaul_get_ranges(void)
 {
 	unsigned long invalue;
-	unsigned int multipliers[32]=3D {
-		50,30,40,100,55,35,45,95,90,70,80,60,120,75,85,65,
-		-1,110,120,-1,135,115,125,105,130,150,160,140,-1,155,-1,145 };
 	unsigned int j, k =3D 0;
 	union msr_longhaul longhaul;
 	unsigned long lo, hi;
-	unsigned int eblcr_fsb_table_v1[] =3D { 66, 133, 100, -1 };
-	unsigned int eblcr_fsb_table_v2[] =3D { 133, 100, -1, 66 };
=20
 	switch (longhaul_version) {
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
 		/* Ugh, Longhaul v1 didn't have the min/max MSRs.
-		   Assume min=3D3.0x & max =3D whatever we booted at. */
-		minmult =3D 30;
+		   Assume min=3D3.5x & max =3D whatever we booted at. */
+		minmult =3D 35;
 		maxmult =3D longhaul_get_cpu_mult();
 		rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
+		if ( (lo & 0xf8000000) !=3D 0xc0000000 ) {
+			printk (KERN_INFO PFX "Uncorrect EBL_CR_POWER_ON values. Aborting.\n");
+			return -EINVAL;
+		}
 		invalue =3D (lo & (1<<18|1<<19)) >>18;
-		if (cpu_model=3D=3DCPU_SAMUEL || cpu_model=3D=3DCPU_SAMUEL2)
-			fsb =3D eblcr_fsb_table_v1[invalue];
-		else
-			fsb =3D guess_fsb();
+		fsb_min =3D fsb =3D eblcr_fsb_table_v1[invalue];
+		printk (KERN_INFO PFX "CPU don't have the min/max MSRs.\n");
+		printk (KERN_INFO PFX "Assume min=3D3.5x, max=3D%d.%d, fsb=3D%dMHz\n", m=
axmult/10, maxmult%10, fsb);
 		break;
=20
 	case TYPE_POWERSAVER:
-		/* Ezra-T */
-		if (cpu_model=3D=3DCPU_EZRA_T) {
-			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-			invalue =3D longhaul.bits.MaxMHzBR;
-			if (longhaul.bits.MaxMHzBR4)
-				invalue +=3D 16;
-			maxmult=3Dmultipliers[invalue];
-
-			invalue =3D longhaul.bits.MinMHzBR;
-			if (longhaul.bits.MinMHzBR4 =3D=3D 1)
-				minmult =3D 30;
-			else
-				minmult =3D multipliers[invalue];
-			fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
-		}
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
=20
-		/* Nehemiah */
-		if (cpu_model=3D=3DCPU_NEHEMIAH) {
-			rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-			/*
-			 * TODO: This code works, but raises a lot of questions.
-			 * - Some Nehemiah's seem to have broken Min/MaxMHzBR's.
-			 *   We get around this by using a hardcoded multiplier of 4.0x
-			 *   for the minimimum speed, and the speed we booted up at for the max.
-			 *   This is done in longhaul_get_cpu_mult() by reading the EBLCR regis=
ter.
-			 * - According to some VIA documentation EBLCR is only
-			 *   in pre-Nehemiah C3s. How this still works is a mystery.
-			 *   We're possibly using something undocumented and unsupported,
-			 *   But it works, so we don't grumble.
-			 */
-			minmult=3D40;
-			maxmult=3Dlonghaul_get_cpu_mult();
-
-			/* Starting with the 1.2GHz parts, theres a 200MHz bus. */
-			if ((cpu_khz/1000) > 1200)
-				fsb =3D 200;
-			else
-				fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
-			break;
+		invalue =3D longhaul.bits.MaxMHzBR;
+		if (longhaul.bits.MaxMHzBR4)
+			invalue +=3D 16;
+		maxmult =3D eblcr_table[invalue];
+
+		invalue =3D longhaul.bits.MinMHzBR;
+		if (longhaul.bits.MinMHzBR4) {
+			invalue +=3D 16;
 		}
+		minmult =3D eblcr_table[invalue];
+		if (minmult <=3D 45) clock_ratio[6] =3D 45;
+		if (minmult <=3D 40) clock_ratio[2] =3D 40;
+		if (minmult <=3D 35) clock_ratio[5] =3D 35;
+		if (minmult <=3D 30) clock_ratio[1] =3D 30;
+
+		fsb =3D eblcr_fsb_table_v2[longhaul.bits.MaxMHzFSB];
+		fsb_min =3D eblcr_fsb_table_v2[longhaul.bits.MinMHzFSB];
+		printk(KERN_INFO PFX "CPU have Longhaul MSR.\n");
+		break;
 	}
=20
-	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
-		 minmult/10, minmult%10, maxmult/10, maxmult%10);
-
 	if (fsb =3D=3D -1) {
 		printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
 		return -EINVAL;
 	}
=20
-	highest_speed =3D calc_speed(maxmult);
-	lowest_speed =3D calc_speed(minmult);
-	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
-		 print_speed(lowest_speed/1000),=20
-		 print_speed(highest_speed/1000));
+	highest_speed =3D calc_speed(maxmult, fsb);
+	lowest_speed =3D calc_speed(minmult, fsb_min);
+ 	printk(KERN_INFO PFX "Maximum frequency =3D %dMHz (%d.%d x %dMHz)\n",
+		 highest_speed/1000,
+		 maxmult/10, maxmult%10,
+		 fsb/10);
+ 	printk(KERN_INFO PFX "Minimum frequency =3D %dMHz (%d.%d x %dMHz)\n",
+		 lowest_speed/1000,
+		 minmult/10, minmult%10,
+		 fsb_min/10);
=20
 	if (lowest_speed =3D=3D highest_speed) {
-		printk (KERN_INFO PFX "highestspeed =3D=3D lowest, aborting.\n");
+		printk (KERN_INFO PFX "highest speed =3D=3D lowest, aborting.\n");
 		return -EINVAL;
 	}
 	if (lowest_speed > highest_speed) {
@@ -421,18 +379,19 @@ static int __init longhaul_get_ranges(vo
 	if(!longhaul_table)
 		return -ENOMEM;
=20
-	for (j=3D0; j < numscales; j++) {
-		unsigned int ratio;
+	for (j =3D 0; j < numscales; j++) {
+		unsigned int ratio, speed;
 		ratio =3D clock_ratio[j];
 		if (ratio =3D=3D -1)
 			continue;
-		if (ratio > maxmult || ratio < minmult)
+		speed =3D calc_speed(ratio, fsb);
+		if (speed > highest_speed || speed < lowest_speed)
 			continue;
-		longhaul_table[k].frequency =3D calc_speed(ratio);
+		longhaul_table[k].frequency =3D speed;
 		longhaul_table[k].index	=3D j;
+		f_msr_table[k].fsb =3D longhaul.bits.MaxMHzFSB;
 		k++;
 	}
-
 	longhaul_table[k].frequency =3D CPUFREQ_TABLE_END;
 	if (!k) {
 		kfree (longhaul_table);
@@ -446,52 +405,59 @@ static int __init longhaul_get_ranges(vo
 static void __init longhaul_setup_voltagescaling(void)
 {
 	union msr_longhaul longhaul;
+	unsigned int speed, pos;
+	int kHz_step;
+	int j;
=20
 	rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
 	if (!(longhaul.bits.RevisionID & 1))
 		return;
=20
-	minvid =3D longhaul.bits.MinimumVID;
-	maxvid =3D longhaul.bits.MaximumVID;
 	vrmrev =3D longhaul.bits.VRMRev;
+	if (!vrmrev) {
+		printk (KERN_INFO PFX "VRM 8.5\n");
+		memcpy (vrm_mV_table, vrm85_mV, sizeof(vrm_mV_table));
+		memcpy (mV_vrm_table, mV_vrm85, sizeof(mV_vrm_table));
+	} else {
+		printk (KERN_INFO PFX "Mobile VRM.\n");
+		memcpy (vrm_mV_table, mobilevrm_mV, sizeof(vrm_mV_table));
+		memcpy (mV_vrm_table, mV_mobilevrm, sizeof(mV_vrm_table));
+	}
=20
-	if (minvid =3D=3D 0 || maxvid =3D=3D 0) {
+	minvid =3D vrm_mV_table[longhaul.bits.MinimumVID];
+	maxvid =3D vrm_mV_table[longhaul.bits.MaximumVID];
+	numvscales =3D maxvid.pos - minvid.pos + 1;
+	kHz_step =3D (highest_speed - lowest_speed) / numvscales;
+
+	if (minvid.mV =3D=3D 0 || maxvid.mV =3D=3D 0 || minvid.mV > maxvid.mV) {
 		printk (KERN_INFO PFX "Bogus values Min:%d.%03d Max:%d.%03d. "
 					"Voltage scaling disabled.\n",
-					minvid/1000, minvid%1000, maxvid/1000, maxvid%1000);
+					minvid.mV/1000, minvid.mV%1000, maxvid.mV/1000, maxvid.mV%1000);
 		return;
 	}
=20
-	if (minvid =3D=3D maxvid) {
+	if (minvid.mV =3D=3D maxvid.mV) {
 		printk (KERN_INFO PFX "Claims to support voltage scaling but min & max a=
re "
 				"both %d.%03d. Voltage scaling disabled\n",
-				maxvid/1000, maxvid%1000);
+				maxvid.mV/1000, maxvid.mV%1000);
 		return;
 	}
=20
-	if (vrmrev=3D=3D0) {
-		dprintk ("VRM 8.5\n");
-		memcpy (voltage_table, vrm85scales, sizeof(voltage_table));
-		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/25;
-	} else {
-		dprintk ("Mobile VRM\n");
-		memcpy (voltage_table, mobilevrmscales, sizeof(voltage_table));
-		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/5;
-	}
-
-	/* Current voltage isn't readable at first, so we need to
-	   set it to a known value. The spec says to use maxvid */
-	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;	/* FIXME: This is=
 bad. */
-	longhaul.bits.EnableSoftVID =3D 1;
-	longhaul.bits.SoftVID =3D maxvid;
-	wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-	minvid =3D voltage_table[minvid];
-	maxvid =3D voltage_table[maxvid];
-
-	dprintk ("Min VID=3D%d.%03d Max VID=3D%d.%03d, %d possible voltage scales=
\n",
-		maxvid/1000, maxvid%1000, minvid/1000, minvid%1000, numvscales);
+	printk (KERN_INFO PFX "Max VID=3D%d.%03d  Min VID=3D%d.%03d, %d possible =
voltage scales\n",
+		maxvid.mV/1000, maxvid.mV%1000,
+		minvid.mV/1000, minvid.mV%1000,
+		numvscales);
+=09
+	j =3D 0;
+	while (longhaul_table[j].frequency !=3D CPUFREQ_TABLE_END) {
+		speed =3D longhaul_table[j].frequency;
+		pos =3D (speed - lowest_speed) / kHz_step + minvid.pos;
+		f_msr_table[j].vrm =3D mV_vrm_table[--pos];
+		dprintk("speed =3D %dkHz  fsb =3D %d  vrm =3D 0x%x\n", speed,
+			f_msr_table[j].fsb,
+			f_msr_table[j].vrm);
+		j++;
+	}
=20
 	can_scale_voltage =3D 1;
 }
@@ -507,14 +473,11 @@ static int longhaul_target(struct cpufre
 			    unsigned int target_freq, unsigned int relation)
 {
 	unsigned int table_index =3D 0;
-	unsigned int new_clock_ratio =3D 0;
=20
 	if (cpufreq_frequency_table_target(policy, longhaul_table, target_freq, r=
elation, &table_index))
 		return -EINVAL;
=20
-	new_clock_ratio =3D longhaul_table[table_index].index & 0xFF;
-
-	longhaul_setstate(new_clock_ratio);
+	longhaul_setstate(table_index);
=20
 	return 0;
 }
@@ -524,108 +487,90 @@ static unsigned int longhaul_get(unsigne
 {
 	if (cpu)
 		return 0;
-	return calc_speed(longhaul_get_cpu_mult());
+	return old_speed;
 }
=20
=20
+acpi_status longhaul_walk_callback(acpi_handle obj_handle,
+				  u32 nesting_level,
+				  void *context, void **return_value)
+{
+	struct acpi_device *d;
+
+	if ( acpi_bus_get_device(obj_handle, &d) ) {
+		return 0;
+	}
+	*return_value =3D (void *)acpi_driver_data(d);
+	return 1;
+}
+
 static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c =3D cpu_data;
-	char *cpuname=3DNULL;
 	int ret;
=20
-	switch (c->x86_model) {
-	case 6:
-		cpu_model =3D CPU_SAMUEL;
-		cpuname =3D "C3 'Samuel' [C5A]";
-		longhaul_version =3D TYPE_LONGHAUL_V1;
-		memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
-		memcpy (eblcr_table, samuel1_eblcr, sizeof(samuel1_eblcr));
-		break;
-
-	case 7:
-		longhaul_version =3D TYPE_LONGHAUL_V1;
-		switch (c->x86_mask) {
-		case 0:
-			cpu_model =3D CPU_SAMUEL2;
-			cpuname =3D "C3 'Samuel 2' [C5B]";
-			/* Note, this is not a typo, early Samuel2's had Samuel1 ratios. */
-			memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
-			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
-			break;
-		case 1 ... 15:
-			if (c->x86_mask < 8) {
-				cpu_model =3D CPU_SAMUEL2;
-				cpuname =3D "C3 'Samuel 2' [C5B]";
-			} else {
-				cpu_model =3D CPU_EZRA;
-				cpuname =3D "C3 'Ezra' [C5C]";
-			}
-			memcpy (clock_ratio, ezra_clock_ratio, sizeof(ezra_clock_ratio));
-			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
-			break;
-		}
-		break;
-
-	case 8:
-		cpu_model =3D CPU_EZRA_T;
-		cpuname =3D "C3 'Ezra-T' [C5M]";
-		longhaul_version =3D TYPE_POWERSAVER;
-		numscales=3D32;
-		memcpy (clock_ratio, ezrat_clock_ratio, sizeof(ezrat_clock_ratio));
-		memcpy (eblcr_table, ezrat_eblcr, sizeof(ezrat_eblcr));
-		break;
-
-	case 9:
-		cpu_model =3D CPU_NEHEMIAH;
+	/* Check ACPI support for C3 state */
+	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32_MA=
X,
+			 &longhaul_walk_callback, NULL, (void *)&pr);
+	if (pr =3D=3D NULL) goto err_acpi;
+
+	cx =3D &pr->power.states[ACPI_STATE_C3];
+	if (cx =3D=3D NULL || cx->latency > 1000) goto err_acpi;
+
+	/* Now check what we have on this motherboard */
+	longhaul_version =3D TYPE_LONGHAUL_V1;
+	numscales =3D 16;
+	if (c->x86_model < 9) {
+		clock_ratio[1] =3D 30;
+		clock_ratio[2] =3D 40;
+		clock_ratio[5] =3D 35;
+		clock_ratio[6] =3D 45;
+		eblcr_table[1] =3D 30;
+	}
+	if (c->x86_capability[5] & 16) {	/* Longhaul MSR present? */
 		longhaul_version =3D TYPE_POWERSAVER;
-		numscales=3D32;
-		switch (c->x86_mask) {
-		case 0 ... 1:
-			cpuname =3D "C3 'Nehemiah A' [C5N]";
-			memcpy (clock_ratio, nehemiah_a_clock_ratio, sizeof(nehemiah_a_clock_ra=
tio));
-			memcpy (eblcr_table, nehemiah_a_eblcr, sizeof(nehemiah_a_eblcr));
-			break;
-		case 2 ... 4:
-			cpuname =3D "C3 'Nehemiah B' [C5N]";
-			memcpy (clock_ratio, nehemiah_b_clock_ratio, sizeof(nehemiah_b_clock_ra=
tio));
-			memcpy (eblcr_table, nehemiah_b_eblcr, sizeof(nehemiah_b_eblcr));
-			break;
-		case 5 ... 15:
-			cpuname =3D "C3 'Nehemiah C' [C5N]";
-			memcpy (clock_ratio, nehemiah_c_clock_ratio, sizeof(nehemiah_c_clock_ra=
tio));
-			memcpy (eblcr_table, nehemiah_c_eblcr, sizeof(nehemiah_c_eblcr));
-			break;
+		numscales =3D 32;
+	} else {
+		if (c->x86_model >=3D 8) {	/* >=3D 'Ezra-T' */
+			numscales =3D 32;
+		} else if ( (c->x86_model =3D=3D 7)	/* =3D=3D 'Samuel 2' */
+			   && (c->x86_mask <=3D 7) ) {
+			eblcr_table[7] =3D 110;
+			eblcr_table[14] =3D 130;
+			clock_ratio[0] =3D	/* Just to be sure */
+			clock_ratio[3] =3D
+			clock_ratio[4] =3D
+			clock_ratio[14] =3D
+			clock_ratio[15] =3D -1;
 		}
-		break;
-
-	default:
-		cpuname =3D "Unknown";
-		break;
+	}
+	if ( (c->x86_model =3D=3D 9)		/* =3D=3D 'Nehemiah C' */
+	    && (c->x86_mask >=3D 5) && (c->x86_mask <=3D 15) ) {
+		clock_ratio[2] =3D 40;
+		clock_ratio[6] =3D 45;
+	}
+	if (cpuid_eax(0x80000000) >=3D 0x80000004) {
+		printk(KERN_INFO PFX "%s CPU detected.\n", c->x86_model_id);
 	}
=20
-	printk (KERN_INFO PFX "VIA %s CPU detected.  ", cpuname);
-	switch (longhaul_version) {
-	case TYPE_LONGHAUL_V1:
-	case TYPE_LONGHAUL_V2:
-		printk ("Longhaul v%d supported.\n", longhaul_version);
-		break;
-	case TYPE_POWERSAVER:
-		printk ("Powersaver supported.\n");
-		break;
-	};
+#if (CONFIG_HZ > 250)
+	if (longhaul_version !=3D TYPE_POWERSAVER) {
+		printk (KERN_INFO PFX "Timer frequency to high. Aborting\n");
+		return -EINVAL;
+	}
+#endif
=20
 	ret =3D longhaul_get_ranges();
 	if (ret !=3D 0)
 		return ret;
=20
-	if ((longhaul_version=3D=3DTYPE_LONGHAUL_V2 || longhaul_version=3D=3DTYPE=
_POWERSAVER) &&
-		 (dont_scale_voltage=3D=3D0))
+	if ( (longhaul_version =3D=3D TYPE_POWERSAVER) && (dont_scale_voltage =3D=
=3D 0) )
 		longhaul_setup_voltagescaling();
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency =3D 200000;	/* nsec */
-	policy->cur =3D calc_speed(longhaul_get_cpu_mult());
+	/* Can't tell the truth */
+	policy->cpuinfo.transition_latency =3D 1000000;	/* nsec */
+	policy->cur =3D old_speed =3D calc_speed(longhaul_get_cpu_mult(), fsb);
=20
 	ret =3D cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
 	if (ret)
@@ -634,6 +579,10 @@ static int __init longhaul_cpu_init(stru
 	cpufreq_frequency_table_get_attr(longhaul_table, policy->cpu);
=20
 	return 0;
+
+err_acpi:
+	printk(KERN_ERR PFX "No ACPI support for CPU frequency changes.\n");
+	return -ENODEV;
 }
=20
 static int __devexit longhaul_cpu_exit(struct cpufreq_policy *policy)
@@ -658,7 +607,6 @@ static struct cpufreq_driver longhaul_dr
 	.attr	=3D longhaul_attr,
 };
=20
-
 static int __init longhaul_init(void)
 {
 	struct cpuinfo_x86 *c =3D cpu_data;
@@ -669,8 +617,9 @@ static int __init longhaul_init(void)
 	switch (c->x86_model) {
 	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
-	default:
-		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\=
n");
+	}
+	if (c->x86_model > 9) {
+		printk(KERN_INFO PFX "VIA C7 (or better) CPU. Use \"ACPI Processor P-Sta=
tes driver\".\n");
 	}
=20
 	return -ENODEV;
@@ -699,6 +648,5 @@ MODULE_AUTHOR ("Dave Jones <davej@codemo
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
 MODULE_LICENSE ("GPL");
=20
-module_init(longhaul_init);
+late_initcall(longhaul_init);
 module_exit(longhaul_exit);
-
diff -uprN -X linux-2.6.17-git20-vanilla/Documentation/dontdiff linux-2.6.1=
7-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.h linux-2.6.17-git20/=
arch/i386/kernel/cpu/cpufreq/longhaul.h
--- linux-2.6.17-git20-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.h	2006=
-06-18 03:49:35.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.h	2006-07-02 1=
9:48:40.000000000 +0200
@@ -53,196 +53,14 @@ union msr_longhaul {
  * The clock_ratio ones specify what to write to the CPU.
  */
=20
-/*
- * VIA C3 Samuel 1  & Samuel 2 (stepping 0)
- */
-static int __initdata samuel1_clock_ratio[16] =3D {
-	-1, /* 0000 -> RESERVED */
-	30, /* 0001 ->  3.0x */
-	40, /* 0010 ->  4.0x */
-	-1, /* 0011 -> RESERVED */
-	-1, /* 0100 -> RESERVED */
-	35, /* 0101 ->  3.5x */
-	45, /* 0110 ->  4.5x */
-	55, /* 0111 ->  5.5x */
-	60, /* 1000 ->  6.0x */
-	70, /* 1001 ->  7.0x */
-	80, /* 1010 ->  8.0x */
-	50, /* 1011 ->  5.0x */
-	65, /* 1100 ->  6.5x */
-	75, /* 1101 ->  7.5x */
-	-1, /* 1110 -> RESERVED */
-	-1, /* 1111 -> RESERVED */
-};
-
-static int __initdata samuel1_eblcr[16] =3D {
-	50, /* 0000 -> RESERVED */
-	30, /* 0001 ->  3.0x */
-	40, /* 0010 ->  4.0x */
-	-1, /* 0011 -> RESERVED */
-	55, /* 0100 ->  5.5x */
-	35, /* 0101 ->  3.5x */
-	45, /* 0110 ->  4.5x */
-	-1, /* 0111 -> RESERVED */
-	-1, /* 1000 -> RESERVED */
-	70, /* 1001 ->  7.0x */
-	80, /* 1010 ->  8.0x */
-	60, /* 1011 ->  6.0x */
-	-1, /* 1100 -> RESERVED */
-	75, /* 1101 ->  7.5x */
-	-1, /* 1110 -> RESERVED */
-	65, /* 1111 ->  6.5x */
-};
-
-/*
- * VIA C3 Samuel2 Stepping 1->15
- */
-static int __initdata samuel2_eblcr[16] =3D {
-	50,  /* 0000 ->  5.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	110, /* 0111 -> 11.0x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	130, /* 1110 -> 13.0x */
-	65,  /* 1111 ->  6.5x */
-};
-
-/*
- * VIA C3 Ezra
- */
-static int __initdata ezra_clock_ratio[16] =3D {
+static int clock_ratio[32] =3D {
 	100, /* 0000 -> 10.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
+	160, /* 0001 -> 16.0x | 3.0x */
+	-1,  /* 0010 ->  4.0x */
 	90,  /* 0011 ->  9.0x */
 	95,  /* 0100 ->  9.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 -> 12.0x */
-};
-
-static int __initdata ezra_eblcr[16] =3D {
-	50,  /* 0000 ->  5.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-};
-
-/*
- * VIA C3 (Ezra-T) [C5M].
- */
-static int __initdata ezrat_clock_ratio[32] =3D {
-	100, /* 0000 -> 10.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 ->  12.0x */
-
-	-1,  /* 0000 -> RESERVED (10.0x) */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	-1,  /* 0011 -> RESERVED (9.0x)*/
-	105, /* 0100 -> 10.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	135, /* 0111 -> 13.5x */
-	140, /* 1000 -> 14.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	130, /* 1011 -> 13.0x */
-	145, /* 1100 -> 14.5x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	-1,  /* 1111 -> RESERVED (12.0x) */
-};
-
-static int __initdata ezrat_eblcr[32] =3D {
-	50,  /* 0000 ->  5.0x */
-	30,  /* 0001 ->  3.0x */
-	40,  /* 0010 ->  4.0x */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	35,  /* 0101 ->  3.5x */
-	45,  /* 0110 ->  4.5x */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-
-	-1,  /* 0000 -> RESERVED (9.0x) */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	-1,  /* 0011 -> RESERVED (10.0x)*/
-	135, /* 0100 -> 13.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	105, /* 0111 -> 10.5x */
-	130, /* 1000 -> 13.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	140, /* 1011 -> 14.0x */
-	-1,  /* 1100 -> RESERVED (12.0x) */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	145, /* 1111 -> 14.5x */
-};
-
-/*
- * VIA C3 Nehemiah */
-
-static int __initdata nehemiah_a_clock_ratio[32] =3D {
-	100, /* 0000 -> 10.0x */
-	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
+	-1,  /* 0101 ->  3.5x */
+	-1,  /* 0110 ->  4.5x */
 	55,  /* 0111 ->  5.5x */
 	60,  /* 1000 ->  6.0x */
 	70,  /* 1001 ->  7.0x */
@@ -266,158 +84,18 @@ static int __initdata nehemiah_a_clock_r
 	130, /* 1011 -> 13.0x */
 	145, /* 1100 -> 14.5x */
 	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	120, /* 1111 -> 12.0x */
-};
-
-static int __initdata  nehemiah_b_clock_ratio[32] =3D {
-	100, /* 0000 -> 10.0x */
-	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 -> 12.0x */
-	100, /* 0000 -> 10.0x */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	90,  /* 0011 ->  9.0x */
-	105, /* 0100 -> 10.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	135, /* 0111 -> 13.5x */
-	140, /* 1000 -> 14.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	130, /* 1011 -> 13.0x */
-	145, /* 1100 -> 14.5x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
+	-1,  /* 1110 -> RESERVED */
 	120, /* 1111 -> 12.0x */
 };
=20
-static int __initdata  nehemiah_c_clock_ratio[32] =3D {
-	100, /* 0000 -> 10.0x */
-	160, /* 0001 -> 16.0x */
-	40,  /* 0010 ->  RESERVED */
-	90,  /* 0011 ->  9.0x */
-	95,  /* 0100 ->  9.5x */
-	-1,  /* 0101 ->  RESERVED */
-	45,  /* 0110 ->  RESERVED */
-	55,  /* 0111 ->  5.5x */
-	60,  /* 1000 ->  6.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	50,  /* 1011 ->  5.0x */
-	65,  /* 1100 ->  6.5x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	120, /* 1111 -> 12.0x */
-	100, /* 0000 -> 10.0x */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	90,  /* 0011 ->  9.0x */
-	105, /* 0100 -> 10.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	135, /* 0111 -> 13.5x */
-	140, /* 1000 -> 14.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	130, /* 1011 -> 13.0x */
-	145, /* 1100 -> 14.5x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	120, /* 1111 -> 12.0x */
-};
-
-static int __initdata nehemiah_a_eblcr[32] =3D {
+static int eblcr_table[32] =3D {
 	50,  /* 0000 ->  5.0x */
 	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-	90,  /* 0000 ->  9.0x */
-	-1,  /* 0001 -> RESERVED */
-	120, /* 0010 -> 12.0x */
-	100, /* 0011 -> 10.0x */
-	135, /* 0100 -> 13.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	105, /* 0111 -> 10.5x */
-	130, /* 1000 -> 13.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	140, /* 1011 -> 14.0x */
-	120, /* 1100 -> 12.0x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	145 /* 1111 -> 14.5x */
-   /* end of table  */
-};
-static int __initdata nehemiah_b_eblcr[32] =3D {
-	50,  /* 0000 ->  5.0x */
-	160, /* 0001 -> 16.0x */
-	-1,  /* 0010 ->  RESERVED */
-	100, /* 0011 -> 10.0x */
-	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 ->  RESERVED */
-	-1,  /* 0110 ->  RESERVED */
-	95,  /* 0111 ->  9.5x */
-	90,  /* 1000 ->  9.0x */
-	70,  /* 1001 ->  7.0x */
-	80,  /* 1010 ->  8.0x */
-	60,  /* 1011 ->  6.0x */
-	120, /* 1100 -> 12.0x */
-	75,  /* 1101 ->  7.5x */
-	85,  /* 1110 ->  8.5x */
-	65,  /* 1111 ->  6.5x */
-	90,  /* 0000 ->  9.0x */
-	110, /* 0001 -> 11.0x */
-	120, /* 0010 -> 12.0x */
-	100, /* 0011 -> 10.0x */
-	135, /* 0100 -> 13.5x */
-	115, /* 0101 -> 11.5x */
-	125, /* 0110 -> 12.5x */
-	105, /* 0111 -> 10.5x */
-	130, /* 1000 -> 13.0x */
-	150, /* 1001 -> 15.0x */
-	160, /* 1010 -> 16.0x */
-	140, /* 1011 -> 14.0x */
-	120, /* 1100 -> 12.0x */
-	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
-	145 /* 1111 -> 14.5x */
-	   /* end of table  */
-};
-static int __initdata nehemiah_c_eblcr[32] =3D {
-	50,  /* 0000 ->  5.0x */
-	160, /* 0001 -> 16.0x */
-	40,  /* 0010 ->  RESERVED */
+	40,  /* 0010 ->  4.0x */
 	100, /* 0011 -> 10.0x */
 	55,  /* 0100 ->  5.5x */
-	-1,  /* 0101 ->  RESERVED */
-	45,  /* 0110 ->  RESERVED */
+	35,  /* 0101 ->  3.5x */
+	45,  /* 0110 ->  4.5x */
 	95,  /* 0111 ->  9.5x */
 	90,  /* 1000 ->  9.0x */
 	70,  /* 1001 ->  7.0x */
@@ -441,26 +119,53 @@ static int __initdata nehemiah_c_eblcr[3
 	140, /* 1011 -> 14.0x */
 	120, /* 1100 -> 12.0x */
 	155, /* 1101 -> 15.5x */
-	-1,  /* 1110 -> RESERVED (13.0x) */
+	-1, /* 1110 -> RESERVED */
 	145 /* 1111 -> 14.5x */
-	  /* end of table  */
+   /* end of table  */
 };
=20
 /*
  * Voltage scales. Div/Mod by 1000 to get actual voltage.
  * Which scale to use depends on the VRM type in use.
  */
-static int __initdata vrm85scales[32] =3D {
-	1250, 1200, 1150, 1100, 1050, 1800, 1750, 1700,
-	1650, 1600, 1550, 1500, 1450, 1400, 1350, 1300,
-	1275, 1225, 1175, 1125, 1075, 1825, 1775, 1725,
-	1675, 1625, 1575, 1525, 1475, 1425, 1375, 1325,
-};
=20
-static int __initdata mobilevrmscales[32] =3D {
-	2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
-	1600, 1550, 1500, 1450, 1500, 1350, 1300, -1,
-	1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
-	1075, 1050, 1025, 1000, 975, 950, 925, -1,
+struct mV_pos {
+    unsigned short mV;
+    unsigned short pos;
+};
+
+static struct mV_pos __initdata vrm85_mV[32] =3D {
+        {1250, 8},	{1200, 6},	{1150, 4},	{1100, 2},
+	{1050, 0},	{1800, 30},	{1750, 28},	{1700, 26},
+	{1650, 24},	{1600, 22},	{1550, 20},	{1500, 18},
+	{1450, 16},	{1400, 14},	{1350, 12},	{1300, 10},
+        {1275, 9},	{1225, 7},	{1175, 5},	{1125, 3},
+	{1075, 1},	{1825, 31},	{1775, 29},	{1725, 27},
+        {1675, 25},	{1625, 23},	{1575, 21},	{1525, 19},
+	{1475, 17},	{1425, 15},	{1375, 13},	{1325, 11}
+};
+
+static unsigned char __initdata mV_vrm85[32] =3D {
+	0x04,	0x14,	0x03,	0x13,	0x02,	0x12,	0x01,	0x11,
+	0x00,	0x10,	0x0f,	0x1f,	0x0e,	0x1e,	0x0d,	0x1d,
+	0x0c,	0x1c,	0x0b,	0x1b,	0x0a,	0x1a,	0x09,	0x19,
+	0x08,	0x18,	0x07,	0x17,	0x06,	0x16,	0x05,	0x15
+};
+
+static struct mV_pos __initdata mobilevrm_mV[32] =3D {
+	{1750, 31},	{1700, 30},	{1650, 29},	{1600, 28},
+	{1550, 27},	{1500, 26},	{1450, 25},	{1400, 24},
+	{1350, 23},	{1300, 22},	{1250, 21},	{1200, 20},
+	{1150, 19},	{1100, 18},	{1050, 17},	{1000, 16},
+	{975, 15},	{950, 14},	{925, 13},	{900, 12},
+	{875, 11},	{850, 10},	{825, 9},	{800, 8},
+	{775, 7},	{750, 6},	{725, 5},	{700, 4},
+	{675, 3},	{650, 2},	{625, 1},	{600, 0}
+};
+
+static unsigned char __initdata mV_mobilevrm[32] =3D {
+	0x1f,	0x1e,	0x1d,	0x1c,	0x1b,	0x1a,	0x19,	0x18,
+	0x17,	0x16,	0x15,	0x14,	0x13,	0x12,	0x11,	0x10,
+	0x0f,	0x0e,	0x0d,	0x0c,	0x0b,	0x0a,	0x09,	0x08,
+	0x07,	0x06,	0x05,	0x04,	0x03,	0x02,	0x01,	0x00
 };
-

------------------------------------------------------------------------
Interaktywne mapy miast na http://map24.interia.pl
