From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH][2/4] Longhaul - VT8237
Date: Thu, 17 May 2007 22:35:29 +0200
Message-ID: <464CBC91.1080302@interia.pl>
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


Looks like VT8237 has the same bits which VT8235 has.
Poke registers if it is found.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -633,6 +633,10 @@ static int longhaul_setup_southbridge(void)
=20
 	/* Find VT8235 southbridge */
 	dev =3D pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8235, NULL);
+	if (dev =3D=3D NULL)
+	/* Find VT8237 southbridge */
+		dev =3D pci_get_device(PCI_VENDOR_ID_VIA,
+				     PCI_DEVICE_ID_VIA_8237, NULL);
 	if (dev !=3D NULL) {
 		/* Set transition time to max */
 		pci_read_config_byte(dev, 0xec, &pci_cmd);
--=20



----------------------------------------------------------------------
Nowy darmowy serwis og=B3oszeniowy Populada. Kup, sprzedaj, zamie=F1 =20
>>> http://link.interia.pl/f1a8a
