From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: patch-02 [Re: [PATCHES] cpufreq_get(), cpufreq->get()]
Date: Mon, 12 Apr 2004 00:00:08 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040411220008.GB8160@dominikbrodowski.de>
References: <20040411215912.GA8160@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040411215912.GA8160@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

Move cpufreq_get() from the userspace governor to the core. Contrary to the
previous implementation, it now calls the cpufreq driver, and reads out the
_actual_ current frequency, and not the frequency the CPUfreq core _thinks_
the CPU is running at. Most cpufreq drivers do provide such a "hw get"
function (only ACPI-io can definitely not be supported, I'm not sure
about sh, sparc64 and powermac) anyway, and it is useful for other issues
(see following patches).

 drivers/cpufreq/cpufreq.c           |   32 +++++++++++++++++++++++++++
 drivers/cpufreq/cpufreq_userspace.c |   42 ++----------------------------------
 include/linux/cpufreq.h             |    9 +++++--
 3 files changed, 41 insertions(+), 42 deletions(-)

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-04-11 16:59:29.868192392 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-04-11 17:01:30.297884296 +0200
@@ -474,6 +474,38 @@
 	return 0;
 }
 
+
+/** 
+ * cpufreq_get - get the current CPU frequency (in kHz)
+ * @cpu: CPU number
+ *
+ * Get the CPU current (static) CPU frequency
+ */
+unsigned int cpufreq_get(unsigned int cpu)
+{
+	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	unsigned int ret = 0;
+
+	if (!policy)
+		return 0;
+
+	if (!cpufreq_driver->get)
+		goto out;
+
+	down(&policy->lock);
+
+	ret = cpufreq_driver->get(cpu);
+
+	up(&policy->lock);
+
+ out:
+	cpufreq_cpu_put(policy);
+
+	return (ret);
+}
+EXPORT_SYMBOL(cpufreq_get);
+
+
 /**
  *	cpufreq_resume - restore the CPU clock frequency after resume
  *
diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-04-11 14:48:15.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-04-11 17:04:23.642531904 +0200
@@ -145,19 +145,6 @@
 EXPORT_SYMBOL_GPL(cpufreq_setmax);
 
 
-/** 
- * cpufreq_get - get the current CPU frequency (in kHz)
- * @cpu: CPU number
- *
- * Get the CPU current (static) CPU frequency
- */
-unsigned int cpufreq_get(unsigned int cpu)
-{
-	return cpu_cur_freq[cpu];
-}
-EXPORT_SYMBOL(cpufreq_get);
-
-
 #ifdef CONFIG_CPU_FREQ_24_API
 
 
@@ -542,20 +529,6 @@
 	return 0;
 }
 
-/* on ARM SA1100 we need to rely on the values of cpufreq_get() - because 
- * of this, cpu_cur_freq[] needs to be set early.
- */
-#if defined(CONFIG_ARM) && defined(CONFIG_ARCH_SA1100)
-extern unsigned int sa11x0_getspeed(void);
-
-static void cpufreq_sa11x0_compat(void)
-{
-	cpu_cur_freq[0] = sa11x0_getspeed();
-}
-#else
-#define cpufreq_sa11x0_compat() do {} while(0)
-#endif
-
 
 struct cpufreq_governor cpufreq_gov_userspace = {
 	.name		= "userspace",
@@ -564,21 +537,12 @@
 };
 EXPORT_SYMBOL(cpufreq_gov_userspace);
 
-static int already_init = 0;
-
-int cpufreq_gov_userspace_init(void)
+static int __init cpufreq_gov_userspace_init(void)
 {
-	if (!already_init) {
-		down(&userspace_sem);
-		cpufreq_sa11x0_compat();
-		cpufreq_sysctl_init();
-		cpufreq_register_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
-		already_init = 1;
-		up(&userspace_sem);
-	}
+	cpufreq_sysctl_init();
+	cpufreq_register_notifier(&userspace_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
 	return cpufreq_register_governor(&cpufreq_gov_userspace);
 }
-EXPORT_SYMBOL(cpufreq_gov_userspace_init);
 
 
 static void __exit cpufreq_gov_userspace_exit(void)
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-04-11 14:48:29.000000000 +0200
+++ linux/include/linux/cpufreq.h	2004-04-11 17:04:47.436914608 +0200
@@ -187,6 +187,9 @@
 				 unsigned int target_freq,
 				 unsigned int relation);
 
+	/* should be defined, if possible */
+	unsigned int	(*get)	(unsigned int cpu);
+
 	/* optional */
 	int	(*exit)		(struct cpufreq_policy *policy);
 	int	(*resume)	(struct cpufreq_policy *policy);
@@ -234,6 +237,9 @@
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
 int cpufreq_update_policy(unsigned int cpu);
 
+/* query the current CPU frequency (in kHz). If zero, cpufreq couldn't detect it */
+unsigned int cpufreq_get(unsigned int cpu);
+
 /* the proc_intf.c needs this */
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy, struct cpufreq_governor **governor);
 
@@ -241,13 +247,10 @@
 /*********************************************************************
  *                      CPUFREQ USERSPACE GOVERNOR                   *
  *********************************************************************/
-int cpufreq_gov_userspace_init(void);
-
 #ifdef CONFIG_CPU_FREQ_24_API
 
 int cpufreq_setmax(unsigned int cpu);
 int cpufreq_set(unsigned int kHz, unsigned int cpu);
-unsigned int cpufreq_get(unsigned int cpu);
 
 
 /* /proc/sys/cpu */
