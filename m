From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: Re: [PATCH] 2.6.5 speedstep on P4Ms
Date: Tue, 08 Jun 2004 23:53:34 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40C6517E.1090708@cern.ch>
References: <40C5F42D.1050107@cern.ch> <20040608153023.GS13782@poupinou.org>
Reply-To: holbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------090806060408030608070604"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040608153023.GS13782@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------090806060408030608070604
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Bruno Ducrot wrote:

>On Tue, Jun 08, 2004 at 05:15:25PM +0000, Christian Hoelbling wrote:
>  
>
>>  hi list,
>>
>>i am trying to do a small rewrite of the speedstep-ich driver to 
>>address the following issues:
>>
>>1.) detect all P4M's via the model_id string
>>2.) correctly register drivers on hyperthreading CPU's (and stop 
>>freeze-ups i occasionally had)
>>3.) do P4-clockmod on top of speedstep on P4-Ms
>>    
>>
>
>It would be great if you send 3 differents patches...
>
>Also, I don't think 3) is how thinks should be done.
>It would be much more usefull to allow 2 cpufreq drivers to be loaded.
>I think it's planed for 2.7 btw.
>
>Cheers,
>
>  
>
thanks alot for your help. here are the patches for 1) and 2) seperately.

for 3): what you say sounds much better than my brutal hack, so i won't 
post it again. i'd definitely want to try to implement 2 cpufreq 
drivers, but i fear this is way beyond me at the moment and probably 
involves design choices i can't make.

cheers,

chris

--------------090806060408030608070604
Content-Type: text/x-patch;
 name="speedstep_patch.2.6.5_detectP4M.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep_patch.2.6.5_detectP4M.diff"

diff --unified --recursive --new-file linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-07 20:49:36.000000000 +0000
+++ linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-08 22:56:06.911397232 +0000
@@ -210,8 +210,17 @@
 		ebx = cpuid_ebx(0x00000001);
 		ebx &= 0x000000FF;
 
-		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->86_mask);
+		dprintk(KERN_INFO "ebx value is %x\n", ebx);
 
+		dprintk(KERN_INFO "model_id is %s\n", c->x86_model_id);
+		
+		/*
+		 * If the x86_model_id string contais "Mobile Intel(R) Pentium(R) 4"
+                 * omit all other checks and treat the CPU as a M-P4-M
+		 */
+		if (strstr(c->x86_model_id,"Mobile Intel(R) Pentium(R) 4") != NULL)
+		       return SPEEDSTEP_PROCESSOR_P4M;
+		
 		switch (c->x86_mask) {
 		case 4: 
 			/*
@@ -248,6 +257,7 @@
 			 * So, how to distinguish all those processors with
 			 * ebx=0xf? I don't know. Sort them out, and wait
 			 * for someone to complain.
+			 * also, M-P4M HTs actually have ebx=0x8, too
 			 */
 			if (ebx == 0x0e)
 				return SPEEDSTEP_PROCESSOR_P4M;

--------------090806060408030608070604
Content-Type: text/x-patch;
 name="speedstep_patch.2.6.5_SMT.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep_patch.2.6.5_SMT.diff"

diff --unified --recursive --new-file linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-07 20:49:36.000000000 +0000
+++ linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-06-08 23:34:00.871702720 +0000
@@ -70,23 +70,52 @@
  *
  *   Tries to change the SpeedStep state. 
  */
-static void speedstep_set_state (unsigned int state, unsigned int notify)
+static void speedstep_set_state (unsigned int cpu, unsigned int state, unsigned int notify)
 {
 	u32			pmbase;
 	u8			pm2_blk;
 	u8			value;
 	unsigned long		flags;
 	struct cpufreq_freqs	freqs;
+	cpumask_t               cpus_allowed, affected_cpu_map;
+	int                     hyperthreading = 0;
+	int                     sibling = 0;
 
 	if (!speedstep_chipset_dev || (state > 0x1))
 		return;
 
+	/* switch to physical CPU where state is to be changed*/
+	cpus_allowed = current->cpus_allowed;
+
+	/* only run on CPU to be set, or on its sibling */
+       affected_cpu_map = cpumask_of_cpu(cpu);
+#ifdef CONFIG_X86_HT
+	hyperthreading = ((cpu_has_ht) && (smp_num_siblings == 2));
+	if (hyperthreading) {
+		sibling = cpu_sibling_map[cpu];
+                cpu_set(sibling, affected_cpu_map);
+	}
+#endif
+	set_cpus_allowed(current, affected_cpu_map);
+        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
+
 	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
 	freqs.new = speedstep_freqs[state].frequency;
-	freqs.cpu = 0; /* speedstep.c is UP only driver */
-	
-	if (notify)
+	freqs.cpu = cpu;
+
+	/* no transition necessary */
+	if (freqs.old == freqs.new) {
+	        set_cpus_allowed(current, cpus_allowed);
+		return;
+	}
+
+	if (notify) {
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+		if (hyperthreading) {
+		        freqs.cpu = sibling;
+			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+		}
+	}
 
 	/* get PMBASE */
 	pci_read_config_dword(speedstep_chipset_dev, 0x40, &pmbase);
@@ -142,9 +171,18 @@
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
 
-	if (notify)
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	/* allow to be run on all CPUs */
+	set_cpus_allowed(current, cpus_allowed);
 
+	if (notify) {
+	        /* notifiers */
+	        cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	        if (hyperthreading) {
+		        freqs.cpu = cpu;
+			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+		}
+		dprintk(KERN_DEBUG "cpufreq: transition on cpu %i from %i kHz to %ikHz completed\n",cpu ,freqs.old ,freqs.new);
+	}
 	return;
 }
 
@@ -253,7 +291,7 @@
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
-	speedstep_set_state(newstate, 1);
+	speedstep_set_state(policy->cpu, newstate, 1);
 
 	return 0;
 }
@@ -277,12 +315,8 @@
 	int		result = 0;
 	unsigned int	speed;
 
-	/* capability check */
-	if (policy->cpu != 0)
-		return -ENODEV;
-
 	/* detect low and high frequency */
-	result = speedstep_get_freqs(speedstep_processor,
+	result = speedstep_get_freqs(policy->cpu,speedstep_processor,
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
 				     &speedstep_set_state);
diff --unified --recursive --new-file linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-07 20:49:36.000000000 +0000
+++ linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-06-08 23:34:50.120215808 +0000
@@ -310,20 +310,40 @@
  *                     DETECT SPEEDSTEP SPEEDS                       *
  *********************************************************************/
 
-unsigned int speedstep_get_freqs(unsigned int processor,
+unsigned int speedstep_get_freqs(unsigned int cpu,
+				  unsigned int processor,
 				  unsigned int *low_speed,
 				  unsigned int *high_speed,
-				  void (*set_state) (unsigned int state,
+				  void (*set_state) (unsigned int cpu,
+						     unsigned int state,
 						     unsigned int notify)
 				 )
 {
 	unsigned int prev_speed;
 	unsigned int ret = 0;
 	unsigned long flags;
+	cpumask_t cpus_allowed, affected_cpu_map;
+	int hyperthreading = 0;
+	int sibling = 0;
 
 	if ((!processor) || (!low_speed) || (!high_speed) || (!set_state))
 		return -EINVAL;
 
+	/* switch to physical CPU where state is to be changed*/
+	cpus_allowed = current->cpus_allowed;
+
+	/* only run on CPU to be set, or on its sibling */
+       affected_cpu_map = cpumask_of_cpu(cpu);
+#ifdef CONFIG_X86_HT
+	hyperthreading = ((cpu_has_ht) && (smp_num_siblings == 2));
+	if (hyperthreading) {
+		sibling = cpu_sibling_map[cpu];
+                cpu_set(sibling, affected_cpu_map);
+	}
+#endif
+	set_cpus_allowed(current, affected_cpu_map);
+        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
+
 	/* get current speed */
 	prev_speed = speedstep_get_processor_frequency(processor);
 	if (!prev_speed)
@@ -332,7 +352,7 @@
 	local_irq_save(flags);
 
 	/* switch to low state */
-	set_state(SPEEDSTEP_LOW, 0);
+	set_state(cpu, SPEEDSTEP_LOW, 0);
 	*low_speed = speedstep_get_processor_frequency(processor);
 	if (!*low_speed) {
 		ret = -EIO;
@@ -340,7 +360,7 @@
 	}
 
 	/* switch to high state */
-	set_state(SPEEDSTEP_HIGH, 0);
+	set_state(cpu, SPEEDSTEP_HIGH, 0);
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
 		ret = -EIO;
@@ -354,10 +374,11 @@
 
 	/* switch to previous state, if necessary */
 	if (*high_speed != prev_speed)
-		set_state(SPEEDSTEP_LOW, 0);
+		set_state(cpu, SPEEDSTEP_LOW, 0);
 
  out:
 	local_irq_restore(flags);
+	set_cpus_allowed(current, cpus_allowed);
 	return (ret);
 }
 EXPORT_SYMBOL_GPL(speedstep_get_freqs);
diff --unified --recursive --new-file linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
--- linux-2.6.5/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2004-06-07 20:49:36.000000000 +0000
+++ linux-2.6.5.speedstep/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h	2004-06-08 23:34:06.104907152 +0000
@@ -41,7 +41,7 @@
  * SPEEDSTEP_LOW; the second argument is zero so that no 
  * cpufreq_notify_transition calls are initiated.
  */
-extern unsigned int speedstep_get_freqs(unsigned int processor,
+extern unsigned int speedstep_get_freqs(unsigned int cpu, unsigned int processor,
 	  unsigned int *low_speed,
 	  unsigned int *high_speed,
-	  void (*set_state) (unsigned int state, unsigned int notify));
+	  void (*set_state) (unsigned int cpu, unsigned int state, unsigned int notify));

--------------090806060408030608070604
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------090806060408030608070604--

