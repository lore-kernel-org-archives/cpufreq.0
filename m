From: Adrian Bunk <bunk@kernel.org>
Subject: [2.6 patch] drivers/cpufreq/cpufreq_stats.c section fix
Date: Sun, 2 Dec 2007 01:43:04 +0100
Message-ID: <20071202004304.GG15974@stusta.de>
References: <200711291419.49261.chris2553@googlemail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755406AbXLBAn0@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200711291419.49261.chris2553@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Clayton <chris2553@googlemail.com>, davej@codemonkey.org.uk
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

cpufreq_stats_free_table() mustn't be __cpuexit since it's called by the 
__cpuinit cpufreq_stat_cpu_callback().

This patch fixes the following section mismatch reported by
Chris Clayton:

<--  snip  -->

...
WARNING: vmlinux.o(.init.text+0x143dd): Section mismatch: reference to .exit.text:cpufreq_stats_free_table (between 'cpufreq_stat_cpu_callback' and 'cpufreq_stats_init')
...

<--  snip  -->

Signed-off-by: Adrian Bunk <bunk@kernel.org>

---
b845706570b48f091f855c33cdb9979d7e83a424 
diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 8a45d0f..1b8312b 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -164,7 +164,7 @@ freq_table_get_index(struct cpufreq_stats *stat, unsigned int freq)
 	return -1;
 }
 
-static void __cpuexit cpufreq_stats_free_table(unsigned int cpu)
+static void cpufreq_stats_free_table(unsigned int cpu)
 {
 	struct cpufreq_stats *stat = cpufreq_stats_table[cpu];
 	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);

