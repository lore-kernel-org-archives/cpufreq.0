From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Disable arbiter CLE266
Date: Sat, 23 Sep 2006 07:59:01 +0200
Message-ID: <4514CD25.6030901@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

I have datasheet for CLE266 now. It is possible to enable=20
port 0x22 on this chipset too.

This patch is adding support for older CPU connected to=20
CLE266 chipset.=20

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -567,16 +567,23 @@ static acpi_status longhaul_walk_callbac
 static int enable_arbiter_disable(void)
 {
 	struct pci_dev *dev;
+	int port;
 	u8 pci_cmd;
=20
 	/* Find PLE133 host bridge */
+	port =3D 0x78;
 	dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL=
);
+	/* Find CLE266 host bridge */
+	if (dev =3D=3D NULL) {
+		dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NUL=
L);
+		port =3D 0x76;
+	}
 	if (dev !=3D NULL) {
 		/* Enable access to port 0x22 */
-		pci_read_config_byte(dev, 0x78, &pci_cmd);
+		pci_read_config_byte(dev, port, &pci_cmd);
 		if ( !(pci_cmd & 1<<7) ) {
 			pci_cmd |=3D 1<<7;
-			pci_write_config_byte(dev, 0x78, pci_cmd);
+			pci_write_config_byte(dev, port, pci_cmd);
 		}
 		return 1;
 	}


----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
