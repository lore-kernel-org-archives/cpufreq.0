From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.43,1.44
Date: Tue, 19 Aug 2003 14:38:37 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6h3-0005jz-IB@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv22028/linux/include/linux

Modified Files:
	cpufreq.h 
Log Message:
sync with latest davej version

Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.43
retrieving revision 1.44
diff -u -r1.43 -r1.44
--- cpufreq.h	16 Jun 2003 21:04:52 -0000	1.43
+++ cpufreq.h	19 Aug 2003 13:38:33 -0000	1.44
@@ -20,6 +20,7 @@
 #include <linux/device.h>
 #include <linux/kobject.h>
 #include <linux/sysfs.h>
+#include <linux/completion.h>
 
 #define CPUFREQ_NAME_LEN 16
 
@@ -31,17 +32,15 @@
 int cpufreq_register_notifier(struct notifier_block *nb, unsigned int list);
 int cpufreq_unregister_notifier(struct notifier_block *nb, unsigned int list);
 
-#define CPUFREQ_TRANSITION_NOTIFIER     (0)
-#define CPUFREQ_POLICY_NOTIFIER         (1)
-
-#define CPUFREQ_ALL_CPUS        ((NR_CPUS))
+#define CPUFREQ_TRANSITION_NOTIFIER	(0)
+#define CPUFREQ_POLICY_NOTIFIER		(1)
 
 
 /********************** cpufreq policy notifiers *********************/
 
-#define CPUFREQ_POLICY_POWERSAVE        (1)
-#define CPUFREQ_POLICY_PERFORMANCE      (2)
-#define CPUFREQ_POLICY_GOVERNOR         (3)
+#define CPUFREQ_POLICY_POWERSAVE	(1)
+#define CPUFREQ_POLICY_PERFORMANCE	(2)
+#define CPUFREQ_POLICY_GOVERNOR		(3)
 
 /* Frequency values here are CPU kHz so that hardware which doesn't run 
  * with some frequencies can complain without having to guess what per 
@@ -52,30 +51,34 @@
 
 struct cpufreq_governor;
 
-#define CPUFREQ_ETERNAL (-1)
+#define CPUFREQ_ETERNAL			(-1)
 struct cpufreq_cpuinfo {
-	unsigned int            max_freq;
-	unsigned int            min_freq;
-	unsigned int            transition_latency;
+	unsigned int		max_freq;
+	unsigned int		min_freq;
+	unsigned int		transition_latency; /* in 10^(-9) s */
 };
 
 struct cpufreq_policy {
-	unsigned int            cpu;    /* cpu nr or CPUFREQ_ALL_CPUS */
-	unsigned int            min;    /* in kHz */
-	unsigned int            max;    /* in kHz */
-	unsigned int            cur;    /* in kHz, only needed if cpufreq
+	unsigned int		cpu;    /* cpu nr */
+	struct cpufreq_cpuinfo	cpuinfo;/* see above */
+
+	unsigned int		min;    /* in kHz */
+	unsigned int		max;    /* in kHz */
+	unsigned int		cur;    /* in kHz, only needed if cpufreq
 					 * governors are used */
-        unsigned int            policy; /* see above */
-	struct cpufreq_governor *governor; /* see below */
-	struct cpufreq_cpuinfo  cpuinfo;     /* see above */
-	struct kobject		kobj;
+        unsigned int		policy; /* see above */
+	struct cpufreq_governor	*governor; /* see below */
+
  	struct semaphore	lock;   /* CPU ->setpolicy or ->target may
 					   only be called once a time */
+
+	struct kobject		kobj;
+	struct completion	kobj_unregister;
 };
 
-#define CPUFREQ_ADJUST          (0)
-#define CPUFREQ_INCOMPATIBLE    (1)
-#define CPUFREQ_NOTIFY          (2)
+#define CPUFREQ_ADJUST		(0)
+#define CPUFREQ_INCOMPATIBLE	(1)
+#define CPUFREQ_NOTIFY		(2)
 
 
 /******************** cpufreq transition notifiers *******************/
@@ -84,7 +87,7 @@
 #define CPUFREQ_POSTCHANGE	(1)
 
 struct cpufreq_freqs {
-	unsigned int cpu;      /* cpu nr or CPUFREQ_ALL_CPUS */
+	unsigned int cpu;	/* cpu nr */
 	unsigned int old;
 	unsigned int new;
 };
@@ -125,18 +128,22 @@
 #define CPUFREQ_GOV_LIMITS 3
 
 struct cpufreq_governor {
-	char			name[CPUFREQ_NAME_LEN];
-	int	(*governor)	(struct cpufreq_policy *policy,
+	char	name[CPUFREQ_NAME_LEN];
+	int 	(*governor)	(struct cpufreq_policy *policy,
 				 unsigned int event);
 	struct list_head	governor_list;
-	struct module           *owner;
+	struct module		*owner;
 };
 
 /* pass a target to the cpufreq driver 
  */
-inline int cpufreq_driver_target(struct cpufreq_policy *policy,
+extern int cpufreq_driver_target(struct cpufreq_policy *policy,
 				 unsigned int target_freq,
 				 unsigned int relation);
+extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
+				   unsigned int target_freq,
+				   unsigned int relation);
+
 
 /* pass an event to the cpufreq governor */
 int cpufreq_governor(unsigned int cpu, unsigned int event);
@@ -154,18 +161,20 @@
 struct freq_attr;
 
 struct cpufreq_driver {
+	struct module           *owner;
+	char			name[CPUFREQ_NAME_LEN];
+
 	/* needed by all drivers */
+	int	(*init)		(struct cpufreq_policy *policy);
 	int	(*verify)	(struct cpufreq_policy *policy);
-	struct cpufreq_policy	*policy;
-	char			name[CPUFREQ_NAME_LEN];
+
 	/* define one out of two */
 	int	(*setpolicy)	(struct cpufreq_policy *policy);
 	int	(*target)	(struct cpufreq_policy *policy,
 				 unsigned int target_freq,
 				 unsigned int relation);
-	struct module           *owner;
-	/* optional, for the moment */
-	int	(*init)		(struct cpufreq_policy *policy);
+
+	/* optional */
 	int	(*exit)		(struct cpufreq_policy *policy);
 	struct freq_attr	**attr;
 };
@@ -306,8 +315,4 @@
 
 
 #endif /* CONFIG_CPU_FREQ_TABLE */
-
-/* Currently exported only for the proc interface, remove when that goes */
-extern struct cpufreq_driver *cpufreq_driver;
-
 #endif /* _LINUX_CPUFREQ_H */
