From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Redo Longhaul ver. 2
Date: Wed, 14 Feb 2007 22:00:37 +0100
Message-ID: <45D37875.1050908@interia.pl>
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


Start using v2 version of Longhaul when available. It provides 
voltage scaling and can use ACPI C3 state. That's curious. CPU 
will not change frequency on ACPI C3 when v1 is in use, but it will 
when v2 is used. Driver will return max frequency all the time if 
this isn't true for all processors. There is strange thing with 
mobile voltage. Looks like only Nehemiah (C3-M) supports it. 
Earlier processors have different mobile VRM (in docs), but I can't 
find any which is using it. Looks like all are using VRM 8.5. So 
fail for non Nehemiah with mobile VRM.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   53 ++++++++++++++++++-------------
 1 files changed, 31 insertions(+), 22 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -8,12 +8,11 @@
  *  VIA have currently 3 different versions of Longhaul.
  *  Version 1 (Longhaul) uses the BCR2 MSR at 0x1147.
  *   It is present only in Samuel 1 (C5A), Samuel 2 (C5B) stepping 0.
- *  Version 2 of longhaul is the same as v1, but adds voltage scaling.
- *   Present in Samuel 2 (steppings 1-7 only) (C5B), and Ezra (C5C)
- *   voltage scaling support has currently been disabled in this driver
- *   until we have code that gets it right.
+ *  Version 2 of longhaul is backward compatible with v1, but adds 
+ *   LONGHAUL MSR for purpose of both frequency and voltage scaling.
+ *   Present in Samuel 2 (steppings 1-7 only) (C5B), and Ezra (C5C).
  *  Version 3 of longhaul got renamed to Powersaver and redesigned
- *   to use the POWERSAVER MSR at 0x110a.
+ *   to use only the POWERSAVER MSR at 0x110a.
  *   It is present in Ezra-T (C5M), Nehemiah (C5X) and above.
  *   It's pretty much the same feature wise to longhaul v2, though
  *   there is provision for scaling FSB too, but this doesn't work
@@ -299,26 +298,19 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 	/*
 	 * Longhaul v1. (Samuel[C5A] and Samuel2 stepping 0[C5B])
 	 * Software controlled multipliers only.
-	 *
-	 * *NB* Until we get voltage scaling working v1 & v2 are the same code.
-	 * Longhaul v2 appears in Samuel2 Steppings 1->7 [C5b] and Ezra [C5C]
 	 */
 	case TYPE_LONGHAUL_V1:
-	case TYPE_LONGHAUL_V2:
 		do_longhaul1(clock_ratio_index);
 		break;
 
 	/*
+	 * Longhaul v2 appears in Samuel2 Steppings 1->7 [C5B] and Ezra [C5C]
+	 *
 	 * Longhaul v3 (aka Powersaver). (Ezra-T [C5M] & Nehemiah [C5N])
-	 * We can scale voltage with this too, but that's currently
-	 * disabled until we come up with a decent 'match freq to voltage'
-	 * algorithm.
-	 * When we add voltage scaling, we will also need to do the
-	 * voltage/freq setting in order depending on the direction
-	 * of scaling (like we do in powernow-k7.c)
 	 * Nehemiah can do FSB scaling too, but this has never been proven
 	 * to work in practice.
 	 */
+	case TYPE_LONGHAUL_V2:
 	case TYPE_POWERSAVER:
 		if (longhaul_flags & USE_ACPI_C3) {
 			/* Don't allow wakeup */
@@ -345,6 +337,7 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 	local_irq_restore(flags);
 	preempt_enable();
 
+	freqs.new = calc_speed(longhaul_get_cpu_mult());
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 }
 
@@ -474,6 +467,8 @@ static void __init longhaul_setup_voltagescaling(void)
 		mV_vrm_table = &mV_vrm85[0];
 	} else {
 		printk (KERN_INFO PFX "Mobile VRM\n");
+		if (cpu_model < CPU_NEHEMIAH)
+			return;
 		vrm_mV_table = &mobilevrm_mV[0];
 		mV_vrm_table = &mV_mobilevrm[0];
 	}
@@ -658,6 +653,7 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 	struct cpuinfo_x86 *c = cpu_data;
 	char *cpuname=NULL;
 	int ret;
+	u32 lo, hi;
 	int vt8235_present;
 
 	/* Check what we have on this motherboard */
@@ -671,16 +667,20 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 		break;
 
 	case 7:
-		longhaul_version = TYPE_LONGHAUL_V1;
 		switch (c->x86_mask) {
 		case 0:
+			longhaul_version = TYPE_LONGHAUL_V1;
 			cpu_model = CPU_SAMUEL2;
 			cpuname = "C3 'Samuel 2' [C5B]";
-			/* Note, this is not a typo, early Samuel2's had Samuel1 ratios. */
-			memcpy (clock_ratio, samuel1_clock_ratio, sizeof(samuel1_clock_ratio));
-			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
+			/* Note, this is not a typo, early Samuel2's had 
+			 * Samuel1 ratios. */
+			memcpy(clock_ratio, samuel1_clock_ratio,
+				sizeof(samuel1_clock_ratio));
+			memcpy(eblcr_table, samuel2_eblcr,
+				sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
+			longhaul_version = TYPE_LONGHAUL_V2;
 			if (c->x86_mask < 8) {
 				cpu_model = CPU_SAMUEL2;
 				cpuname = "C3 'Samuel 2' [C5B]";
@@ -688,8 +688,10 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 				cpu_model = CPU_EZRA;
 				cpuname = "C3 'Ezra' [C5C]";
 			}
-			memcpy (clock_ratio, ezra_clock_ratio, sizeof(ezra_clock_ratio));
-			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
+			memcpy(clock_ratio, ezra_clock_ratio,
+				sizeof(ezra_clock_ratio));
+			memcpy(eblcr_table, ezra_eblcr,
+				sizeof(ezra_eblcr));
 			break;
 		}
 		break;
@@ -730,6 +732,13 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 		cpuname = "Unknown";
 		break;
 	}
+	/* Check Longhaul ver. 2 */
+	if (longhaul_version == TYPE_LONGHAUL_V2) {
+		rdmsr(MSR_VIA_LONGHAUL, lo, hi);
+		if (lo == 0 && hi == 0)
+			/* Looks like MSR isn't present */
+			longhaul_version = TYPE_LONGHAUL_V1;
+	}
 
 	printk (KERN_INFO PFX "VIA %s CPU detected.  ", cpuname);
 	switch (longhaul_version) {
@@ -751,7 +760,7 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 				NULL, (void *)&pr);
 
 	/* Check ACPI support for C3 state */
-	if (pr != NULL && longhaul_version == TYPE_POWERSAVER) {
+	if (pr != NULL && longhaul_version != TYPE_LONGHAUL_V1) {
 		cx = &pr->power.states[ACPI_STATE_C3];
 		if (cx->address > 0 && cx->latency <= 1000) {
 			longhaul_flags |= USE_ACPI_C3;

----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow! 
>>> http://link.interia.pl/f19e8
