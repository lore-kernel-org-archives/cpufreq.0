From: <ken_staton@agilent.com>
Subject: [PATCH] longhaul
Date: Wed, 20 Apr 2005 09:49:20 -0700
Message-ID: <3EFE14A8A1A82D4BB867A48A01A88ED708A094@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk


here's the patch for longhaul on a nehemiah c3-2.

the patch is against 2.6.11.7
i've undone dprintk because it was more convenient to test on both 2.4 =
and 2.6 kernels.

refer to the text sent to this list on 11apr2005.

note that 8237 dma might still cause problems.
get_dma_residue() on all channels until they are all zero if you need =
to.
8237 transfer sizes are small enough that they should complete
before the frequency change once pci bus mastering is shut down.






--- longhaul.c	2005-04-20 09:15:55.000000000 -0700
+++ longhaul-rc2.c	2005-04-20 09:15:13.000000000 -0700
@@ -30,6 +30,9 @@
 #include <linux/slab.h>
 #include <linux/string.h>
=20
+#include <linux/ide.h>
+#include <linux/delay.h>
+
 #include <asm/msr.h>
 #include <asm/timex.h>
 #include <asm/io.h>
@@ -58,13 +61,26 @@
=20
 /* Module parameters */
 static int dont_scale_voltage;
+static int debug;
=20
+static void dprintk(const char *fmt, ...)
+{
+        char s[256];
+        va_list args;
=20
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, =
"longhaul", msg)
+        if (debug =3D=3D 0)
+                return;
+
+        va_start(args, fmt);
+        vsprintf(s, fmt, args);
+        printk(s);
+        va_end(args);
+}
=20
=20
 #define __hlt()     __asm__ __volatile__("hlt": : :"memory")
=20
+
 /* Clock ratios multiplied by 10 */
 static int clock_ratio[32];
 static int eblcr_table[32];
@@ -73,9 +89,25 @@
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
=20
-#ifdef CONFIG_CPU_FREQ_DEBUG
 static char speedbuffer[8];
=20
+void ide_idle(void) {
+	int i;
+	ide_hwif_t *hwif =3D ide_hwifs;
+	ide_drive_t *drive;
+
+	i =3D 0;
+	do {
+		drive =3D &hwif->drives[i];
+		i++;
+		if (strncmp(drive->name,"hd",2) =3D=3D 0) {
+			while (drive->waiting_for_dma) udelay(10) ;
+		} else {
+			i =3D 0;
+		}
+	} while (i !=3D 0);
+}
+
 static char *print_speed(int speed)
 {
 	if (speed > 1000) {
@@ -88,7 +120,6 @@
=20
 	return speedbuffer;
 }
-#endif
=20
=20
 static unsigned int calc_speed(int mult)
@@ -120,6 +151,12 @@
 			unsigned int clock_ratio_index)
 {
 	int version;
+	unsigned long flags;
+	unsigned int tmp_mask;
+	struct pci_dev *dev;
+	int i;
+	u16 pci_cmd;
+	u16 cmd_state[64];
=20
 	switch (cpu_model) {
 	case CPU_EZRA_T:
@@ -133,21 +170,77 @@
 	}
=20
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+
 	longhaul->bits.SoftBusRatio =3D clock_ratio_index & 0xf;
 	longhaul->bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
 	longhaul->bits.EnableSoftBusRatio =3D 1;
 	longhaul->bits.RevisionKey =3D 0;
-	local_irq_disable();
+
+	/* Begin critical section */
+	preempt_disable();
+	ide_idle();	/* avoid ide timeouts when bus master off */
+	local_irq_save(flags);
+
+	/* get current pci bus master state for all devices */
+	/* and clear bus master bit */
+
+	dev =3D NULL;
+	i =3D 0;
+	do {
+		dev =3D pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
+		if (dev !=3D NULL) {
+			pci_read_config_word(dev, PCI_COMMAND, &pci_cmd);
+			cmd_state[i++] =3D pci_cmd;
+			pci_cmd &=3D ~PCI_COMMAND_MASTER;
+			pci_write_config_word(dev, PCI_COMMAND, pci_cmd);
+		}
+	} while (dev !=3D NULL);
+
+	/* disabling INT2 takes care of ints 8-15 (cascaded) */
+
+	tmp_mask=3Dinb(0x21);	/* works on C3. save mask. */
+	outb(0xFE,0x21);        /* TMR0 only */
+	outb(0xFF,0x80);        /* delay */
+
+	local_irq_enable();     /* sti */
+
+	__hlt();		/* make sure we've got a full tick */
+
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	local_irq_enable();
+
 	__hlt();
=20
+	local_irq_disable();	/* cli */
+
+	outb(tmp_mask,0x21);  /* restore mask */
+
+	/* restore pci bus master state for all devices */
+
+	dev =3D NULL;
+	i =3D 0;
+	do {
+		dev =3D pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
+		if (dev !=3D NULL) {
+			pci_cmd =3D cmd_state[i++];
+			pci_write_config_byte(dev, PCI_COMMAND, pci_cmd);
+		}
+	} while (dev !=3D NULL);
+
+	local_irq_restore(flags);
+
+	preempt_enable();
+
+	/* END CRITICAL SECTION */
+
+	/* disable bus ratio bit */
+
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+
 	longhaul->bits.EnableSoftBusRatio =3D 0;
 	longhaul->bits.RevisionKey =3D version;
-	local_irq_disable();
+
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	local_irq_enable();
+
 }
=20
 /**
@@ -578,7 +671,7 @@
 		longhaul_setup_voltagescaling();
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
+	policy->cpuinfo.transition_latency =3D 200000;	/* nsec */
 	policy->cur =3D calc_speed(longhaul_get_cpu_mult());
=20
 	ret =3D cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
@@ -649,6 +742,9 @@
 module_param (dont_scale_voltage, int, 0644);
 MODULE_PARM_DESC(dont_scale_voltage, "Don't scale voltage of =
processor");
=20
+module_param (debug, int, 0644);
+MODULE_PARM_DESC(debug, "Dump debugging information.");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
 MODULE_LICENSE ("GPL");
