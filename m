From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH 1/2] cpufreq: use dynamic debug instead of custom
 infrastructure
Date: Mon, 25 Apr 2011 22:43:02 +0200
Message-ID: <20110425204302.GA13032@comet.dominikbrodowski.net>
References: <20110327130446.GA6759@comet.dominikbrodowski.net>
 <20110425140218.GA27378@comet.dominikbrodowski.net>
 <20110425162820.GA18401@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110425162820.GA18401@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

On Mon, Apr 25, 2011 at 12:28:20PM -0400, Dave Jones wrote:
> On Mon, Apr 25, 2011 at 04:02:18PM +0200, Dominik Brodowski wrote:
>  > ping... any chance to get this and the second patch into 2.6.40?
>  
> This looks like it needs a bit more work..

Argh, some debug messages and formatting obviously were broken. Could you
apply this patch on top, or squash it with the other patches if you prefer
that? Thanks & best,

	Dominik


From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Mon, 25 Apr 2011 22:40:09 +0200
Subject: [PATCH] cpufreq: fix debug messages

Fix debug messages which created warnings or even errors when using
dynamic debug instead of cpufreq's previous custom debug interface.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/arch/x86/kernel/cpu/cpufreq/longhaul.c b/arch/x86/kernel/cpu/cpufreq/longhaul.c
index 03dfc33..f47d26e 100644
--- a/arch/x86/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/x86/kernel/cpu/cpufreq/longhaul.c
@@ -84,7 +84,6 @@ static int eblcr[32];
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
 
-#ifdef CONFIG_CPU_FREQ_DEBUG
 static char speedbuffer[8];
 
 static char *print_speed(int speed)
@@ -103,7 +102,6 @@ static char *print_speed(int speed)
 
 	return speedbuffer;
 }
-#endif
 
 
 static unsigned int calc_speed(int mult)
diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
index 5ef04a8..c1cdb97 100644
--- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
@@ -176,7 +176,7 @@ static unsigned int pcc_get_freq(unsigned int cpu)
 			/ 100) * 1000);
 
 	pr_debug("get: SUCCESS: (virtual) output_offset for cpu %d is "
-		"0x%x, contains a value of: 0x%x. Speed is: %d MHz\n",
+		"0x%p, contains a value of: 0x%x. Speed is: %d MHz\n",
 		cpu, (pcch_virt_addr + pcc_cpu_data->output_offset),
 		output_buffer, curr_freq);
 
@@ -210,7 +210,7 @@ static int pcc_cpufreq_target(struct cpufreq_policy *policy,
 	pcc_cpu_data = per_cpu_ptr(pcc_cpu_info, cpu);
 
 	pr_debug("target: CPU %d should go to target freq: %d "
-		"(virtual) input_offset is 0x%x\n",
+		"(virtual) input_offset is 0x%p\n",
 		cpu, target_freq,
 		(pcch_virt_addr + pcc_cpu_data->input_offset));
 
diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k7.c b/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
index c93f927..d71d9f3 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
@@ -68,7 +68,6 @@ union powernow_acpi_control_t {
 };
 #endif
 
-#ifdef CONFIG_CPU_FREQ_DEBUG
 /* divide by 1000 to get VCore voltage in V. */
 static const int mobile_vid_table[32] = {
     2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
@@ -76,7 +75,6 @@ static const int mobile_vid_table[32] = {
     1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
     1075, 1050, 1025, 1000, 975, 950, 925, 0,
 };
-#endif
 
 /* divide by 10 to get FID. */
 static const int fid_codes[32] = {
diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 5453cbc..83479b6 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -849,7 +849,7 @@ static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
 
 	if ((control != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
 	    (status != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
-		pr_debug("Invalid control/status registers (%x - %x)\n",
+		pr_debug("Invalid control/status registers (%llx - %llx)\n",
 			control, status);
 		goto err_out;
 	}
diff --git a/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c b/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
index 1e1fafd..c76ead3 100644
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
@@ -404,8 +404,8 @@ static int __init speedstep_init(void)
 		return -ENODEV;
 	}
 
-	pr_debug("signature:0x%.8lx, command:0x%.8lx, "
-		"event:0x%.8lx, perf_level:0x%.8lx.\n",
+	pr_debug("signature:0x%.8ulx, command:0x%.8ulx, "
+		"event:0x%.8ulx, perf_level:0x%.8ulx.\n",
 		ist_info.signature, ist_info.command,
 		ist_info.event, ist_info.perf_level);
 
