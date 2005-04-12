From: <ken_staton@agilent.com>
Subject: longhaul
Date: Mon, 11 Apr 2005 22:46:56 -0700
Message-ID: <3EFE14A8A1A82D4BB867A48A01A88ED708A08A@waglmb01.labs.agilent.com>
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


here's a partial fix for longhaul on a nehemiah c3-2.

the code in do_powersaver() is significantly changed.

frequency changes occur after the HLT instruction and there must
be more than 20 usec between HLT and the interrupt that brings
the cpu out of HLT. the only interrupt you have any chance of =
controlling
is the timer interrupt.

the algorithm for this:

1. disable all interrupts
2. mask all interrupts off except timer (irq0)
3. enable interrupts (i.e. just irq0)
4. HLT (so we know we've just had a tick before changing the MSR)
5. write the MSR
6. HLT (this changes the frequency)
7. disable all interrupts
8. restore the original interrupt mask
9. re-enable interrupts


the reason this is a partial fix:

external hardware signals (NMI, INIT, SMI, FLUSH) interferes with the=20
frequency change.

****> this is the hard one:
cache snooping interferes with the frequency change.
so if DMA is accessing memory, cache snooping is active.

my partial fix waits for the ide dma to be idle and then dives into the=20
frequency change.
other dma controllers (e.g. bus mastering pci card, legacy (isa) dma =
channels)
will cause the same problem.



---
ken





--- longhaul-2.6.11.7.c	2005-04-11 22:12:18.000000000 -0700
+++ longhaul.c	2005-04-11 22:13:51.000000000 -0700
@@ -30,6 +30,11 @@
  #include <linux/slab.h>
  #include <linux/string.h>

+#include <linux/ide.h>
+#include <linux/delay.h>
+#include <asm/irq.h>
+#include <linux/sched.h>
+
  #include <asm/msr.h>
  #include <asm/timex.h>
  #include <asm/io.h>
@@ -58,13 +63,26 @@

  /* Module parameters */
  static int dont_scale_voltage;
+static int debug;
+
+static void dprintk(const char *fmt, ...)
+{
+	char s[256];
+	va_list args;

+	if (debug =3D=3D 0)
+		return;

-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER,=20
"longhaul", msg)
+	va_start(args, fmt);
+	vsprintf(s, fmt, args);
+	printk(s);
+	va_end(args);
+}


  #define __hlt()     __asm__ __volatile__("hlt": : :"memory")

+
  /* Clock ratios multiplied by 10 */
  static int clock_ratio[32];
  static int eblcr_table[32];
@@ -72,10 +90,31 @@
  static unsigned int highest_speed, lowest_speed; /* kHz */
  static int longhaul_version;
  static struct cpufreq_frequency_table *longhaul_table;
-
-#ifdef CONFIG_CPU_FREQ_DEBUG
  static char speedbuffer[8];

+spinlock_t long_lock =3D SPIN_LOCK_UNLOCKED;
+
+
+void dma_idle(void) {
+	int i;
+	ide_hwif_t *hwif =3D ide_hwifs;
+	ide_drive_t *drive;
+
+	i =3D 0;
+	do {
+	  drive =3D &hwif->drives[i];
+	  i++;
+	  if (strncmp(drive->name,"hd",2) =3D=3D 0) {
+	    while (drive->waiting_for_dma) udelay(10) ;
+	  } else {
+	    i =3D 0;
+	  }
+	}
+	while (i !=3D 0);
+}
+
+
+
  static char *print_speed(int speed)
  {
  	if (speed > 1000) {
@@ -88,7 +127,6 @@

  	return speedbuffer;
  }
-#endif


  static unsigned int calc_speed(int mult)
@@ -121,6 +159,13 @@
  {
  	int version;

+	unsigned long flags;
+	unsigned int tmp_mask;
+
+
+	dprintk(KERN_INFO PFX " %d ",clock_ratio_index);
+
+
  	switch (cpu_model) {
  	case CPU_EZRA_T:
  		version =3D 3;
@@ -133,23 +178,54 @@
  	}

  	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+
  	longhaul->bits.SoftBusRatio =3D clock_ratio_index & 0xf;
  	longhaul->bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
  	longhaul->bits.EnableSoftBusRatio =3D 1;
  	longhaul->bits.RevisionKey =3D 0;
-	local_irq_disable();
+
+	dma_idle();	// ide dma only...
+
+// BEGIN CRITICAL SECTION
+
+//	preempt_disable();
+	local_irq_save(flags);
+
+	// disabling INT2 takes care of ints 8-15 (cascaded)
+
+	tmp_mask=3Dinb(0x21);	// works on C3. save mask.
+        outb(0xFE,0x21);        // TMR0 only
+//        outb(0xFF,0x80);        // delay
+
+
+	local_irq_enable();	// sti
+
+	__hlt();	// wait to catch a full timer tick interval
+
  	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	local_irq_enable();
-	__hlt();
+
+	__hlt();	// change PLL. wait for stable clock.
+
+	local_irq_disable();	// cli
+
+	outb(tmp_mask,0x21);	// restore mask
+
+	local_irq_restore(flags);
+//	preempt_enable();
+
+// END CRITICAL SECTION
+
+	// disable bus ratio bit

  	rdmsrl(MSR_VIA_LONGHAUL, longhaul->val);
+
  	longhaul->bits.EnableSoftBusRatio =3D 0;
  	longhaul->bits.RevisionKey =3D version;
-	local_irq_disable();
+
  	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
-	local_irq_enable();
  }

+
  /**
   * longhaul_set_cpu_frequency()
   * @clock_ratio_index : bitpattern of the new multiplier.
@@ -183,7 +259,7 @@

  	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);

-	dprintk ("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
+	dprintk (KERN_INFO PFX "Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
  			fsb, mult/10, mult%10, print_speed(speed/1000));

  	switch (longhaul_version) {
@@ -213,6 +289,7 @@
  		local_irq_disable();
  		wrmsrl (MSR_VIA_BCR2, bcr2.val);
  		local_irq_enable();
+
  		break;

  	/*
@@ -347,7 +424,7 @@
  		}
  	}

-	dprintk ("MinMult:%d.%dx MaxMult:%d.%dx\n",
+	dprintk (KERN_INFO PFX "MinMult:%d.%dx MaxMult:%d.%dx\n",
  		 minmult/10, minmult%10, maxmult/10, maxmult%10);

  	if (fsb =3D=3D -1) {
@@ -357,9 +434,9 @@

  	highest_speed =3D calc_speed(maxmult);
  	lowest_speed =3D calc_speed(minmult);
-	dprintk ("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
-		 print_speed(lowest_speed/1000),
-		 print_speed(highest_speed/1000));
+	dprintk (KERN_INFO PFX "FSB:%dMHz  ", fsb);
+	dprintk ("Lowest speed:%s  ", print_speed(lowest_speed/1000));
+	dprintk ("Highest speed:%s\n", print_speed(highest_speed/1000));

  	if (lowest_speed =3D=3D highest_speed) {
  		printk (KERN_INFO PFX "highestspeed =3D=3D lowest, aborting.\n");
@@ -425,11 +502,11 @@
  	}

  	if (vrmrev=3D=3D0) {
-		dprintk ("VRM 8.5 \n");
+		dprintk (KERN_INFO PFX "VRM 8.5 : ");
  		memcpy (voltage_table, vrm85scales, sizeof(voltage_table));
  		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/25;
  	} else {
-		dprintk ("Mobile VRM \n");
+		dprintk (KERN_INFO PFX "Mobile VRM : ");
  		memcpy (voltage_table, mobilevrmscales, sizeof(voltage_table));
  		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/5;
  	}
@@ -578,7 +655,7 @@
  		longhaul_setup_voltagescaling();

  	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency =3D CPUFREQ_ETERNAL;
+	policy->cpuinfo.transition_latency =3D 20000; // nSec =3D 20uS
  	policy->cur =3D calc_speed(longhaul_get_cpu_mult());

  	ret =3D cpufreq_frequency_table_cpuinfo(policy, longhaul_table);
@@ -631,6 +708,7 @@
  }


+
  static void __exit longhaul_exit(void)
  {
  	int i=3D0;
@@ -649,6 +727,9 @@
  module_param (dont_scale_voltage, int, 0644);
  MODULE_PARM_DESC(dont_scale_voltage, "Don't scale voltage of =
processor");

+module_param (debug, int, 0644);
+MODULE_PARM_DESC(debug, "Dump debugging information.");
+
  MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
  MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
  MODULE_LICENSE ("GPL");
