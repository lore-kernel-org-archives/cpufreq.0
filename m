From: venkatesh.pallipadi@intel.com
Subject: [patch 1/6] cpufreq: Add cpu number parameter to
	__cpufreq_driver_getavg()
Date: Thu, 17 Jul 2008 13:55:55 -0700
Message-ID: <20080717205615.928888000@intel.com>
References: <20080717205554.214645000@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline; filename=cpufreq_getavg_cpu_param.patch
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
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

Add a cpu parameter to __cpufreq_driver_getavg(). This is needed for software
cpufreq coordination where policy->cpu may not be same as the CPU on which we
want to getavg frequency. 

A follow-on patch will use this parameter to getavg freq from all cpus
in policy->cpus.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

---
 arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c |    5 +++++
 drivers/cpufreq/cpufreq.c                  |    6 +++---
 drivers/cpufreq/cpufreq_ondemand.c         |    2 +-
 include/linux/cpufreq.h                    |    3 ++-
 4 files changed, 11 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.orig/drivers/cpufreq/cpufreq.c	2008-07-16 10:58:51.000000000 -0700
+++ linux-2.6/drivers/cpufreq/cpufreq.c	2008-07-17 10:02:23.000000000 -0700
@@ -1482,7 +1482,7 @@ int cpufreq_driver_target(struct cpufreq
 }
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
 
-int __cpufreq_driver_getavg(struct cpufreq_policy *policy)
+int __cpufreq_driver_getavg(struct cpufreq_policy *policy, unsigned int cpu)
 {
 	int ret = 0;
 
@@ -1490,8 +1490,8 @@ int __cpufreq_driver_getavg(struct cpufr
 	if (!policy)
 		return -EINVAL;
 
-	if (cpu_online(policy->cpu) && cpufreq_driver->getavg)
-		ret = cpufreq_driver->getavg(policy->cpu);
+	if (cpu_online(cpu) && cpufreq_driver->getavg)
+		ret = cpufreq_driver->getavg(cpu);
 
 	cpufreq_cpu_put(policy);
 	return ret;
Index: linux-2.6/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.orig/drivers/cpufreq/cpufreq_ondemand.c	2008-07-16 10:58:51.000000000 -0700
+++ linux-2.6/drivers/cpufreq/cpufreq_ondemand.c	2008-07-17 10:02:23.000000000 -0700
@@ -415,7 +415,7 @@ static void dbs_check_cpu(struct cpu_dbs
 	if (load < (dbs_tuners_ins.up_threshold - 10)) {
 		unsigned int freq_next, freq_cur;
 
-		freq_cur = __cpufreq_driver_getavg(policy);
+		freq_cur = __cpufreq_driver_getavg(policy, policy->cpu);
 		if (!freq_cur)
 			freq_cur = policy->cur;
 
Index: linux-2.6/include/linux/cpufreq.h
===================================================================
--- linux-2.6.orig/include/linux/cpufreq.h	2008-07-16 10:58:51.000000000 -0700
+++ linux-2.6/include/linux/cpufreq.h	2008-07-17 10:02:23.000000000 -0700
@@ -189,7 +189,8 @@ extern int __cpufreq_driver_target(struc
 				   unsigned int relation);
 
 
-extern int __cpufreq_driver_getavg(struct cpufreq_policy *policy);
+extern int __cpufreq_driver_getavg(struct cpufreq_policy *policy,
+				   unsigned int cpu);
 
 int cpufreq_register_governor(struct cpufreq_governor *governor);
 void cpufreq_unregister_governor(struct cpufreq_governor *governor);
Index: linux-2.6/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.orig/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c	2008-07-16 10:58:51.000000000 -0700
+++ linux-2.6/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c	2008-07-17 10:02:23.000000000 -0700
@@ -611,6 +611,11 @@ static int acpi_cpufreq_cpu_init(struct 
 	}
 #endif
 
+	/* Set drv_data for all secondary CPUs in policy->cpus mask */
+	for_each_cpu_mask(i, policy->cpus)
+		if (i != policy->cpu)
+			per_cpu(drv_data, i) = data;
+
 	/* capability check */
 	if (perf->state_count <= 1) {
 		dprintk("No P-States\n");

-- 
