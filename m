From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.47,1.48
Date: Thu, 26 Aug 2004 17:40:23 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C0NIV-0000MJ-4c@flint.arm.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv1364/linux/include/linux

Modified Files:
	cpufreq.h 
Log Message:
merge with current cpufreq bk tree and 2.6.9-r1

Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.47
retrieving revision 1.48
diff -u -r1.47 -r1.48
--- cpufreq.h	20 Jan 2004 17:03:32 -0000	1.47
+++ cpufreq.h	26 Aug 2004 16:40:19 -0000	1.48
@@ -21,6 +21,7 @@
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
 #include <linux/completion.h>
+#include <linux/workqueue.h>
 
 #define CPUFREQ_NAME_LEN 16
 
@@ -81,6 +82,9 @@
  	struct semaphore	lock;   /* CPU ->setpolicy or ->target may
 					   only be called once a time */
 
+	struct work_struct	update; /* if update_policy() needs to be
+					 * called, but you're in IRQ context */
+
 	struct cpufreq_real_policy	user_policy;
 
 	struct kobject		kobj;
@@ -96,11 +100,13 @@
 
 #define CPUFREQ_PRECHANGE	(0)
 #define CPUFREQ_POSTCHANGE	(1)
+#define CPUFREQ_RESUMECHANGE	(8)
 
 struct cpufreq_freqs {
 	unsigned int cpu;	/* cpu nr */
 	unsigned int old;
 	unsigned int new;
+	u8 flags;		/* flags of cpufreq_driver, see below. */
 };
 
 
@@ -110,24 +116,24 @@
  * @div:   divisor
  * @mult:  multiplier
  *
- * Needed for loops_per_jiffy and similar calculations.  We do it 
- * this way to avoid math overflow on 32-bit machines.  This will
- * become architecture dependent once high-resolution-timer is
- * merged (or any other thing that introduces sc_math.h).
  *
  *    new = old * mult / div
  */
 static inline unsigned long cpufreq_scale(unsigned long old, u_int div, u_int mult)
 {
-	unsigned long val, carry;
+#if BITS_PER_LONG == 32
+
+	u64 result = ((u64) old) * ((u64) mult);
+	do_div(result, div);
+	return (unsigned long) result;
+
+#elif BITS_PER_LONG == 64
 
-	mult /= 100;
-	div  /= 100;
-        val   = (old / div) * mult;
-        carry = old % div;
-	carry = carry * mult / div;
+	unsigned long result = old * ((u64) mult);
+	result /= div;
+	return result;
 
-	return carry + val;
+#endif
 };
 
 /*********************************************************************
@@ -175,6 +181,7 @@
 struct cpufreq_driver {
 	struct module           *owner;
 	char			name[CPUFREQ_NAME_LEN];
+	u8			flags;
 
 	/* needed by all drivers */
 	int	(*init)		(struct cpufreq_policy *policy);
@@ -186,12 +193,31 @@
 				 unsigned int target_freq,
 				 unsigned int relation);
 
+	/* should be defined, if possible */
+	unsigned int	(*get)	(unsigned int cpu);
+
 	/* optional */
 	int	(*exit)		(struct cpufreq_policy *policy);
 	int	(*resume)	(struct cpufreq_policy *policy);
 	struct freq_attr	**attr;
 };
 
+/* flags */
+
+#define CPUFREQ_STICKY		0x01	/* the driver isn't removed even if 
+					 * all ->init() calls failed */
+#define CPUFREQ_CONST_LOOPS 	0x02	/* loops_per_jiffy or other kernel
+					 * "constants" aren't affected by
+					 * frequency transitions */
+#define CPUFREQ_PANIC_OUTOFSYNC	0x04	/* panic if cpufreq's opinion of
+					 * current frequency differs from
+					 * actual frequency */
+#define CPUFREQ_PANIC_RESUME_OUTOFSYNC 0x08 /* panic if cpufreq's opinion of
+					 * current frequency differs from
+					 * actual frequency on resume
+					 * from sleep. */
+
+
 int cpufreq_register_driver(struct cpufreq_driver *driver_data);
 int cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
 
@@ -228,6 +254,9 @@
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
 int cpufreq_update_policy(unsigned int cpu);
 
+/* query the current CPU frequency (in kHz). If zero, cpufreq couldn't detect it */
+unsigned int cpufreq_get(unsigned int cpu);
+
 /* the proc_intf.c needs this */
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy, struct cpufreq_governor **governor);
 
@@ -235,13 +264,10 @@
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
