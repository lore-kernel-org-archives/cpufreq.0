From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Longhaul - patch proposal
Date: Sun, 14 May 2006 08:51:12 +0200
Message-ID: <4466D360.9070204@interia.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000803040002030008090506"
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
To: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------000803040002030008090506
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit

I think this is working. Patches are for linux-2.6.16. Preempt_disable
seems to be unnecesary before goto_sleep_pci so I do it later. I can do:

while [ 1 ]
do
echo >scaling_setspeed 532000
sleep 1s
echo >scaling_setspeed 997000
sleep 1s
done

on one console while on other is running:

while [ 1 ]
do
hdparm -t /dev/hda
done

Output (24MB/s is max for my drive):
dev/hda:
 Timing buffered disk reads:   60 MB in  3.02 seconds =  19.90 MB/sec
 Timing buffered disk reads:   62 MB in  3.02 seconds =  20.52 MB/sec
 Timing buffered disk reads:   68 MB in  3.01 seconds =  22.56 MB/sec
 Timing buffered disk reads:   50 MB in  3.44 seconds =  14.55 MB/sec
 Timing buffered disk reads:   70 MB in  3.07 seconds =  22.80 MB/sec




----------------------------------------------------------------------
Poznaj Stefana! Zmien komunikator! >>> http://link.interia.pl/f1924

--------------000803040002030008090506
Content-Type: text/plain;
 name="longhaul.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="longhaul.patch"

--- longhaul.orig.c	2006-03-20 06:53:29.000000000 +0100
+++ longhaul.c	2006-05-14 00:28:01.000000000 +0200
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
+	goto_sleep_pci();
+
+	preempt_disable();
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
+	preempt_enable();
+
+	wakeup_pci();
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
 
-	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
-	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-	longhaul->bits.EnableSoftBusRatio = 1;
-	longhaul->bits.RevisionKey = 0;
+	goto_sleep_pci();
 
 	preempt_disable();
 	local_irq_save(flags);
 
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
+	pic2_mask=inb(0xA1);
+	pic1_mask=inb(0x21);	/* works on C3. save mask. */
+	outb(0xFF,0xA1);	/* Overkill */
 	outb(0xFE,0x21);	/* TMR0 only */
-	outb(0xFF,0x80);	/* delay */
 
-	safe_halt();
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
+	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
+	longhaul->bits.EnableSoftBusRatio = 1;
+	longhaul->bits.RevisionKey = 0;
+
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
+	preempt_enable();
+
+	wakeup_pci();
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

--------------000803040002030008090506
Content-Type: text/plain;
 name="via82cxxx.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="via82cxxx.patch"

--- via82cxxx.orig.c	2006-05-01 09:18:15.000000000 +0200
+++ via82cxxx.c	2006-05-14 08:23:48.000000000 +0200
@@ -34,6 +34,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/ide.h>
+#include <linux/pm.h>
 #include <asm/io.h>
 
 #ifdef CONFIG_PPC_MULTIPLATFORM
@@ -469,6 +470,99 @@
 	hwif->drives[1].autodma = hwif->autodma;
 }
 
+/* Copy of sc1200.c */
+
+static ide_hwif_t *lookup_pci_dev (ide_hwif_t *prev, struct pci_dev *dev)
+{
+	int	h;
+
+	for (h = 0; h < MAX_HWIFS; h++) {
+		ide_hwif_t *hwif = &ide_hwifs[h];
+		if (prev) {
+			if (hwif == prev)
+				prev = NULL;	// found previous, now look for next match
+		} else {
+			if (hwif && hwif->pci_dev == dev)
+				return hwif;	// found next match
+		}
+	}
+	return NULL;	// not found
+}
+
+static int via_suspend(struct pci_dev *dev, pm_message_t state)
+{
+	ide_hwif_t *hwif = NULL;
+	ide_drive_t *drive = NULL;
+	struct request rq;
+	struct request_pm_state rqpm;
+	ide_task_t args;
+	unsigned int d;
+
+	printk("VIA IDE: suspend(%u)\n", state.event);
+
+	while ( ( hwif = lookup_pci_dev(hwif, dev) ) != NULL ) {
+		for (d = 0; d < MAX_DRIVES; ++d) {
+			drive = &(hwif->drives[d]);
+			if (drive->present) {
+				ide_init_drive_cmd(&rq);
+				memset(&rqpm, 0, sizeof(rqpm));
+			    	memset(&args, 0, sizeof(args));
+				rq.flags = REQ_PM_SUSPEND;
+		    		rq.pm = &rqpm;
+				rq.special = &args;
+				rqpm.pm_step = ide_pm_state_start_suspend;
+				rqpm.pm_state = state.event;
+				ide_do_drive_cmd(drive, &rq, ide_head_wait);
+			}
+		}
+	}
+	pci_save_state(dev);
+	pci_disable_device(dev);
+	pci_set_power_state(dev, pci_choose_state(dev, state));
+	dev->current_state = state.event;
+	return 0;
+}
+
+static int via_resume(struct pci_dev *dev)
+{
+	ide_hwif_t *hwif = NULL;
+	ide_drive_t *drive = NULL;
+	struct request rq;
+	struct request_pm_state rqpm;
+	ide_task_t args;
+	unsigned int d;
+
+	printk("VIA IDE: resume\n");
+
+	pci_restore_state(dev);
+	pci_set_power_state(dev, PCI_D0);	// bring chip back from sleep state
+	dev->current_state = PM_EVENT_ON;
+	/* if the device was busmaster before the suspend, make it busmaster again */
+	if (dev->is_busmaster)
+		pci_set_master(dev);
+	/* if the device was enabled before suspend, reenable */
+	if (dev->is_enabled)
+		pci_enable_device(dev);
+
+	while ( ( hwif = lookup_pci_dev(hwif, dev) ) != NULL ) {
+		for (d = 0; d < MAX_DRIVES; ++d) {
+			drive = &(hwif->drives[d]);
+			if (drive->present) {
+				ide_init_drive_cmd(&rq);
+				memset(&args, 0, sizeof(args));
+				memset(&rqpm, 0, sizeof(rqpm));
+				rq.flags = REQ_PM_RESUME;
+		    		rq.pm = &rqpm;
+				rq.special = &args;
+				rqpm.pm_step = ide_pm_state_start_resume;
+				rqpm.pm_state = PM_EVENT_ON;
+				ide_do_drive_cmd(drive, &rq, ide_head_wait);
+			}
+		}
+	}
+	return 0;
+}
+
 static ide_pci_device_t via82cxxx_chipsets[] __devinitdata = {
 	{	/* 0 */
 		.name		= "VP_IDE",
@@ -506,6 +600,8 @@
 	.name 		= "VIA_IDE",
 	.id_table 	= via_pci_tbl,
 	.probe 		= via_init_one,
+	.suspend	= via_suspend,
+	.resume		= via_resume,
 };
 
 static int via_ide_init(void)

--------------000803040002030008090506
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------000803040002030008090506--

