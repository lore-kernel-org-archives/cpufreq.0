From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Disable arbiter CLE266
Date: Tue, 26 Sep 2006 21:45:05 +0200
Message-ID: <45198341.4080202@interia.pl>
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

Please ignore previous two messages. :-)

This patch is adding support for CPU connected to CLE266=20
chipset. For older CPU this is only way. For "Powersaver"=20
processor this way will be used if ACPI C3 isn't supported.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -178,11 +178,17 @@ static void do_powersaver(int cx_address
 	safe_halt();
 	/* Change frequency on next halt or sleep */
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-	ACPI_FLUSH_CPU_CACHE();
-	/* Invoke C3 */
-	inb(cx_address);
-	/* Dummy op - must do something useless after P_LVL3 read */
-	t =3D inl(acpi_fadt.xpm_tmr_blk.address);
+	if (port22_en) {
+		ACPI_FLUSH_CPU_CACHE();
+		/* Invoke C1 */
+		halt();
+	} else {
+		ACPI_FLUSH_CPU_CACHE();
+		/* Invoke C3 */
+		inb(cx_address);
+		/* Dummy op - must do something useless after P_LVL3 read */
+		t =3D inl(acpi_fadt.xpm_tmr_blk.address);
+	}
=20
 	/* Disable bus ratio bit */
 	local_irq_disable();
@@ -567,16 +573,23 @@ static acpi_status longhaul_walk_callbac
 static int enable_arbiter_disable(void)
 {
 	struct pci_dev *dev;
+	int reg;
 	u8 pci_cmd;
=20
 	/* Find PLE133 host bridge */
+	reg =3D 0x78;
 	dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL=
);
+	/* Find CLE266 host bridge */
+	if (dev =3D=3D NULL) {
+		reg =3D 0x76;
+		dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NUL=
L);
+	}
 	if (dev !=3D NULL) {
 		/* Enable access to port 0x22 */
-		pci_read_config_byte(dev, 0x78, &pci_cmd);
+		pci_read_config_byte(dev, reg, &pci_cmd);
 		if ( !(pci_cmd & 1<<7) ) {
 			pci_cmd |=3D 1<<7;
-			pci_write_config_byte(dev, 0x78, pci_cmd);
+			pci_write_config_byte(dev, reg, pci_cmd);
 		}
 		return 1;
 	}
@@ -680,20 +693,25 @@ static int __init longhaul_cpu_init(stru
 	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
 		/* Check ACPI support for C3 state */
 		cx =3D &pr->power.states[ACPI_STATE_C3];
-		if (cx->address =3D=3D 0 ||
-		   (cx->latency > 1000 && ignore_latency =3D=3D 0) )
+		if (cx->address > 0 &&
+		   (cx->latency <=3D 1000 || ignore_latency !=3D 0) ) {
+			goto print_support_type;
+		}
+	}
+	/* Check ACPI support for bus master arbiter disable */
+	if (!pr->flags.bm_control) {
+		if (enable_arbiter_disable()) {
+			port22_en =3D 1;
+		} else {
 			goto err_acpi;
-
-	} else {
-		/* Check ACPI support for bus master arbiter disable */
-		if (!pr->flags.bm_control) {
-			if (!enable_arbiter_disable()) {
-				printk(KERN_ERR PFX "No ACPI support. No VT8601 host bridge. Aborting.=
\n");
-				return -ENODEV;
-			} else
-				port22_en =3D 1;
 		}
 	}
+print_support_type:
+	if (!port22_en) {
+		printk (KERN_INFO PFX "Using ACPI support.\n");
+	} else {
+		printk (KERN_INFO PFX "Using northbridge support.\n");
+	}
=20
 	ret =3D longhaul_get_ranges();
 	if (ret !=3D 0)
@@ -716,7 +734,7 @@ static int __init longhaul_cpu_init(stru
 	return 0;
=20
 err_acpi:
-	printk(KERN_ERR PFX "No ACPI support for CPU frequency changes.\n");
+	printk(KERN_ERR PFX "No ACPI support. No VT8601 or VT8623 northbridge. Ab=
orting.\n");
 	return -ENODEV;
 }


----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
