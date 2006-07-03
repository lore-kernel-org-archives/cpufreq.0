From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Use hardware support
Date: Mon, 03 Jul 2006 07:19:05 +0200
Message-ID: <44A8A8C9.3070901@interia.pl>
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

This patch depends on "Longhaul - There are limits".
Minimal change necessary for hardware support.

Changes in longhaul.c:
- most important - now C3 state is causing transition,
- code resopnsible for clearing "bus master" bit removed,
- protect bcr2 transition in the same way as longhaul.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

--- linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c.orig	2006-07=
-02 19:41:52.000000000 +0200
+++ linux-2.6.17-git20/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-07-03 0=
6:43:54.000000000 +0200
@@ -29,11 +29,13 @@
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/pci.h>
=20
 #include <asm/msr.h>
 #include <asm/timex.h>
 #include <asm/io.h>
+#include <asm/acpi.h>
+#include <linux/acpi.h>
+#include <acpi/processor.h>
=20
 #include "longhaul.h"
=20
@@ -56,6 +58,8 @@ static int minvid, maxvid;
 static unsigned int minmult, maxmult;
 static int can_scale_voltage;
 static int vrmrev;
+static struct acpi_processor *pr =3D NULL;
+static struct acpi_processor_cx *cx =3D NULL;
=20
 /* Module parameters */
 static int dont_scale_voltage;
@@ -118,84 +122,64 @@ static int longhaul_get_cpu_mult(void)
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
+static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
+{
+	union msr_longhaul longhaul;
+	u32 t;
+
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;
+	longhaul.bits.SoftBusRatio =3D clock_ratio_index & 0xf;
+	longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
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
@@ -209,9 +193,9 @@ static void longhaul_setstate(unsigned i
 {
 	int speed, mult;
 	struct cpufreq_freqs freqs;
-	union msr_longhaul longhaul;
-	union msr_bcr2 bcr2;
 	static unsigned int old_ratio=3D-1;
+	unsigned long flags;
+	unsigned int pic1_mask, pic2_mask;
=20
 	if (old_ratio =3D=3D clock_ratio_index)
 		return;
@@ -234,6 +218,20 @@ static void longhaul_setstate(unsigned i
 	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
 			fsb, mult/10, mult%10, print_speed(speed/1000));
=20
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
+
 	switch (longhaul_version) {
=20
 	/*
@@ -245,20 +243,7 @@ static void longhaul_setstate(unsigned i
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
=20
 	/*
@@ -273,10 +258,22 @@ static void longhaul_setstate(unsigned i
 	 * to work in practice.
 	 */
 	case TYPE_POWERSAVER:
-		do_powersaver(&longhaul, clock_ratio_index);
+		do_powersaver(cx->address, clock_ratio_index);
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
 }
=20
@@ -527,6 +524,18 @@ static unsigned int longhaul_get(unsigne
 	return calc_speed(longhaul_get_cpu_mult());
 }
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
=20
 static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 {
@@ -534,6 +543,15 @@ static int __init longhaul_cpu_init(stru
 	char *cpuname=3DNULL;
 	int ret;
=20
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
 	switch (c->x86_model) {
 	case 6:
 		cpu_model =3D CPU_SAMUEL;
@@ -634,6 +652,10 @@ static int __init longhaul_cpu_init(stru
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


----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
