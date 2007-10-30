From: =?ISO-8859-1?Q?Ferdinand_H=FCbner?= <fh@cvmx.org>
Subject: CPU-Frequency limited to lowest available frequency while under load
Date: Tue, 30 Oct 2007 11:23:42 +0100
Message-ID: <4727062E.9090806@cvmx.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040307080602020306000108"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------040307080602020306000108
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

since I've upgraded to 2.6.23, the current frequency scaling policy is
being changed whenever the CPU is under load.
My CPU is a Core2Duo T7200, frequency steps: 2.00 GHz, 1.67 GHz, 1.33
GHz, 1000 MHz
I'm using the acpi-cpufreq driver and am setting the governor to
'ondemand' via cpufrequtils.
When the system is booted, the scaling works as expected, the partial
output from cpufreq-info:

current policy: frequency should be within 1000 MHz and 2.00 GHz.

However, when I start compiling something the policy is being changed to
the following:

current policy: frequency should be within 1000 MHz and 1000 MHz.

This problem didn't exist with kernels prior to 2.6.23 (I was using
gentoo-sources most of the time), same behaviour as with 2.6.23 can be
observed with 2.6.24-rc1.

I'm not entirely sure if this is a problem with cpufreq, so I apologize
if this is not the right place to ask for help.

Anyway, everytime the maximum CPU frequency is being changed, I receive
the following ACPI events a few seconds afterwards (these events are not
being handled)

processor CPU0 00000080 00000003
processor CPU1 00000080 00000003

Setting the maximum frequency back to 2GHz (cpufreq-set -u 2000MHz) has
either no effect at all, or is being reverted to 1GHz 30 seconds after that.
The 'performance' governor is showing the same behaviour.

I've attached my kernel config for ACPI/CPUFREQ and the output from
acpitool -e.

What can I do to get the "old" behaviour back? I just want the maximum
frequency to stay at 2GHz...


Thank you,

Ferdinand


--------------040307080602020306000108
Content-Type: text/plain;
 name="kernel-config.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="kernel-config.txt"

#
# Power management options (ACPI, APM)
#
CONFIG_PM=y
# CONFIG_PM_LEGACY is not set
# CONFIG_PM_DEBUG is not set
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_SLEEP=y
CONFIG_SUSPEND_SMP_POSSIBLE=y
CONFIG_SUSPEND=y
CONFIG_HIBERNATION_SMP_POSSIBLE=y
# CONFIG_HIBERNATION is not set
CONFIG_ACPI=y
CONFIG_ACPI_SLEEP=y
# CONFIG_ACPI_PROCFS is not set
CONFIG_ACPI_PROC_EVENT=y
CONFIG_ACPI_BUTTON=y
# CONFIG_ACPI_VIDEO is not set
CONFIG_ACPI_FAN=y
CONFIG_ACPI_DOCK=y
# CONFIG_ACPI_BAY is not set
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_THERMAL=y
# CONFIG_ACPI_ASUS is not set
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_ACPI_BLACKLIST_YEAR=2001
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_DEBUG_FUNC_TRACE is not set
CONFIG_ACPI_EC=y
CONFIG_ACPI_POWER=y
CONFIG_ACPI_SYSTEM=y
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_CONTAINER=y
# CONFIG_APM is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
CONFIG_CPU_FREQ_DEBUG=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=y
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_CPUFREQ_NFORCE2 is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set
# CONFIG_X86_E_POWERSAVER is not set

#
# shared options
#
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
# CONFIG_X86_SPEEDSTEP_LIB is not set
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
CONFIG_CPU_IDLE_GOV_MENU=y

--------------040307080602020306000108
Content-Type: text/plain;
 name="acpitool.txt"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="acpitool.txt"

  Kernel version : 2.6.24-rc1   -    ACPI version : ������������2.6
  -----------------------------------------------------------
  Battery status : <not available>

  AC adapter     : <not available>
  Fan            : enabled
  Fan Speed      : 3507 RPM

  CPU type               : Intel(R) Core(TM)2 CPU         T7200  @ 2.00GHz 
  Min/Max frequency      : 1000/1000 MHz
  Current frequency      : 1000 MHz
  Frequency governor     : ondemand 
  Freq. scaling driver   : acpi-cpufreq 
  Cache size             : 4096 KB
  Bogomips               : 4023.70 
  Bogomips               : 3990.04 

  # of CPU's found       : 2

  Processor ID           : 0
  Bus mastering control  : yes
  Power management       : yes
  Throttling control     : yes
  Limit interface        : yes
  Active C-state         : C0
  C-states (incl. C0)    : 4
  Usage of state C1      : 4148 (0.0 %)
  Usage of state C2      : 13181091 (74.0 %)
  Usage of state C3      : 4636873 (26.0 %)
  T-state count          : 8
  Active T-state         : T8


  Processor ID           : 1
  Bus mastering control  : yes
  Power management       : yes
  Throttling control     : yes
  Limit interface        : yes
  Active C-state         : C0
  C-states (incl. C0)    : 4
  Usage of state C1      : 6062 (0.0 %)
  Usage of state C2      : 15254283 (67.6 %)
  Usage of state C3      : 2673667 (11.8 %)
  T-state count          : 8
  Active T-state         : T8



  Thermal zone 1 : ok, 52 C
  Trip points : 
  ------------- 
  critical (S5):           127 C

  Thermal zone 2 : ok, 53 C
  Trip points : 
  ------------- 
  critical (S5):           99 C
  passive:                 95 C: tc1=5 tc2=4 tsp=600 devices=CPU0 CPU1 


   Device	S-state	  Status   Sysfs node
  ---------------------------------------
  1. LID	  S3	*enabled   
  2. SLPB	  S3	*enabled   
  3. EXP0	  S4	 disabled  pci:0000:00:1c.0
  4. EXP1	  S4	 disabled  pci:0000:00:1c.1
  5. EXP2	  S4	 disabled  pci:0000:00:1c.2
  6. EXP3	  S4	 disabled  pci:0000:00:1c.3
  7. PCI1	  S4	 disabled  pci:0000:00:1e.0
  8. USB0	  S3	 disabled  pci:0000:00:1d.0
  9. USB1	  S3	 disabled  pci:0000:00:1d.1
  10. USB2	  S3	 disabled  pci:0000:00:1d.2
  11. USB7	  S3	 disabled  pci:0000:00:1d.7
  12. HDEF	  S4	 disabled  pci:0000:00:1b.0

--------------040307080602020306000108
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040307080602020306000108--

