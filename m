From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.45,1.46
Date: Wed, 05 Nov 2003 18:27:48 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <E1AHSNg-0000Yq-77@flint.arm.linux.org.uk>
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
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv2114/linux/include/linux

Modified Files:
	cpufreq.h 
Log Message:
Merge with davej cpufreq bk tree.

Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.45
retrieving revision 1.46
diff -u -r1.45 -r1.46
--- cpufreq.h	3 Sep 2003 09:20:00 -0000	1.45
+++ cpufreq.h	5 Nov 2003 18:27:44 -0000	1.46
@@ -36,11 +36,13 @@
 #define CPUFREQ_POLICY_NOTIFIER		(1)
 
 
-/********************** cpufreq policy notifiers *********************/
+/* if (cpufreq_driver->target) exists, the ->governor decides what frequency
+ * within the limits is used. If (cpufreq_driver->setpolicy> exists, these
+ * two generic policies are available:
+ */
 
 #define CPUFREQ_POLICY_POWERSAVE	(1)
 #define CPUFREQ_POLICY_PERFORMANCE	(2)
-#define CPUFREQ_POLICY_GOVERNOR		(3)
 
 /* Frequency values here are CPU kHz so that hardware which doesn't run 
  * with some frequencies can complain without having to guess what per 
@@ -58,6 +60,13 @@
 	unsigned int		transition_latency; /* in 10^(-9) s */
 };
 
+struct cpufreq_real_policy {
+	unsigned int		min;    /* in kHz */
+	unsigned int		max;    /* in kHz */
+        unsigned int		policy; /* see above */
+	struct cpufreq_governor	*governor; /* see below */
+};
+
 struct cpufreq_policy {
 	unsigned int		cpu;    /* cpu nr */
 	struct cpufreq_cpuinfo	cpuinfo;/* see above */
@@ -72,6 +81,8 @@
  	struct semaphore	lock;   /* CPU ->setpolicy or ->target may
 					   only be called once a time */
 
+	struct cpufreq_real_policy	user_policy;
+
 	struct kobject		kobj;
 	struct completion	kobj_unregister;
 };
@@ -151,6 +162,7 @@
 int cpufreq_register_governor(struct cpufreq_governor *governor);
 void cpufreq_unregister_governor(struct cpufreq_governor *governor);
 
+
 /*********************************************************************
  *                      CPUFREQ DRIVER INTERFACE                     *
  *********************************************************************/
@@ -214,6 +226,7 @@
  *********************************************************************/
 int cpufreq_set_policy(struct cpufreq_policy *policy);
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
+int cpufreq_update_policy(unsigned int cpu);
 
 /* the proc_intf.c needs this */
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy, struct cpufreq_governor **governor);
@@ -222,7 +235,6 @@
 /*********************************************************************
  *                      CPUFREQ USERSPACE GOVERNOR                   *
  *********************************************************************/
-extern struct cpufreq_governor cpufreq_gov_userspace;
 int cpufreq_gov_userspace_init(void);
 
 int cpufreq_setmax(unsigned int cpu);
@@ -279,6 +291,19 @@
 
 #endif /* CONFIG_CPU_FREQ_GOV_USERSPACE */
 
+
+/*********************************************************************
+ *                       CPUFREQ DEFAULT GOVERNOR                    *
+ *********************************************************************/
+
+
+#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
+extern struct cpufreq_governor cpufreq_gov_performance;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_performance
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
+extern struct cpufreq_governor cpufreq_gov_userspace;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#endif
 
 /*********************************************************************
  *                     FREQUENCY TABLE HELPERS                       *
