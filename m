From: Christian Hoelbling <christian.holbling@cern.ch>
Subject: Re: [PATCH 2.6.8-rc2] speedstep SMT support
Date: Fri, 30 Jul 2004 11:36:34 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <410A32C2.3080002@cern.ch>
References: <4107B8DE.5020401@cern.ch>	<20040728172028.GB8678@dominikbrodowski.de>	<4108EB34.9060505@cern.ch>
	<20040729163450.GA7947@dominikbrodowski.de>
Reply-To: Christian.Hoelbling@cpt.univ-mrs.fr
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050803010006060204040609"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040729163450.GA7947@dominikbrodowski.de>
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
Cc: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------050803010006060204040609
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

   hi,

here is the new patch w.r.t. the latest cpufreq-development snapshot 
(thanks for pointing me to it!). it should make speedstep-ich SMP save 
(altough that is hypothetical for now).

 chris

--------------050803010006060204040609
Content-Type: text/x-patch;
 name="speedstep_SMP.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="speedstep_SMP.diff"

diff --unified --recursive --new-file linux-2.6.8-rc2-cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux-2.6.8-rc2-cpufreq.my/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-2.6.8-rc2-cpufreq/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-07-26 10:13:07.000000000 +0000
+++ linux-2.6.8-rc2-cpufreq.my/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-07-30 11:00:59.000000000 +0000
@@ -247,14 +247,14 @@
 	if (cpufreq_frequency_table_target(policy, &speedstep_freqs[0], target_freq, relation, &newstate))
 		return -EINVAL;
 
+	freqs.old = speedstep_get(policy->cpu);
+	freqs.new = speedstep_freqs[newstate].frequency;
+	freqs.cpu = policy->cpu;
+
 	/* no transition necessary */
 	if (freqs.old == freqs.new)
 		return 0;
 
-	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new = speedstep_freqs[newstate].frequency;
-	freqs.cpu = policy->cpu;
-
 	cpus_allowed = current->cpus_allowed;
 
 	/* only run on CPU to be set, or on its sibling */
@@ -324,14 +324,13 @@
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
 				     &speedstep_set_state);
+	set_cpus_allowed(current, cpus_allowed);
 	if (result) {
-		set_cpus_allowed(current, cpus_allowed);
 		return result;
 	}
 
 	/* get current speed setting */
-	speed = speedstep_get_processor_frequency(speedstep_processor);
-	set_cpus_allowed(current, cpus_allowed);
+	speed = speedstep_get(policy->cpu);
 	if (!speed)
 		return -EIO;
 
@@ -362,7 +361,20 @@
 
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

--------------050803010006060204040609
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------050803010006060204040609--

