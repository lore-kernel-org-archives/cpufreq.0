From: Adrian Bunk <bunk@stusta.de>
Subject: [2.6 patch] small cpufreq cleanup
Date: Sat, 30 Oct 2004 09:22:46 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041030072246.GG4374@stusta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org

the patch below does the following cleanups in the cpufreq code:
- remove the __deprecated cpufreq_set{,max} functions that didn't have
  any users left
- make cpufreq_gov_dbs static

cpufreq_driver_target and cpufreq_governor in drivers/cpufreq/cpufreq.c 
also both have currently exactly zero in-kernel users, but I left them.


diffstat output:
 drivers/cpufreq/cpufreq_ondemand.c  |    3 +--
 drivers/cpufreq/cpufreq_userspace.c |   21 ---------------------
 include/linux/cpufreq.h             |    3 ---
 3 files changed, 1 insertion(+), 26 deletions(-)



Signed-off-by: Adrian Bunk <bunk@stusta.de>

--- linux-2.6.10-rc1-mm2-full/include/linux/cpufreq.h.old	2004-10-30 08:02:34.000000000 +0200
+++ linux-2.6.10-rc1-mm2-full/include/linux/cpufreq.h	2004-10-30 08:03:07.000000000 +0200
@@ -261,9 +261,6 @@
  *********************************************************************/
 #ifdef CONFIG_CPU_FREQ_24_API
 
-int __deprecated cpufreq_setmax(unsigned int cpu);
-int __deprecated cpufreq_set(unsigned int kHz, unsigned int cpu);
-
 
 /* /proc/sys/cpu */
 enum {
--- linux-2.6.10-rc1-mm2-full/drivers/cpufreq/cpufreq_userspace.c.old	2004-10-30 08:05:10.000000000 +0200
+++ linux-2.6.10-rc1-mm2-full/drivers/cpufreq/cpufreq_userspace.c	2004-10-30 08:06:04.000000000 +0200
@@ -141,27 +141,6 @@
 
 static unsigned int warning_print = 0;
 
-int __deprecated cpufreq_set(unsigned int freq, unsigned int cpu)
-{
-	return _cpufreq_set(freq, cpu);
-}
-EXPORT_SYMBOL_GPL(cpufreq_set);
-
-
-/** 
- * cpufreq_setmax - set the CPU to the maximum frequency
- * @cpu - affected cpu;
- *
- * Sets the CPU frequency to the maximum frequency supported by
- * this CPU.
- */
-int __deprecated cpufreq_setmax(unsigned int cpu)
-{
-	if (!cpu_is_managed[cpu] || !cpu_online(cpu))
-		return -EINVAL;
-	return _cpufreq_set(cpu_max_freq[cpu], cpu);
-}
-EXPORT_SYMBOL_GPL(cpufreq_setmax);
 
 /*********************** cpufreq_sysctl interface ********************/
 static int
--- linux-2.6.10-rc1-mm2-full/drivers/cpufreq/cpufreq_ondemand.c.old	2004-10-30 07:58:22.000000000 +0200
+++ linux-2.6.10-rc1-mm2-full/drivers/cpufreq/cpufreq_ondemand.c	2004-10-30 07:59:05.000000000 +0200
@@ -410,12 +410,11 @@
 	return 0;
 }
 
-struct cpufreq_governor cpufreq_gov_dbs = {
+static struct cpufreq_governor cpufreq_gov_dbs = {
 	.name		= "ondemand",
 	.governor	= cpufreq_governor_dbs,
 	.owner		= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_dbs);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
