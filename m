From: Zwane Mwaikambo <zwane@linuxpower.ca>
Subject: [PATCH] Hotplug cpu: fix p4-clockmod
Date: Sat, 21 Aug 2004 10:29:04 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0408211022090.27390@montezuma.fsmlabs.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CPU Freq ML <cpufreq@www.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>

This currently oopses when a processor goes offline since it can't
schedule itself onto the correct cpu. So we now disable preemption whilst
reading or setting the DC. There is a questionable hunk which returns the
stock_freq if the processor being read from is offline. The other drivers
most probably have similar issues so i'll do a seperate careful sweep of
those as i don't have hardware.

Signed-off-by: Zwane Mwaikambo <zwane@linuxpower.ca>

Index: linux-2.6.8.1-mm2/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
===================================================================
RCS file: /home/cvsroot/linux-2.6.8.1-mm2/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c,v
retrieving revision 1.1.1.1
diff -u -p -B -r1.1.1.1 p4-clockmod.c
--- linux-2.6.8.1-mm2/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	19 Aug 2004 20:51:36 -0000	1.1.1.1
+++ linux-2.6.8.1-mm2/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	20 Aug 2004 14:08:27 -0000
@@ -58,8 +58,11 @@ static int cpufreq_p4_setdc(unsigned int
 {
 	u32 l, h;

-	if (!cpu_online(cpu) || (newstate > DC_DISABLE) || (newstate == DC_RESV))
+	preempt_disable();
+	if (!cpu_online(cpu) || (newstate > DC_DISABLE) || (newstate == DC_RESV)) {
+		preempt_enable();
 		return -EINVAL;
+	}

 	rdmsr(MSR_IA32_THERM_STATUS, l, h);
 #if 0
@@ -86,6 +89,7 @@ static int cpufreq_p4_setdc(unsigned int
 		wrmsr(MSR_IA32_THERM_CONTROL, l, h);
 	}

+	preempt_enable();
 	return 0;
 }

@@ -145,8 +149,6 @@ static int cpufreq_p4_target(struct cpuf
 		cpumask_t this_cpu = cpumask_of_cpu(i);

 		set_cpus_allowed(current, this_cpu);
-		BUG_ON(smp_processor_id() != i);
-
 		cpufreq_p4_setdc(i, p4clockmod_table[newstate].index);
 	}
 	set_cpus_allowed(current, cpus_allowed);
@@ -260,6 +262,7 @@ static int cpufreq_p4_cpu_exit(struct cp

 static unsigned int cpufreq_p4_get(unsigned int cpu)
 {
+	unsigned int freq;
 	cpumask_t cpus_allowed, affected_cpu_map;
 	u32 l, h;

@@ -267,22 +270,25 @@ static unsigned int cpufreq_p4_get(unsig
         affected_cpu_map = cpumask_of_cpu(cpu);

 	set_cpus_allowed(current, affected_cpu_map);
-        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
+	preempt_disable();
+	if (smp_processor_id() != cpu) {
+		freq = stock_freq;
+		goto done;
+	}

 	rdmsr(MSR_IA32_THERM_CONTROL, l, h);

-	set_cpus_allowed(current, cpus_allowed);
-
 	if (l & 0x10) {
 		l = l >> 1;
 		l &= 0x7;
+		freq = stock_freq * l / 8;
 	} else
-		l = DC_DISABLE;
-
-	if (l != DC_DISABLE)
-		return (stock_freq * l / 8);
+		freq = stock_freq;

-	return stock_freq;
+done:
+	preempt_enable_no_resched();
+	set_cpus_allowed(current, cpus_allowed);
+	return freq;
 }

 static struct freq_attr* p4clockmod_attr[] = {
