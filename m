From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] speedstep-centrino: Avoid returning zero freq on transient
	MSR values
Date: Thu, 9 Dec 2004 17:24:36 -0800
Message-ID: <20041209172436.A3337@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: linux@dominikbrodowski.de, cpufreq@www.linux.org.uk




On some CPUs, we can see transient MSR values (which are not present in _PSS) in
IA32_PERF_STATUS MSR, while CPU is doing some automatic P-state transition 
(like TM2). 
Current code will return frequency as 0 in such cases. Fix it by retrying the 
get after a delay and use lowest possible frequency as the current frequency 
in worst case.

Thanks to Matt Domsch for identifying and root-causing this failure.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

--- linux-2.6.10-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.org	2004-12-07 18:55:57.000000000 -0800
+++ linux-2.6.10-rc3/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-12-09 16:18:30.000000000 -0800
@@ -22,6 +22,8 @@
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/config.h>
+#include <linux/delay.h>
+#include <linux/compiler.h>
 
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
 #include <linux/acpi.h>
@@ -277,7 +279,7 @@ static int centrino_verify_cpu_id(const 
 }
 
 /* To be called only after centrino_model is initialized */
-static unsigned extract_clock(unsigned msr, unsigned int cpu)
+static unsigned extract_clock(unsigned msr, unsigned int cpu, int failsafe)
 {
 	int i;
 
@@ -299,15 +301,19 @@ static unsigned extract_clock(unsigned m
 	msr &= 0xffff;
 	for (i=0;centrino_model[cpu]->op_points[i].frequency != CPUFREQ_TABLE_END; i++) {
 		if (msr == centrino_model[cpu]->op_points[i].index)
-		return centrino_model[cpu]->op_points[i].frequency;
+			return centrino_model[cpu]->op_points[i].frequency;
 	}
-	return 0;
+	if (failsafe)
+		return centrino_model[cpu]->op_points[i-1].frequency;
+	else
+		return 0;
 }
 
 /* Return the current CPU frequency in kHz */
 static unsigned int get_cur_freq(unsigned int cpu)
 {
 	unsigned l, h;
+	unsigned clock_freq;
 	cpumask_t saved_mask;
 
 	saved_mask = current->cpus_allowed;
@@ -316,8 +322,34 @@ static unsigned int get_cur_freq(unsigne
 		return 0;
 
 	rdmsr(MSR_IA32_PERF_STATUS, l, h);
+	clock_freq = extract_clock(l, cpu, 0);
+
+	if (unlikely(clock_freq == 0)) {
+		/*
+		 * On some CPUs, we can see transient MSR values (which are
+		 * not present in _PSS), while CPU is doing some automatic
+		 * P-state transition (like TM2). Allow CPU to stabilize at
+		 * some freq and retry.
+		 * If we continue to see transients for long time, just return
+		 * the lowest possible frequency as best guess.
+		 */
+		int retries = 0;
+#define MAX_EXTRACT_CLOCK_RETRIES	5
+		while (clock_freq == 0 && retries < MAX_EXTRACT_CLOCK_RETRIES) {
+			udelay(100);
+			retries++;
+			rdmsr(MSR_IA32_PERF_STATUS, l, h);
+			clock_freq = extract_clock(l, cpu, 0);
+		}
+
+		if (clock_freq == 0) {
+			rdmsr(MSR_IA32_PERF_STATUS, l, h);
+			clock_freq = extract_clock(l, cpu, 1);
+		}
+	}
+
 	set_cpus_allowed(current, saved_mask);
-	return extract_clock(l, cpu);
+	return clock_freq;
 }
 
 
@@ -426,10 +458,10 @@ static int centrino_cpu_init_acpi(struct
 			continue;
 		}
 		
-		if (extract_clock(centrino_model[cpu]->op_points[i].index, cpu) !=
+		if (extract_clock(centrino_model[cpu]->op_points[i].index, cpu, 0) !=
 		    (centrino_model[cpu]->op_points[i].frequency)) {
 			dprintk("Invalid encoded frequency (%u vs. %u)\n",
-				extract_clock(centrino_model[cpu]->op_points[i].index, cpu),
+				extract_clock(centrino_model[cpu]->op_points[i].index, cpu, 0),
 				centrino_model[cpu]->op_points[i].frequency);
 			result = -EINVAL;
 			goto err_kfree_all;
@@ -605,8 +637,8 @@ static int centrino_target (struct cpufr
 	}
 
 	freqs.cpu = cpu;
-	freqs.old = extract_clock(oldmsr, cpu);
-	freqs.new = extract_clock(msr, cpu);
+	freqs.old = extract_clock(oldmsr, cpu, 0);
+	freqs.new = extract_clock(msr, cpu, 0);
 
 	dprintk("target=%dkHz old=%d new=%d msr=%04x\n",
 		target_freq, freqs.old, freqs.new, msr);
