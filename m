From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Longhaul - patch proposal
Date: Fri, 12 May 2006 22:37:14 +0200
Message-ID: <4464F1FA.4010304@interia.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070306050908070205050606"
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
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------070306050908070205050606
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

Sorry. Bad English inside.
Idea is simple - write ide suspend which waits for end of DMA transfer.



----------------------------------------------------------------------
Poznaj Stefana! Zmien komunikator! >>> http://link.interia.pl/f1924

--------------070306050908070205050606
Content-Type: text/plain;
 name="longhaul.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="longhaul.patch"

--- longhaul.orig.c	2006-03-20 06:53:29.000000000 +0100
+++ longhaul.c	2006-05-12 22:05:08.000000000 +0200
@@ -30,6 +30,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/pci.h>
+#include <linux/pm.h>
 
 #include <asm/msr.h>
 #include <asm/timex.h>
@@ -114,17 +115,114 @@
 	return eblcr_table[invalue];
 }
 
+/* This is copy from pci.c and pci-driver.c
+ * Better export this functions there 
+ */
 
-static void do_powersaver(union msr_longhaul *longhaul,
-			unsigned int clock_ratio_index)
+static void goto_sleep_pci(void)
 {
 	struct pci_dev *dev;
+	struct pci_driver *drv;
+	struct pm_message pm_freeze;
+	u16 pci_command;
+
+	/*
+	 * Get current pci bus master state for all devices
+	 * and clear bus master bit
+	 */
+
+	pm_freeze.event = PM_EVENT_FREEZE;
+	dev = NULL;
+	do {
+		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
+		if (dev != NULL) {
+			drv = dev->driver;
+			if (drv && drv->suspend)
+				drv->suspend(dev, pm_freeze);
+			else
+	    			pci_save_state(dev);
+			pci_read_config_word(dev, PCI_COMMAND, &pci_command);
+			if (pci_command & PCI_COMMAND_MASTER) {
+				pci_command &= ~PCI_COMMAND_MASTER;
+				pci_write_config_word(dev, PCI_COMMAND, pci_command);
+			}
+			/* pcibios_disable_device omited because
+			   USB devices don't respond after resume
+			   on EPIA M10000 */
+		}
+	} while (dev != NULL);
+}
+
+static void wakeup_pci(void)
+{
+	struct pci_dev *dev;
+	struct pci_driver *drv;
+
+	/* Restore pci bus master state for all devices */
+
+	dev = NULL;
+	do {
+		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
+		if (dev != NULL) {
+			drv = dev->driver;
+			if (drv && drv->resume)
+				drv->resume(dev);
+			else
+				/* restore the PCI config space */
+				pci_restore_state(dev);
+	    		/* if the device was busmaster before the suspend, make it busmaster again */
+			if (dev->is_busmaster)
+				pci_set_master(dev);
+			/* if the device was enabled before suspend, reenable */
+			if (dev->is_enabled)
+				pci_enable_device(dev);
+		}
+	} while (dev != NULL);
+}
+
+static void do_longhaul1(int reserved, unsigned int clock_ratio_index)
+{
 	unsigned long flags;
 	unsigned int tmp_mask;
+	union msr_bcr2 bcr2;
+
+	preempt_disable();
+	goto_sleep_pci();
+
+	local_irq_save(flags);
+
+	tmp_mask=inb(0x21);	/* works on C3. save mask. */
+	outb(0xFE, 0x21);	/* TMR0 only */
+
+	local_irq_disable();
+	rdmsrl(MSR_VIA_BCR2, bcr2.val);
+	/* Enable software clock multiplier */
+	bcr2.bits.ESOFTBF = 1;
+	bcr2.bits.CLOCKMUL = clock_ratio_index;
+	safe_halt();		/* Sync */
+	wrmsrl(MSR_VIA_BCR2, bcr2.val);	/* Change */
+	halt();
+
+	/* Disable software clock multiplier */
+	local_irq_disable();
+	rdmsrl(MSR_VIA_BCR2, bcr2.val);
+	bcr2.bits.ESOFTBF = 0;
+	wrmsrl(MSR_VIA_BCR2, bcr2.val);
+	local_irq_enable();
+
+	outb(tmp_mask, 0x21);	/* restore mask */
+	local_irq_restore(flags);
+
+	wakeup_pci();
+	preempt_enable();
+}
+
+static void do_powersaver(union msr_longhaul *longhaul,
+			unsigned int clock_ratio_index)
+{
+	unsigned long flags;
+	unsigned int pic1_mask, pic2_mask;
 	int version;
-	int i;
-	u16 pci_cmd;
-	u16 cmd_state[64];
 
 	switch (cpu_model) {
 	case CPU_EZRA_T:
@@ -137,61 +235,40 @@
 		return;
 	}
 
+	preempt_disable();
+	goto_sleep_pci();
+
+	local_irq_save(flags);
+
+	pic2_mask=inb(0xA1);
+	pic1_mask=inb(0x21);	/* works on C3. save mask. */
+	outb(0xFF,0xA1);	/* Overkill */
+	outb(0xFE,0x21);	/* TMR0 only */
+
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
 	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
 	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
 	longhaul->bits.EnableSoftBusRatio = 1;
 	longhaul->bits.RevisionKey = 0;
 
-	preempt_disable();
-	local_irq_save(flags);
-
-	/*
-	 * get current pci bus master state for all devices
-	 * and clear bus master bit
-	 */
-	dev = NULL;
-	i = 0;
-	do {
-		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
-		if (dev != NULL) {
-			pci_read_config_word(dev, PCI_COMMAND, &pci_cmd);
-			cmd_state[i++] = pci_cmd;
-			pci_cmd &= ~PCI_COMMAND_MASTER;
-			pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
-		}
-	} while (dev != NULL);
-
-	tmp_mask=inb(0x21);	/* works on C3. save mask. */
-	outb(0xFE,0x21);	/* TMR0 only */
-	outb(0xFF,0x80);	/* delay */
-
-	safe_halt();
+	safe_halt();		/* Sync */
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
 	halt();
 
 	local_irq_disable();
 
-	outb(tmp_mask,0x21);	/* restore mask */
-
-	/* restore pci bus master state for all devices */
-	dev = NULL;
-	i = 0;
-	do {
-		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
-		if (dev != NULL) {
-			pci_cmd = cmd_state[i++];
-			pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
-		}
-	} while (dev != NULL);
-	local_irq_restore(flags);
-	preempt_enable();
-
 	/* disable bus ratio bit */
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
 	longhaul->bits.EnableSoftBusRatio = 0;
 	longhaul->bits.RevisionKey = version;
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+
+	outb(pic2_mask,0xA1);
+	outb(pic1_mask,0x21);	/* restore mask */
+	local_irq_restore(flags);
+
+	wakeup_pci();
+	preempt_enable();
 }
 
 /**
@@ -206,7 +283,6 @@
 	int speed, mult;
 	struct cpufreq_freqs freqs;
 	union msr_longhaul longhaul;
-	union msr_bcr2 bcr2;
 	static unsigned int old_ratio=-1;
 
 	if (old_ratio == clock_ratio_index)
@@ -241,20 +317,7 @@
 	 */
 	case TYPE_LONGHAUL_V1:
 	case TYPE_LONGHAUL_V2:
-		rdmsrl (MSR_VIA_BCR2, bcr2.val);
-		/* Enable software clock multiplier */
-		bcr2.bits.ESOFTBF = 1;
-		bcr2.bits.CLOCKMUL = clock_ratio_index;
-		local_irq_disable();
-		wrmsrl (MSR_VIA_BCR2, bcr2.val);
-		safe_halt();
-
-		/* Disable software clock multiplier */
-		rdmsrl (MSR_VIA_BCR2, bcr2.val);
-		bcr2.bits.ESOFTBF = 0;
-		local_irq_disable();
-		wrmsrl (MSR_VIA_BCR2, bcr2.val);
-		local_irq_enable();
+		do_longhaul1(0, clock_ratio_index);
 		break;
 
 	/*

--------------070306050908070205050606
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------070306050908070205050606--

