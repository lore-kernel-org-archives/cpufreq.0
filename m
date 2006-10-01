From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 1/8]cpufreq: acpi-cpufreq: software coordination and handle
	all CPUs in the group
Date: Sun, 1 Oct 2006 07:05:27 -0700
Message-ID: <20061001070527.A16392@unix-os.sc.intel.com>
References: <20060901140753.D14821@unix-os.sc.intel.com>
	<20060927024051.GA19413@redhat.com>
	<20060927024148.GA29163@redhat.com>
	<20061001064126.A16290@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061001064126.A16290@unix-os.sc.intel.com>;
	from venkatesh.pallipadi@intel.com on Sun, Oct 01, 2006 at
	06:41:26AM -0700
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
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>


This patchset has refresh/rebase of a bunch of patches/bugfixes related to
acpi-cpufreq that were sent earlier on this list.

patch 1/8 
 Patch that fixes a bug in swcoordination code in acpi-cpufreq

patch 2/8 through patch 7/8
 Grand unification of ACPI based speedstep-centrino and acpi-cpufreq drivers.

 ACPI allows P-state transitions in multiple ways. Like using IO ports or using
 processor native method (MSR). Without this patch, IO port based P-state
 transitions are handled in acpi-cpufreq driver and MSR based transitions on
 Intel CPUs are handled in speedstep-centrino driver. Even though most of the
 code in these two drivers should be similar, except for final changing/checking
 of frequency (one driver does it using IO port and other does it through
 MSR), we have duplicated code in these two drivers. There are also issues
 around BIOSes supporting both MSR and IO port and which driver should be
 loaded first in standard installations.

 The patchset combines functionality of these two driver into acpi-cpufreq
 driver. ACPI based functionality in speedstep-centrino is marked deprecated
 and will be removed in future. speedstep-centrino will continue to work
 on systems that depend on older non-ACPI table based P-state chanes.

 * 2/8 - Patch that reorganizes the code in acpi-cpufreq, cleaning it up
 a little and making it easier to add MSR support later.
 * 3/8 - Pull in the MSR based transition support into acpi-cpufreq.
 * 4/8 - Mark speedstep-centrino deprecated. Change the order in Makefile to
 load acpi-cpufreq first and speedstep-centrino later, in cases where both
 are configured in.
 * 5/8 - lindent acpi-cpufreq.c
 * 6/8 - Minor change to eliminate the check of current frequency on
 notifications. We can use last set frequency instead.
 * 7/8 - Make cpufreq->get of acpi_cpufreq work correctly again.

 There will be a patch in future that removes ACPI based support in
 speedstep-centrino in coming months.

patch 8/8
Add support for IA32_APERF and IA32_MPERF MSR and get the actual frequency
from these MSRs and use it to determine the next frequency target in ondemand
governor

This patch:

There is a bug in software coordination patch in acpi-cpufreq, due to which 
frequency will only be set on first CPU of any coordinated group. 
Bug identified by Denis, was not recognised earlier as there are no platforms 
yet that use software coordination with acpi-cpufreq driver.


Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>


Index: linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -197,6 +197,7 @@ acpi_cpufreq_target (
 	unsigned int relation)
 {
 	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct cpufreq_acpi_io *cpudata;
 	struct acpi_processor_performance *perf;
 	struct cpufreq_freqs freqs;
 	cpumask_t online_policy_cpus;
@@ -260,7 +261,8 @@ acpi_cpufreq_target (
 			break;
 		}
 
-		result = acpi_processor_set_performance (data, j, next_state);
+		cpudata = acpi_io_data[j];
+		result = acpi_processor_set_performance(cpudata, j, next_state);
 		if (result) {
 			result = -EAGAIN;
 			break;
@@ -287,8 +289,11 @@ acpi_cpufreq_target (
 
 		if (!cpus_empty(covered_cpus)) {
 			for_each_cpu_mask(j, covered_cpus) {
-				policy->cpu = j;
-				acpi_processor_set_performance (data, 
+				cpus_clear(set_mask);
+				cpu_set(j, set_mask);
+				set_cpus_allowed(current, set_mask);
+				cpudata = acpi_io_data[j];
+				acpi_processor_set_performance(cpudata,
 						j, 
 						cur_state);
 			}
