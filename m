From: "Trevor Bowen" <m27315@gmail.com>
Subject: cpufreq-info fails for Intel Quad-Core X9650 (45nm Penryn)
Date: Mon, 14 Apr 2008 18:03:25 -0500
Message-ID: <a8472c960804141603o67daca87hedb8b7294d9fb962@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

Whenever I run cpufreq-info for the X9650, I get the following output error:

$ cpufreq-info
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU
analyzing CPU 2:
  no or unknown cpufreq driver is active on this CPU
analyzing CPU 3:
  no or unknown cpufreq driver is active on this CPU

I am using the 2.6.24-gentoo-r4 version of the kernel.  What am I doing
wrong?

TIA, m27315

The relevant portion of my kernel config is:

#
# Power management options
#
CONFIG_ARCH_HIBERNATION_HEADER=y
CONFIG_PM=y
CONFIG_PM_LEGACY=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_SLEEP_SMP=y
CONFIG_PM_SLEEP=y
CONFIG_SUSPEND_SMP_POSSIBLE=y
CONFIG_SUSPEND=y
CONFIG_HIBERNATION_SMP_POSSIBLE=y
CONFIG_HIBERNATION=y
CONFIG_PM_STD_PARTITION=""
CONFIG_ACPI=y
CONFIG_ACPI_SLEEP=y
CONFIG_ACPI_PROCFS=y
CONFIG_ACPI_PROCFS_POWER=y
CONFIG_ACPI_SYSFS_POWER=y
CONFIG_ACPI_PROC_EVENT=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
CONFIG_ACPI_FAN=y
CONFIG_ACPI_DOCK=y
# CONFIG_ACPI_BAY is not set
CONFIG_ACPI_PROCESSOR=m
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_THERMAL=m
# CONFIG_ACPI_ASUS is not set
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_ACPI_BLACKLIST_YEAR=0
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_EC=y
CONFIG_ACPI_POWER=y
CONFIG_ACPI_SYSTEM=y
CONFIG_X86_PM_TIMER=y
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_SBS=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=y
# CONFIG_CPU_FREQ_DEBUG is not set
CONFIG_CPU_FREQ_STAT=m
CONFIG_CPU_FREQ_STAT_DETAILS=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=m
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_POWERNOW_K8 is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_P4_CLOCKMOD=m

#
# shared options
#
CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
CONFIG_X86_SPEEDSTEP_LIB=m
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y

And, I have the following modules loaded:

$ lsmod -l
Module                  Size  Used by
snd_seq_dummy           4868  0
snd_seq_oss            33088  0
snd_seq_midi_event      8896  1 snd_seq_oss
snd_seq                55232  5 snd_seq_dummy,snd_seq_oss,snd_seq_midi_event
snd_seq_device          9300  3 snd_seq_dummy,snd_seq_oss,snd_seq
snd_pcm_oss            40736  0
snd_mixer_oss          17792  1 snd_pcm_oss
cpufreq_powersave       2688  0
thermal                19040  0
cpufreq_stats           7392  0
processor              41800  1 thermal
snd_hda_intel         354660  0
snd_pcm                79624  2 snd_pcm_oss,snd_hda_intel
snd_timer              24968  2 snd_seq,snd_pcm
snd_page_alloc         11664  2 snd_hda_intel,snd_pcm
snd_hwdep              11144  1 snd_hda_intel
snd                    62440  9
snd_seq_oss,snd_seq,snd_seq_device,snd_pcm_oss,snd_mixer_oss,snd_hda_intel,snd_pcm,snd_timer,snd_hwdep

Trying to load acpi-cpufreq yields:

$ modprobe acpi-cpufreq
FATAL: Error inserting acpi_cpufreq
(/lib/modules/2.6.24-gentoo-r4/kernel/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.ko):
No such device
Mon Apr 14 18:00:17 [root@ratchet]~
$ lt
/lib/modules/2.6.24-gentoo-r4/kernel/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.ko
-rw-r--r-- 1 root root 14843 2008-04-14 17:41:45.000000000 -0500
/lib/modules/2.6.24-gentoo-r4/kernel/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.ko
