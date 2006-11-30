From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Add support for CN400
Date: Thu, 30 Nov 2006 03:47:41 +0100
Message-ID: <456E464D.8060708@interia.pl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Support for CN400 northbridge when ACPI C3 isn't available.
Tested on Epia SP13000. Thanks to Robert for testing it.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---=20

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -583,6 +583,11 @@ static int enable_arbiter_disable(void)
 	if (dev =3D=3D NULL) {
 		reg =3D 0x76;
 		dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NUL=
L);
+		/* Find CN400 V-Link host bridge */
+		if (dev =3D=3D NULL) {
+			dev =3D pci_find_device(PCI_VENDOR_ID_VIA, 0x7259, NULL);
+		}
+=20
 	}
 	if (dev !=3D NULL) {
 		/* Enable access to port 0x22 */
@@ -734,7 +739,7 @@ print_support_type:
 	return 0;
=20
 err_acpi:
-	printk(KERN_ERR PFX "No ACPI support. No VT8601 or VT8623 northbridge. Ab=
orting.\n");
+	printk(KERN_ERR PFX "No ACPI support. Unsupported northbridge. Aborting.\=
n");
 	return -ENODEV;
 }


----------------------------------------------------------------------
PS. >>> http://link.interia.pl/f19a6
