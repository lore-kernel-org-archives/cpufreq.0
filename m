From: Jon Anderson <janderson@janderson.ca>
Subject: dynamic cpufreq governor
Date: Sun, 02 Nov 2003 23:10:45 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <1067832645.4586.10.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-qn2/0CytrvABNB7PkWPn"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--=-qn2/0CytrvABNB7PkWPn
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've made some major changes. I would say that it's now 'not really
ugly'. :)

I didn't bother changing the name, because of probable non-inclusion.
Incredible learning experience though! Thanks!

Comments, questions, let me know.

jon anderson

--=-qn2/0CytrvABNB7PkWPn
Content-Disposition: attachment; filename=2.6.0-test9_cpufreq_dynamic2.patch
Content-Type: text/x-patch; name=2.6.0-test9_cpufreq_dynamic2.patch;
	charset=us-ascii
Content-Transfer-Encoding: 7bit

diff -Naur linux-2.6.0-test9.orig/drivers/cpufreq/Kconfig linux-2.6.0-test9/drivers/cpufreq/Kconfig
--- linux-2.6.0-test9.orig/drivers/cpufreq/Kconfig	2003-10-25 14:44:40.000000000 -0400
+++ linux-2.6.0-test9/drivers/cpufreq/Kconfig	2003-11-02 22:20:42.627396856 -0500
@@ -35,6 +35,21 @@
 	  programm shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.
 
+config CPU_FREQ_DEFAULT_GOV_DYNAMIC
+	bool "dynamic"
+	select CPU_FREQ_GOV_DYNAMIC
+	help
+	  Use the dynamic CPUFreq governor as the default. This will set
+	  your CPU frequency based on how idle your CPU is at any given
+	  time.
+
+	  Note: If your cpufreq driver's transition latency is too high,
+	        this governor will have the same effect as the 
+		'performance' governor. (Set CPU to max, and leave it
+		there.)
+
+	  This is experimental.
+
 endchoice
 
 config CPU_FREQ_GOV_PERFORMANCE
@@ -68,6 +83,17 @@
 
 	  If in doubt, say Y.
 
+config CPU_FREQ_GOV_DYNAMIC
+        tristate "Dynamic CPUFreq policy governor"
+        depends on CPU_FREQ
+        help
+          This CPUFreq governor checks CPU idle time 10 times a second,
+          and raises or lowers the CPU's speed as appropriate. This 
+	  governor is somewhat hesitant in dropping the CPUs frequency.
+	  Frequency decreases happen 5 times slower than increases.
+                                                                                
+          It is best to say N for the moment.
+
 config CPU_FREQ_24_API
 	bool "/proc/sys/cpu/ interface (2.4. / OLD)"
 	depends on CPU_FREQ && SYSCTL && CPU_FREQ_GOV_USERSPACE
diff -Naur linux-2.6.0-test9.orig/drivers/cpufreq/Makefile linux-2.6.0-test9/drivers/cpufreq/Makefile
--- linux-2.6.0-test9.orig/drivers/cpufreq/Makefile	2003-10-25 14:45:05.000000000 -0400
+++ linux-2.6.0-test9/drivers/cpufreq/Makefile	2003-11-02 22:20:58.350006656 -0500
@@ -5,6 +5,7 @@
 obj-$(CONFIG_CPU_FREQ_GOV_PERFORMANCE)	+= cpufreq_performance.o
 obj-$(CONFIG_CPU_FREQ_GOV_POWERSAVE)	+= cpufreq_powersave.o
 obj-$(CONFIG_CPU_FREQ_GOV_USERSPACE)	+= cpufreq_userspace.o
+obj-$(CONFIG_CPU_FREQ_GOV_DYNAMIC)	+= cpufreq_dynamic.o
 
 # CPUfreq cross-arch helpers
 obj-$(CONFIG_CPU_FREQ_TABLE)		+= freq_table.o
diff -Naur linux-2.6.0-test9.orig/drivers/cpufreq/cpufreq_dynamic.c linux-2.6.0-test9/drivers/cpufreq/cpufreq_dynamic.c
--- linux-2.6.0-test9.orig/drivers/cpufreq/cpufreq_dynamic.c	1969-12-31 19:00:00.000000000 -0500
+++ linux-2.6.0-test9/drivers/cpufreq/cpufreq_dynamic.c	2003-11-02 22:42:11.879272848 -0500
@@ -0,0 +1,258 @@
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
+ *       - *** DONE *** Handle more than CPU 0.
+ *       - *** DONE *** Put in a better stepping mechanism. Room for improvement.
+ *       - *** DONE ***  Make frequency tables for each CPU - I assume that it might be possible to have CPUs at different frequencies.
+ *       - *** DONE *** Step downwards slower than stepping upwards. 
+ *       - Documenting in Documentation/cpufreq. Not needed (driver not to be committed.)
+ *       - *** DONE ***  Documentation that is NOT crappy in this file. Need more.
+ *       - Proper debug printing. -> Need to figure out kernel conventions.
+ *       - *** DONE *** Handle transition latency. -> modprobe cpufreq_dynamic force_latency=1
+ *       - *** DONE *** 2.6 Work queues are more appropriate. Switch to work queues from kernel timers. http://www.linuxjournal.com/article.php?sid=6916 convinced me.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/cpufreq.h>
+#include <linux/init.h>
+#include <linux/times.h>
+#include <linux/workqueue.h>
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
+/* Definitions for transition latency */
+#define MAX_LATENCY_SEC 1/POLL_FREQUENCY
+#define MAX_LATENCY_NS  MAX_LATENCY_SEC * (10^9)
+
+/* How many ticks to wait before decreasing frequency. */
+#define DEC_TICKS 5
+
+/* Minimum and maximum idle thresholds, in percent */
+#define MIN_IDLE 20
+#define MAX_IDLE 80
+
+/* Internal definitions for temporary frequency table. Ug-ly. */
+#define FREQ_MAX -1	// unsigned int type -> 2's complement should mean this becomes max value
+#define FREQ_MIN 0
+
+/* How many frequency steps should we have */
+#define FREQ_STEPS 5
+
+/* FREQ_MULT is 1/4 with FREQ_STEPS = 5 -> max * 1/4 * step# = step_freq  */
+#define FREQ_MULT 1/(FREQ_STEPS - 1)
+
+/* Only schedule the thing once. */
+unsigned short cpufreq_gov_dynamic_work_queue_enabled = 0;
+
+/* If transition latency is too high, this module can be force-enabled anyway. */
+/* # modprobe cpufreq_dynamic force_latency=1  */
+static unsigned short force_latency = 0;
+MODULE_PARM(force_latency,"i");
+
+/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. */
+/* Managed semi-automatically in frequency steps. */
+unsigned int cpufreq_dynamic_freqs[NR_CPUS][FREQ_STEPS];
+
+/* Struct to hold CPU status information. */
+typedef struct cpufreq_dynamic_cpuinfo {
+	unsigned long prev_idle; // CPU idle time, in jiffies.
+	unsigned long percent_idle; // Idle percentage. 
+	unsigned short	cur_freq_id; // What ID from the stupid table we're at.
+	unsigned short dec_wait; // Holds ticks until CPU frequency is to be bumped down.
+	unsigned short enabled; // Don't do anything unless this governor is enabled on a specific CPU.
+} cpufreq_dynamic_cpuinfo;
+
+/* CPU Status information for all CPUs */
+cpufreq_dynamic_cpuinfo cpufreq_dynamic_status[NR_CPUS];
+
+/* Prototype for the work queue callback function. */
+void cpufreq_gov_dynamic_work(void *mt);
+
+/* Use work queues, rather than kernel timers. */
+DECLARE_WORK(cpufreq_dynamic,cpufreq_gov_dynamic_work,NULL);
+
+/**
+ * cpufreq_gov_dynamic_getidle
+ *
+ * Collects idle and idle percentage statistics about a given CPU.
+ *
+ * @param cur_cpu The cpu for which statistics are to be collected.
+ *
+ * Inline to save needless function call overhead...I think. If this is bad, please let me know.
+ */
+inline void cpufreq_gov_dynamic_getidle(unsigned int cur_cpu) {
+	//printk(KERN_DEBUG "cpufreq_dynamic: Calculating idle percentage for CPU%i\n",cur_cpu);
+	cpufreq_dynamic_status[cur_cpu].percent_idle = POLL_FREQUENCY * 100 * (kstat_cpu(cur_cpu).cpustat.idle - cpufreq_dynamic_status[cur_cpu].prev_idle) / HZ;
+	cpufreq_dynamic_status[cur_cpu].prev_idle = kstat_cpu(cur_cpu).cpustat.idle;
+}
+
+/**
+ * cpufreq_gov_dynamic_work
+ */
+void cpufreq_gov_dynamic_work(void *mt) {
+	unsigned int cur_cpu;
+	
+	for (cur_cpu = 0;cur_cpu < NR_CPUS;cur_cpu++) {
+		if (! cpufreq_dynamic_status[cur_cpu].enabled) {
+			cpufreq_gov_dynamic_getidle(cur_cpu);
+			//printk(KERN_DEBUG "cpufreq_dynamic: Timer callback for CPU%lu -> %lu%% idle.\n",cur_cpu,cpufreq_dynamic_status[cur_cpu].percent_idle);
+			if ((cpufreq_dynamic_status[cur_cpu].percent_idle > MAX_IDLE) || (cpufreq_dynamic_status[cur_cpu].percent_idle < MIN_IDLE)) {
+				cpufreq_governor(cur_cpu,CPUFREQ_GOV_LIMITS);
+			} else {
+				cpufreq_dynamic_status[cur_cpu].dec_wait = DEC_TICKS;
+			}
+		}
+	} 
+
+	schedule_delayed_work(&cpufreq_dynamic,SLEEP_JIFFIES);
+}
+
+/**
+ * cpufreq_gov_dynamic
+ *
+ * The governor itself.
+ * 
+ * This function:
+ *	1) initializes CPU statistics, frequency tables, and the work queue.
+ *	2) gets called by the work queue callback if the frequency needs to be changed, changes frequencies
+ *	3) deletes work queues once the governor is stopped.
+ */
+static int cpufreq_gov_dynamic(struct cpufreq_policy *policy,unsigned int event) {
+	unsigned int step;
+
+	switch (event) {
+	case CPUFREQ_GOV_START:
+		printk(KERN_INFO "cpufreq_dynamic: Starting dynamic governor on CPU%i\n",policy->cpu);
+
+		if (policy->cpuinfo.transition_latency > MAX_LATENCY_NS) {
+			printk(KERN_NOTICE "cpufreq_dynamic: Transition latency exceeds maximum allowable latency\n");
+			if (! force_latency) {
+				printk(KERN_NOTICE "cpufreq_dynamic: Reverting to 'performance' behavior.\n");
+				__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
+				return(0);
+			}
+		}
+		
+		// Init info for policy CPU.
+		cpufreq_dynamic_status[policy->cpu].cur_freq_id = 0; // Set initially to max speed.
+		cpufreq_dynamic_status[policy->cpu].prev_idle = kstat_cpu(policy->cpu).cpustat.idle; // Set previous idle.
+		cpufreq_gov_dynamic_getidle(policy->cpu); // Get initial idle time.
+
+		// Calculate frequency steps.
+		cpufreq_dynamic_freqs[policy->cpu][0] = FREQ_MAX;
+		cpufreq_dynamic_freqs[policy->cpu][FREQ_STEPS-1] = FREQ_MIN;
+		printk(KERN_DEBUG "cpufreq_dynamic: Frequency steps: %u,",policy->max);
+		for (step=1;step<(FREQ_STEPS-1);step++) {
+			cpufreq_dynamic_freqs[policy->cpu][step] = policy->max * FREQ_MULT;
+			cpufreq_dynamic_freqs[policy->cpu][step] *= FREQ_STEPS - step - 1;
+			printk("%u,",cpufreq_dynamic_freqs[policy->cpu][step]);
+		}
+		printk("%u\n",policy->min);
+	
+		// Enable the work queue timer.
+		if (! cpufreq_gov_dynamic_work_queue_enabled) { 
+			schedule_work(&cpufreq_dynamic);
+			cpufreq_gov_dynamic_work_queue_enabled = 1;
+		}
+
+		//printk(KERN_DEBUG "cpufreq_dynamic: dynamic governor started on CPU%i.\n",policy->cpu);
+	
+		// No need to change the frequency until we've collected SLEEP_JIFFIES worth of stats.
+		break;
+
+	case CPUFREQ_GOV_LIMITS:
+
+		// If the work queue hasn't been enabled, that would mean that the cpufreq driver hasn't passed the latency check, and the user hasn't forced the latency check to succeed, so we just revert to 'performance' behavior. This governor should be able to be used as a default governor.
+		if (! cpufreq_gov_dynamic_work_queue_enabled) {
+			__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
+			return(0);
+		}
+		
+		// If we're too idle, we want to decrease the CPU frequency.
+		if (cpufreq_dynamic_status[policy->cpu].percent_idle > MAX_IDLE) {
+			if (--cpufreq_dynamic_status[policy->cpu].dec_wait > 0) {
+				// Waiting a little before dropping frequency.
+				// Leaving room for something here, if need be.
+			// Don't do anything if we're already at minimum frequency.
+			} else if (cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id] != FREQ_MIN) {
+				cpufreq_dynamic_status[policy->cpu].dec_wait = DEC_TICKS;
+				// If we're to step down to FREQ_MIN, use the policy's value.
+				if (cpufreq_dynamic_freqs[policy->cpu][++cpufreq_dynamic_status[policy->cpu].cur_freq_id] == FREQ_MIN) {
+					//printk(KERN_INFO "cpufreq_dynamic: Setting CPU%i to minimum frequency: %u KHz\n",policy->cpu,policy->min);
+					__cpufreq_driver_target(policy,policy->min,CPUFREQ_RELATION_L);
+				} else {
+					//printk(KERN_INFO "cpufreq_dynamic: decreasing CPU%i frequency to %li KHz\n",policy->cpu,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id]);
+					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id],CPUFREQ_RELATION_L);
+				}
+			}
+		// If we're not idle enough, we want to increase the CPU frequency.
+		} else if (cpufreq_dynamic_status[policy->cpu].percent_idle < MIN_IDLE) {
+			cpufreq_dynamic_status[policy->cpu].dec_wait = DEC_TICKS;
+			// Don't do anything if we're already at the max frequency.
+			if (cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id] != FREQ_MAX) {
+				// If we're to step up to FREQ_MAX, use the policy's value.
+				if (cpufreq_dynamic_freqs[policy->cpu][--cpufreq_dynamic_status[policy->cpu].cur_freq_id] == FREQ_MAX) {
+					//printk(KERN_INFO "cpufreq_dynamic: Setting CPU%i to maximum frequency: %u KHz\n",policy->cpu,policy->max);
+					__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
+				} else {
+					//printk("cpufreq_dynamic: increasing CPU%i frequency to %li KHz\n",policy->cpu,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id]);
+					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id],CPUFREQ_RELATION_L);
+				}
+			}
+		}
+		break;
+	case CPUFREQ_GOV_STOP:
+		//printk(KERN_DEBUG "cpufreq_dynamic: Stopping dynamic governor.\n");
+		if (cpufreq_gov_dynamic_work_queue_enabled) {
+			cancel_delayed_work(&cpufreq_dynamic);
+			cpufreq_gov_dynamic_work_queue_enabled = 0;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+// CPUFreq governor struct
+struct cpufreq_governor cpufreq_governor_dynamic = {
+	.name		= "dynamic",
+	.governor	= cpufreq_gov_dynamic,
+	.owner		= THIS_MODULE,
+};
+EXPORT_SYMBOL(cpufreq_gov_dynamic);
+
+// Module init
+static int __init cpufreq_gov_dynamic_init(void)
+{
+	return cpufreq_register_governor(&cpufreq_governor_dynamic);
+}
+
+// Module exit
+static void __exit cpufreq_gov_dynamic_exit(void)
+{
+	cpufreq_unregister_governor(&cpufreq_governor_dynamic);
+}
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

--=-qn2/0CytrvABNB7PkWPn
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
 *       - *** DONE *** Handle more than CPU 0.
 *       - *** DONE *** Put in a better stepping mechanism. Room for improvement.
 *       - *** DONE ***  Make frequency tables for each CPU - I assume that it might be possible to have CPUs at different frequencies.
 *       - *** DONE *** Step downwards slower than stepping upwards. 
 *       - Documenting in Documentation/cpufreq. Not needed (driver not to be committed.)
 *       - *** DONE ***  Documentation that is NOT crappy in this file. Need more.
 *       - Proper debug printing. -> Need to figure out kernel conventions.
 *       - *** DONE *** Handle transition latency. -> modprobe cpufreq_dynamic force_latency=1
 *       - *** DONE *** 2.6 Work queues are more appropriate. Switch to work queues from kernel timers. http://www.linuxjournal.com/article.php?sid=6916 convinced me.
 *
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/cpufreq.h>
#include <linux/init.h>
#include <linux/times.h>
#include <linux/workqueue.h>
#include <asm/timex.h>

#include <linux/kernel_stat.h>

/* How many times/second to poll */
#define POLL_FREQUENCY 10

/* Wait HZ/POLL_FREQUENCY jiffies in between polling. */
#define SLEEP_JIFFIES HZ/POLL_FREQUENCY

/* Definitions for transition latency */
#define MAX_LATENCY_SEC 1/POLL_FREQUENCY
#define MAX_LATENCY_NS  MAX_LATENCY_SEC * (10^9)

/* How many ticks to wait before decreasing frequency. */
#define DEC_TICKS 5

/* Minimum and maximum idle thresholds, in percent */
#define MIN_IDLE 20
#define MAX_IDLE 80

/* Internal definitions for temporary frequency table. Ug-ly. */
#define FREQ_MAX -1	// unsigned int type -> 2's complement should mean this becomes max value
#define FREQ_MIN 0

/* How many frequency steps should we have */
#define FREQ_STEPS 5

/* FREQ_MULT is 1/4 with FREQ_STEPS = 5 -> max * 1/4 * step# = step_freq  */
#define FREQ_MULT 1/(FREQ_STEPS - 1)

/* Only schedule the thing once. */
unsigned short cpufreq_gov_dynamic_work_queue_enabled = 0;

/* If transition latency is too high, this module can be force-enabled anyway. */
/* # modprobe cpufreq_dynamic force_latency=1  */
static unsigned short force_latency = 0;
MODULE_PARM(force_latency,"i");

/** Should be a list, from FREQ_MAX to FREQ_MIN of CPU speeds in KHz. */
/* Managed semi-automatically in frequency steps. */
unsigned int cpufreq_dynamic_freqs[NR_CPUS][FREQ_STEPS];

/* Struct to hold CPU status information. */
typedef struct cpufreq_dynamic_cpuinfo {
	unsigned long prev_idle; // CPU idle time, in jiffies.
	unsigned long percent_idle; // Idle percentage. 
	unsigned short	cur_freq_id; // What ID from the stupid table we're at.
	unsigned short dec_wait; // Holds ticks until CPU frequency is to be bumped down.
	unsigned short enabled; // Don't do anything unless this governor is enabled on a specific CPU.
} cpufreq_dynamic_cpuinfo;

/* CPU Status information for all CPUs */
cpufreq_dynamic_cpuinfo cpufreq_dynamic_status[NR_CPUS];

/* Prototype for the work queue callback function. */
void cpufreq_gov_dynamic_work(void *mt);

/* Use work queues, rather than kernel timers. */
DECLARE_WORK(cpufreq_dynamic,cpufreq_gov_dynamic_work,NULL);

/**
 * cpufreq_gov_dynamic_getidle
 *
 * Collects idle and idle percentage statistics about a given CPU.
 *
 * @param cur_cpu The cpu for which statistics are to be collected.
 *
 * Inline to save needless function call overhead...I think. If this is bad, please let me know.
 */
inline void cpufreq_gov_dynamic_getidle(unsigned int cur_cpu) {
	//printk(KERN_DEBUG "cpufreq_dynamic: Calculating idle percentage for CPU%i\n",cur_cpu);
	cpufreq_dynamic_status[cur_cpu].percent_idle = POLL_FREQUENCY * 100 * (kstat_cpu(cur_cpu).cpustat.idle - cpufreq_dynamic_status[cur_cpu].prev_idle) / HZ;
	cpufreq_dynamic_status[cur_cpu].prev_idle = kstat_cpu(cur_cpu).cpustat.idle;
}

/**
 * cpufreq_gov_dynamic_work
 */
void cpufreq_gov_dynamic_work(void *mt) {
	unsigned int cur_cpu;
	
	for (cur_cpu = 0;cur_cpu < NR_CPUS;cur_cpu++) {
		if (! cpufreq_dynamic_status[cur_cpu].enabled) {
			cpufreq_gov_dynamic_getidle(cur_cpu);
			//printk(KERN_DEBUG "cpufreq_dynamic: Timer callback for CPU%lu -> %lu%% idle.\n",cur_cpu,cpufreq_dynamic_status[cur_cpu].percent_idle);
			if ((cpufreq_dynamic_status[cur_cpu].percent_idle > MAX_IDLE) || (cpufreq_dynamic_status[cur_cpu].percent_idle < MIN_IDLE)) {
				cpufreq_governor(cur_cpu,CPUFREQ_GOV_LIMITS);
			} else {
				cpufreq_dynamic_status[cur_cpu].dec_wait = DEC_TICKS;
			}
		}
	} 

	schedule_delayed_work(&cpufreq_dynamic,SLEEP_JIFFIES);
}

/**
 * cpufreq_gov_dynamic
 *
 * The governor itself.
 * 
 * This function:
 *	1) initializes CPU statistics, frequency tables, and the work queue.
 *	2) gets called by the work queue callback if the frequency needs to be changed, changes frequencies
 *	3) deletes work queues once the governor is stopped.
 */
static int cpufreq_gov_dynamic(struct cpufreq_policy *policy,unsigned int event) {
	unsigned int step;

	switch (event) {
	case CPUFREQ_GOV_START:
		printk(KERN_INFO "cpufreq_dynamic: Starting dynamic governor on CPU%i\n",policy->cpu);

		if (policy->cpuinfo.transition_latency > MAX_LATENCY_NS) {
			printk(KERN_NOTICE "cpufreq_dynamic: Transition latency exceeds maximum allowable latency\n");
			if (! force_latency) {
				printk(KERN_NOTICE "cpufreq_dynamic: Reverting to 'performance' behavior.\n");
				__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
				return(0);
			}
		}
		
		// Init info for policy CPU.
		cpufreq_dynamic_status[policy->cpu].cur_freq_id = 0; // Set initially to max speed.
		cpufreq_dynamic_status[policy->cpu].prev_idle = kstat_cpu(policy->cpu).cpustat.idle; // Set previous idle.
		cpufreq_gov_dynamic_getidle(policy->cpu); // Get initial idle time.

		// Calculate frequency steps.
		cpufreq_dynamic_freqs[policy->cpu][0] = FREQ_MAX;
		cpufreq_dynamic_freqs[policy->cpu][FREQ_STEPS-1] = FREQ_MIN;
		printk(KERN_DEBUG "cpufreq_dynamic: Frequency steps: %u,",policy->max);
		for (step=1;step<(FREQ_STEPS-1);step++) {
			cpufreq_dynamic_freqs[policy->cpu][step] = policy->max * FREQ_MULT;
			cpufreq_dynamic_freqs[policy->cpu][step] *= FREQ_STEPS - step - 1;
			printk("%u,",cpufreq_dynamic_freqs[policy->cpu][step]);
		}
		printk("%u\n",policy->min);
	
		// Enable the work queue timer.
		if (! cpufreq_gov_dynamic_work_queue_enabled) { 
			schedule_work(&cpufreq_dynamic);
			cpufreq_gov_dynamic_work_queue_enabled = 1;
		}

		//printk(KERN_DEBUG "cpufreq_dynamic: dynamic governor started on CPU%i.\n",policy->cpu);
	
		// No need to change the frequency until we've collected SLEEP_JIFFIES worth of stats.
		break;

	case CPUFREQ_GOV_LIMITS:

		// If the work queue hasn't been enabled, that would mean that the cpufreq driver hasn't passed the latency check, and the user hasn't forced the latency check to succeed, so we just revert to 'performance' behavior. This governor should be able to be used as a default governor.
		if (! cpufreq_gov_dynamic_work_queue_enabled) {
			__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
			return(0);
		}
		
		// If we're too idle, we want to decrease the CPU frequency.
		if (cpufreq_dynamic_status[policy->cpu].percent_idle > MAX_IDLE) {
			if (--cpufreq_dynamic_status[policy->cpu].dec_wait > 0) {
				// Waiting a little before dropping frequency.
				// Leaving room for something here, if need be.
			// Don't do anything if we're already at minimum frequency.
			} else if (cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id] != FREQ_MIN) {
				cpufreq_dynamic_status[policy->cpu].dec_wait = DEC_TICKS;
				// If we're to step down to FREQ_MIN, use the policy's value.
				if (cpufreq_dynamic_freqs[policy->cpu][++cpufreq_dynamic_status[policy->cpu].cur_freq_id] == FREQ_MIN) {
					//printk(KERN_INFO "cpufreq_dynamic: Setting CPU%i to minimum frequency: %u KHz\n",policy->cpu,policy->min);
					__cpufreq_driver_target(policy,policy->min,CPUFREQ_RELATION_L);
				} else {
					//printk(KERN_INFO "cpufreq_dynamic: decreasing CPU%i frequency to %li KHz\n",policy->cpu,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id]);
					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id],CPUFREQ_RELATION_L);
				}
			}
		// If we're not idle enough, we want to increase the CPU frequency.
		} else if (cpufreq_dynamic_status[policy->cpu].percent_idle < MIN_IDLE) {
			cpufreq_dynamic_status[policy->cpu].dec_wait = DEC_TICKS;
			// Don't do anything if we're already at the max frequency.
			if (cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id] != FREQ_MAX) {
				// If we're to step up to FREQ_MAX, use the policy's value.
				if (cpufreq_dynamic_freqs[policy->cpu][--cpufreq_dynamic_status[policy->cpu].cur_freq_id] == FREQ_MAX) {
					//printk(KERN_INFO "cpufreq_dynamic: Setting CPU%i to maximum frequency: %u KHz\n",policy->cpu,policy->max);
					__cpufreq_driver_target(policy,policy->max,CPUFREQ_RELATION_L);
				} else {
					//printk("cpufreq_dynamic: increasing CPU%i frequency to %li KHz\n",policy->cpu,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id]);
					__cpufreq_driver_target(policy,cpufreq_dynamic_freqs[policy->cpu][cpufreq_dynamic_status[policy->cpu].cur_freq_id],CPUFREQ_RELATION_L);
				}
			}
		}
		break;
	case CPUFREQ_GOV_STOP:
		//printk(KERN_DEBUG "cpufreq_dynamic: Stopping dynamic governor.\n");
		if (cpufreq_gov_dynamic_work_queue_enabled) {
			cancel_delayed_work(&cpufreq_dynamic);
			cpufreq_gov_dynamic_work_queue_enabled = 0;
		}
		break;
	default:
		break;
	}
	return 0;
}

// CPUFreq governor struct
struct cpufreq_governor cpufreq_governor_dynamic = {
	.name		= "dynamic",
	.governor	= cpufreq_gov_dynamic,
	.owner		= THIS_MODULE,
};
EXPORT_SYMBOL(cpufreq_gov_dynamic);

// Module init
static int __init cpufreq_gov_dynamic_init(void)
{
	return cpufreq_register_governor(&cpufreq_governor_dynamic);
}

// Module exit
static void __exit cpufreq_gov_dynamic_exit(void)
{
	cpufreq_unregister_governor(&cpufreq_governor_dynamic);
}

MODULE_AUTHOR("Jonathan Anderson <janderson@janderson.ca");
MODULE_DESCRIPTION("Dynamic CPUfreq policy governor");
MODULE_LICENSE("GPL");

module_init(cpufreq_gov_dynamic_init);
module_exit(cpufreq_gov_dynamic_exit);

--=-qn2/0CytrvABNB7PkWPn
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-qn2/0CytrvABNB7PkWPn--


