From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 7880] New: cpufreq detects wrong frequency on VIA Esther CPU
	(C7-1500)
Date: Wed, 24 Jan 2007 13:30:42 -0800
Message-ID: <200701242130.l0OLUg04026213@fire-2.osdl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=7880

           Summary: cpufreq detects wrong frequency on VIA Esther CPU (C7-
                    1500)
    Kernel Version: 2.6.20-rc5
            Status: NEW
          Severity: normal
             Owner: cpufreq@www.linux.org.uk
         Submitter: claas@rootdir.de


Most recent kernel where this bug did *NOT* occur: none known
Distribution: Ubuntu Edgy, but the kernel is built from the sources
Hardware Environment: VIA EPIA EX mini-ITX system EX15000g
Software Environment: Ubuntu Linux 6.10 "Edgy Eft"
Problem Description: cpufreq detects the CPU to also have 65.54 GHz!

Apart from that, the CPU switches between 800 and 1500 correctly.

See this:

# cpufreq-info 
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 800 MHz - 65.54 GHz
  available frequency steps: 1.50 GHz, 800 MHz, 65.54 GHz
  available cpufreq governors: userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 1.50 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 1.50 GHz.



Steps to reproduce: 

# cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq 
65535000

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
1500000 800000 65535000 

### But this looks good:
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 
1500000


# cat /proc/cpuinfo 
processor       : 0
vendor_id       : CentaurHauls
cpu family      : 6
model           : 10
model name      : VIA Esther processor 1500MHz
stepping        : 9
cpu MHz         : 800.000
cache size      : 128 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 1
wp              : yes
flags           : fpu vme de pse tsc msr pae mce apic sep mtrr pge cmov pat
clflush acpi mmx fxsr sse sse2 pni est rng rng_en ace ace_en ace2 ace2_en phe
phe_en pmm pmm_en
bogomips        : 1600.96
clflush size    : 64


and from the kernel .config:

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
# CONFIG_CPU_FREQ_DEBUG is not set
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_STAT_DETAILS=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=m
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=m
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



many regards, 
  claas

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
