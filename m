From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/2] cpupower: Do detect IDA (opportunistic processor performance) via cpuid
Date: Thu, 21 Jul 2011 11:54:54 +0200
Message-ID: <1311242094-79312-3-git-send-email-trenn@suse.de>
References: <1311242094-79312-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1311242094-79312-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: Thomas Renninger <trenn@suse.de>, lenb@kernel.org, linux@dominikbrodowski.net, cpufreq@vger.kernel.org

IA32-Intel Devel guide Volume 3A - 14.3.2.1
-------------------------------------------
...
Opportunistic processor performance operation can be disabled by setting bit 38 of
IA32_MISC_ENABLES. This mechanism is intended for BIOS only. If
IA32_MISC_ENABLES[38] is set, CPUID.06H:EAX[1] will return 0.

Better detect things via cpuid, this cleans up the code a bit
and the MSR parts were not working correctly anyway.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: lenb@kernel.org
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 tools/power/cpupower/utils/helpers/cpuid.c   |    6 ++++++
 tools/power/cpupower/utils/helpers/helpers.h |    9 +--------
 tools/power/cpupower/utils/helpers/misc.c    |   12 ++----------
 tools/power/cpupower/utils/helpers/msr.c     |   23 -----------------------
 4 files changed, 9 insertions(+), 41 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/cpuid.c b/tools/power/cpupower/utils/helpers/cpuid.c
index a97f091..906895d 100644
--- a/tools/power/cpupower/utils/helpers/cpuid.c
+++ b/tools/power/cpupower/utils/helpers/cpuid.c
@@ -131,6 +131,12 @@ out:
 	}
 
 	if (cpu_info->vendor == X86_VENDOR_INTEL) {
+		if (cpuid_level >= 6 &&
+		    (cpuid_eax(6) & (1 << 1)))
+			cpu_info->caps |= CPUPOWER_CAP_INTEL_IDA;
+	}
+
+	if (cpu_info->vendor == X86_VENDOR_INTEL) {
 		/* Intel's perf-bias MSR support */
 		if (cpuid_level >= 6 && (cpuid_ecx(6) & (1 << 3)))
 			cpu_info->caps |= CPUPOWER_CAP_PERF_BIAS;
diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
index 9125a55..592ee36 100644
--- a/tools/power/cpupower/utils/helpers/helpers.h
+++ b/tools/power/cpupower/utils/helpers/helpers.h
@@ -58,6 +58,7 @@ enum cpupower_cpu_vendor {X86_VENDOR_UNKNOWN = 0, X86_VENDOR_INTEL,
 #define CPUPOWER_CAP_PERF_BIAS		0x00000008
 #define CPUPOWER_CAP_HAS_TURBO_RATIO	0x00000010
 #define CPUPOWER_CAP_IS_SNB		0x00000011
+#define CPUPOWER_CAP_INTEL_IDA		0x00000012
 
 #define MAX_HW_PSTATES 10
 
@@ -115,9 +116,6 @@ extern int msr_intel_set_perf_bias(unsigned int cpu, unsigned int val);
 extern int msr_intel_get_perf_bias(unsigned int cpu);
 extern unsigned long long msr_intel_get_turbo_ratio(unsigned int cpu);
 
-extern int msr_intel_has_boost_support(unsigned int cpu);
-extern int msr_intel_boost_is_active(unsigned int cpu);
-
 /* Read/Write msr ****************************/
 
 /* PCI stuff ****************************/
@@ -163,11 +161,6 @@ static inline int msr_intel_get_perf_bias(unsigned int cpu)
 static inline unsigned long long msr_intel_get_turbo_ratio(unsigned int cpu)
 { return 0; };
 
-static inline int msr_intel_has_boost_support(unsigned int cpu)
-{ return -1; };
-static inline int msr_intel_boost_is_active(unsigned int cpu)
-{ return -1; };
-
 /* Read/Write msr ****************************/
 
 static inline int cpufreq_has_boost_support(unsigned int cpu, int *support,
diff --git a/tools/power/cpupower/utils/helpers/misc.c b/tools/power/cpupower/utils/helpers/misc.c
index e8b3140..1609243 100644
--- a/tools/power/cpupower/utils/helpers/misc.c
+++ b/tools/power/cpupower/utils/helpers/misc.c
@@ -20,16 +20,8 @@ int cpufreq_has_boost_support(unsigned int cpu, int *support, int *active,
 		if (ret <= 0)
 			return ret;
 		*support = 1;
-	} else if (cpupower_cpu_info.vendor == X86_VENDOR_INTEL) {
-		ret = msr_intel_has_boost_support(cpu);
-		if (ret <= 0)
-			return ret;
-		*support = ret;
-		ret = msr_intel_boost_is_active(cpu);
-		if (ret <= 0)
-			return ret;
-		*active = ret;
-	}
+	} else if (cpupower_cpu_info.caps & CPUPOWER_CAP_INTEL_IDA)
+		*support = *active = 1;
 	return 0;
 }
 #endif /* #if defined(__i386__) || defined(__x86_64__) */
diff --git a/tools/power/cpupower/utils/helpers/msr.c b/tools/power/cpupower/utils/helpers/msr.c
index 7869ca6..31a4b24 100644
--- a/tools/power/cpupower/utils/helpers/msr.c
+++ b/tools/power/cpupower/utils/helpers/msr.c
@@ -72,29 +72,6 @@ int write_msr(int cpu, unsigned int idx, unsigned long long val)
 	return -1;
 }
 
-int msr_intel_has_boost_support(unsigned int cpu)
-{
-	unsigned long long misc_enables;
-	int ret;
-
-	ret = read_msr(cpu, MSR_IA32_MISC_ENABLES, &misc_enables);
-	if (ret)
-		return ret;
-
-	return (misc_enables >> 38) & 0x1;
-}
-
-int msr_intel_boost_is_active(unsigned int cpu)
-{
-	unsigned long long perf_status;
-	int ret;
-
-	ret = read_msr(cpu, MSR_IA32_PERF_STATUS, &perf_status);
-	if (ret)
-		return ret;
-	return (perf_status >> 32) & 0x1;
-}
-
 int msr_intel_get_perf_bias(unsigned int cpu)
 {
 	unsigned long long val;
-- 
1.7.3.4

