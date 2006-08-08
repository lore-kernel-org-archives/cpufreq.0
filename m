From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Disable arbiter
Date: Tue, 08 Aug 2006 19:12:20 +0200
Message-ID: <44D8C5F4.4050406@interia.pl>
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

ACPI C3 works for "Powersaver" processors, so use it=20
only for them.

Older CPU will change frequency on "halt" only. But we=20
can protect transition in two ways:
- by ACPI PM2 register, there is "bus master arbiter=20
  disable" bit. This isn't tested because VIA mainboards=20
  don't have PM2 register,
- by PLE133 PCI/AGP arbiter disable register. There=20
  are two bits in this register. First is "PCI arbiter=20
  disable", second "AGP arbiter disable". This is=20
  working on VIA Epia 800 mainboards.

Test on bm_control is more proper because this is true=20
when PM2 register exist.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -27,6 +27,7 @@ #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
+#include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/string.h>
=20
@@ -60,6 +61,7 @@ static int can_scale_voltage;
 static int vrmrev;
 static struct acpi_processor *pr =3D NULL;
 static struct acpi_processor_cx *cx =3D NULL;
+static int port22_en =3D 0;
=20
 /* Module parameters */
 static int dont_scale_voltage;
@@ -124,10 +126,9 @@ static int longhaul_get_cpu_mult(void)
=20
 /* For processor with BCR2 MSR */
=20
-static void do_longhaul1(int cx_address, unsigned int clock_ratio_index)
+static void do_longhaul1(unsigned int clock_ratio_index)
 {
 	union msr_bcr2 bcr2;
-	u32 t;
=20
 	rdmsrl(MSR_VIA_BCR2, bcr2.val);
 	/* Enable software clock multiplier */
@@ -136,13 +137,11 @@ static void do_longhaul1(int cx_address,
=20
 	/* Sync to timer tick */
 	safe_halt();
-	ACPI_FLUSH_CPU_CACHE();
 	/* Change frequency on next halt or sleep */
 	wrmsrl(MSR_VIA_BCR2, bcr2.val);
-	/* Invoke C3 */
-	inb(cx_address);
-	/* Dummy op - must do something useless after P_LVL3 read */
-	t =3D inl(acpi_fadt.xpm_tmr_blk.address);
+	/* Invoke transition */
+	ACPI_FLUSH_CPU_CACHE();
+	halt();
=20
 	/* Disable software clock multiplier */
 	local_irq_disable();
@@ -166,9 +165,9 @@ static void do_powersaver(int cx_address
=20
 	/* Sync to timer tick */
 	safe_halt();
-	ACPI_FLUSH_CPU_CACHE();
 	/* Change frequency on next halt or sleep */
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+	ACPI_FLUSH_CPU_CACHE();
 	/* Invoke C3 */
 	inb(cx_address);
 	/* Dummy op - must do something useless after P_LVL3 read */
@@ -227,10 +226,13 @@ static void longhaul_setstate(unsigned i
 	outb(0xFF,0xA1);	/* Overkill */
 	outb(0xFE,0x21);	/* TMR0 only */
=20
-	/* Disable bus master arbitration */
-	if (pr->flags.bm_check) {
+	if (pr->flags.bm_control) {
+ 		/* Disable bus master arbitration */
 		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 1,
 				  ACPI_MTX_DO_NOT_LOCK);
+	} else if (port22_en) {
+		/* Disable AGP and PCI arbiters */
+		outb(3, 0x22);
 	}
=20
 	switch (longhaul_version) {
@@ -244,7 +246,7 @@ static void longhaul_setstate(unsigned i
 	 */
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
-		do_longhaul1(cx->address, clock_ratio_index);
+		do_longhaul1(clock_ratio_index);
 		break;
=20
 	/*
@@ -259,14 +261,20 @@ static void longhaul_setstate(unsigned i
 	 * to work in practice.
 	 */
 	case TYPE_POWERSAVER:
+		/* Don't allow wakeup */
+		acpi_set_register(ACPI_BITREG_BUS_MASTER_RLD, 0,
+				  ACPI_MTX_DO_NOT_LOCK);
 		do_powersaver(cx->address, clock_ratio_index);
 		break;
 	}
=20
-	/* Enable bus master arbitration */
-	if (pr->flags.bm_check) {
+	if (pr->flags.bm_control) {
+		/* Enable bus master arbitration */
 		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 0,
 				  ACPI_MTX_DO_NOT_LOCK);
+	} else if (port22_en) {
+		/* Enable arbiters */
+		outb(0, 0x22);
 	}
=20
 	outb(pic2_mask,0xA1);	/* restore mask */
@@ -540,21 +548,33 @@ static acpi_status longhaul_walk_callbac
 	return 1;
 }
=20
+/* VIA don't support PM2 reg, but have something similar */
+static int enable_arbiter_disable(void)
+{
+	struct pci_dev *dev;
+	u8 pci_cmd;
+
+	/* Find PLE133 host bridge */
+	dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL=
);
+	if (dev !=3D NULL) {
+		/* Enable access to port 0x22 */
+		pci_read_config_byte(dev, 0x78, &pci_cmd);
+		if ( !(pci_cmd & 1<<7) ) {
+			pci_cmd |=3D 1<<7;
+			pci_write_config_byte(dev, 0x78, pci_cmd);
+		}
+		return 1;
+	}
+	return 0;
+}
+
 static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c =3D cpu_data;
 	char *cpuname=3DNULL;
 	int ret;
=20
-	/* Check ACPI support for C3 state */
-	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32_MA=
X,
-			 &longhaul_walk_callback, NULL, (void *)&pr);
-	if (pr =3D=3D NULL) goto err_acpi;
-
-	cx =3D &pr->power.states[ACPI_STATE_C3];
-	if (cx->address =3D=3D 0 || cx->latency > 1000) goto err_acpi;
-
-	/* Now check what we have on this motherboard */
+	/* Check what we have on this motherboard */
 	switch (c->x86_model) {
 	case 6:
 		cpu_model =3D CPU_SAMUEL;
@@ -636,6 +656,26 @@ static int __init longhaul_cpu_init(stru
 		break;
 	};
=20
+	/* Find ACPI data for processor */
+	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32_MA=
X,
+			    &longhaul_walk_callback, NULL, (void *)&pr);
+	if (pr =3D=3D NULL) goto err_acpi;
+
+	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
+		/* Check ACPI support for C3 state */
+		cx =3D &pr->power.states[ACPI_STATE_C3];
+		if (cx->address =3D=3D 0 || cx->latency > 1000) goto err_acpi;
+	} else {
+		/* Check ACPI support for bus master arbiter disable */
+		if (!pr->flags.bm_control) {
+			if ( !enable_arbiter_disable() ) {
+				printk(KERN_ERR PFX "No ACPI support. No VT8601 host bridge. Aborting.=
\n");
+		    		return -ENODEV;
+			} else
+				port22_en =3D 1;
+		}
+	}
+
 	ret =3D longhaul_get_ranges();
 	if (ret !=3D 0)
 		return ret;




----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
