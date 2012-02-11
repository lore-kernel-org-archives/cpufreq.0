From: Ben Hutchings <ben@decadent.org.uk>
Subject: [PATCH] powernow-k8: Use cached power management CPUID information
Date: Sat, 11 Feb 2012 23:18:09 +0000
Message-ID: <1329002289.325.68.camel@deadeye>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

The common x86 CPU initialisation code reads some of the necessary CPUID
information into x86_cpu_data::x86_power.  Use that to reduce the code
size slightly.

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
Compile-tested only.

Ben.

 drivers/cpufreq/powernow-k8.c |   15 +++------------
 drivers/cpufreq/powernow-k8.h |    2 --
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index c0e8164..b1403c1 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -532,7 +532,7 @@ MODULE_DEVICE_TABLE(x86cpu, powernow_k8_ids);
 
 static void check_supported_cpu(void *_rc)
 {
-	u32 eax, ebx, ecx, edx;
+	u32 eax;
 	int *rc = _rc;
 
 	*rc = -ENODEV;
@@ -547,23 +547,14 @@ static void check_supported_cpu(void *_rc)
 			return;
 		}
 
-		eax = cpuid_eax(CPUID_GET_MAX_CAPABILITIES);
-		if (eax < CPUID_FREQ_VOLT_CAPABILITIES) {
-			printk(KERN_INFO PFX
-			       "No frequency change capabilities detected\n");
-			return;
-		}
-
-		cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx);
-		if ((edx & P_STATE_TRANSITION_CAPABLE)
+		if ((boot_cpu_data.x86_power & P_STATE_TRANSITION_CAPABLE)
 			!= P_STATE_TRANSITION_CAPABLE) {
 			printk(KERN_INFO PFX
 				"Power state transitions not supported\n");
 			return;
 		}
 	} else { /* must be a HW Pstate capable processor */
-		cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx);
-		if ((edx & USE_HW_PSTATE) == USE_HW_PSTATE)
+		if ((boot_cpu_data.x86_power & USE_HW_PSTATE) == USE_HW_PSTATE)
 			cpu_family = CPU_HW_PSTATE;
 		else
 			return;
diff --git a/drivers/cpufreq/powernow-k8.h b/drivers/cpufreq/powernow-k8.h
index 3744d26..a81753e 100644
--- a/drivers/cpufreq/powernow-k8.h
+++ b/drivers/cpufreq/powernow-k8.h
@@ -62,8 +62,6 @@ struct powernow_k8_data {
 #define CPUID_XMOD_REV_MASK		0x000c0000
 #define CPUID_XFAM_10H			0x00100000	/* family 0x10 */
 #define CPUID_USE_XFAM_XMOD		0x00000f00
-#define CPUID_GET_MAX_CAPABILITIES	0x80000000
-#define CPUID_FREQ_VOLT_CAPABILITIES	0x80000007
 #define P_STATE_TRANSITION_CAPABLE	6
 
 /* Model Specific Registers for p-state transitions. MSRs are 64-bit. For     */
-- 
1.7.9


