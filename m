From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Correct PCI code
Date: Fri, 02 Mar 2007 20:12:27 +0100
Message-ID: <45E8771B.4050609@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk, =?ISO-8859-2?Q?Micha=B3_Piotrowski?= <michal.k.k.piotrowski@gmail.com>


Replace obsolete pci_find_device with pci_get_device.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -590,20 +590,23 @@ static acpi_status longhaul_walk_callback(acpi_handle obj_handle,
 static int enable_arbiter_disable(void)
 {
 	struct pci_dev *dev;
+	int status;
 	int reg;
 	u8 pci_cmd;
 
+	status = 1;
 	/* Find PLE133 host bridge */
 	reg = 0x78;
-	dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL);
+	dev = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0,
+			     NULL);
 	/* Find CLE266 host bridge */
 	if (dev == NULL) {
 		reg = 0x76;
-		dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NULL);
+		dev = pci_get_device(PCI_VENDOR_ID_VIA,
+				     PCI_DEVICE_ID_VIA_862X_0, NULL);
 		/* Find CN400 V-Link host bridge */
 		if (dev == NULL)
-			dev = pci_find_device(PCI_VENDOR_ID_VIA, 0x7259, NULL);
-
+			dev = pci_get_device(PCI_VENDOR_ID_VIA, 0x7259, NULL);
 	}
 	if (dev != NULL) {
 		/* Enable access to port 0x22 */
@@ -615,10 +618,11 @@ static int enable_arbiter_disable(void)
 			if (!(pci_cmd & 1<<7)) {
 				printk(KERN_ERR PFX
 					"Can't enable access to port 0x22.\n");
-				return 0;
+				status = 0;
 			}
 		}
-		return 1;
+		pci_dev_put(dev);
+		return status;
 	}
 	return 0;
 }
@@ -629,7 +633,7 @@ static int longhaul_setup_vt8235(void)
 	u8 pci_cmd;
 
 	/* Find VT8235 southbridge */
-	dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8235, NULL);
+	dev = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8235, NULL);
 	if (dev != NULL) {
 		/* Set transition time to max */
 		pci_read_config_byte(dev, 0xec, &pci_cmd);
@@ -641,6 +645,7 @@ static int longhaul_setup_vt8235(void)
 		pci_read_config_byte(dev, 0xe5, &pci_cmd);
 		pci_cmd |= 1 << 7;
 		pci_write_config_byte(dev, 0xe5, pci_cmd);
+		pci_dev_put(dev);
 		return 1;
 	}
 	return 0;

----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
