From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCHES 2.5] cpufreq: more cleanups
Date: Tue, 8 Jul 2003 23:49:03 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030708214903.GA999@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: davej@suse.de
Cc: cpufreq@www.linux.org.uk


--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

these patches require:
cpufreq-2.4.74-bk6-{cleanup,doc_update,kobj_release,move_restore}

cpufreq-2.4.74-bk6-rmmod -	don't care about rmmod -f

cpufreq-2.4.74-bk6-include -	(mostly) whitespace cleanup

	Dominik

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.4.74-bk6-include"

- CPUFREQ_ALL_CPUS is not a valid argument any more, don't mention it
  in include/linux/cpufreq.h
- without a driver->init() function a cpufreq driver isn't even
  loaded, so remove that check in the per-CPU initialization
- whitespace and clarification changes to linux/cpufreq.h

 drivers/cpufreq/proc_intf.c |    2 +
 include/linux/cpufreq.h     |   67 +++++++++++++++++++++++---------------------
 kernel/cpufreq.c            |    8 +----
 3 files changed, 41 insertions(+), 36 deletions(-)

diff -ruN linux-original/drivers/cpufreq/proc_intf.c linux/drivers/cpufreq/proc_intf.c
--- linux-original/drivers/cpufreq/proc_intf.c	2003-07-08 19:40:47.000000000 +0200
+++ linux/drivers/cpufreq/proc_intf.c	2003-07-08 22:20:12.000000000 +0200
@@ -13,6 +13,8 @@
 #include <asm/uaccess.h>
 
 
+#define CPUFREQ_ALL_CPUS		((NR_CPUS))
+
 /**
  * cpufreq_parse_policy - parse a policy string
  * @input_string: the string to parse.
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-07-08 21:37:15.000000000 +0200
+++ linux/include/linux/cpufreq.h	2003-07-08 22:24:26.000000000 +0200
@@ -32,17 +32,15 @@
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
@@ -53,31 +51,34 @@
 
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
 	struct completion	kobj_unregister;
 };
 
-#define CPUFREQ_ADJUST          (0)
-#define CPUFREQ_INCOMPATIBLE    (1)
-#define CPUFREQ_NOTIFY          (2)
+#define CPUFREQ_ADJUST		(0)
+#define CPUFREQ_INCOMPATIBLE	(1)
+#define CPUFREQ_NOTIFY		(2)
 
 
 /******************** cpufreq transition notifiers *******************/
@@ -86,7 +87,7 @@
 #define CPUFREQ_POSTCHANGE	(1)
 
 struct cpufreq_freqs {
-	unsigned int cpu;      /* cpu nr or CPUFREQ_ALL_CPUS */
+	unsigned int cpu;	/* cpu nr */
 	unsigned int old;
 	unsigned int new;
 };
@@ -127,11 +128,11 @@
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
@@ -156,18 +157,22 @@
 struct freq_attr;
 
 struct cpufreq_driver {
+	struct module           *owner;
+	char			name[CPUFREQ_NAME_LEN];
+
+	struct cpufreq_policy	*policy;
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
diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-08 22:13:50.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-08 22:24:01.000000000 +0200
@@ -337,11 +337,9 @@
 	 */
 	policy = &cpufreq_driver->policy[cpu];
 	policy->cpu = cpu;
-	if (cpufreq_driver->init) {
-		ret = cpufreq_driver->init(policy);
-		if (ret)
-			goto out;
-	}
+	ret = cpufreq_driver->init(policy);
+	if (ret)
+		goto out;
 
 	/* set default policy on this CPU */
 	down(&cpufreq_driver_sem);

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.4.74-bk6-rmmod"

- don't care about "rmmod -f". It's expected to break things.
- whitespace cleanup

 kernel/cpufreq.c |   25 +------------------------
 1 files changed, 1 insertion(+), 24 deletions(-)

diff -ruN linux-original/kernel/cpufreq.c linux/kernel/cpufreq.c
--- linux-original/kernel/cpufreq.c	2003-07-08 22:09:48.000000000 +0200
+++ linux/kernel/cpufreq.c	2003-07-08 22:09:37.000000000 +0200
@@ -627,33 +627,10 @@
 
 void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 {
-	unsigned int i;
-	
 	if (!governor)
 		return;
 
 	down(&cpufreq_governor_sem);
-
-	/* 
-	 * Unless the user uses rmmod -f, we can be safe. But we never
-	 * know, so check whether if it's currently used. If so,
-	 * stop it and replace it with the default governor.
-	 */
-	for (i=0; i<NR_CPUS; i++)
-	{
-		if (!cpufreq_cpu_get(i))
-			continue;
-		if ((cpufreq_driver->policy[i].policy == CPUFREQ_POLICY_GOVERNOR) && 
-		    (cpufreq_driver->policy[i].governor == governor)) {
-			cpufreq_governor(i, CPUFREQ_GOV_STOP);
-			cpufreq_driver->policy[i].policy = CPUFREQ_POLICY_PERFORMANCE;
-			cpufreq_governor(i, CPUFREQ_GOV_START);
-			cpufreq_governor(i, CPUFREQ_GOV_LIMITS);
-		}
-		cpufreq_cpu_put(i);
-	}
-
-	/* now we can safely remove it from the list */
 	list_del(&governor->governor_list);
 	up(&cpufreq_governor_sem);
 	return;
@@ -821,7 +798,7 @@
 	switch (state) {
 	case CPUFREQ_PRECHANGE:
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_PRECHANGE, freqs);
-		adjust_jiffies(CPUFREQ_PRECHANGE, freqs);		
+		adjust_jiffies(CPUFREQ_PRECHANGE, freqs);
 		break;
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);

--FL5UXtIhxfXey3p5--
