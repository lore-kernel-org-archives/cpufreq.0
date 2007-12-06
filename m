From: "=?ISO-8859-1?Q?Petri_J=E4rvenp=E4=E4?=" <petri.jarvenpaa@gmail.com>
Subject: Re: Intel E21x0 processors
Date: Thu, 6 Dec 2007 14:51:18 +0200
Message-ID: <2a993050712060451n26e38d96wd6968a23f7738847@mail.gmail.com>
References: <2a993050712040639p40d0a8e8s45a2a73378c73c39@mail.gmail.com>
	<924EFEDD5F540B4284297C4DC59F3DEE34AB20@orsmsx423.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <924EFEDD5F540B4284297C4DC59F3DEE34AB20@orsmsx423.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

Hi.
Kernel is the current one in Gentoo repositories, 2.6.22-gentoo-r9.

Acpi-cpufreq module gives error about missing device.
# modprobe acpi_cpufreq
FATAL: Error inserting acpi_cpufreq
(/lib/modules/2.6.22-gentoo-r9-petrin/kernel/arch/x86_64/kernel/cpufreq/acp=
i-
cpufreq.ko): No such device

Cpufreq-info does not list anything usefull, presumably because the driver
above won=B4t load.
#cpufreq-info
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU

This all on a E2180 in Gigabyte GA-P35-DS3R motherboard, EIST and C1E are
enabled in BIOS.
Any ideas what I am doing wrong here?

Best regards,
Petri

PS. Kernel configuration (if needed):

#
# Processor type and features
#
CONFIG_X86_PC=3Dy
# CONFIG_X86_VSMP is not set
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
CONFIG_MCORE2=3Dy
# CONFIG_GENERIC_CPU is not set
CONFIG_X86_L1_CACHE_BYTES=3D64
CONFIG_X86_L1_CACHE_SHIFT=3D6
CONFIG_X86_INTERNODE_CACHE_BYTES=3D64
CONFIG_X86_TSC=3Dy
CONFIG_X86_GOOD_APIC=3Dy
CONFIG_MICROCODE=3Dy
CONFIG_MICROCODE_OLD_INTERFACE=3Dy
CONFIG_X86_MSR=3Dy
CONFIG_X86_CPUID=3Dy
CONFIG_X86_HT=3Dy
CONFIG_X86_IO_APIC=3Dy
CONFIG_X86_LOCAL_APIC=3Dy
CONFIG_MTRR=3Dy
CONFIG_SMP=3Dy
CONFIG_SCHED_SMT=3Dy
CONFIG_SCHED_MC=3Dy
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=3Dy
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_BKL=3Dy
# CONFIG_NUMA is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
CONFIG_ARCH_FLATMEM_ENABLE=3Dy
CONFIG_SELECT_MEMORY_MODEL=3Dy
CONFIG_FLATMEM_MANUAL=3Dy
# CONFIG_DISCONTIGMEM_MANUAL is not set
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=3Dy
CONFIG_FLAT_NODE_MEM_MAP=3Dy
# CONFIG_SPARSEMEM_STATIC is not set
CONFIG_SPLIT_PTLOCK_CPUS=3D4
CONFIG_RESOURCES_64BIT=3Dy
CONFIG_ZONE_DMA_FLAG=3D1
CONFIG_NR_CPUS=3D8
CONFIG_HOTPLUG_CPU=3Dy
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
CONFIG_HPET_TIMER=3Dy
CONFIG_HPET_EMULATE_RTC=3Dy
CONFIG_IOMMU=3Dy
# CONFIG_CALGARY_IOMMU is not set
CONFIG_SWIOTLB=3Dy
CONFIG_X86_MCE=3Dy
CONFIG_X86_MCE_INTEL=3Dy
# CONFIG_X86_MCE_AMD is not set
# CONFIG_KEXEC is not set
# CONFIG_CRASH_DUMP is not set
# CONFIG_RELOCATABLE is not set
CONFIG_PHYSICAL_START=3D0x200000
CONFIG_SECCOMP=3Dy
# CONFIG_CC_STACKPROTECTOR is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=3Dy
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=3D250
CONFIG_K8_NB=3Dy
CONFIG_GENERIC_HARDIRQS=3Dy
CONFIG_GENERIC_IRQ_PROBE=3Dy
CONFIG_ISA_DMA_API=3Dy
CONFIG_GENERIC_PENDING_IRQ=3Dy

#
# Power management options
#
CONFIG_PM=3Dy
# CONFIG_PM_LEGACY is not set
# CONFIG_PM_DEBUG is not set
# CONFIG_PM_SYSFS_DEPRECATED is not set
# CONFIG_SOFTWARE_SUSPEND is not set
CONFIG_SUSPEND_SMP=3Dy

#
# ACPI (Advanced Configuration and Power Interface) Support
#
CONFIG_ACPI=3Dy
CONFIG_ACPI_SLEEP=3Dy
CONFIG_ACPI_SLEEP_PROC_FS=3Dy
# CONFIG_ACPI_SLEEP_PROC_SLEEP is not set
# CONFIG_ACPI_PROCFS is not set
# CONFIG_ACPI_AC is not set
# CONFIG_ACPI_BATTERY is not set
CONFIG_ACPI_BUTTON=3Dy
CONFIG_ACPI_VIDEO=3Dy
CONFIG_ACPI_FAN=3Dy
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_PROCESSOR=3Dy
CONFIG_ACPI_HOTPLUG_CPU=3Dy
CONFIG_ACPI_THERMAL=3Dy
# CONFIG_ACPI_ASUS is not set
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_ACPI_BLACKLIST_YEAR=3D0
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_EC=3Dy
CONFIG_ACPI_POWER=3Dy
CONFIG_ACPI_SYSTEM=3Dy
CONFIG_X86_PM_TIMER=3Dy
CONFIG_ACPI_CONTAINER=3Dy
# CONFIG_ACPI_SBS is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
CONFIG_CPU_FREQ_TABLE=3Dm
# CONFIG_CPU_FREQ_DEBUG is not set
CONFIG_CPU_FREQ_STAT=3Dm
# CONFIG_CPU_FREQ_STAT_DETAILS is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm

#
# CPUFreq processor drivers
#
# CONFIG_X86_POWERNOW_K8 is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
CONFIG_X86_ACPI_CPUFREQ=3Dm

#
# shared options
#
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
# CONFIG_X86_SPEEDSTEP_LIB is not set

On Dec 5, 2007 1:38 AM, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.com>
wrote:

>
> Should work with acpi-cpufreq driver with any latest version of kernel and
> speedstep_centrino.c with older kernel versions (before 2.6.19).
>
> Is it not working for you? What kernel version are you using?
>
> Thanks,
> Venki
>
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Petri
> >J=E4rvenp=E4=E4
> >Sent: Tuesday, December 04, 2007 6:39 AM
> >To: cpufreq@lists.linux.org.uk
> >Subject: Intel E21x0 processors
> >
> >Hello all and well met.
> >I=B4ve tried searching Google and your list archives, but one
> >answer to this
> >question still eludes me:
> >Does Intel E21x0 processor (E2180 to be exact) work with
> >cpufreq currently?
> >
> >If not:
> >       is it going to work at all?
> >       I wont bore you with more details.
> >if yes:
> >       Since what version of Kernel and cpufreq?
> >       More info on my predicament to follow, maybe.
> >
> >Best regards,
> >Petri J=E4rvenp=E4=E4
> >
> >PS. Hopefully this goes by-the-book, I am pretty new to this
> >mailing list
> >thing.
> >_______________________________________________
> >Cpufreq mailing list
> >Cpufreq@lists.linux.org.uk
> >http://lists.linux.org.uk/mailman/listinfo/cpufreq
> >
>
