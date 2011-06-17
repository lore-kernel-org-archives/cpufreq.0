From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH V2 1/6] x86: Add AMD HW_PSTATE cpu feature bit and MSRs
Date: Fri, 17 Jun 2011 15:50:52 -0400
Message-ID: <1308340257-10117-1-git-send-email-mjg@redhat.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: borislav.petkov@amd.com, davej@redhat.com, mark.langsdorf@amd.com, cpufreq@vger.kernel.org, andreas.herrmann3@amd.com, Matthew Garrett <mjg@redhat.com>

AMD CPUs that support hardware P-state setting expose this via cpuid. Add
the bit to the generic code so the ACPI cpufreq driver can make use of it,
and also add the related MSRs.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
---
 arch/x86/include/asm/cpufeature.h |    1 +
 arch/x86/include/asm/msr-index.h  |    2 ++
 arch/x86/kernel/cpu/scattered.c   |    1 +
 3 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 71cc380..312f455 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -174,6 +174,7 @@
 #define X86_FEATURE_PLN		(7*32+ 5) /* Intel Power Limit Notification */
 #define X86_FEATURE_PTS		(7*32+ 6) /* Intel Package Thermal Status */
 #define X86_FEATURE_DTS		(7*32+ 7) /* Digital Thermal Sensor */
+#define X86_FEATURE_HW_PSTATE	(7*32+ 8) /* AMD frequency scaling */
 
 /* Virtualization flags: Linux defined, word 8 */
 #define X86_FEATURE_TPR_SHADOW  (8*32+ 0) /* Intel TPR Shadow */
diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 485b4f1..1772978 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -234,6 +234,8 @@
 
 #define MSR_IA32_PERF_STATUS		0x00000198
 #define MSR_IA32_PERF_CTL		0x00000199
+#define MSR_AMD_PERF_STATUS		0xc0010063
+#define MSR_AMD_PERF_CTL		0xc0010062
 
 #define MSR_IA32_MPERF			0x000000e7
 #define MSR_IA32_APERF			0x000000e8
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index c7f64e6..4adffc4 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -39,6 +39,7 @@ void __cpuinit init_scattered_cpuid_features(struct cpuinfo_x86 *c)
 		{ X86_FEATURE_APERFMPERF,	CR_ECX, 0, 0x00000006, 0 },
 		{ X86_FEATURE_EPB,		CR_ECX, 3, 0x00000006, 0 },
 		{ X86_FEATURE_XSAVEOPT,		CR_EAX,	0, 0x0000000d, 1 },
+		{ X86_FEATURE_HW_PSTATE,	CR_EDX, 7, 0x80000007, 0 },
 		{ X86_FEATURE_CPB,		CR_EDX, 9, 0x80000007, 0 },
 		{ X86_FEATURE_NPT,		CR_EDX, 0, 0x8000000a, 0 },
 		{ X86_FEATURE_LBRV,		CR_EDX, 1, 0x8000000a, 0 },
-- 
1.7.5.2

