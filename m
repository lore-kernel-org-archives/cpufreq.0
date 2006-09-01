From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] acpi-cpufreq and software coordination
Date: Fri, 1 Sep 2006 13:58:57 -0700
Message-ID: <20060901135857.A14821@unix-os.sc.intel.com>
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
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>



There is a bug in software coordination patch in acpi-cpufreq, due to which 
frequency will only be set on first CPU of any coordinated group. 
Bug identified by Denis, was not recognised earlier as there are no platforms 
yet that use software coordination with acpi-cpufreq driver.


Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>


Index: linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18-rc4.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18-rc4/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -196,6 +196,7 @@ acpi_cpufreq_target (
 	unsigned int relation)
 {
 	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct cpufreq_acpi_io *cpudata;
 	struct acpi_processor_performance *perf;
 	struct cpufreq_freqs freqs;
 	cpumask_t online_policy_cpus;
@@ -259,7 +260,8 @@ acpi_cpufreq_target (
 			break;
 		}
 
-		result = acpi_processor_set_performance (data, j, next_state);
+		cpudata = acpi_io_data[j];
+		result = acpi_processor_set_performance(cpudata, j, next_state);
 		if (result) {
 			result = -EAGAIN;
 			break;
@@ -286,8 +288,11 @@ acpi_cpufreq_target (
 
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
