From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: [PATCH 2.6.8-rc2] speedstep SMT support
Date: Wed, 28 Jul 2004 14:31:58 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <4107B8DE.5020401@cern.ch>
Reply-To: Christian.Hoelbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090109070001040100040501"
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

This is a multi-part message in MIME format.
--------------090109070001040100040501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

  hi list,

 i have noticed that the most recent vanilla kernel oopses on a P4M-HT 
(because only one CPU is registered in sysfs but 2 are informed of a 
change of state). also there are some returns out of subroutines before 
set_cpus_allowed() is performed to restore the mask prior to entering 
the subroutine (this should not matter on uniprocessor systems, but 
still...).

 this patch should fix these 2 issues. for the first one, it registerers 
all logical cpu's and a tiny modification is made in cpufreq.c to 
perform a policy change on all siblings.

 i noticed, that this should be superseeded by the patches that dominik 
has submitted over a month ago. sorry, since i didn't see them in the 
kernel i did my own thing. maybe they are usefull still.

christian

--------------090109070001040100040501
Content-Type: text/x-patch;
 name="speedstep_patch.2.6.8-rc2.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep_patch.2.6.8-rc2.diff"

diff --unified --recursive --new-file linux-2.6.8-rc2/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.8-rc2-speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.8-rc2/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-07-26 10:13:07.000000000 +0000
+++ linux-2.6.8-rc2-speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-07-28 11:10:09.000000000 +0000
@@ -67,6 +67,7 @@
 /**
  * speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
+ * @notify: whether to call cpufreq_notify_transition for CPU speed changes
  *
  *   Tries to change the SpeedStep state. 
  */
@@ -239,22 +240,16 @@
 			     unsigned int target_freq,
 			     unsigned int relation)
 {
-	unsigned int	newstate = 0;
+	unsigned int newstate = 0;
 	struct cpufreq_freqs freqs;
 	cpumask_t cpus_allowed, affected_cpu_map;
 	int i;
 
+
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	/* no transition necessary */
-	if (freqs.old == freqs.new)
-		return 0;
-
-	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new = speedstep_freqs[newstate].frequency;
-	freqs.cpu = policy->cpu;
-
+	/* switch to physical CPU where state is to be changed*/
 	cpus_allowed = current->cpus_allowed;
 
 	/* only run on CPU to be set, or on its sibling */
@@ -263,22 +258,33 @@
 #else
 	affected_cpu_map = cpumask_of_cpu(policy->cpu);
 #endif
+ 
+	set_cpus_allowed(current, affected_cpu_map);
+	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
+	set_cpus_allowed(current, cpus_allowed);
+
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = policy->cpu;
+
+	/* no transition necessary */
+	if (freqs.old == freqs.new) {
+	        set_cpus_allowed(current, cpus_allowed);
+		return 0;
+	}
 
 	for_each_cpu_mask(i, affected_cpu_map) {
-		freqs.cpu = i;
+	        freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
 
-	/* switch to physical CPU where state is to be changed */
+	/* do the transition */
 	set_cpus_allowed(current, affected_cpu_map);
-
 	speedstep_set_state(newstate);
-
-	/* allow to be run on all CPUs */
 	set_cpus_allowed(current, cpus_allowed);
 
+	/* notifiers */
 	for_each_cpu_mask(i, affected_cpu_map) {
-		freqs.cpu = i;
+	        freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
 
@@ -305,11 +311,6 @@
 	unsigned int	speed;
 	cpumask_t       cpus_allowed,affected_cpu_map;
 
-
-	/* capability check */
-	if (policy->cpu != 0) /* FIXME: better support for SMT in cpufreq core. Up until then, it's better to register only one CPU */
-		return -ENODEV;
-
 	/* only run on CPU to be set, or on its sibling */
 	cpus_allowed = current->cpus_allowed;
 #ifdef CONFIG_SMP
@@ -317,21 +318,22 @@
 #else
 	affected_cpu_map = cpumask_of_cpu(policy->cpu);
 #endif
-	set_cpus_allowed(current, affected_cpu_map);
 
 	/* detect low and high frequency */
+	set_cpus_allowed(current, affected_cpu_map);
 	result = speedstep_get_freqs(speedstep_processor,
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
 				     &speedstep_set_state);
-	if (result) {
-		set_cpus_allowed(current, cpus_allowed);
+	set_cpus_allowed(current, cpus_allowed);
+	if (result)
 		return result;
-	}
 
 	/* get current speed setting */
+	set_cpus_allowed(current, affected_cpu_map);
 	speed = speedstep_get_processor_frequency(speedstep_processor);
 	set_cpus_allowed(current, cpus_allowed);
+
 	if (!speed)
 		return -EIO;
 
@@ -362,7 +364,20 @@
 
 static unsigned int speedstep_get(unsigned int cpu)
 {
-	return speedstep_get_processor_frequency(speedstep_processor);
+ 	unsigned int	speed;
+	cpumask_t       cpus_allowed,affected_cpu_map;
+ 
+	/* only run on CPU to be set, or on its sibling */
+	cpus_allowed = current->cpus_allowed;
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(cpu);
+#endif
+	set_cpus_allowed(current, affected_cpu_map);
+	speed=speedstep_get_processor_frequency(speedstep_processor);
+	set_cpus_allowed(current, cpus_allowed);
+	return speed;
 }
 
 static struct freq_attr* speedstep_attr[] = {
diff --unified --recursive --new-file linux-2.6.8-rc2/drivers/cpufreq/cpufreq.c linux-2.6.8-rc2-speedstep/drivers/cpufreq/cpufreq.c
--- linux-2.6.8-rc2/drivers/cpufreq/cpufreq.c	2004-07-26 10:13:07.000000000 +0000
+++ linux-2.6.8-rc2-speedstep/drivers/cpufreq/cpufreq.c	2004-07-28 12:35:52.000000000 +0000
@@ -218,7 +218,7 @@
 
 
 /**
- * store_scaling_governor - store policy for the specified CPU
+ * store_scaling_governor - store policy for the specified CPU and all of its siblings
  */
 static ssize_t store_scaling_governor (struct cpufreq_policy * policy, 
 				       const char *buf, size_t count) 
@@ -226,6 +226,8 @@
 	unsigned int ret = -EINVAL;
 	char	str_governor[16];
 	struct cpufreq_policy new_policy;
+	cpumask_t affected_cpu_map;
+	int i;
 
 	ret = cpufreq_get_policy(&new_policy, policy->cpu);
 	if (ret)
@@ -238,8 +240,15 @@
 	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
 		return -EINVAL;
 
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[new_policy.cpu];
+	for_each_cpu_mask(i, affected_cpu_map) {
+	        new_policy.cpu = i;
+		ret = ret & cpufreq_set_policy(&new_policy);
+	}
+#else
 	ret = cpufreq_set_policy(&new_policy);
-
+#endif
 	return ret ? ret : count;
 }
 

--------------090109070001040100040501
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------090109070001040100040501--

