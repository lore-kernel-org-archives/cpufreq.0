From: Jon Anderson <janderson@janderson.ca>
Subject: CPUFreq dynamic speed governor, take 2.
Date: Fri, 31 Oct 2003 02:04:08 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1067583848.25805.234.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-ZU6kBJxZgSOUrJ5rozA4"
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--=-ZU6kBJxZgSOUrJ5rozA4
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been lurking on this list for a while now, but a few friends of
mine encouraged me to post a chunk of code I wrote...

I wrote a simple "dynamic" frequency governor for use on my non-mobile
P4 laptop, since the demandbased governor patch seems to be targeted at
mobile CPUs. (...and doesn't work for me :)

I've been using the "dynamic" governor on my machine with the
p4-clockmod driver, and it works beautifully. I don't notice any
slowdown in X/Gnome2, though I'm sure there is quite a bit. I do however
notice significant drops is heat output and a small yet noticeable
increase in battery life.

The module itself just polls idle jiffies every 100ms, and bumps up the
frequency if there's less than 20% idle, and down if there's more than
80%.

I've made a quick patch that should apply cleanly to 2.6.0-test9. Also
included is the raw code, however ugly it may be.

From previous posts, I've gathered that:
1) This kind of stuff is probably patented, so it will never be merged
anywhere. Oh, well.
2) People seem to prefer userspace tools to govern frequency. As far as
I can tell, the kernel-based solution should use way less overhead, and
doesn't run into certain limitations.

Comments, questions? Please let me know,

jon anderson



--=-ZU6kBJxZgSOUrJ5rozA4
Content-Disposition: attachment; filename=2.6.0-test9_cpufreq_dynamic.patch
Content-Type: text/x-patch; name=2.6.0-test9_cpufreq_dynamic.patch;
	charset=us-ascii
Content-Transfer-Encoding: 7bit

diff -Naur linux-2.6.0-test9.orig/drivers/cpufreq/Kconfig linux-2.6.0-test9/drivers/cpufreq/Kconfig
--- linux-2.6.0-test9.orig/drivers/cpufreq/Kconfig	2003-10-25 14:44:40.000000000 -0400
+++ linux-2.6.0-test9/drivers/cpufreq/Kconfig	2003-10-30 21:29:38.509019128 -0500
@@ -35,6 +35,17 @@
 	  programm shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.
 
+config CPU_FREQ_DEFAULT_GOV_DYNAMIC
+        bool "dynamic"
+        select CPU_FREQ_GOV_DYNAMIC
+        help
+          Use the CPUFreq governor 'dynamic' as the default. This will
+          adjust the CPU frequency automatically based on CPU idle time.
+          This should work on just about any CPU for which there is a
+          CPUFreq driver (p4-clockmod, etc...)
+                                                                                
+          This is experimental
+                                                                                
 endchoice
 
 config CPU_FREQ_GOV_PERFORMANCE
@@ -68,6 +79,19 @@
 
 	  If in doubt, say Y.
 
+config CPU_FREQ_GOV_DYNAMIC
+        tristate "Dynamic CPUFreq policy governor"
+        depends on CPU_FREQ
+        help
+          This CPUFreq governor checks CPU idle time 10 times a second,
+          and raises or lowers the CPU's speed as appropriate.
+                                                                                
+          This code is currently experimental, but works fantastically
+          for the author.
+                                                                                
+          It is best to say N for the moment.
+                                                                                
+
 config CPU_FREQ_24_API
 	bool "/proc/sys/cpu/ interface (2.4. / OLD)"
 	depends on CPU_FREQ && SYSCTL && CPU_FREQ_GOV_USERSPACE
diff -Naur linux-2.6.0-test9.orig/drivers/cpufreq/Makefile linux-2.6.0-test9/drivers/cpufreq/Makefile
--- linux-2.6.0-test9.orig/drivers/cpufreq/Makefile	2003-10-25 14:45:05.000000000 -0400
+++ linux-2.6.0-test9/drivers/cpufreq/Makefile	2003-10-30 21:30:49.939160096 -0500
@@ -5,6 +5,7 @@
 obj-$(CONFIG_CPU_FREQ_GOV_PERFORMANCE)	+= cpufreq_performance.o
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+= cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= cpufreq_userspace.o
+obj-$(CONFIG_CPU_FREQ_GOV_DYNAMIC)	+= cpufreq_dynamic.o
 
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o
diff -Naur linux-2.6.0-test9.orig/drivers/cpufreq/cpufreq_dynamic.c linux-2.6.0-test9/drivers/cpufreq/cpufreq_dynamic.c
--- linux-2.6.0-test9.orig/drivers/cpufreq/cpufreq_dynamic.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-2.6.0-test9/drivers/cpufreq/cpufreq_dynamic.c	2003-10-30 21:05:32.119903696 -0500
@@ -0,0 +1,154 @@
+/*
+ *  linux/drivers/cpufreq/cpufreq_dynamic.c
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * *** Experimental! ***
+ *
+ * TODO: 
+ *       - Handle more than CPU 0.
+ *       - Put in a better stepping mechanism.
+ *       - Step downwards slower than stepping upwards. (I think this would
+ *          work more efficiently than as it is now.)
+ *       - Documenting in Documentation/cpufreq
+ *       - Documentation that is NOT crappy in this file.
+ *       - Proper debug printing.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/cpufreq.h>
+#include <linux/init.h>
+#include <linux/timer.h>
+#include <linux/times.h>
+#include <asm/timex.h>
+
+#include <linux/kernel_stat.h>
+
+/* How many times/second to poll */
+#define POLL_FREQUENCY 10
+
+/* Wait HZ/POLL_FREQUENCY jiffies in between polling. */
+#define SLEEP_JIFFIES HZ/POLL_FREQUENCY
+
+/* Minimum and maximum idle thresholds, in percent */
+#define MIN_IDLE 20
+#define MAX_IDLE 80
+
+/* Internal definitions for temporary frequency table. Ug-ly. */
+#define FREQ_MAX 0
+#define FREQ_MIN -1
+
+/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. 
+ * e.g. { FREQ_MAX,1500000,1000000,500000,FREQ_MIN }
+ */
+static const int32_t cpufreq_dynamic_freqs[] = {
+	FREQ_MAX, \
+/**
+ * FIXME: Find better way to find frequencies to switch to.
+ *
+ * These values work on my non-mobile P4 2 GHz, but 
+ * would probably just waste CPU cycles on most other
+ * CPUs. (I.e. these values would probably be invalid.)
+ *
+ *	1500000, \
+ *	1000000, \
+ *	500000, \
+ *	250000, \ */
+	FREQ_MIN \
+};
+
+/* Kernel Timer for this module. (Timers are awesome!) */
+struct timer_list cpufreq_dynamic_timer;
+unsigned long prev_idle; // CPU idle time, in jiffies.
+unsigned long percent_idle; // Idle percentage. 
+uint8_t	cpufreq_dynamic_cur_freq_id; // What ID from the stupid table we're at.
+
+
+/**
+ * Timer callback
+ */
+static void cpufreq_governor_dynamic_callback(unsigned long t) {
+	percent_idle = POLL_FREQUENCY * 100 * (kstat_cpu(0).cpustat.idle - prev_idle) / HZ;
+	prev_idle = kstat_cpu(0).cpustat.idle;
+
+	if ((percent_idle > MAX_IDLE) || (percent_idle < MIN_IDLE)) { cpufreq_governor(0,CPUFREQ_GOV_LIMITS); }
+
+	cpufreq_dynamic_timer.expires = jiffies + SLEEP_JIFFIES;
+	add_timer(&cpufreq_dynamic_timer);
+}
+
+/**
+ * The governor itself.
+ * 
+ * DOCUMENT ME!
+ */
+static int cpufreq_governor_dynamic(struct cpufreq_policy *policy,
+					unsigned int event)
+{
+	switch (event) {
+	case CPUFREQ_GOV_START:
+		cpufreq_dynamic_timer.expires = jiffies + SLEEP_JIFFIES;
+		cpufreq_dynamic_timer.function = cpufreq_governor_dynamic_callback;
+		cpufreq_dynamic_cur_freq_id = 0;
+		prev_idle = kstat_cpu(0).cpustat.idle;
+		init_timer(&cpufreq_dynamic_timer);
+		add_timer(&cpufreq_dynamic_timer);
+	case CPUFREQ_GOV_LIMITS:
+		if (percent_idle > MAX_IDLE) {
+			if (cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id] != FREQ_MIN) {
+				if (cpufreq_dynamic_freqs[++cpufreq_dynamic_cur_freq_id] == FREQ_MIN) {
+					__cpufreq_driver_target(policy,policy->min,CPUFREQ_RELATION_L);
+				} else {
+					//printk("cpufreq_dynamic: Attempting to downgrade frequency: %i KHz\n",cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id]);
+					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id],CPUFREQ_RELATION_L);
+				}
+			}
+		} else if (percent_idle < MIN_IDLE) {
+			if (cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id] != FREQ_MAX) {
+				if (cpufreq_dynamic_freqs[--cpufreq_dynamic_cur_freq_id] == FREQ_MAX) {
+					__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
+				} else {
+					//printk("cpufreq_dynamic: Attempting to upgrade frequency: %i KHz\n",cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id]);
+					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id],CPUFREQ_RELATION_L);
+				}
+			}
+		}
+		break;
+	case CPUFREQ_GOV_STOP:
+		del_timer(&cpufreq_dynamic_timer);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+                                                            
+static struct cpufreq_governor cpufreq_gov_dynamic = {
+	.name		= "dynamic",
+	.governor	= cpufreq_governor_dynamic,
+	.owner		= THIS_MODULE,
+};
+
+
+static int __init cpufreq_gov_dynamic_init(void)
+{
+	return cpufreq_register_governor(&cpufreq_gov_dynamic);
+}
+
+
+static void __exit cpufreq_gov_dynamic_exit(void)
+{
+	cpufreq_unregister_governor(&cpufreq_gov_dynamic);
+}
+
+
+MODULE_AUTHOR("Jonathan Anderson <janderson@janderson.ca");
+MODULE_DESCRIPTION("Dynamic CPUfreq policy governor");
+MODULE_LICENSE("GPL");
+
+module_init(cpufreq_gov_dynamic_init);
+module_exit(cpufreq_gov_dynamic_exit);
diff -Naur linux-2.6.0-test9.orig/include/linux/cpufreq.h linux-2.6.0-test9/include/linux/cpufreq.h
--- linux-2.6.0-test9.orig/include/linux/cpufreq.h	2003-10-25 14:43:56.000000000 -0400
+++ linux-2.6.0-test9/include/linux/cpufreq.h	2003-10-30 21:33:11.784596312 -0500
@@ -303,6 +303,9 @@
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_DYNAMIC)
+extern struct cpufreq_governor cpufreq_gov_dynamic;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_dynamic
 #endif
 
 /*********************************************************************

--=-ZU6kBJxZgSOUrJ5rozA4
Content-Disposition: attachment; filename=cpufreq_dynamic.c
Content-Type: text/x-c; name=cpufreq_dynamic.c; charset=us-ascii
Content-Transfer-Encoding: 7bit

/*
 *  linux/drivers/cpufreq/cpufreq_dynamic.c
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * *** Experimental! ***
 *
 * TODO: 
 *       - Handle more than CPU 0.
 *       - Put in a better stepping mechanism.
 *       - Step downwards slower than stepping upwards. (I think this would
 *          work more efficiently than as it is now.)
 *       - Documenting in Documentation/cpufreq
 *       - Documentation that is NOT crappy in this file.
 *       - Proper debug printing.
 *
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cpufreq.h>
#include <linux/init.h>
#include <linux/timer.h>
#include <linux/times.h>
#include <asm/timex.h>

#include <linux/kernel_stat.h>

/* How many times/second to poll */
#define POLL_FREQUENCY 10

/* Wait HZ/POLL_FREQUENCY jiffies in between polling. */
#define SLEEP_JIFFIES HZ/POLL_FREQUENCY

/* Minimum and maximum idle thresholds, in percent */
#define MIN_IDLE 20
#define MAX_IDLE 80

/* Internal definitions for temporary frequency table. Ug-ly. */
#define FREQ_MAX 0
#define FREQ_MIN -1

/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. 
 * e.g. { FREQ_MAX,1500000,1000000,500000,FREQ_MIN }
 */
static const int32_t cpufreq_dynamic_freqs[] = {
	FREQ_MAX, \
/**
 * FIXME: Find better way to find frequencies to switch to.
 *
 * These values work on my non-mobile P4 2 GHz, but 
 * would probably just waste CPU cycles on most other
 * CPUs. (I.e. these values would probably be invalid.)
 *
 *	1500000, \
 *	1000000, \
 *	500000, \
 *	250000, \ */
	FREQ_MIN \
};

/* Kernel Timer for this module. (Timers are awesome!) */
struct timer_list cpufreq_dynamic_timer;
unsigned long prev_idle; // CPU idle time, in jiffies.
unsigned long percent_idle; // Idle percentage. 
uint8_t	cpufreq_dynamic_cur_freq_id; // What ID from the stupid table we're at.


/**
 * Timer callback
 */
static void cpufreq_governor_dynamic_callback(unsigned long t) {
	percent_idle = POLL_FREQUENCY * 100 * (kstat_cpu(0).cpustat.idle - prev_idle) / HZ;
	prev_idle = kstat_cpu(0).cpustat.idle;

	if ((percent_idle > MAX_IDLE) || (percent_idle < MIN_IDLE)) { cpufreq_governor(0,CPUFREQ_GOV_LIMITS); }

	cpufreq_dynamic_timer.expires = jiffies + SLEEP_JIFFIES;
	add_timer(&cpufreq_dynamic_timer);
}

/**
 * The governor itself.
 * 
 * DOCUMENT ME!
 */
static int cpufreq_governor_dynamic(struct cpufreq_policy *policy,
					unsigned int event)
{
	switch (event) {
	case CPUFREQ_GOV_START:
		cpufreq_dynamic_timer.expires = jiffies + SLEEP_JIFFIES;
		cpufreq_dynamic_timer.function = cpufreq_governor_dynamic_callback;
		cpufreq_dynamic_cur_freq_id = 0;
		prev_idle = kstat_cpu(0).cpustat.idle;
		init_timer(&cpufreq_dynamic_timer);
		add_timer(&cpufreq_dynamic_timer);
	case CPUFREQ_GOV_LIMITS:
		if (percent_idle > MAX_IDLE) {
			if (cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id] != FREQ_MIN) {
				if (cpufreq_dynamic_freqs[++cpufreq_dynamic_cur_freq_id] == FREQ_MIN) {
					__cpufreq_driver_target(policy,policy->min,CPUFREQ_RELATION_L);
				} else {
					//printk("cpufreq_dynamic: Attempting to downgrade frequency: %i KHz\n",cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id]);
					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id],CPUFREQ_RELATION_L);
				}
			}
		} else if (percent_idle < MIN_IDLE) {
			if (cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id] != FREQ_MAX) {
				if (cpufreq_dynamic_freqs[--cpufreq_dynamic_cur_freq_id] == FREQ_MAX) {
					__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
				} else {
					//printk("cpufreq_dynamic: Attempting to upgrade frequency: %i KHz\n",cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id]);
					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[cpufreq_dynamic_cur_freq_id],CPUFREQ_RELATION_L);
				}
			}
		}
		break;
	case CPUFREQ_GOV_STOP:
		del_timer(&cpufreq_dynamic_timer);
		break;
	default:
		break;
	}
	return 0;
}
                                                            
static struct cpufreq_governor cpufreq_gov_dynamic = {
	.name		= "dynamic",
	.governor	= cpufreq_governor_dynamic,
	.owner		= THIS_MODULE,
};
EXPORT_SYMBOL(cpufreq_gov_dynamic);


static int __init cpufreq_gov_dynamic_init(void)
{
	return cpufreq_register_governor(&cpufreq_gov_dynamic);
}


static void __exit cpufreq_gov_dynamic_exit(void)
{
	cpufreq_unregister_governor(&cpufreq_gov_dynamic);
}


MODULE_AUTHOR("Jonathan Anderson <janderson@janderson.ca");
MODULE_DESCRIPTION("Dynamic CPUfreq policy governor");
MODULE_LICENSE("GPL");

module_init(cpufreq_gov_dynamic_init);
module_exit(cpufreq_gov_dynamic_exit);

--=-ZU6kBJxZgSOUrJ5rozA4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-ZU6kBJxZgSOUrJ5rozA4--


