From: Dave Jones <davej@redhat.com>
Subject: Remove cpufreq_stats sysfs entries on module unload.
Date: Sun, 12 Jun 2011 16:57:46 -0400
Message-ID: <20110612205746.GA28685@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Zou Nan hai <nanhai.zou@intel.com>

fyi, I just merged the patch below.

	Dave

--- 
[CPUFREQ] Remove cpufreq_stats sysfs entries on module unload.

cpufreq_stats leaves behind its sysfs entries, which causes a panic
when something stumbled across them.
(Discovered by unloading cpufreq_stats while powertop was loaded).

Signed-off-by: Dave Jones <davej@redhat.com>

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index b60a4c2..853f92d 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -387,6 +387,7 @@ static void __exit cpufreq_stats_exit(void)
 	unregister_hotcpu_notifier(&cpufreq_stat_cpu_notifier);
 	for_each_online_cpu(cpu) {
 		cpufreq_stats_free_table(cpu);
+		cpufreq_stats_free_sysfs(cpu);
 	}
 }
 
