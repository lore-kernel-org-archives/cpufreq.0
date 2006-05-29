From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul
Date: Mon, 29 May 2006 15:25:16 +0200
Message-ID: <447AF63C.2@interia.pl>
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

(HZ_100 | HZ_250) - for BCR2 MSR CPU's.

How it works:
1. Stop processes.
2. Call suspend(PMSG_FREEZE) for all devices.
3. Change frequency
4. Call resume() for all devices.
5. Start processes.

Adventages:
- works (sadly avg rate drops to 8MB/s),
- using infrastructure already in kernel,
- no need to poke PIC registers - all interrupts are disabled anyway
  (APIC compatible?),
- seems to be PREEMPT compatible (no more "sheduling while atomic").

Disadventages:
- suspend(FREEZE) == suspend(SUSPEND) for most devices currently.
  But this will be fixed anyway.
- it takes a moment.


diff -uprN -X linux-2.6.16.18-vanilla/Documentation/dontdiff linux-2.6.16.18-vanilla/arch/i386/kernel/cpu/cpufreq/Kconfig linux-2.6.16.18/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-2.6.16.18-vanilla/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-05-28 15:04:34.000000000 +0200
+++ linux-2.6.16.18/arch/i386/kernel/cpu/cpufreq/Kconfig	2006-05-29 14:26:51.000000000 +0200
@@ -201,9 +201,11 @@ config X86_LONGRUN
 	  If in doubt, say N.
 
 config X86_LONGHAUL
-	tristate "VIA Cyrix III Longhaul"
+	bool "VIA Cyrix III Longhaul (EXPERIMENTAL)"
+	default n
 	select CPU_FREQ_TABLE
-	depends on BROKEN
+	depends on EXPERIMENTAL
+	depends on !SMP && (HZ_100 || HZ_250)
 	help
 	  This adds the CPUFreq driver for VIA Samuel/CyrixIII, 
 	  VIA Cyrix Samuel/C3, VIA Cyrix Ezra and VIA Cyrix Ezra-T 
diff -uprN -X linux-2.6.16.18-vanilla/Documentation/dontdiff linux-2.6.16.18-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.16.18/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-2.6.16.18-vanilla/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16.18/arch/i386/kernel/cpu/cpufreq/longhaul.c	2006-05-29 14:23:30.000000000 +0200
@@ -30,6 +30,8 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/pci.h>
+#include <linux/pm.h>
+#include <linux/sched.h>
 
 #include <asm/msr.h>
 #include <asm/timex.h>
@@ -115,36 +117,17 @@ static int longhaul_get_cpu_mult(void)
 }
 
 
-static void do_powersaver(union msr_longhaul *longhaul,
-			unsigned int clock_ratio_index)
+/**
+ * Just to be 100% sure
+ */
+
+static u16 cmd_state[64];
+
+static void clear_bus_master(void)
 {
 	struct pci_dev *dev;
-	unsigned long flags;
-	unsigned int tmp_mask;
-	int version;
-	int i;
 	u16 pci_cmd;
-	u16 cmd_state[64];
-
-	switch (cpu_model) {
-	case CPU_EZRA_T:
-		version = 3;
-		break;
-	case CPU_NEHEMIAH:
-		version = 0xf;
-		break;
-	default:
-		return;
-	}
-
-	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
-	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-	longhaul->bits.EnableSoftBusRatio = 1;
-	longhaul->bits.RevisionKey = 0;
-
-	preempt_disable();
-	local_irq_save(flags);
+	int i;
 
 	/*
 	 * get current pci bus master state for all devices
@@ -157,22 +140,20 @@ static void do_powersaver(union msr_long
 		if (dev != NULL) {
 			pci_read_config_word(dev, PCI_COMMAND, &pci_cmd);
 			cmd_state[i++] = pci_cmd;
-			pci_cmd &= ~PCI_COMMAND_MASTER;
-			pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
+			if (pci_cmd & PCI_COMMAND_MASTER) {
+				pci_cmd &= ~PCI_COMMAND_MASTER;
+				pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
+			}
 		}
 	} while (dev != NULL);
+}
 
-	tmp_mask=inb(0x21);	/* works on C3. save mask. */
-	outb(0xFE,0x21);	/* TMR0 only */
-	outb(0xFF,0x80);	/* delay */
-
-	safe_halt();
-	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	halt();
-
-	local_irq_disable();
 
-	outb(tmp_mask,0x21);	/* restore mask */
+static void restore_bus_master(void)
+{
+	struct pci_dev *dev;
+	u16 pci_cmd;
+	int i;
 
 	/* restore pci bus master state for all devices */
 	dev = NULL;
@@ -181,11 +162,62 @@ static void do_powersaver(union msr_long
 		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
 		if (dev != NULL) {
 			pci_cmd = cmd_state[i++];
-			pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
+			if (pci_cmd & PCI_COMMAND_MASTER)
+				pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
 		}
 	} while (dev != NULL);
-	local_irq_restore(flags);
-	preempt_enable();
+}
+
+
+static void do_longhaul1(int reserved, unsigned int clock_ratio_index)
+{
+	union msr_bcr2 bcr2;
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
+}
+
+
+static void do_powersaver(union msr_longhaul *longhaul,
+			unsigned int clock_ratio_index)
+{
+	int version;
+
+	switch (cpu_model) {
+	case CPU_EZRA_T:
+		version = 3;
+		break;
+	case CPU_NEHEMIAH:
+		version = 0xf;
+		break;
+	default:
+		return;
+	}
+
+	local_irq_disable();
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+	longhaul->bits.SoftBusRatio = clock_ratio_index & 0xf;
+	longhaul->bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
+	longhaul->bits.EnableSoftBusRatio = 1;
+	longhaul->bits.RevisionKey = 0;
+
+	safe_halt();		/* Sync */
+	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val); /* Change */
+	halt();
+
+	local_irq_disable();
 
 	/* disable bus ratio bit */
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
@@ -206,8 +238,8 @@ static void longhaul_setstate(unsigned i
 	int speed, mult;
 	struct cpufreq_freqs freqs;
 	union msr_longhaul longhaul;
-	union msr_bcr2 bcr2;
 	static unsigned int old_ratio=-1;
+	unsigned long flags;
 
 	if (old_ratio == clock_ratio_index)
 		return;
@@ -230,6 +262,15 @@ static void longhaul_setstate(unsigned i
 	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
 			fsb, mult/10, mult%10, print_speed(speed/1000));
 
+	if ( freeze_processes() )
+		goto thaw;
+	if ( device_suspend(PMSG_FREEZE) ) {
+		printk(KERN_INFO PFX "Some devices failed to freeze\n");
+		goto resume;
+	}
+	clear_bus_master();
+	local_irq_save(flags);
+
 	switch (longhaul_version) {
 
 	/*
@@ -241,20 +282,7 @@ static void longhaul_setstate(unsigned i
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
@@ -273,6 +301,12 @@ static void longhaul_setstate(unsigned i
 		break;
 	}
 
+	local_irq_restore(flags);
+	restore_bus_master();
+resume:
+	device_resume();
+thaw:
+	thaw_processes();
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 }
 



----------------------------------------------------------------------
Tysiace zdjec swietnych samochodow! >>> http://link.interia.pl/f1944
