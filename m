From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 1/2] cpufreq: use dynamic debug instead of custom
 infrastructure
Date: Sun, 27 Mar 2011 15:04:46 +0200
Message-ID: <20110327130446.GA6759@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@codemonkey.org.uk>, cpufreq@vger.kernel.org

With dynamic debug having gained the capability to report debug messages
also during the boot process, it offers a far superior interface for
debug messages than the custom cpufreq infrastructure. As a first step,
remove the old cpufreq_debug_printk() function and replace it with a call
to the generic pr_debug() function.

How can dynamic debug be used on cpufreq? You need a kernel which has
CONFIG_DYNAMIC_DEBUG enabled.

To enabled debugging during runtime, mount debugfs and

$ echo -n 'module cpufreq +p' > /sys/kernel/debug/dynamic_debug/control

for debugging the complete "cpufreq" module. To achieve the same goal during
boot, append

	ddebug_query="module cpufreq +p"

as a boot parameter to the kernel of your choice.

For more detailled instructions, please see
Documentation/dynamic-debug-howto.txt

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 drivers/cpufreq/Kconfig   |   13 ------
 drivers/cpufreq/cpufreq.c |  104 +--------------------------------------------
 include/linux/cpufreq.h   |   11 +----
 3 files changed, 2 insertions(+), 126 deletions(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index ca8ee80..b78baa5 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -18,19 +18,6 @@ if CPU_FREQ
 config CPU_FREQ_TABLE
 	tristate
 
-config CPU_FREQ_DEBUG
-	bool "Enable CPUfreq debugging"
-	help
-	  Say Y here to enable CPUfreq subsystem (including drivers)
-	  debugging. You will need to activate it via the kernel
-	  command line by passing
-	     cpufreq.debug=<value>
-
-	  To get <value>, add 
-	       1 to activate CPUfreq core debugging,
-	       2 to activate CPUfreq drivers debugging, and
-	       4 to activate CPUfreq governor debugging
-
 config CPU_FREQ_STAT
 	tristate "CPU frequency translation statistics"
 	select CPU_FREQ_TABLE
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index b03771d..b6ed7df 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -181,93 +181,6 @@ EXPORT_SYMBOL_GPL(cpufreq_cpu_put);
 
 
 /*********************************************************************
- *                     UNIFIED DEBUG HELPERS                         *
- *********************************************************************/
-#ifdef CONFIG_CPU_FREQ_DEBUG
-
-/* what part(s) of the CPUfreq subsystem are debugged? */
-static unsigned int debug;
-
-/* is the debug output ratelimit'ed using printk_ratelimit? User can
- * set or modify this value.
- */
-static unsigned int debug_ratelimit = 1;
-
-/* is the printk_ratelimit'ing enabled? It's enabled after a successful
- * loading of a cpufreq driver, temporarily disabled when a new policy
- * is set, and disabled upon cpufreq driver removal
- */
-static unsigned int disable_ratelimit = 1;
-static DEFINE_SPINLOCK(disable_ratelimit_lock);
-
-static void cpufreq_debug_enable_ratelimit(void)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&disable_ratelimit_lock, flags);
-	if (disable_ratelimit)
-		disable_ratelimit--;
-	spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
-}
-
-static void cpufreq_debug_disable_ratelimit(void)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&disable_ratelimit_lock, flags);
-	disable_ratelimit++;
-	spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
-}
-
-void cpufreq_debug_printk(unsigned int type, const char *prefix,
-			const char *fmt, ...)
-{
-	char s[256];
-	va_list args;
-	unsigned int len;
-	unsigned long flags;
-
-	WARN_ON(!prefix);
-	if (type & debug) {
-		spin_lock_irqsave(&disable_ratelimit_lock, flags);
-		if (!disable_ratelimit && debug_ratelimit
-					&& !printk_ratelimit()) {
-			spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
-			return;
-		}
-		spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
-
-		len = snprintf(s, 256, KERN_DEBUG "%s: ", prefix);
-
-		va_start(args, fmt);
-		len += vsnprintf(&s[len], (256 - len), fmt, args);
-		va_end(args);
-
-		printk(s);
-
-		WARN_ON(len < 5);
-	}
-}
-EXPORT_SYMBOL(cpufreq_debug_printk);
-
-
-module_param(debug, uint, 0644);
-MODULE_PARM_DESC(debug, "CPUfreq debugging: add 1 to debug core,"
-			" 2 to debug drivers, and 4 to debug governors.");
-
-module_param(debug_ratelimit, uint, 0644);
-MODULE_PARM_DESC(debug_ratelimit, "CPUfreq debugging:"
-					" set to 0 to disable ratelimiting.");
-
-#else /* !CONFIG_CPU_FREQ_DEBUG */
-
-static inline void cpufreq_debug_enable_ratelimit(void) { return; }
-static inline void cpufreq_debug_disable_ratelimit(void) { return; }
-
-#endif /* CONFIG_CPU_FREQ_DEBUG */
-
-
-/*********************************************************************
  *            EXTERNALLY AFFECTING FREQUENCY CHANGES                 *
  *********************************************************************/
 
@@ -977,7 +890,6 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	if (cpu_is_offline(cpu))
 		return 0;
 
-	cpufreq_debug_disable_ratelimit();
 	dprintk("adding CPU %u\n", cpu);
 
 #ifdef CONFIG_SMP
@@ -986,7 +898,6 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	policy = cpufreq_cpu_get(cpu);
 	if (unlikely(policy)) {
 		cpufreq_cpu_put(policy);
-		cpufreq_debug_enable_ratelimit();
 		return 0;
 	}
 #endif
@@ -1064,7 +975,6 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	kobject_uevent(&policy->kobj, KOBJ_ADD);
 	module_put(cpufreq_driver->owner);
 	dprintk("initialization complete\n");
-	cpufreq_debug_enable_ratelimit();
 
 	return 0;
 
@@ -1088,7 +998,6 @@ err_free_policy:
 nomem_out:
 	module_put(cpufreq_driver->owner);
 module_out:
-	cpufreq_debug_enable_ratelimit();
 	return ret;
 }
 
@@ -1112,7 +1021,6 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 	unsigned int j;
 #endif
 
-	cpufreq_debug_disable_ratelimit();
 	dprintk("unregistering CPU %u\n", cpu);
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
@@ -1120,7 +1028,6 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 
 	if (!data) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
-		cpufreq_debug_enable_ratelimit();
 		unlock_policy_rwsem_write(cpu);
 		return -EINVAL;
 	}
@@ -1137,7 +1044,6 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 		kobj = &sys_dev->kobj;
 		cpufreq_cpu_put(data);
-		cpufreq_debug_enable_ratelimit();
 		unlock_policy_rwsem_write(cpu);
 		sysfs_remove_link(kobj, "cpufreq");
 		return 0;
@@ -1213,7 +1119,6 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 	kfree(data);
 	per_cpu(cpufreq_cpu_data, cpu) = NULL;
 
-	cpufreq_debug_enable_ratelimit();
 	return 0;
 }
 
@@ -1697,7 +1602,6 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 {
 	int ret = 0;
 
-	cpufreq_debug_disable_ratelimit();
 	dprintk("setting new policy for CPU %u: %u - %u kHz\n", policy->cpu,
 		policy->min, policy->max);
 
@@ -1774,7 +1678,6 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 	}
 
 error_out:
-	cpufreq_debug_enable_ratelimit();
 	return ret;
 }
 
@@ -1928,7 +1831,6 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 
 	register_hotcpu_notifier(&cpufreq_cpu_notifier);
 	dprintk("driver %s up and running\n", driver_data->name);
-	cpufreq_debug_enable_ratelimit();
 
 	return 0;
 err_sysdev_unreg:
@@ -1955,12 +1857,8 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
 {
 	unsigned long flags;
 
-	cpufreq_debug_disable_ratelimit();
-
-	if (!cpufreq_driver || (driver != cpufreq_driver)) {
-		cpufreq_debug_enable_ratelimit();
+	if (!cpufreq_driver || (driver != cpufreq_driver))
 		return -EINVAL;
-	}
 
 	dprintk("unregistering driver %s\n", driver->name);
 
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 9343dd3..adb10ea 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -405,15 +405,6 @@ void cpufreq_frequency_table_put_attr(unsigned int cpu);
 #define CPUFREQ_DEBUG_DRIVER	2
 #define CPUFREQ_DEBUG_GOVERNOR	4
 
-#ifdef CONFIG_CPU_FREQ_DEBUG
-
-extern void cpufreq_debug_printk(unsigned int type, const char *prefix, 
-				 const char *fmt, ...);
-
-#else
-
-#define cpufreq_debug_printk(msg...) do { } while(0)
-
-#endif /* CONFIG_CPU_FREQ_DEBUG */
+#define cpufreq_debug_printk(type, msg...) pr_debug(msg)
 
 #endif /* _LINUX_CPUFREQ_H */
-- 
1.7.1

