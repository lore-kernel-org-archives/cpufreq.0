From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCHES] cpufreq: introduce cpufreq_update_policy, Kconfig cleanup
Date: Fri, 5 Sep 2003 00:05:06 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904220506.GA6350@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: davej@suse.de, cpufreq@www.linux.org.uk


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Kconfig-speedstep
	Clarify Kconfig text for speedstep-ich

	arch/i386/kernel/cpu/cpufreq/Kconfig |    6 +++---
	1 files changed, 3 insertions(+), 3 deletions(-)


update_policy
	Add a new cpufreq_update_policy call:

	Certain cpufreq policy notifers have different needs at different times.
	Thus it needs to be possible to re-evaluate an already set cpufreq policy.
 
	 drivers/cpufreq/cpufreq.c |	84 ++++++++++++++++++++++++++++++++++++----------
	 include/linux/cpufreq.h   |	10 +++++
	 2 files changed, 76 insertions(+), 18 deletions(-)
 


Dominik

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-test4-update_policy"

Add a new cpufreq_update_policy call:

Certain cpufreq policy notifers have different needs at different times.
Thus it needs to be possible to re-evaluate an already set cpufreq policy.

 drivers/cpufreq/cpufreq.c |   84 ++++++++++++++++++++++++++++++++++++---------- include/linux/cpufreq.h   |   10 +++++
 2 files changed, 76 insertions(+), 18 deletions(-)


diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2003-09-04 20:52:48.638783544 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2003-09-04 20:53:21.381805848 +0200
@@ -741,26 +741,9 @@
 EXPORT_SYMBOL(cpufreq_get_policy);
 
 
-/**
- *	cpufreq_set_policy - set a new CPUFreq policy
- *	@policy: policy to be set.
- *
- *	Sets a new CPU frequency and voltage scaling policy.
- */
-int cpufreq_set_policy(struct cpufreq_policy *policy)
+static int __cpufreq_set_policy(struct cpufreq_policy *data, struct cpufreq_policy *policy)
 {
 	int ret = 0;
-	struct cpufreq_policy *data;
-
-	if (!policy)
-		return -EINVAL;
-
-	data = cpufreq_cpu_get(policy->cpu);
-	if (!data)
-		return -EINVAL;
-
-	/* lock this CPU */
-	down(&data->lock);
 
 	memcpy(&policy->cpuinfo, 
 	       &data->cpuinfo, 
@@ -827,6 +810,36 @@
 	}
 
  error_out:
+	return ret;
+}
+
+/**
+ *	cpufreq_set_policy - set a new CPUFreq policy
+ *	@policy: policy to be set.
+ *
+ *	Sets a new CPU frequency and voltage scaling policy.
+ */
+int cpufreq_set_policy(struct cpufreq_policy *policy)
+{
+	int ret = 0;
+	struct cpufreq_policy *data;
+
+	if (!policy)
+		return -EINVAL;
+
+	data = cpufreq_cpu_get(policy->cpu);
+	if (!data)
+		return -EINVAL;
+
+	/* lock this CPU */
+	down(&data->lock);
+
+	ret = __cpufreq_set_policy(data, policy);
+	data->user_policy.min = data->min;
+	data->user_policy.max = data->max;
+	data->user_policy.policy = data->policy;
+	data->user_policy.governor = data->governor;
+
 	up(&data->lock);
 	cpufreq_cpu_put(data);
 
@@ -835,6 +848,41 @@
 EXPORT_SYMBOL(cpufreq_set_policy);
 
 
+/**
+ *	cpufreq_update_policy - re-evaluate an existing cpufreq policy
+ *	@cpu: CPU which shall be re-evaluated
+ *
+ *	Usefull for policy notifiers which have different necessities
+ *	at different times.
+ */
+int cpufreq_update_policy(unsigned int cpu)
+{
+	struct cpufreq_policy *data = cpufreq_cpu_get(cpu);
+	struct cpufreq_policy policy;
+	int ret = 0;
+
+	if (!data)
+		return -ENODEV;
+
+	down(&data->lock);
+
+	memcpy(&policy, 
+	       &data, 
+	       sizeof(struct cpufreq_policy));
+	policy.min = data->user_policy.min;
+	policy.max = data->user_policy.max;
+	policy.policy = data->user_policy.policy;
+	policy.governor = data->user_policy.governor;
+
+	ret = __cpufreq_set_policy(data, &policy);
+
+	up(&data->lock);
+
+	cpufreq_cpu_put(data);
+	return ret;
+}
+EXPORT_SYMBOL(cpufreq_update_policy);
+
 
 /*********************************************************************
  *            EXTERNALLY AFFECTING FREQUENCY CHANGES                 *
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-09-04 20:52:48.655780960 +0200
+++ linux/include/linux/cpufreq.h	2003-09-04 20:54:05.922034704 +0200
@@ -60,6 +60,13 @@
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
@@ -74,6 +81,8 @@
  	struct semaphore	lock;   /* CPU ->setpolicy or ->target may
 					   only be called once a time */
 
+	struct cpufreq_real_policy	user_policy;
+
 	struct kobject		kobj;
 	struct completion	kobj_unregister;
 };
@@ -217,6 +226,7 @@
  *********************************************************************/
 int cpufreq_set_policy(struct cpufreq_policy *policy);
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
+int cpufreq_update_policy(unsigned int cpu);
 
 /* the proc_intf.c needs this */
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy, struct cpufreq_governor **governor);

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="cpufreq-2.6.0-test4-Kconfig-speedstep"

Clarify Kconfig text for speedstep-ich

 arch/i386/kernel/cpu/cpufreq/Kconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-09-04 20:47:17.844071984 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2003-09-04 20:57:05.098795696 +0200
@@ -100,13 +100,13 @@
 	 If in doubt, say N.
 
 config X86_SPEEDSTEP_ICH
-	tristate "Intel Speedstep"
+	tristate "Intel Speedstep on ICH-M chipsets (ioport interface)"
 	depends on CPU_FREQ_TABLE
 	help
 	  This adds the CPUFreq driver for certain mobile Intel Pentium III
 	  (Coppermine), all mobile Intel Pentium III-M (Tualatin) and all
-	  mobile Intel Pentium 4 P4-Ms, with an Intel ICH2, ICH3,
-	  or ICH4 southbridge.
+	  mobile Intel Pentium 4 P4-M on systems which have an Intel ICH2, 
+	  ICH3 or ICH4 southbridge.
 
 	  For details, take a look at linux/Documentation/cpu-freq. 
 

--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--rwEMma7ioTxnRzrJ--

