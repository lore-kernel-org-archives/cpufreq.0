From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Thu, 10 Jun 2004 00:46:36 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C7AF6C.1080408@cern.ch>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
	<40C6517E.1090708@cern.ch>
	<20040609154710.GA9482@dominikbrodowski.de>
Reply-To: holbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000905090806020808000609"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040609154710.GA9482@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------000905090806020808000609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

hi dominik,

thanks alot for your detailed reply and patience with a newbie. i have 
attached 2 patches w.r.t. 2.6.7-rc3 that should adress your suggestions.

i also wonder about one thing, maybe you can help me on that. with the 
old speedstep driver, i would have occational hard freezups of my 
machine. this seems to be gone (just experimental evidence, since i 
didn't have one in a few days now where before they occured about 
hourly). so my guess is that something in this patch must have corrected 
it. since my machine just has one physical cpu, i really don't 
understand what went wrong before.  do you have any idea on that?

Dominik Brodowski wrote:

>Hi Chris,
>
>  
>
<snip>

> Even more, under normal circumstances [i.e. idling works,
>which it does on most systems], I see no _technical_ reason to do
>throttling, or even non-temperature related _dynamic throttling_ like other
>OSes do it. For those new to this list, there's some maths in the archives
>which proves that you need more energy == battery power if you do
>throttling for any given task... So it's something we need to discuss 
>during 2.7.
>  
>
 thanks, i didn't know that

>Now, about your patch 1):
>  
>
<snip>

>So I'd prefer, due to the nastiness of the CPUID in the specific 0x0F29 case,
>to move the strstr check to this specific case -- e.g. have
>
>			if (ebx == 0x0e)
>				return SPEEDSTEP_PROCESSOR_P4M;
>			if (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") != NULL)
>				return SPEEDSTEP_PROCESSOR_P4M;
>  
>
 > Could you update your patch accordingly, please?
 
thanks, done it. i was somehow anticipating that since reading the 
version string feels like a cheat.

>Now, about your patch 2) [slightly re-ordered]:
>
>  
>
>>-unsigned int speedstep_get_freqs(unsigned int processor,
>>+unsigned int speedstep_get_freqs(unsigned int cpu,
>>+				  unsigned int processor,
>> 				  unsigned int *low_speed,
>> 				  unsigned int *high_speed,
>>-				  void (*set_state) (unsigned int state,
>>+				  void (*set_state) (unsigned int cpu,
>>+						     unsigned int state,
>> 						     unsigned int notify)
>>    
>>
>
>This will break speedstep-smi, as it uses speedstep_get_freqs too...
>
>  
>
ok, i chopped out the notify and cpu switching part from speedstep_set_state

>>+	/* switch to physical CPU where state is to be changed*/
>>+	cpus_allowed = current->cpus_allowed;
>>+
>>+	/* only run on CPU to be set, or on its sibling */
>>+       affected_cpu_map = cpumask_of_cpu(cpu);
>>+#ifdef CONFIG_X86_HT
>>+	hyperthreading = ((cpu_has_ht) && (smp_num_siblings == 2));
>>+	if (hyperthreading) {
>>+		sibling = cpu_sibling_map[cpu];
>>+                cpu_set(sibling, affected_cpu_map);
>>+	}
>>+#endif
>>+	set_cpus_allowed(current, affected_cpu_map);
>>+        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
>>    
>>
>
>Due to changes to cpu_sibling_map [it's a cpumask_t now], this won't
>generate appropriate code [if it even compiles] on 2.6.7-rc3. See in
>p4-clockmod.c how "easy" it becomes now.
>  
>
 thanks, done it

<snip>

>>-	/* capability check */
>>-	if (policy->cpu != 0)
>>-		return -ENODEV;
>>    
>>
>
>For the time being, this should be kept. Else you can load two different
>governors, or set two different frequencies, on both siblings. Obviously,
>it'll break. 
>
as far as i understand, the frequencies are always the same, because the 
siblings are explicitly notified. about the 2 different governors, the 
same problem exists in the current p4-clockmod.

>I'll try to fix it in the 2.6.8 timeframe...
>  
>
you mean that a change of governors gets communicated to the siblings?


thanks again for your help!

chris

--------------000905090806020808000609
Content-Type: text/x-patch;
 name="speedstep_patch.2.6.7-rc3_detectP4M.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="speedstep_patch.2.6.7-rc3_detectP4M.diff"

diff --unified --recursive --new-file linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-09 22:27:18.000000000 +0000
+++ linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-09 22:36:31.227318536 +0000
@@ -252,11 +252,10 @@
 			 * specific.
 			 * M-P4-Ms may have either ebx=0xe or 0xf [see above]
 			 * M-P4/533 have either ebx=0xe or 0xf. [25317607.pdf]
-			 * So, how to distinguish all those processors with
-			 * ebx=0xf? I don't know. Sort them out, and wait
-			 * for someone to complain.
+			 * also, M-P4M HTs have ebx=0x8, too
+			 * For now, they are distinguished by the model_id string
 			 */
-			if (ebx == 0x0e)
+		        if ((ebx == 0x0e) || (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") != NULL)) 
 				return SPEEDSTEP_PROCESSOR_P4M;
 			break;
 		default:

--------------000905090806020808000609
Content-Type: text/x-patch;
 name="speedstep_patch.2.6.7-rc3_SMT.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep_patch.2.6.7-rc3_SMT.diff"

diff --unified --recursive --new-file linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.7-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-09 22:27:18.000000000 +0000
+++ linux-2.6.7-rc3.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-10 00:29:54.388186856 +0000
@@ -70,6 +70,7 @@
  * @notify: whether to call cpufreq_notify_transition for CPU speed changes
  *
  *   Tries to change the SpeedStep state. 
+ * Note: notify is a dummy argument. The routine never notifies.
  */
 static void speedstep_set_state (unsigned int state, unsigned int notify)
 {
@@ -77,18 +78,10 @@
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
@@ -143,9 +136,6 @@
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-
 	return;
 }
 
@@ -251,12 +241,56 @@
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
+	set_cpus_allowed(current, affected_cpu_map);
+ 
+	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = policy->cpu;
+
+	/* no transition necessary */
+	if (freqs.old == freqs.new) {
+	        set_cpus_allowed(current, cpus_allowed);
+		return 0;
+	}
+
+	for_each_cpu(i) {
+	        if (cpu_isset(i, affected_cpu_map)) {
+	                freqs.cpu = i;
+			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+		}
+	}
+
+	/* do the transition */
+	speedstep_set_state(newstate, 0);
+
+	/* allow to be run on all CPUs */
+	set_cpus_allowed(current, cpus_allowed);
+
+	/* notifiers */
+	for_each_cpu(i) {
+	        if (cpu_isset(i, affected_cpu_map)) {
+		        freqs.cpu = i;
+			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+		}
+	}
 
 	return 0;
 }
@@ -279,10 +313,16 @@
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
+	set_cpus_allowed(current, affected_cpu_map);
 
 	/* detect low and high frequency */
 	result = speedstep_get_freqs(speedstep_processor,
@@ -297,6 +337,9 @@
 	if (!speed)
 		return -EIO;
 
+	/* allow to run on any CPU */
+	set_cpus_allowed(current, cpus_allowed);
+
 	dprintk(KERN_INFO "cpufreq: currently at %s speed setting - %i MHz\n", 
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "high",
 		(speed / 1000));

--------------000905090806020808000609
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------000905090806020808000609--

