From: Ben Hutchings <ben@decadent.org.uk>
Subject: [RFC PATCH] x86/cpu, powernow-k7: Set and use specific CPU feature
 flags for K7 power
Date: Sat, 11 Feb 2012 23:08:52 +0000
Message-ID: <1329001732.325.63.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Dave Jones <davej@redhat.com>
Cc: x86@kernel.org, cpufreq@vger.kernel.org

Define CPU feature flags for K7 'PowerNOW!' frequency and voltage
scaling and add them to the device ID table for powernow-k7.  This
should mean the module is only auto-loaded if it's usable.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
This should reduce boot time slightly on some systems.  But even without
this, the module won't take up memory if it's not usable since it will
be unloaded after its init function fails.

This is compile-tested only.

Ben.

 arch/x86/include/asm/cpufeature.h |    2 ++
 arch/x86/kernel/cpu/amd.c         |    5 +++++
 drivers/cpufreq/powernow-k7.c     |   28 ++++++----------------------
 3 files changed, 13 insertions(+), 22 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index dcb839e..a7b2856 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -178,6 +178,8 @@
 #define X86_FEATURE_PTS		(7*32+ 6) /* Intel Package Thermal Status */
 #define X86_FEATURE_DTS		(7*32+ 7) /* Digital Thermal Sensor */
 #define X86_FEATURE_HW_PSTATE	(7*32+ 8) /* AMD HW-PState */
+#define X86_FEATURE_K7_FREQ	(7*32+ 9) /* AMD K7 frequency scaling */
+#define X86_FEATURE_K7_VOLT	(7*32+10) /* AMD K7 voltage scaling */
 
 /* Virtualization flags: Linux defined, word 8 */
 #define X86_FEATURE_TPR_SHADOW  (8*32+ 0) /* Intel TPR Shadow */
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index f4773f4..a72b740 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -229,6 +229,11 @@ static void __cpuinit init_amd_k7(struct cpuinfo_x86 *c)
 
 	set_cpu_cap(c, X86_FEATURE_K7);
 
+	if (c->x86_power & (1 << 1))
+		set_cpu_cap(c, X86_FEATURE_K7_FREQ);
+	if (c->x86_power & (1 << 2))
+		set_cpu_cap(c, X86_FEATURE_K7_VOLT);
+
 	amd_k7_smp_check(c);
 }
 #endif
diff --git a/drivers/cpufreq/powernow-k7.c b/drivers/cpufreq/powernow-k7.c
index cf7e1ee..51bd856 100644
--- a/drivers/cpufreq/powernow-k7.c
+++ b/drivers/cpufreq/powernow-k7.c
@@ -112,7 +112,8 @@ static int check_fsb(unsigned int fsbspeed)
 }
 
 static const struct x86_cpu_id powernow_k7_cpuids[] = {
-	{ X86_VENDOR_AMD, 6, },
+	{ X86_VENDOR_AMD, 6, X86_MODEL_ANY, X86_FEATURE_K7_FREQ },
+	{ X86_VENDOR_AMD, 6, X86_MODEL_ANY, X86_FEATURE_K7_VOLT},
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, powernow_k7_cpuids);
@@ -120,43 +121,26 @@ MODULE_DEVICE_TABLE(x86cpu, powernow_k7_cpuids);
 static int check_powernow(void)
 {
 	struct cpuinfo_x86 *c = &cpu_data(0);
-	unsigned int maxei, eax, ebx, ecx, edx;
 
 	if (!x86_match_cpu(powernow_k7_cpuids))
 		return 0;
 
-	/* Get maximum capabilities */
-	maxei = cpuid_eax(0x80000000);
-	if (maxei < 0x80000007) {	/* Any powernow info ? */
-#ifdef MODULE
-		printk(KERN_INFO PFX "No powernow capabilities detected\n");
-#endif
-		return 0;
-	}
-
 	if ((c->x86_model == 6) && (c->x86_mask == 0)) {
 		printk(KERN_INFO PFX "K7 660[A0] core detected, "
 				"enabling errata workarounds\n");
 		have_a0 = 1;
 	}
 
-	cpuid(0x80000007, &eax, &ebx, &ecx, &edx);
-
-	/* Check we can actually do something before we say anything.*/
-	if (!(edx & (1 << 1 | 1 << 2)))
-		return 0;
-
 	printk(KERN_INFO PFX "PowerNOW! Technology present. Can scale: ");
 
-	if (edx & 1 << 1) {
+	if (cpu_has(c, X86_FEATURE_K7_FREQ)) {
 		printk("frequency");
 		can_scale_bus = 1;
 	}
 
-	if ((edx & (1 << 1 | 1 << 2)) == 0x6)
-		printk(" and ");
-
-	if (edx & 1 << 2) {
+	if (cpu_has(c, X86_FEATURE_K7_VOLT)) {
+		if (cpu_has(c, X86_FEATURE_K7_FREQ))
+			printk(" and ");
 		printk("voltage");
 		can_scale_vid = 1;
 	}
-- 
1.7.9


