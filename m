From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Separate frequency and voltage transition
Date: Thu, 08 Feb 2007 18:56:04 +0100
Message-ID: <45CB6434.5090507@interia.pl>
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


This change should make Longhaul more compatible with 
both ver. 2 and Powersaver processors. Voltage transitions 
will be done before or after frequency transition. That depends 
on direction of change. I don't know how to force conservative 
governor when voltage scaling is enabled, so there is only 
a warning for user. Minimal voltage is calculated in different 
way now because in this way more power is saved at lower 
multipliers.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |  109 ++++++++++++++++++++++++++-----
 1 files changed, 93 insertions(+), 16 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -65,7 +65,8 @@ static unsigned int fsb;
 static struct mV_pos *vrm_mV_table;
 static unsigned char *mV_vrm_table;
 struct f_msr {
-	unsigned char vrm;
+	u8 vrm;
+	u8 pos;
 };
 static struct f_msr f_msr_table[32];
 
@@ -75,6 +76,7 @@ static int can_scale_voltage;
 static struct acpi_processor *pr = NULL;
 static struct acpi_processor_cx *cx = NULL;
 static u8 longhaul_flags;
+static u8 longhaul_pos;
 
 /* Module parameters */
 static int scale_voltage;
@@ -165,26 +167,47 @@ static void do_longhaul1(unsigned int clock_ratio_index)
 static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
 {
 	union msr_longhaul longhaul;
+	u8 dest_pos;
 	u32 t;
 
+	dest_pos = f_msr_table[clock_ratio_index].pos;
+
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+	/* Setup new frequency */
 	longhaul.bits.RevisionKey = longhaul.bits.RevisionID;
 	longhaul.bits.SoftBusRatio = clock_ratio_index & 0xf;
 	longhaul.bits.SoftBusRatio4 = (clock_ratio_index & 0x10) >> 4;
-	longhaul.bits.EnableSoftBusRatio = 1;
-
-	if (can_scale_voltage) {
+	/* Setup new voltage */
+	if (can_scale_voltage)
 		longhaul.bits.SoftVID = f_msr_table[clock_ratio_index].vrm;
+	/* Sync to timer tick */
+	safe_halt();
+	/* Raise voltage if necessary */
+	if (can_scale_voltage && longhaul_pos < dest_pos) {
 		longhaul.bits.EnableSoftVID = 1;
+		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+		/* Change voltage */
+		if (!cx_address) {
+			ACPI_FLUSH_CPU_CACHE();
+			halt();
+		} else {
+			ACPI_FLUSH_CPU_CACHE();
+			/* Invoke C3 */
+			inb(cx_address);
+			/* Dummy op - must do something useless after P_LVL3
+			 * read */
+			t = inl(acpi_fadt.xpm_tmr_blk.address);
+		}
+		longhaul.bits.EnableSoftVID = 0;
+		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul_pos = dest_pos;
 	}
 
-	/* Sync to timer tick */
-	safe_halt();
 	/* Change frequency on next halt or sleep */
+	longhaul.bits.EnableSoftBusRatio = 1;
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 	if (!cx_address) {
 		ACPI_FLUSH_CPU_CACHE();
-		/* Invoke C1 */
 		halt();
 	} else {
 		ACPI_FLUSH_CPU_CACHE();
@@ -194,12 +217,29 @@ static void do_powersaver(int cx_address, unsigned int clock_ratio_index)
 		t = inl(acpi_fadt.xpm_tmr_blk.address);
 	}
 	/* Disable bus ratio bit */
-	local_irq_disable();
-	longhaul.bits.RevisionKey = longhaul.bits.RevisionID;
 	longhaul.bits.EnableSoftBusRatio = 0;
-	longhaul.bits.EnableSoftBSEL = 0;
-	longhaul.bits.EnableSoftVID = 0;
 	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+
+	/* Reduce voltage if necessary */
+	if (can_scale_voltage && longhaul_pos > dest_pos) {
+		longhaul.bits.EnableSoftVID = 1;
+		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+		/* Change voltage */
+		if (!cx_address) {
+			ACPI_FLUSH_CPU_CACHE();
+			halt();
+		} else {
+			ACPI_FLUSH_CPU_CACHE();
+			/* Invoke C3 */
+			inb(cx_address);
+			/* Dummy op - must do something useless after P_LVL3
+			 * read */
+			t = inl(acpi_fadt.xpm_tmr_blk.address);
+		}
+		longhaul.bits.EnableSoftVID = 0;
+		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul_pos = dest_pos;
+	}
 }
 
 /**
@@ -420,6 +460,7 @@ static void __init longhaul_setup_voltagescaling(void)
 	union msr_longhaul longhaul;
 	struct mV_pos minvid, maxvid;
 	unsigned int j, speed, pos, kHz_step, numvscales;
+	int min_vid_speed;
 
 	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 	if (!(longhaul.bits.RevisionID & 1)) {
@@ -439,8 +480,6 @@ static void __init longhaul_setup_voltagescaling(void)
 
 	minvid = vrm_mV_table[longhaul.bits.MinimumVID];
 	maxvid = vrm_mV_table[longhaul.bits.MaximumVID];
-	numvscales = maxvid.pos - minvid.pos + 1;
-	kHz_step = (highest_speed - lowest_speed) / numvscales;
 
 	if (minvid.mV == 0 || maxvid.mV == 0 || minvid.mV > maxvid.mV) {
 		printk (KERN_INFO PFX "Bogus values Min:%d.%03d Max:%d.%03d. "
@@ -456,20 +495,58 @@ static void __init longhaul_setup_voltagescaling(void)
 		return;
 	}
 
-	printk(KERN_INFO PFX "Max VID=%d.%03d  Min VID=%d.%03d, %d possible voltage scales\n",
+	/* How many voltage steps */
+	numvscales = maxvid.pos - minvid.pos + 1;
+	printk(KERN_INFO PFX
+		"Max VID=%d.%03d  "
+		"Min VID=%d.%03d, "
+		"%d possible voltage scales\n",
 		maxvid.mV/1000, maxvid.mV%1000,
 		minvid.mV/1000, minvid.mV%1000,
 		numvscales);
-	
+
+	/* Calculate max frequency at min voltage */
+	j = longhaul.bits.MinMHzBR;
+	if (longhaul.bits.MinMHzBR4)
+		j += 16;
+	min_vid_speed = eblcr_table[j];
+	if (min_vid_speed == -1)
+		return;
+	switch (longhaul.bits.MinMHzFSB) {
+	case 0:
+		min_vid_speed *= 13333;
+		break;
+	case 1:
+		min_vid_speed *= 10000;
+		break;
+	case 3:
+		min_vid_speed *= 6666;
+		break;
+	default:
+		return;
+		break;
+	}
+	if (min_vid_speed >= highest_speed)
+		return;
+	/* Calculate kHz for one voltage step */
+	kHz_step = (highest_speed - min_vid_speed) / numvscales;
+
 	j = 0;
 	while (longhaul_table[j].frequency != CPUFREQ_TABLE_END) {
 		speed = longhaul_table[j].frequency;
-		pos = (speed - lowest_speed) / kHz_step + minvid.pos;
+		if (speed > min_vid_speed)
+			pos = (speed - min_vid_speed) / kHz_step + minvid.pos;
+		else
+			pos = minvid.pos;
 		f_msr_table[longhaul_table[j].index].vrm = mV_vrm_table[pos];
+		f_msr_table[longhaul_table[j].index].pos = pos;
 		j++;
 	}
 
+	longhaul_pos = maxvid.pos;
 	can_scale_voltage = 1;
+	printk(KERN_INFO PFX "Voltage scaling enabled. "
+		"Use of \"conservative\" governor is highly recommended.\n");
 }

----------------------------------------------------------------------
Spiewam, tancze, recytuje 
A.Morek , kliknij >> http://link.interia.pl/f1a10
