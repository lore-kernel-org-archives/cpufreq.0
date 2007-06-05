From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Replace ACPI functions with direct I/O
Date: Tue, 05 Jun 2007 22:08:50 +0200
Message-ID: <4665C2D2.4050502@interia.pl>
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
Cc: cpufreq@lists.linux.org.uk


Current version of "bm status" bit test works as long as
no USB device is in use. When USB device is plugged in ACPI
function in this context is always returning 1. Until reboot.
Direct I/O is working fine even when many USB devices are
connected.
Change bm_timeout value to less annoying. 1000 is still much
more then worst case observed and it is much better when status
bit gets stuck.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   23 ++++++++++++++++-------
 1 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -69,6 +69,7 @@ static unsigned int minmult, maxmult;
 static int can_scale_voltage;
 static struct acpi_processor *pr = NULL;
 static struct acpi_processor_cx *cx = NULL;
+static u32 acpi_regs_addr;
 static u8 longhaul_flags;
 static unsigned int longhaul_index;
 
@@ -247,7 +248,7 @@ static void longhaul_setstate(unsigned int table_index)
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
 	u32 bm_status = 0;
-	u32 bm_timeout = 100000;
+	u32 bm_timeout = 1000;
 	unsigned int dir = 0;
 
 	clock_ratio_index = longhaul_table[table_index].index;
@@ -282,12 +283,13 @@ static void longhaul_setstate(unsigned int table_index)
 	/* Wait while PCI bus is busy. */
 	if (longhaul_flags & USE_NORTHBRIDGE
 	    || ((pr != NULL) && pr->flags.bm_control)) {
-		acpi_get_register(ACPI_BITREG_BUS_MASTER_STATUS, &bm_status);
+		bm_status = inl(acpi_regs_addr);
+		bm_status &= 1 << 4;
 		while (bm_status && bm_timeout) {
-			acpi_set_register(ACPI_BITREG_BUS_MASTER_STATUS, 1);
+			outl(1 << 4, acpi_regs_addr);
 			bm_timeout--;
-			acpi_get_register(ACPI_BITREG_BUS_MASTER_STATUS,
-					  &bm_status);
+			bm_status = inl(acpi_regs_addr);
+			bm_status &= 1 << 4;
 		}
 	}
 
@@ -344,8 +346,7 @@ static void longhaul_setstate(unsigned int table_index)
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
 	if (!bm_timeout)
-		printk(KERN_INFO PFX "Warning: Timeout while waiting for "
-			"idle PCI bus.\n");
+		printk(KERN_INFO PFX "Warning: Timeout while waiting for idle PCI bus.\n");
 }
 
 /*
@@ -713,6 +714,14 @@ static int longhaul_setup_southbridge(void)
 		pci_read_config_byte(dev, 0xe5, &pci_cmd);
 		pci_cmd |= 1 << 7;
 		pci_write_config_byte(dev, 0xe5, pci_cmd);
+		/* Get address of ACPI registers block*/
+		pci_read_config_byte(dev, 0x81, &pci_cmd);
+		if (pci_cmd & 1 << 7) {
+			pci_read_config_dword(dev, 0x88, &acpi_regs_addr);
+			acpi_regs_addr &= 0xff00;
+			printk(KERN_INFO PFX "ACPI I/O at 0x%x\n", acpi_regs_addr);
+		}
+
 		pci_dev_put(dev);
 		return 1;
 	}
-- 


----------------------------------------------------------------------
Kasia Cichopek eksponuje biust  
>>> http://link.interia.pl/f1a6f
