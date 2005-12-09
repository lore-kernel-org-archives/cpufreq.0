From: Zou Nan hai <nanhai.zou@intel.com>
Subject: [PATCH] cpufreq stats module unload fault.
Date: 09 Dec 2005 13:46:43 +0800
Message-ID: <1134107203.3228.12.camel@linux-znh>
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
To: cpufreq@www.linux.org.uk
Cc: ashok.raj@intel.com

CPU hotplug patch for cpufreq_stats module marked
cpufreq_stat_cpu_callback as __cpuinit.
That will break module unload if CONFIG_CPU_HOTPLUG is not set, 
because this function is also called at module_exit.


Signed off by: Zou Nan hai <nanhai.zou@intel.com>

diff -Nraup a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
--- a/drivers/cpufreq/cpufreq_stats.c	2005-12-09 10:59:53.000000000 +0800
+++ b/drivers/cpufreq/cpufreq_stats.c	2005-12-09 11:10:43.000000000 +0800
@@ -303,7 +303,7 @@ cpufreq_stat_notifier_trans (struct noti
 	return 0;
 }
 
-static int __cpuinit cpufreq_stat_cpu_callback(struct notifier_block *nfb,
+static int cpufreq_stat_cpu_callback(struct notifier_block *nfb,
 					unsigned long action, void *hcpu)
 {
 	unsigned int cpu = (unsigned long)hcpu;
