From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: [PATCH] 2.6.5 speedstep on P4Ms
Date: Fri, 11 Jun 2004 00:21:06 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C8FAF2.1070305@cern.ch>
Reply-To: holbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070508020408030605090807"
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
--------------070508020408030605090807
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

  hi and thanks! here is a batch that should do what you suggested.


>>/ diff --unified --recursive --new-file linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
>/>/ --- linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-09 22:27:18.000000000 +0000
>/>/ +++ linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-10 00:29:54.388186856 +0000
>/>/ @@ -70,6 +70,7 @@
>/>/   * @notify: whether to call cpufreq_notify_transition for CPU speed changes
>/>/   *
>/>/   *   Tries to change the SpeedStep state. 
>/>/ + * Note: notify is a dummy argument. The routine never notifies.
>/
>Maybe it's better to kill notify, and modify a little speedstep-smi and speedstep-lib

done

>Dominik, your though, please?
>
>...
>
>>/ +
>/>/ +	for_each_cpu(i) {
>/>/ +	        if (cpu_isset(i, affected_cpu_map)) {
>/>/ +	                freqs.cpu = i;
>/>/ +			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
>/>/ +		}
>/>/ +	}
>/
>What about 
>	for_each_cpu_mask(i, affected_cpu_map) {
>		...
>	}
>instead?

thanks, done

>>/  
>/>/  	/* detect low and high frequency */
>/>/  	result = speedstep_get_freqs(speedstep_processor,
>/>/ @@ -297,6 +337,9 @@
>/>/  	if (!speed)
>/>/  		return -EIO;
>/>/  
>/>/ +	/* allow to run on any CPU */
>/>/ +	set_cpus_allowed(current, cpus_allowed);
>/>/ +
>/
>Something wrong.  I mean, there is a return but the set_cpu_allowed()
>is done after...

 this was a nasty one and i screwed up in 2 other places before. thanks alot!

chris


--------------070508020408030605090807
Content-Type: text/x-patch;
 name="speedstep_patch.2.6.7-rc3_SMT.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep_patch.2.6.7-rc3_SMT.diff"

diff --unified --recursive --new-file linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-09 22:27:18.000000000 +0000
+++ linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-10 23:57:40.779127072 +0000
@@ -71,24 +71,16 @@
  *
  *   Tries to change the SpeedStep state. 
  */
-static void speedstep_set_state (unsigned int state, unsigned int notify)
+static void speedstep_set_state (unsigned int state)
 {
 	u32			pmbase;
 	u8			pm2_blk;
 	u8			value;
 	unsigned long		flags;
-	struct cpufreq_freqs	freqs;
 
 	if (!speedstep_chipset_dev || (state > 0x1))
 		return;
 
-	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new = speedstep_freqs[state].frequency;
-	freqs.cpu = 0; /* speedstep.c is UP only driver */
-	
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-
 	/* get PMBASE */
 	pci_read_config_dword(speedstep_chipset_dev, 0x40, &pmbase);
 	if (!(pmbase & 0x01))
@@ -143,9 +135,6 @@
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	return;
 }
 
@@ -251,12 +240,53 @@
 			     unsigned int target_freq,
 			     unsigned int relation)
 {
-	unsigned int	newstate = 0;
+	unsigned int newstate = 0;
+	struct cpufreq_freqs freqs;
+	cpumask_t cpus_allowed, affected_cpu_map;
+	int i;
+
 
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	speedstep_set_state(newstate, 1);
+	/* switch to physical CPU where state is to be changed*/
+	cpus_allowed = current->cpus_allowed;
+
+	/* only run on CPU to be set, or on its sibling */
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[policy->cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+#endif
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
+
+	for_each_cpu_mask(i, affected_cpu_map) {
+	        freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	}
+
+	/* do the transition */
+	set_cpus_allowed(current, affected_cpu_map);
+	speedstep_set_state(newstate);
+	set_cpus_allowed(current, cpus_allowed);
+
+	/* notifiers */
+	for_each_cpu_mask(i, affected_cpu_map) {
+	        freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	}
 
 	return 0;
 }
@@ -279,21 +309,31 @@
 {
 	int		result = 0;
 	unsigned int	speed;
+	cpumask_t       cpus_allowed,affected_cpu_map;
 
-	/* capability check */
-	if (policy->cpu != 0)
-		return -ENODEV;
+	/* only run on CPU to be set, or on its sibling */
+	cpus_allowed = current->cpus_allowed;
+#ifdef CONFIG_SMP
+	affected_cpu_map = cpu_sibling_map[policy->cpu];
+#else
+	affected_cpu_map = cpumask_of_cpu(policy->cpu);
+#endif
 
 	/* detect low and high frequency */
+	set_cpus_allowed(current, affected_cpu_map);
 	result = speedstep_get_freqs(speedstep_processor,
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
 				     &speedstep_set_state);
+	set_cpus_allowed(current, cpus_allowed);
 	if (result)
 		return result;
 
 	/* get current speed setting */
+	set_cpus_allowed(current, affected_cpu_map);
 	speed = speedstep_get_processor_frequency(speedstep_processor);
+	set_cpus_allowed(current, cpus_allowed);
+
 	if (!speed)
 		return -EIO;
 
@@ -324,7 +364,20 @@
 
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

--------------070508020408030605090807
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------070508020408030605090807--

