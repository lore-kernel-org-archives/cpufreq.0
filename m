From: Ken Hughes <khughes@pacific.edu>
Subject: ACPI / cpufreq on Presario R3120
Date: Thu, 03 Jun 2004 07:32:38 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40BF3686.6030701@pacific.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cpufreq@www.linux.org.uk

I've got a Presario with an AMD XP-M 3000+ CPU (a 32-bit K8).
I can't get the acpi or powernow-k8 modules to load on the
2.6.6 kernel;  loading acpi gives this message:

  > acpi_processor_perf-0301 [1219] acpi_cpufreq_cpu_init : Unsupported 
address space [127, 127]

and powernow-k8 (with and without Pavel's patches) gives this:

  > powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 
1.20.08b - March 20, 2004)
  > powernow-k8: Too many lo freq table entries
  > powernow-k8: BIOS error - no PSB

I dumped the DSDT but it doesn't seem to have much info on the CPU.

The applicable section in my .config file is:

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
# CONFIG_CPU_FREQ_PROC_INTF is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=m
# CONFIG_CPU_FREQ_24_API is not set
CONFIG_CPU_FREQ_TABLE=m
 

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
CONFIG_X86_POWERNOW_K8=m
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set

Any suggestions where I should look?  I'm not sure if it's a
APCI or cpufreq issue  -- Ken
