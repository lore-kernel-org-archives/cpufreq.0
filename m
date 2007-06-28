From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] Allow ondemand and conservative cpufreq governors to be
	used as default
Date: Thu, 28 Jun 2007 15:43:43 +0200
Message-ID: <1183038223.4249.182.camel@queen.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Cc: cpufreq <cpufreq@www.linux.org.uk>

Hi Venkatesh,

do you give me your ack/signed off for this one?

Runtime tested to load ondemand and to fallback to performance
governor (by faking the transition latency of the driver) on x86_64.

Thanks,

   Thomas

Allow ondemand and conservative cpufreq governors to be used as default

Depending on the transition latency of the HW on cpufreq switches, the
ondemand or conservative governor cannot be used with certain cpufreq drivers.
Still the ondemand should be the default governor on a wide range of systems.
This patch allows this and lets the governor fallback to the performance
governor at cpufreq driver load time, if the driver does not support fast
enough frequency switching.

Main benefit is that on e.g. installation or other systems without userspace
support a working dynamic cpufreq support can be achieved on most systems by
simply loading the cpufreq driver. This is especially essential for recent
x86(_64) laptop hardware which may rely on working dynamic cpufreq OS support.

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 arch/arm/mach-imx/cpufreq.c                       |    1 
 arch/arm/mach-sa1100/cpu-sa1110.c                 |    1 
 arch/arm/plat-omap/cpu-omap.c                     |    1 
 arch/blackfin/mach-bf533/cpu.c                    |    2 -
 arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c       |    1 
 arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c    |    1 
 arch/i386/kernel/cpu/cpufreq/e_powersaver.c       |    1 
 arch/i386/kernel/cpu/cpufreq/elanfreq.c           |    1 
 arch/i386/kernel/cpu/cpufreq/gx-suspmod.c         |    1 
 arch/i386/kernel/cpu/cpufreq/longhaul.c           |    1 
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c        |    1 
 arch/i386/kernel/cpu/cpufreq/powernow-k6.c        |    1 
 arch/i386/kernel/cpu/cpufreq/powernow-k7.c        |    2 -
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c        |    1 
 arch/i386/kernel/cpu/cpufreq/sc520_freq.c         |    1 
 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |    1 
 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c      |    1 
 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c      |    1 
 arch/ia64/kernel/cpufreq/acpi-cpufreq.c           |    2 -
 arch/powerpc/platforms/cell/cbe_cpufreq.c         |    1 
 arch/powerpc/platforms/pasemi/cpufreq.c           |    2 -
 arch/powerpc/platforms/powermac/cpufreq_32.c      |    1 
 arch/powerpc/platforms/powermac/cpufreq_64.c      |    1 
 arch/sh/kernel/cpufreq.c                          |    1 
 arch/sparc64/kernel/us2e_cpufreq.c                |    1 
 drivers/cpufreq/Kconfig                           |   23 ++++++++++++++++++----
 drivers/cpufreq/cpufreq.c                         |   13 ++++++++++++
 drivers/cpufreq/cpufreq_conservative.c            |   12 ++++-------
 drivers/cpufreq/cpufreq_ondemand.c                |   22 ++++++++-------------
 include/linux/cpufreq.h                           |   16 ++++++++++++++-
 30 files changed, 61 insertions(+), 54 deletions(-)

Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
@@ -1205,7 +1205,6 @@ static int __cpuinit powernowk8_cpu_init
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
 
-	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	if (cpu_family == CPU_HW_PSTATE)
 		pol->cpus = cpumask_of_cpu(pol->cpu);
 	else
Index: linux-2.6.22-rc6/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.22-rc6.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.22-rc6/drivers/cpufreq/cpufreq_ondemand.c
@@ -47,7 +47,7 @@ static unsigned int def_sampling_rate;
 			(def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
 #define MAX_SAMPLING_RATE			(500 * def_sampling_rate)
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
-#define TRANSITION_LATENCY_LIMIT		(10 * 1000)
+#define TRANSITION_LATENCY_LIMIT		(10 * 1000 * 1000)
 
 static void do_dbs_timer(struct work_struct *work);
 
@@ -496,12 +496,6 @@ static int cpufreq_governor_dbs(struct c
 		if ((!cpu_online(cpu)) || (!policy->cur))
 			return -EINVAL;
 
-		if (policy->cpuinfo.transition_latency >
-				(TRANSITION_LATENCY_LIMIT * 1000)) {
-			printk(KERN_WARNING "ondemand governor failed to load "
-			       "due to too long transition latency\n");
-			return -EINVAL;
-		}
 		if (this_dbs_info->enable) /* Already enabled */
 			break;
 
@@ -573,11 +567,13 @@ static int cpufreq_governor_dbs(struct c
 	return 0;
 }
 
-static struct cpufreq_governor cpufreq_gov_dbs = {
-	.name = "ondemand",
-	.governor = cpufreq_governor_dbs,
-	.owner = THIS_MODULE,
+struct cpufreq_governor cpufreq_gov_ondemand = {
+	.name			= "ondemand",
+	.governor		= cpufreq_governor_dbs,
+	.max_transition_latency = TRANSITION_LATENCY_LIMIT,
+	.owner			= THIS_MODULE,
 };
+EXPORT_SYMBOL(cpufreq_gov_ondemand);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
@@ -586,12 +582,12 @@ static int __init cpufreq_gov_dbs_init(v
 		printk(KERN_ERR "Creation of kondemand failed\n");
 		return -EFAULT;
 	}
-	return cpufreq_register_governor(&cpufreq_gov_dbs);
+	return cpufreq_register_governor(&cpufreq_gov_ondemand);
 }
 
 static void __exit cpufreq_gov_dbs_exit(void)
 {
-	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+	cpufreq_unregister_governor(&cpufreq_gov_ondemand);
 	destroy_workqueue(kondemand_wq);
 }
 
Index: linux-2.6.22-rc6/include/linux/cpufreq.h
===================================================================
--- linux-2.6.22-rc6.orig/include/linux/cpufreq.h
+++ linux-2.6.22-rc6/include/linux/cpufreq.h
@@ -163,6 +163,9 @@ struct cpufreq_governor {
 	char	name[CPUFREQ_NAME_LEN];
 	int 	(*governor)	(struct cpufreq_policy *policy,
 				 unsigned int event);
+	unsigned int max_transition_latency; /* HW must be able to switch to
+			next freq faster than this value in nano secs or we
+			will fallback to performance governor */
 	struct list_head	governor_list;
 	struct module		*owner;
 };
@@ -292,12 +295,23 @@ static inline unsigned int cpufreq_get(u
  *********************************************************************/
 
 
-#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
+/*
+  Performance governor is fallback governor if any other gov failed to
+  auto load due latency restrictions
+*/
 extern struct cpufreq_governor cpufreq_gov_performance;
+#define CPUFREQ_PERFORMANCE_GOVERNOR	&cpufreq_gov_performance;
+#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_performance
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND)
+extern struct cpufreq_governor cpufreq_gov_ondemand;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_ondemand;
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE)
+extern struct cpufreq_governor cpufreq_gov_conservative;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_conservative;
 #endif
 
 
Index: linux-2.6.22-rc6/drivers/cpufreq/Kconfig
===================================================================
--- linux-2.6.22-rc6.orig/drivers/cpufreq/Kconfig
+++ linux-2.6.22-rc6/drivers/cpufreq/Kconfig
@@ -56,10 +56,6 @@ config CPU_FREQ_STAT_DETAILS
 
 	  If in doubt, say N.
 
-# Note that it is not currently possible to set the other governors (such as ondemand)
-# as the default, since if they fail to initialise, cpufreq will be
-# left in an undefined state.
-
 choice
 	prompt "Default CPUFreq governor"
 	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
@@ -85,6 +81,25 @@ config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	  program shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.
 
+config CPU_FREQ_DEFAULT_GOV_ONDEMAND
+	bool "ondemand"
+	select CPU_FREQ_GOV_ONDEMAND
+	select CPU_FREQ_GOV_PERFORMANCE
+	help
+	  Use the CPUFreq governor 'ondemand' as default. This allows
+	  you to get a full dynamic frequncy capable system by simply
+	  loading your cpufreq driver.
+	  Be aware that not all cpufreq drivers support the ondemand
+	  governor. If unsure have a look at the help section of the
+	  driver. Fallback governor will then be the performance
+	  governor.
+
+config CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
+	bool "conservative"
+	select CPU_FREQ_GOV_CONSERVATIVE
+	select CPU_FREQ_GOV_PERFORMANCE
+	help
+	  See ondemand as default governor help above.
 endchoice
 
 config CPU_FREQ_GOV_PERFORMANCE
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
@@ -290,7 +290,6 @@ static int speedstep_cpu_init(struct cpu
 		(speed / 1000));
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
Index: linux-2.6.22-rc6/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.22-rc6/drivers/cpufreq/cpufreq.c
@@ -759,6 +759,8 @@ static int cpufreq_add_dev (struct sys_d
 	init_completion(&policy->kobj_unregister);
 	INIT_WORK(&policy->update, handle_update);
 
+	/* Set governor before ->init, so that driver could check it */
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	/* call driver. From then on the cpufreq must be able
 	 * to accept all calls to ->verify and ->setpolicy for this CPU
 	 */
@@ -1454,6 +1456,17 @@ static int __cpufreq_governor(struct cpu
 {
 	int ret;
 
+	if (policy->governor->max_transition_latency &&
+	    policy->cpuinfo.transition_latency >
+	    policy->governor->max_transition_latency) {
+		printk(KERN_WARNING "%s governor failed, too long"
+		       " transition latency of HW, fallback"
+		       " to %s governor\n",
+		       policy->governor->name,
+		       CPUFREQ_PERFORMANCE_GOVERNOR->name);
+		policy->governor = CPUFREQ_PERFORMANCE_GOVERNOR;
+	}
+
 	if (!try_module_get(policy->governor->owner))
 		return -EINVAL;
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -663,7 +663,6 @@ static int acpi_cpufreq_cpu_init(struct 
 			policy->cpuinfo.transition_latency =
 			    perf->states[i].transition_latency * 1000;
 	}
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	data->max_freq = perf->states[0].core_frequency * 1000;
 	/* table init */
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
@@ -363,7 +363,6 @@ static int nforce2_cpu_init(struct cpufr
 	policy->cur = nforce2_get(policy->cpu);
 	policy->min = policy->cpuinfo.min_freq;
 	policy->max = policy->cpuinfo.max_freq;
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	return 0;
 }
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/e_powersaver.c
@@ -253,7 +253,6 @@ static int eps_cpu_init(struct cpufreq_p
 		f_table[k].frequency = CPUFREQ_TABLE_END;
 	}
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 140000; /* 844mV -> 700mV in ns */
 	policy->cur = fsb * current_multiplier;
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/elanfreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/elanfreq.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/elanfreq.c
@@ -219,7 +219,6 @@ static int elanfreq_cpu_init(struct cpuf
 	}
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = elanfreq_get_cpu_frequency(0);
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/gx-suspmod.c
@@ -421,7 +421,6 @@ static int cpufreq_gx_cpu_init(struct cp
 		policy->min = maxfreq / POLICY_MIN_DIV;
 	policy->max = maxfreq;
 	policy->cur = curfreq;
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = maxfreq / max_duration;
 	policy->cpuinfo.max_freq = maxfreq;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/longhaul.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -802,7 +802,6 @@ print_support_type:
 	if ((longhaul_version != TYPE_LONGHAUL_V1) && (scale_voltage != 0))
 		longhaul_setup_voltagescaling();
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 200000;	/* nsec */
 	policy->cur = calc_speed(longhaul_get_cpu_mult());
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
@@ -229,7 +229,6 @@ static int cpufreq_p4_cpu_init(struct cp
 	cpufreq_frequency_table_get_attr(p4clockmod_table, policy->cpu);
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 1000000; /* assumed */
 	policy->cur = stock_freq;
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k6.c
@@ -160,7 +160,6 @@ static int powernow_k6_cpu_init(struct c
 	}
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = busfreq * max_multiplier;
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
@@ -637,8 +637,6 @@ static int __init powernow_cpu_init (str
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
 				minimum_speed/1000, maximum_speed/1000);
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cpuinfo.transition_latency = cpufreq_scale(2000000UL, fsb, latency);
 
 	policy->cur = powernow_get(0);
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
@@ -111,7 +111,6 @@ static int sc520_freq_cpu_init(struct cp
 		return -ENODEV;
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 1000000; /* 1ms */
 	policy->cur = sc520_freq_get_cpu_frequency(0);
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
@@ -610,7 +610,6 @@ static int centrino_cpu_init(struct cpuf
 
 	freq = get_cur_freq(policy->cpu);
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 10000; /* 10uS transition latency */
 	policy->cur = freq;
 
Index: linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ linux-2.6.22-rc6/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -350,7 +350,6 @@ static int speedstep_cpu_init(struct cpu
 		(speed / 1000));
 
 	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cur = speed;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
Index: linux-2.6.22-rc6/drivers/cpufreq/cpufreq_conservative.c
===================================================================
--- linux-2.6.22-rc6.orig/drivers/cpufreq/cpufreq_conservative.c
+++ linux-2.6.22-rc6/drivers/cpufreq/cpufreq_conservative.c
@@ -58,7 +58,7 @@ static unsigned int 				def_sampling_rat
 #define DEF_SAMPLING_RATE_LATENCY_MULTIPLIER	(1000)
 #define DEF_SAMPLING_DOWN_FACTOR		(1)
 #define MAX_SAMPLING_DOWN_FACTOR		(10)
-#define TRANSITION_LATENCY_LIMIT		(10 * 1000)
+#define TRANSITION_LATENCY_LIMIT		(10 * 1000 * 1000)
 
 static void do_dbs_timer(struct work_struct *work);
 
@@ -466,9 +466,6 @@ static int cpufreq_governor_dbs(struct c
 		    (!policy->cur))
 			return -EINVAL;
 
-		if (policy->cpuinfo.transition_latency >
-				(TRANSITION_LATENCY_LIMIT * 1000))
-			return -EINVAL;
 		if (this_dbs_info->enable) /* Already enabled */
 			break;
 		 
@@ -552,9 +549,10 @@ static int cpufreq_governor_dbs(struct c
 }
 
 static struct cpufreq_governor cpufreq_gov_dbs = {
-	.name		= "conservative",
-	.governor	= cpufreq_governor_dbs,
-	.owner		= THIS_MODULE,
+	.name			= "conservative",
+	.governor		= cpufreq_governor_dbs,
+	.max_transition_latency	= TRANSITION_LATENCY_LIMIT,
+	.owner			= THIS_MODULE,
 };
 
 static int __init cpufreq_gov_dbs_init(void)
Index: linux-2.6.22-rc6/arch/arm/mach-imx/cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/arm/mach-imx/cpufreq.c
+++ linux-2.6.22-rc6/arch/arm/mach-imx/cpufreq.c
@@ -269,7 +269,6 @@ static int __init imx_cpufreq_driver_ini
 		return -EINVAL;
 
 	policy->cur = policy->min = policy->max = imx_get_speed(0);
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 8000;
 	policy->cpuinfo.max_freq = 200000;
 	 /* Manual states, that PLL stabilizes in two CLK32 periods */
Index: linux-2.6.22-rc6/arch/arm/mach-sa1100/cpu-sa1110.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/arm/mach-sa1100/cpu-sa1110.c
+++ linux-2.6.22-rc6/arch/arm/mach-sa1100/cpu-sa1110.c
@@ -331,7 +331,6 @@ static int __init sa1110_cpu_init(struct
 	if (policy->cpu != 0)
 		return -EINVAL;
 	policy->cur = policy->min = policy->max = sa11x0_getspeed(0);
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = 59000;
 	policy->cpuinfo.max_freq = 287000;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
Index: linux-2.6.22-rc6/arch/arm/plat-omap/cpu-omap.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/arm/plat-omap/cpu-omap.c
+++ linux-2.6.22-rc6/arch/arm/plat-omap/cpu-omap.c
@@ -108,7 +108,6 @@ static int __init omap_cpu_init(struct c
 	if (policy->cpu != 0)
 		return -EINVAL;
 	policy->cur = policy->min = policy->max = omap_getspeed(0);
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.min_freq = clk_round_rate(mpu_clk, 0) / 1000;
 	policy->cpuinfo.max_freq = clk_round_rate(mpu_clk, VERY_HI_RATE) / 1000;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
Index: linux-2.6.22-rc6/arch/blackfin/mach-bf533/cpu.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/blackfin/mach-bf533/cpu.c
+++ linux-2.6.22-rc6/arch/blackfin/mach-bf533/cpu.c
@@ -119,8 +119,6 @@ static int __init __bf533_cpu_init(struc
 	if (policy->cpu != 0)
 		return -EINVAL;
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	/*Now ,only support one cpu */
 	policy->cur = bf533_getfreq(0);
Index: linux-2.6.22-rc6/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
+++ linux-2.6.22-rc6/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
@@ -323,8 +323,6 @@ acpi_cpufreq_cpu_init (
 			    data->acpi_data.states[i].transition_latency * 1000;
 		}
 	}
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cur = processor_get_freq(data, policy->cpu);
 
 	/* table init */
Index: linux-2.6.22-rc6/arch/powerpc/platforms/cell/cbe_cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/powerpc/platforms/cell/cbe_cpufreq.c
+++ linux-2.6.22-rc6/arch/powerpc/platforms/cell/cbe_cpufreq.c
@@ -235,7 +235,6 @@ static int cbe_cpufreq_cpu_init(struct c
 		pr_debug("%d: %d\n", i, cbe_freqs[i].frequency);
 	}
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	/* if DEBUG is enabled set_pmode() measures the correct latency of a transition */
 	policy->cpuinfo.transition_latency = 25000;
 
Index: linux-2.6.22-rc6/arch/powerpc/platforms/pasemi/cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/powerpc/platforms/pasemi/cpufreq.c
+++ linux-2.6.22-rc6/arch/powerpc/platforms/pasemi/cpufreq.c
@@ -195,8 +195,6 @@ static int pas_cpufreq_cpu_init(struct c
 		pr_debug("%d: %d\n", i, pas_freqs[i].frequency);
 	}
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-
 	policy->cpuinfo.transition_latency = get_gizmo_latency();
 
 	cur_astate = get_cur_astate(policy->cpu);
Index: linux-2.6.22-rc6/arch/powerpc/platforms/powermac/cpufreq_32.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/powerpc/platforms/powermac/cpufreq_32.c
+++ linux-2.6.22-rc6/arch/powerpc/platforms/powermac/cpufreq_32.c
@@ -410,7 +410,6 @@ static int pmac_cpufreq_cpu_init(struct 
 	if (policy->cpu != 0)
 		return -ENODEV;
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency	= CPUFREQ_ETERNAL;
 	policy->cur = cur_freq;
 
Index: linux-2.6.22-rc6/arch/powerpc/platforms/powermac/cpufreq_64.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/powerpc/platforms/powermac/cpufreq_64.c
+++ linux-2.6.22-rc6/arch/powerpc/platforms/powermac/cpufreq_64.c
@@ -357,7 +357,6 @@ static unsigned int g5_cpufreq_get_speed
 
 static int g5_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = g5_cpu_freqs[g5_query_freq()].frequency;
 	/* secondary CPUs are tied to the primary one by the
Index: linux-2.6.22-rc6/arch/sh/kernel/cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/sh/kernel/cpufreq.c
+++ linux-2.6.22-rc6/arch/sh/kernel/cpufreq.c
@@ -159,7 +159,6 @@ static int sh_cpufreq_cpu_init(struct cp
 	sh_freqs[SH_FREQ_MIN].frequency = min_freq;
 
 	/* cpuinfo and default policy values */
-	policy->governor                   = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur                        = max_freq;
 
Index: linux-2.6.22-rc6/arch/sparc64/kernel/us2e_cpufreq.c
===================================================================
--- linux-2.6.22-rc6.orig/arch/sparc64/kernel/us2e_cpufreq.c
+++ linux-2.6.22-rc6/arch/sparc64/kernel/us2e_cpufreq.c
@@ -326,7 +326,6 @@ static int __init us2e_freq_cpu_init(str
 	table[2].index = 5;
 	table[3].frequency = CPUFREQ_TABLE_END;
 
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency = 0;
 	policy->cur = clock_tick;
