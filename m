From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] cpufreq-core: add a common debug infrastructure
Date: Wed, 29 Sep 2004 23:46:05 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040929214605.GD18564@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

Add a unified cpufreq debug infrastructure. Patches which update the 
individual drivers and add some dprintks in core files [exception: ondemand
governor, and proc_itnf. The latter will go away soon, so I don't see a real
need for it anyway...] do exist, but as they're mostly about replacing some
stuff I won't send them to the list yet.


cpufreq_debug_printk will print messages if

a) debugging for the specified part is activated (add 
	1 for core, 
	2 for drivers, 
	4 for governors 
   and pass value as
	cpufreq.debug=<value> 
   on the kernel command line). 

b) and either
	b1) printk_ratelimit() allows it to be printed,
	b2) the user disables ratelimit'ing by passing
		cpufreq.debug_ratelimit=0
	    on the kernel command line, _or_
	b3) during driver initialization [unless a different
	    driver has been initialized successfully] and
	    unloading, and whenever a new policy is set.

	    The last point may cause for numerous messages
	    if an userspace-based dynamic governor is used
	    which mis-uses the policy interface to set specific
	    frequencies. Oh, the ACPI processor.c interface
	    to the file "performance" uses the same trick,
	    but that interface is marked deprecated as well,
	    so I don't care. And debugging isn't activated
	    normally, you know...

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 drivers/cpufreq/Kconfig   |   14 +++++
 drivers/cpufreq/cpufreq.c |  116 ++++++++++++++++++++++++++++++++++++++++++++--
 include/linux/cpufreq.h   |   19 +++++++
 3 files changed, 146 insertions(+), 3 deletions(-)



diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-09-27 17:35:42.350763584 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-09-27 17:43:09.792742064 +0200
@@ -107,6 +107,90 @@
 	module_put(cpufreq_driver->owner);
 }
 
+
+/*********************************************************************
+ *                     UNIFIED DEBUG HELPERS                         *
+ *********************************************************************/
+#ifdef CONFIG_CPU_FREQ_DEBUG
+
+/* what part(s) of the CPUfreq subsystem are debugged? */
+static unsigned int debug;
+
+/* is the debug output ratelimit'ed using printk_ratelimit? User can
+ * set or modify this value.
+ */
+static unsigned int debug_ratelimit = 1;
+
+/* is the printk_ratelimit'ing enabled? It's enabled after a successful
+ * loading of a cpufreq driver, temporarily disabled when a new policy
+ * is set, and disabled upon cpufreq driver removal
+ */
+static unsigned int disable_ratelimit = 1;
+static spinlock_t disable_ratelimit_lock = SPIN_LOCK_UNLOCKED;
+
+static inline void cpufreq_debug_enable_ratelimit(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&disable_ratelimit_lock, flags);
+	if (disable_ratelimit)
+		disable_ratelimit--;
+	spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
+}
+
+static inline void cpufreq_debug_disable_ratelimit(void)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&disable_ratelimit_lock, flags);
+	disable_ratelimit++;
+	spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
+}
+
+void cpufreq_debug_printk(unsigned int type, const char *prefix, const char *fmt, ...)
+{
+	char s[256];
+	va_list args;
+	unsigned int len;
+	unsigned long flags;
+	
+	WARN_ON(!prefix);
+	if (type & debug) {
+		spin_lock_irqsave(&disable_ratelimit_lock, flags);
+		if (!disable_ratelimit && debug_ratelimit && !printk_ratelimit()) {
+			spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
+			return;
+		}
+		spin_unlock_irqrestore(&disable_ratelimit_lock, flags);
+
+		len = snprintf(s, 256, KERN_DEBUG "%s: ", prefix);
+
+		va_start(args, fmt);
+		len += vsnprintf(&s[len], (256 - len), fmt, args);
+		va_end(args);
+
+		printk(s);
+
+		WARN_ON(len < 5);
+	}
+}
+EXPORT_SYMBOL(cpufreq_debug_printk);
+
+
+module_param(debug, uint, 0644);
+MODULE_PARM_DESC(debug, "CPUfreq debugging: add 1 to debug core, 2 to debug drivers, and 4 to debug governors.");
+
+module_param(debug_ratelimit, uint, 0644);
+MODULE_PARM_DESC(debug_ratelimit, "CPUfreq debugging: set to 0 to disable ratelimiting.");
+
+#else /* !CONFIG_CPU_FREQ_DEBUG */
+
+static inline void cpufreq_debug_enable_ratelimit(void) { return; }
+static inline void cpufreq_debug_disable_ratelimit(void) { return; }
+
+#endif /* CONFIG_CPU_FREQ_DEBUG */
+
+
 /*********************************************************************
  *            EXTERNALLY AFFECTING FREQUENCY CHANGES                 *
  *********************************************************************/
@@ -468,6 +552,8 @@
 	unsigned long flags;
 	unsigned int j;
 
+	cpufreq_debug_disable_ratelimit();
+
 #ifdef CONFIG_SMP
 	/* check whether a different CPU already registered this
 	 * CPU because it is in the same boat. */
@@ -475,12 +561,15 @@
 	if (unlikely(policy)) {
 		cpu_sys_devices[cpu] = sys_dev;
 		sysfs_create_link(&sys_dev->kobj, &policy->kobj, "cpufreq");
+		cpufreq_debug_enable_ratelimit();
 		return 0;
 	}
 #endif
 
-	if (!try_module_get(cpufreq_driver->owner))
-		return -EINVAL;
+	if (!try_module_get(cpufreq_driver->owner)) {
+		ret = -EINVAL;
+		goto module_out;
+	}
 
 	policy = kmalloc(sizeof(struct cpufreq_policy), GFP_KERNEL);
 	if (!policy) {
@@ -541,6 +630,8 @@
 
 	module_put(cpufreq_driver->owner);
 	cpu_sys_devices[cpu] = sys_dev;
+	cpufreq_debug_enable_ratelimit();
+	
 	return 0;
 
 
@@ -558,6 +649,8 @@
 
 nomem_out:
 	module_put(cpufreq_driver->owner);
+ module_out:
+	cpufreq_debug_enable_ratelimit();
 	return ret;
 }
 
@@ -576,12 +669,15 @@
 	unsigned int j;
 #endif
 
+	cpufreq_debug_disable_ratelimit();
+
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	data = cpufreq_cpu_data[cpu];
 
 	if (!data) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 		cpu_sys_devices[cpu] = NULL;
+		cpufreq_debug_enable_ratelimit();
 		return -EINVAL;
 	}
 	cpufreq_cpu_data[cpu] = NULL;
@@ -596,6 +692,7 @@
 		sysfs_remove_link(&sys_dev->kobj, "cpufreq");
 		cpu_sys_devices[cpu] = NULL;
 		cpufreq_cpu_put(data);
+		cpufreq_debug_enable_ratelimit();
 		return 0;
 	}
 #endif
@@ -604,6 +701,7 @@
 
 	if (!kobject_get(&data->kobj)) {
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+		cpufreq_debug_enable_ratelimit();
  		return -EFAULT;
 	}
 
@@ -654,6 +752,8 @@
 
 	kfree(data);
 
+	cpufreq_debug_enable_ratelimit();
+
 	return 0;
 }
 
@@ -1024,6 +1124,8 @@
 {
 	int ret = 0;
 
+	cpufreq_debug_disable_ratelimit();
+
 	memcpy(&policy->cpuinfo, 
 	       &data->cpuinfo, 
 	       sizeof(struct cpufreq_cpuinfo));
@@ -1089,6 +1191,7 @@
 	}
 
  error_out:
+	cpufreq_debug_enable_ratelimit();
 	return ret;
 }
 
@@ -1218,6 +1321,9 @@
 		}
 	}
 
+	if (!ret)
+		cpufreq_debug_enable_ratelimit();
+
 	return (ret);
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_driver);
@@ -1235,8 +1341,12 @@
 {
 	unsigned long flags;
 
-	if (!cpufreq_driver || (driver != cpufreq_driver))
+	cpufreq_debug_disable_ratelimit();
+
+	if (!cpufreq_driver || (driver != cpufreq_driver)) {
+		cpufreq_debug_enable_ratelimit();
 		return -EINVAL;
+	}
 
 	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
 
diff -ruN linux-original/drivers/cpufreq/Kconfig linux/drivers/cpufreq/Kconfig
--- linux-original/drivers/cpufreq/Kconfig	2004-09-27 17:35:42.351763432 +0200
+++ linux/drivers/cpufreq/Kconfig	2004-09-27 09:32:01.000000000 +0200
@@ -13,6 +13,20 @@
 
 	  If in doubt, say N.
 
+config CPU_FREQ_DEBUG
+	bool "Enable CPUfreq debugging"
+	depends on CPU_FREQ
+	help
+	  Say Y here to enable CPUfreq subsystem (including drivers)
+	  debugging. You will need to activate it via the kernel
+	  command line by passing
+	     cpufreq.debug=<value>
+
+	  To get <value>, add 
+	       1 to activate CPUfreq core debugging,
+	       2 to activate CPUfreq drivers debugging, and
+	       4 to activate CPUfreq governor debugging
+
 config CPU_FREQ_PROC_INTF
 	tristate "/proc/cpufreq interface (deprecated)"
 	depends on CPU_FREQ && PROC_FS
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-09-27 17:35:42.351763432 +0200
+++ linux/include/linux/cpufreq.h	2004-09-27 17:43:18.784375128 +0200
@@ -360,4 +360,23 @@
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
 
 
+/*********************************************************************
+ *                     UNIFIED DEBUG HELPERS                         *
+ *********************************************************************/
+
+#define CPUFREQ_DEBUG_CORE	1
+#define CPUFREQ_DEBUG_DRIVER	2
+#define CPUFREQ_DEBUG_GOVERNOR	4
+
+#ifdef CONFIG_CPU_FREQ_DEBUG
+
+extern void cpufreq_debug_printk(unsigned int type, const char *prefix, 
+				 const char *fmt, ...);
+
+#else
+
+#define cpufreq_debug_printk(msg...) do { } while(0)
+
+#endif /* CONFIG_CPU_FREQ_DEBUG */
+
 #endif /* _LINUX_CPUFREQ_H */
