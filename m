From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Embedded "conservative"
Date: Mon, 28 May 2007 21:56:19 +0200
Message-ID: <465B33E3.6020802@interia.pl>
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


Longhaul with voltage scaling enabled works great on Ezra
CPU (Longhaul ver. 2). As long as "conservative" governor is
used. Both "ondemand" and "userspace" can change voltage
from min to max at once. Motherboard unfortunatly turns off
when vid difference is big. Longhaul was printing warning
message, but it is not enough. Now driver will have
"conservative" governor built in and will split bigger
changes to smaller ones.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |  145 ++++++++++++++++++++-----------
 1 files changed, 96 insertions(+), 49 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -29,6 +29,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/delay.h>
 
 #include <asm/msr.h>
 #include <asm/timex.h>
@@ -62,11 +63,6 @@ static unsigned int fsb;
 
 static const struct mV_pos *vrm_mV_table;
 static const unsigned char *mV_vrm_table;
-struct f_msr {
-	u8 vrm;
-	u8 pos;
-};
-static struct f_msr f_msr_table[32];
 
 static unsigned int highest_speed, lowest_speed; /* kHz */
 static unsigned int minmult, maxmult;
@@ -74,7 +70,7 @@ static int can_scale_voltage;
 static struct acpi_processor *pr = NULL;
 static struct acpi_processor_cx *cx = NULL;
 static u8 longhaul_flags;
-static u8 longhaul_pos;
+static unsigned int longhaul_index;
 
 /* Module parameters */
 static int scale_voltage;
@@ -87,7 +83,6 @@ static int clock_ratio[32];
 static int eblcr_table[32];
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
-static unsigned int old_ratio = -1;
 
 #ifdef CONFIG_CPU_FREQ_DEBUG
 static char speedbuffer[8];
@@ -144,7 +139,7 @@ static void do_longhaul1(unsigned int clock_ratio_index)
 	rdmsrl(MSR_VIA_BCR2, bcr2.val);
 	/* Enable software clock multiplier */
 	bcr2.bits.ESOFTBF = 1;
-	bcr2.bits.CLOCKMUL = clock_ratio_index;
+	bcr2.bits.CLOCKMUL = clock_ratio_index & 0xff;
 
 	/* Sync to timer tick */
 	safe_halt();
@@ -163,14 +158,12 @@ static void do_longhaul1(unsigned int clock_ratio_index)
 
 /* For processor with Longhaul MSR */
 
-static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
+static void do_powersaver(int cx_address, unsigned int clock_ratio_index,
+			  unsigned int dir)
 {
 	union msr_longhaul longhaul;
-	u8 dest_pos;
 	u32 t;
 
-	dest_pos = f_msr_table[clock_ratio_index].pos;
-
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 	/* Setup new frequency */
 	longhaul.bits.RevisionKey = longhaul.bits.RevisionID;
@@ -178,11 +171,11 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
 	longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
 	/* Setup new voltage */
 	if (can_scale_voltage)
-		longhaul.bits.SoftVID = f_msr_table[clock_ratio_index].vrm;
+		longhaul.bits.SoftVID = (clock_ratio_index >> 8) & 0x1f;
 	/* Sync to timer tick */
 	safe_halt();
 	/* Raise voltage if necessary */
-	if (can_scale_voltage && longhaul_pos < dest_pos) {
+	if (can_scale_voltage && dir) {
 		longhaul.bits.EnableSoftVID = 1;
 		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 		/* Change voltage */
@@ -199,7 +192,6 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
 		}
 		longhaul.bits.EnableSoftVID = 0;
 		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul_pos = dest_pos;
 	}
 
 	/* Change frequency on next halt or sleep */
@@ -220,7 +212,7 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 
 	/* Reduce voltage if necessary */
-	if (can_scale_voltage && longhaul_pos > dest_pos) {
+	if (can_scale_voltage && !dir) {
 		longhaul.bits.EnableSoftVID = 1;
 		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 		/* Change voltage */
@@ -237,7 +229,6 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
 		}
 		longhaul.bits.EnableSoftVID = 0;
 		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-		longhaul_pos = dest_pos;
 	}
 }
 
@@ -248,26 +239,28 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
  * Sets a new clock ratio.
  */
 
-static void longhaul_setstate(unsigned int clock_ratio_index)
+static void longhaul_setstate(unsigned int table_index)
 {
+	unsigned int clock_ratio_index;
 	int speed, mult;
 	struct cpufreq_freqs freqs;
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
 	u32 bm_status = 0;
 	u32 bm_timeout = 100000;
+	unsigned int dir = 0;
 
-	if (old_ratio == clock_ratio_index)
-		return;
-	old_ratio = clock_ratio_index;
-
-	mult = clock_ratio[clock_ratio_index];
+	clock_ratio_index = longhaul_table[table_index].index;
+	/* Safety precautions */
+	mult = clock_ratio[clock_ratio_index & 0x1f];
 	if (mult == -1)
 		return;
-
 	speed = calc_speed(mult);
 	if ((speed > highest_speed) || (speed < lowest_speed))
 		return;
+	/* Voltage transition before frequency transition? */
+	if (can_scale_voltage && longhaul_index < table_index)
+		dir = 1;
 
 	freqs.old = calc_speed(longhaul_get_cpu_mult());
 	freqs.new = speed;
@@ -302,7 +295,7 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 		/* Disable AGP and PCI arbiters */
 		outb(3, 0x22);
 	} else if ((pr != NULL) && pr->flags.bm_control) {
- 		/* Disable bus master arbitration */
+		/* Disable bus master arbitration */
 		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 1);
 	}
 	switch (longhaul_version) {
@@ -327,9 +320,9 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 		if (longhaul_flags & USE_ACPI_C3) {
 			/* Don't allow wakeup */
 			acpi_set_register(ACPI_BITREG_BUS_MASTER_RLD, 0);
-			do_powersaver(cx->address, clock_ratio_index);
+			do_powersaver(cx->address, clock_ratio_index, dir);
 		} else {
-			do_powersaver(0, clock_ratio_index);
+			do_powersaver(0, clock_ratio_index, dir);
 		}
 		break;
 	}
@@ -386,7 +379,8 @@ static int guess_fsb(int mult)
 
 static int __init longhaul_get_ranges(void)
 {
-	unsigned int j, k = 0;
+	unsigned int i, j, k = 0;
+	unsigned int ratio;
 	int mult;
 
 	/* Get current frequency */
@@ -440,8 +434,7 @@ static int __init longhaul_get_ranges(void)
 	if(!longhaul_table)
 		return -ENOMEM;
 
-	for (j=0; j < numscales; j++) {
-		unsigned int ratio;
+	for (j = 0; j < numscales; j++) {
 		ratio = clock_ratio[j];
 		if (ratio == -1)
 			continue;
@@ -451,13 +444,41 @@ static int __init longhaul_get_ranges(void)
 		longhaul_table[k].index	= j;
 		k++;
 	}
+	if (k <= 1) {
+		kfree(longhaul_table);
+		return -ENODEV;
+	}
+	/* Sort */
+	for (j = 0; j < k - 1; j++) {
+		unsigned int min_f, min_i;
+		min_f = longhaul_table[j].frequency;
+		min_i = j;
+		for (i = j + 1; i < k; i++) {
+			if (longhaul_table[i].frequency < min_f) {
+				min_f = longhaul_table[i].frequency;
+				min_i = i;
+			}
+		}
+		if (min_i != j) {
+			unsigned int temp;
+			temp = longhaul_table[j].frequency;
+			longhaul_table[j].frequency = longhaul_table[min_i].frequency;
+			longhaul_table[min_i].frequency = temp;
+			temp = longhaul_table[j].index;
+			longhaul_table[j].index = longhaul_table[min_i].index;
+			longhaul_table[min_i].index = temp;
+		}
+	}
 
 	longhaul_table[k].frequency = CPUFREQ_TABLE_END;
-	if (!k) {
-		kfree (longhaul_table);
-		return -EINVAL;
-	}
 
+	/* Find index we are running on */
+	for (j = 0; j < k; j++) {
+		if (clock_ratio[longhaul_table[j].index & 0x1f] == mult) {
+			longhaul_index = j;
+			break;
+		}
+	}
 	return 0;
 }
 
@@ -465,7 +486,7 @@ static int __init longhaul_get_ranges(void)
 static void __init longhaul_setup_voltagescaling(void)
 {
 	union msr_longhaul longhaul;
-	struct mV_pos minvid, maxvid;
+	struct mV_pos minvid, maxvid, vid;
 	unsigned int j, speed, pos, kHz_step, numvscales;
 	int min_vid_speed;
 
@@ -476,11 +497,11 @@ static void __init longhaul_setup_voltagescaling(void)
 	}
 
 	if (!longhaul.bits.VRMRev) {
-		printk (KERN_INFO PFX "VRM 8.5\n");
+		printk(KERN_INFO PFX "VRM 8.5\n");
 		vrm_mV_table = &vrm85_mV[0];
 		mV_vrm_table = &mV_vrm85[0];
 	} else {
-		printk (KERN_INFO PFX "Mobile VRM\n");
+		printk(KERN_INFO PFX "Mobile VRM\n");
 		if (cpu_model < CPU_NEHEMIAH)
 			return;
 		vrm_mV_table = &mobilevrm_mV[0];
@@ -540,7 +561,6 @@ static void __init longhaul_setup_voltagescaling(void)
 	/* Calculate kHz for one voltage step */
 	kHz_step = (highest_speed - min_vid_speed) / numvscales;
 
-
 	j = 0;
 	while (longhaul_table[j].frequency != CPUFREQ_TABLE_END) {
 		speed = longhaul_table[j].frequency;
@@ -548,15 +568,14 @@ static void __init longhaul_setup_voltagescaling(void)
 			pos = (speed - min_vid_speed) / kHz_step + minvid.pos;
 		else
 			pos = minvid.pos;
-		f_msr_table[longhaul_table[j].index].vrm = mV_vrm_table[pos];
-		f_msr_table[longhaul_table[j].index].pos = pos;
+		longhaul_table[j].index |= mV_vrm_table[pos] << 8;
+		vid = vrm_mV_table[mV_vrm_table[pos]];
+		printk(KERN_INFO PFX "f: %d kHz, index: %d, vid: %d mV\n", speed, j, vid.mV);
 		j++;
 	}
 
-	longhaul_pos = maxvid.pos;
 	can_scale_voltage = 1;
-	printk(KERN_INFO PFX "Voltage scaling enabled. "
-		"Use of \"conservative\" governor is highly recommended.\n");
+	printk(KERN_INFO PFX "Voltage scaling enabled.\n");
 }
 
 
@@ -570,15 +589,44 @@ static int longhaul_target(struct cpufreq_policy *policy,
 			    unsigned int target_freq, unsigned int relation)
 {
 	unsigned int table_index = 0;
-	unsigned int new_clock_ratio = 0;
+	unsigned int i;
+	unsigned int dir = 0;
+	u8 vid, current_vid;
 
 	if (cpufreq_frequency_table_target(policy, longhaul_table, target_freq, relation, &table_index))
 		return -EINVAL;
 
-	new_clock_ratio = longhaul_table[table_index].index & 0xFF;
-
-	longhaul_setstate(new_clock_ratio);
+	/* Don't set same frequency again */
+	if (longhaul_index == table_index)
+		return 0;
 
+	if (!can_scale_voltage)
+		longhaul_setstate(table_index);
+	else {
+		/* On test system voltage transitions exceeding single
+		 * step up or down were turning motherboard off. Both
+		 * "ondemand" and "userspace" are unsafe. C7 is doing
+		 * this in hardware, C3 is old and we need to do this
+		 * in software. */
+		i = longhaul_index;
+		current_vid = (longhaul_table[longhaul_index].index >> 8) & 0x1f;
+		if (table_index > longhaul_index)
+			dir = 1;
+		while (i != table_index) {
+			vid = (longhaul_table[i].index >> 8) & 0x1f;
+			if (vid != current_vid) {
+				longhaul_setstate(i);
+				current_vid = vid;
+				msleep(200);
+			}
+			if (dir)
+				i++;
+			else
+				i--;
+		}
+		longhaul_setstate(table_index);
+	}
+	longhaul_index = table_index;
 	return 0;
 }
 
@@ -607,11 +655,10 @@ static acpi_status longhaul_walk_callback(acpi_handle obj_handle,
 static int enable_arbiter_disable(void)
 {
 	struct pci_dev *dev;
-	int status;
+	int status = 1;
 	int reg;
 	u8 pci_cmd;
 
-	status = 1;
 	/* Find PLE133 host bridge */
 	reg = 0x78;
 	dev = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0,
-- 



----------------------------------------------------------------------
Po meczu.....kurde...:)
>>> http://link.interia.pl/f1a72
