From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 6/8]cpufreq: acpi-cpufreq: Eliminate get of current freq on
	notification
Date: Sun, 1 Oct 2006 07:15:45 -0700
Message-ID: <20061001071545.F16392@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>


Only change the frequency if the state previously set is different
from what we are trying to set. We don't really have to get the current
frequency at this point.

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>

Index: linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -325,11 +325,8 @@ static int acpi_cpufreq_target(struct cp
 	online_policy_cpus = policy->cpus;
 #endif
 
-	cmd.val = get_cur_val(online_policy_cpus);
-	freqs.old = extract_freq(cmd.val, data);
-	freqs.new = data->freq_table[next_state].frequency;
 	next_perf_state = data->freq_table[next_state].index;
-	if (freqs.new == freqs.old) {
+	if (perf->state == next_perf_state) {
 		if (unlikely(data->resume)) {
 			dprintk("Called after resume, resetting to P%d\n",
 				next_perf_state);
@@ -367,6 +364,8 @@ static int acpi_cpufreq_target(struct cp
 	else
 		cpu_set(policy->cpu, cmd.mask);
 
+	freqs.old = data->freq_table[perf->state].frequency;
+	freqs.new = data->freq_table[next_perf_state].frequency;
 	for_each_cpu_mask(i, cmd.mask) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
