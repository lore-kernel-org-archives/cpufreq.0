From: "Brane F. =?utf-8?q?Gra=C4=8Dnar?=" <bfg@interseek.si>
Subject: P4 Xeon (em64t) - maximum frequency is not detected
Date: Wed, 21 Jun 2006 14:33:10 +0200
Message-ID: <200606211433.10833.bfg@interseek.si>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_GyTmEbZ54H+1bqW"
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

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello

I have a strange problem with my P4 Xeon 64bit installation. I'm using slamd 
10.2 in exclusively 64bit mode.

I've compiled my custom kernel (2.6.16.20 - vanilla), but kernel didn't detect 
any cpu freq interfaces. Becouse everything worked on the same hardware with 
32bit kernel, i decided to remove line "depends EMBEDDED" in 
file ./arch/x86_64/kernel/cpufreq/Kconfig in section X86_P4_CLOCKMOD.

After kernel was recompiled, cpufreq interfaces appeared in sysfs. Great.

No i have weird problem. CPU frequency is not set to maximum hardware 
frequency on 3.2GHz processors.

I have servers with two type of cpus:

- p4 xeon 3.2GHz with em64t (processor runs at 2.8 GHz, not ok)
- p4 xeon 3.4GHz with em64t. (everything works ok)

I've attached several files files.

- dmesg output for both machines
- cpufreq-info output for both machines
- /proc/cpuinfo output for both machines
- kernel configuration file

ok-* files were taken from machine that runs ok, bad-* files were taken from 
3.2GHZ machine.

Both machines have 2 processors with hyperthreading enabled.

Can anyone suggest me how to raise maximum cpu frequency on 3.2ghz processor?

Thanks in advance :)

Brane

-- 
	The Gray-haired Woman's Complaint

My back aches, my pussy is sore;
I simply can't fuck any more;
	I'm covered with sweat,
	And you haven't come yet,
And my God, it's a quarter to four!

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="kernel-config.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="kernel-config.txt"

#
# Automatically generated make config: don't edit
# Linux kernel version: 2.6.16.20
# Mon Jun 19 20:57:50 2006
#
CONFIG_X86_64=y
CONFIG_64BIT=y
CONFIG_X86=y
CONFIG_SEMAPHORE_SLEEPERS=y
CONFIG_MMU=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_X86_CMPXCHG=y
CONFIG_EARLY_PRINTK=y
CONFIG_GENERIC_ISA_DMA=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_DMI=y

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=y
CONFIG_LOCK_KERNEL=y
CONFIG_INIT_ENV_ARG_LIMIT=32

#
# General setup
#
CONFIG_LOCALVERSION="-1"
CONFIG_LOCALVERSION_AUTO=y
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_SYSCTL=y
# CONFIG_AUDIT is not set
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
# CONFIG_CPUSETS is not set
CONFIG_INITRAMFS_SOURCE=""
CONFIG_UID16=y
CONFIG_VM86=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
# CONFIG_EMBEDDED is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_EXTRA_PASS is not set
CONFIG_HOTPLUG=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SHMEM=y
CONFIG_CC_ALIGN_FUNCTIONS=0
CONFIG_CC_ALIGN_LABELS=0
CONFIG_CC_ALIGN_LOOPS=0
CONFIG_CC_ALIGN_JUMPS=0
CONFIG_SLAB=y
# CONFIG_TINY_SHMEM is not set
CONFIG_BASE_SMALL=0
# CONFIG_SLOB is not set

#
# Loadable module support
#
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_MODULE_FORCE_UNLOAD=y
CONFIG_OBSOLETE_MODPARM=y
CONFIG_MODVERSIONS=y
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_KMOD is not set
CONFIG_STOP_MACHINE=y

#
# Block layer
#
CONFIG_LBD=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_AS=y
CONFIG_IOSCHED_DEADLINE=y
CONFIG_IOSCHED_CFQ=y
CONFIG_DEFAULT_AS=y
# CONFIG_DEFAULT_DEADLINE is not set
# CONFIG_DEFAULT_CFQ is not set
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="anticipatory"

#
# Processor type and features
#
CONFIG_X86_PC=y
# CONFIG_X86_VSMP is not set
# CONFIG_MK8 is not set
CONFIG_MPSC=y
# CONFIG_GENERIC_CPU is not set
CONFIG_X86_L1_CACHE_BYTES=128
CONFIG_X86_L1_CACHE_SHIFT=7
CONFIG_X86_TSC=y
CONFIG_X86_GOOD_APIC=y
# CONFIG_MICROCODE is not set
CONFIG_X86_MSR=y
CONFIG_X86_CPUID=y
CONFIG_X86_HT=y
CONFIG_X86_IO_APIC=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_MTRR=y
CONFIG_SMP=y
CONFIG_SCHED_SMT=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
# CONFIG_PREEMPT_BKL is not set
# CONFIG_NUMA is not set
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_SELECT_MEMORY_MODEL=y
CONFIG_FLATMEM_MANUAL=y
# CONFIG_DISCONTIGMEM_MANUAL is not set
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
# CONFIG_SPARSEMEM_STATIC is not set
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_NR_CPUS=8
# CONFIG_HOTPLUG_CPU is not set
CONFIG_HPET_TIMER=y
CONFIG_HPET_EMULATE_RTC=y
CONFIG_GART_IOMMU=y
CONFIG_SWIOTLB=y
CONFIG_X86_MCE=y
CONFIG_X86_MCE_INTEL=y
# CONFIG_X86_MCE_AMD is not set
# CONFIG_KEXEC is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x100000
CONFIG_SECCOMP=y
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_GENERIC_HARDIRQS=y
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_ISA_DMA_API=y
CONFIG_GENERIC_PENDING_IRQ=y

#
# Power management options
#
CONFIG_PM=y
# CONFIG_PM_LEGACY is not set
# CONFIG_PM_DEBUG is not set

#
# ACPI (Advanced Configuration and Power Interface) Support
#
CONFIG_ACPI=y
CONFIG_ACPI_AC=y
CONFIG_ACPI_BATTERY=y
CONFIG_ACPI_BUTTON=y
CONFIG_ACPI_VIDEO=y
# CONFIG_ACPI_HOTKEY is not set
CONFIG_ACPI_FAN=y
CONFIG_ACPI_PROCESSOR=y
CONFIG_ACPI_THERMAL=y
# CONFIG_ACPI_ASUS is not set
# CONFIG_ACPI_IBM is not set
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_ACPI_BLACKLIST_YEAR=0
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_EC=y
CONFIG_ACPI_POWER=y
CONFIG_ACPI_SYSTEM=y
CONFIG_X86_PM_TIMER=y
# CONFIG_ACPI_CONTAINER is not set

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
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y

#
# CPUFreq processor drivers
#
# CONFIG_X86_POWERNOW_K8 is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
CONFIG_X86_ACPI_CPUFREQ=y

#
# shared options
#
CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
CONFIG_X86_P4_CLOCKMOD=y
CONFIG_X86_SPEEDSTEP_LIB=y

#
# Bus options (PCI etc.)
#
CONFIG_PCI=y
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_UNORDERED_IO=y
CONFIG_PCIEPORTBUS=y
CONFIG_PCI_MSI=y
CONFIG_PCI_LEGACY_PROC=y

#
# PCCARD (PCMCIA/CardBus) support
#
# CONFIG_PCCARD is not set

#
# PCI Hotplug Support
#
# CONFIG_HOTPLUG_PCI is not set

#
# Executable file formats / Emulations
#
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_MISC=y
CONFIG_IA32_EMULATION=y
# CONFIG_IA32_AOUT is not set
CONFIG_COMPAT=y
CONFIG_SYSVIPC_COMPAT=y

#
# Networking
#
CONFIG_NET=y

#
# Networking options
#
# CONFIG_NETDEBUG is not set
CONFIG_PACKET=y
CONFIG_PACKET_MMAP=y
CONFIG_UNIX=y
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_FIB_HASH=y
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_ARPD is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_TUNNEL is not set
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_BIC=y
# CONFIG_IPV6 is not set
# CONFIG_NETFILTER is not set

#
# DCCP Configuration (EXPERIMENTAL)
#
# CONFIG_IP_DCCP is not set

#
# SCTP Configuration (EXPERIMENTAL)
#
# CONFIG_IP_SCTP is not set

#
# TIPC Configuration (EXPERIMENTAL)
#
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set

#
# QoS and/or fair queueing
#
# CONFIG_NET_SCHED is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_HAMRADIO is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
# CONFIG_IEEE80211 is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_FW_LOADER=y

#
# Connector - unified userspace <-> kernelspace linker
#
CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Memory Technology Devices (MTD)
#
# CONFIG_MTD is not set

#
# Parallel port support
#
# CONFIG_PARPORT is not set

#
# Plug and Play support
#
CONFIG_PNP=y
# CONFIG_PNP_DEBUG is not set

#
# Protocols
#
CONFIG_PNPACPI=y

#
# Block devices
#
CONFIG_BLK_DEV_FD=y
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_CRYPTOLOOP=y
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
CONFIG_BLK_DEV_INITRD=y
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set

#
# ATA/ATAPI/MFM/RLL support
#
CONFIG_IDE=y
CONFIG_BLK_DEV_IDE=y

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_IDE_SATA is not set
# CONFIG_BLK_DEV_HD_IDE is not set
CONFIG_BLK_DEV_IDEDISK=y
# CONFIG_IDEDISK_MULTI_MODE is not set
CONFIG_BLK_DEV_IDECD=y
# CONFIG_BLK_DEV_IDETAPE is not set
# CONFIG_BLK_DEV_IDEFLOPPY is not set
# CONFIG_BLK_DEV_IDESCSI is not set
# CONFIG_IDE_TASK_IOCTL is not set

#
# IDE chipset support/bugfixes
#
CONFIG_IDE_GENERIC=y
# CONFIG_BLK_DEV_CMD640 is not set
# CONFIG_BLK_DEV_IDEPNP is not set
CONFIG_BLK_DEV_IDEPCI=y
# CONFIG_IDEPCI_SHARE_IRQ is not set
# CONFIG_BLK_DEV_OFFBOARD is not set
CONFIG_BLK_DEV_GENERIC=y
# CONFIG_BLK_DEV_OPTI621 is not set
# CONFIG_BLK_DEV_RZ1000 is not set
CONFIG_BLK_DEV_IDEDMA_PCI=y
CONFIG_BLK_DEV_IDEDMA_FORCED=y
CONFIG_IDEDMA_PCI_AUTO=y
# CONFIG_IDEDMA_ONLYDISK is not set
# CONFIG_BLK_DEV_AEC62XX is not set
# CONFIG_BLK_DEV_ALI15X3 is not set
# CONFIG_BLK_DEV_AMD74XX is not set
# CONFIG_BLK_DEV_ATIIXP is not set
# CONFIG_BLK_DEV_CMD64X is not set
# CONFIG_BLK_DEV_TRIFLEX is not set
# CONFIG_BLK_DEV_CY82C693 is not set
# CONFIG_BLK_DEV_CS5520 is not set
# CONFIG_BLK_DEV_CS5530 is not set
# CONFIG_BLK_DEV_HPT34X is not set
# CONFIG_BLK_DEV_HPT366 is not set
# CONFIG_BLK_DEV_SC1200 is not set
CONFIG_BLK_DEV_PIIX=y
# CONFIG_BLK_DEV_IT821X is not set
# CONFIG_BLK_DEV_NS87415 is not set
# CONFIG_BLK_DEV_PDC202XX_OLD is not set
# CONFIG_BLK_DEV_PDC202XX_NEW is not set
# CONFIG_BLK_DEV_SVWKS is not set
# CONFIG_BLK_DEV_SIIMAGE is not set
# CONFIG_BLK_DEV_SIS5513 is not set
# CONFIG_BLK_DEV_SLC90E66 is not set
# CONFIG_BLK_DEV_TRM290 is not set
# CONFIG_BLK_DEV_VIA82CXXX is not set
# CONFIG_IDE_ARM is not set
CONFIG_BLK_DEV_IDEDMA=y
# CONFIG_IDEDMA_IVB is not set
CONFIG_IDEDMA_AUTO=y
# CONFIG_BLK_DEV_HD is not set

#
# SCSI device support
#
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
# CONFIG_CHR_DEV_OSST is not set
# CONFIG_BLK_DEV_SR is not set
CONFIG_CHR_DEV_SG=y
# CONFIG_CHR_DEV_SCH is not set

#
# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
#
# CONFIG_SCSI_MULTI_LUN is not set
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y

#
# SCSI Transport Attributes
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set

#
# SCSI low-level drivers
#
# CONFIG_ISCSI_TCP is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
CONFIG_SCSI_3W_9XXX=y
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
CONFIG_SCSI_AIC7XXX=y
CONFIG_AIC7XXX_CMDS_PER_DEVICE=32
CONFIG_AIC7XXX_RESET_DELAY_MS=15000
# CONFIG_AIC7XXX_DEBUG_ENABLE is not set
CONFIG_AIC7XXX_DEBUG_MASK=0
CONFIG_AIC7XXX_REG_PRETTY_PRINT=y
# CONFIG_SCSI_AIC7XXX_OLD is not set
CONFIG_SCSI_AIC79XX=y
CONFIG_AIC79XX_CMDS_PER_DEVICE=32
CONFIG_AIC79XX_RESET_DELAY_MS=15000
CONFIG_AIC79XX_ENABLE_RD_STRM=y
# CONFIG_AIC79XX_DEBUG_ENABLE is not set
CONFIG_AIC79XX_DEBUG_MASK=0
CONFIG_AIC79XX_REG_PRETTY_PRINT=y
CONFIG_MEGARAID_NEWGEN=y
CONFIG_MEGARAID_MM=y
CONFIG_MEGARAID_MAILBOX=y
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
CONFIG_SCSI_SATA=y
CONFIG_SCSI_SATA_AHCI=y
# CONFIG_SCSI_SATA_SVW is not set
CONFIG_SCSI_ATA_PIIX=y
# CONFIG_SCSI_SATA_MV is not set
# CONFIG_SCSI_SATA_NV is not set
# CONFIG_SCSI_PDC_ADMA is not set
# CONFIG_SCSI_SATA_QSTOR is not set
# CONFIG_SCSI_SATA_PROMISE is not set
# CONFIG_SCSI_SATA_SX4 is not set
CONFIG_SCSI_SATA_SIL=y
CONFIG_SCSI_SATA_SIL24=y
# CONFIG_SCSI_SATA_SIS is not set
# CONFIG_SCSI_SATA_ULI is not set
# CONFIG_SCSI_SATA_VIA is not set
# CONFIG_SCSI_SATA_VITESSE is not set
CONFIG_SCSI_SATA_INTEL_COMBINED=y
CONFIG_SCSI_BUSLOGIC=y
# CONFIG_SCSI_OMIT_FLASHPOINT is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_EATA is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
# CONFIG_SCSI_SYM53C8XX_IOMAPPED is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_FC is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_DEBUG is not set

#
# Multi-device support (RAID and LVM)
#
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_RAID5=y
CONFIG_MD_RAID6=y
CONFIG_MD_MULTIPATH=y
CONFIG_MD_FAULTY=y
CONFIG_BLK_DEV_DM=y
CONFIG_DM_CRYPT=y
CONFIG_DM_SNAPSHOT=y
CONFIG_DM_MIRROR=y
CONFIG_DM_ZERO=y
CONFIG_DM_MULTIPATH=y
CONFIG_DM_MULTIPATH_EMC=y

#
# Fusion MPT device support
#
CONFIG_FUSION=y
CONFIG_FUSION_SPI=y
# CONFIG_FUSION_FC is not set
# CONFIG_FUSION_SAS is not set
CONFIG_FUSION_MAX_SGE=128
CONFIG_FUSION_CTL=y

#
# IEEE 1394 (FireWire) support
#
# CONFIG_IEEE1394 is not set

#
# I2O device support
#
# CONFIG_I2O is not set

#
# Network device support
#
CONFIG_NETDEVICES=y
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
# CONFIG_TUN is not set
# CONFIG_NET_SB1000 is not set

#
# ARCnet devices
#
# CONFIG_ARCNET is not set

#
# PHY device support
#
# CONFIG_PHYLIB is not set

#
# Ethernet (10 or 100Mbit)
#
CONFIG_NET_ETHERNET=y
CONFIG_MII=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NET_VENDOR_3COM is not set

#
# Tulip family network device support
#
# CONFIG_NET_TULIP is not set
# CONFIG_HP100 is not set
CONFIG_NET_PCI=y
CONFIG_PCNET32=y
# CONFIG_AMD8111_ETH is not set
# CONFIG_ADAPTEC_STARFIRE is not set
# CONFIG_B44 is not set
# CONFIG_FORCEDETH is not set
# CONFIG_DGRS is not set
# CONFIG_EEPRO100 is not set
CONFIG_E100=y
# CONFIG_FEALNX is not set
# CONFIG_NATSEMI is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_SIS900 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SUNDANCE is not set
# CONFIG_VIA_RHINE is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_DL2K is not set
CONFIG_E1000=y
# CONFIG_E1000_NAPI is not set
# CONFIG_E1000_DISABLE_PACKET_SPLIT is not set
# CONFIG_NS83820 is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_R8169 is not set
# CONFIG_SIS190 is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
CONFIG_SK98LIN=y
# CONFIG_VIA_VELOCITY is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2 is not set

#
# Ethernet (10000 Mbit)
#
# CONFIG_CHELSIO_T1 is not set
# CONFIG_IXGB is not set
# CONFIG_S2IO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set

#
# Wireless LAN (non-hamradio)
#
# CONFIG_NET_RADIO is not set

#
# Wan interfaces
#
# CONFIG_WAN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
# CONFIG_NET_FC is not set
# CONFIG_SHAPER is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Telephony Support
#
# CONFIG_PHONE is not set

#
# Input device support
#
CONFIG_INPUT=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_TSDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ATKBD=y
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_I8042=y
# CONFIG_SERIO_SERPORT is not set
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=y
# CONFIG_SERIO_RAW is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_VT=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_SERIAL_NONSTANDARD is not set

#
# Serial drivers
#
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_CONSOLE is not set
# CONFIG_SERIAL_8250_ACPI is not set
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set

#
# Non-8250 serial port support
#
CONFIG_SERIAL_CORE=y
# CONFIG_SERIAL_JSM is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256

#
# IPMI
#
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
CONFIG_IPMI_DEVICE_INTERFACE=y
CONFIG_IPMI_SI=y
CONFIG_IPMI_WATCHDOG=y
CONFIG_IPMI_POWEROFF=y

#
# Watchdog Cards
#
CONFIG_WATCHDOG=y
# CONFIG_WATCHDOG_NOWAYOUT is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=y
# CONFIG_ACQUIRE_WDT is not set
# CONFIG_ADVANTECH_WDT is not set
# CONFIG_ALIM1535_WDT is not set
# CONFIG_ALIM7101_WDT is not set
# CONFIG_SC520_WDT is not set
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
# CONFIG_IBMASR is not set
# CONFIG_WAFER_WDT is not set
CONFIG_I6300ESB_WDT=y
CONFIG_I8XX_TCO=y
# CONFIG_SC1200_WDT is not set
# CONFIG_60XX_WDT is not set
# CONFIG_SBC8360_WDT is not set
# CONFIG_CPU5_WDT is not set
# CONFIG_W83627HF_WDT is not set
# CONFIG_W83877F_WDT is not set
# CONFIG_W83977F_WDT is not set
# CONFIG_MACHZ_WDT is not set
# CONFIG_SBC_EPX_C3_WATCHDOG is not set

#
# PCI-based Watchdog Cards
#
# CONFIG_PCIPCWATCHDOG is not set
# CONFIG_WDTPCI is not set
CONFIG_HW_RANDOM=y
CONFIG_NVRAM=y
CONFIG_RTC=y
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set

#
# Ftape, the floppy tape device driver
#
CONFIG_AGP=y
CONFIG_AGP_AMD64=y
# CONFIG_AGP_INTEL is not set
# CONFIG_DRM is not set
# CONFIG_MWAVE is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_HPET is not set
CONFIG_HANGCHECK_TIMER=y

#
# TPM devices
#
# CONFIG_TCG_TPM is not set
# CONFIG_TELCLOCK is not set

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_CHARDEV=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=y
CONFIG_I2C_ALGOPCA=y

#
# I2C Hardware Bus support
#
CONFIG_I2C_ALI1535=y
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
CONFIG_I2C_I801=y
CONFIG_I2C_I810=y
CONFIG_I2C_PIIX4=y
CONFIG_I2C_ISA=y
# CONFIG_I2C_NFORCE2 is not set
CONFIG_I2C_PARPORT_LIGHT=y
# CONFIG_I2C_PROSAVAGE is not set
# CONFIG_I2C_SAVAGE4 is not set
CONFIG_SCx200_ACB=y
CONFIG_I2C_SIS5595=y
CONFIG_I2C_SIS630=y
CONFIG_I2C_SIS96X=y
# CONFIG_I2C_STUB is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set
# CONFIG_I2C_VOODOO3 is not set
# CONFIG_I2C_PCA_ISA is not set

#
# Miscellaneous I2C Chip support
#
CONFIG_SENSORS_DS1337=y
CONFIG_SENSORS_DS1374=y
CONFIG_SENSORS_EEPROM=y
# CONFIG_SENSORS_PCF8574 is not set
# CONFIG_SENSORS_PCA9539 is not set
# CONFIG_SENSORS_PCF8591 is not set
CONFIG_SENSORS_RTC8564=y
CONFIG_SENSORS_MAX6875=y
CONFIG_RTC_X1205_I2C=y
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# CONFIG_I2C_DEBUG_CHIP is not set

#
# SPI support
#
# CONFIG_SPI is not set
# CONFIG_SPI_MASTER is not set

#
# Dallas's 1-wire bus
#
# CONFIG_W1 is not set

#
# Hardware Monitoring support
#
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_SENSORS_ADM1021=y
CONFIG_SENSORS_ADM1025=y
CONFIG_SENSORS_ADM1026=y
CONFIG_SENSORS_ADM1031=y
CONFIG_SENSORS_ADM9240=y
CONFIG_SENSORS_ASB100=y
CONFIG_SENSORS_ATXP1=y
CONFIG_SENSORS_DS1621=y
CONFIG_SENSORS_F71805F=y
CONFIG_SENSORS_FSCHER=y
CONFIG_SENSORS_FSCPOS=y
CONFIG_SENSORS_GL518SM=y
CONFIG_SENSORS_GL520SM=y
CONFIG_SENSORS_IT87=y
CONFIG_SENSORS_LM63=y
CONFIG_SENSORS_LM75=y
CONFIG_SENSORS_LM77=y
CONFIG_SENSORS_LM78=y
CONFIG_SENSORS_LM80=y
CONFIG_SENSORS_LM83=y
CONFIG_SENSORS_LM85=y
CONFIG_SENSORS_LM87=y
CONFIG_SENSORS_LM90=y
CONFIG_SENSORS_LM92=y
CONFIG_SENSORS_MAX1619=y
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_SIS5595=y
CONFIG_SENSORS_SMSC47M1=y
CONFIG_SENSORS_SMSC47B397=y
CONFIG_SENSORS_VIA686A=y
# CONFIG_SENSORS_VT8231 is not set
CONFIG_SENSORS_W83781D=y
CONFIG_SENSORS_W83792D=y
CONFIG_SENSORS_W83L785TS=y
CONFIG_SENSORS_W83627HF=y
CONFIG_SENSORS_W83627EHF=y
# CONFIG_SENSORS_HDAPS is not set
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Misc devices
#
# CONFIG_IBM_ASM is not set

#
# Multimedia Capabilities Port drivers
#

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# Digital Video Broadcasting Devices
#
# CONFIG_DVB is not set

#
# Graphics support
#
CONFIG_FB=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
# CONFIG_FB_MACMODES is not set
# CONFIG_FB_MODE_HELPERS is not set
# CONFIG_FB_TILEBLITTING is not set
# CONFIG_FB_CIRRUS is not set
# CONFIG_FB_PM2 is not set
# CONFIG_FB_CYBER2000 is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_ASILIANT is not set
# CONFIG_FB_IMSTT is not set
CONFIG_FB_VGA16=y
CONFIG_FB_VESA=y
CONFIG_VIDEO_SELECT=y
# CONFIG_FB_HGA is not set
# CONFIG_FB_S1D13XXX is not set
# CONFIG_FB_NVIDIA is not set
# CONFIG_FB_RIVA is not set
# CONFIG_FB_MATROX is not set
# CONFIG_FB_RADEON_OLD is not set
# CONFIG_FB_RADEON is not set
# CONFIG_FB_ATY128 is not set
# CONFIG_FB_ATY is not set
# CONFIG_FB_SAVAGE is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_NEOMAGIC is not set
# CONFIG_FB_KYRO is not set
# CONFIG_FB_3DFX is not set
# CONFIG_FB_VOODOO1 is not set
# CONFIG_FB_TRIDENT is not set
# CONFIG_FB_GEODE is not set
# CONFIG_FB_VIRTUAL is not set

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
CONFIG_FONTS=y
CONFIG_FONT_8x8=y
CONFIG_FONT_8x16=y
# CONFIG_FONT_6x11 is not set
# CONFIG_FONT_7x14 is not set
# CONFIG_FONT_PEARL_8x8 is not set
# CONFIG_FONT_ACORN_8x8 is not set
# CONFIG_FONT_MINI_4x6 is not set
# CONFIG_FONT_SUN8x16 is not set
# CONFIG_FONT_SUN12x22 is not set
# CONFIG_FONT_10x18 is not set

#
# Logo configuration
#
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
CONFIG_LOGO_LINUX_VGA16=y
CONFIG_LOGO_LINUX_CLUT224=y
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Sound
#
# CONFIG_SOUND is not set

#
# USB support
#
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB_ARCH_HAS_OHCI=y
# CONFIG_USB is not set

#
# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
#

#
# USB Gadget Support
#
# CONFIG_USB_GADGET is not set

#
# MMC/SD Card support
#
# CONFIG_MMC is not set

#
# InfiniBand support
#
# CONFIG_INFINIBAND is not set

#
# EDAC - error detection and reporting (RAS)
#
CONFIG_EDAC=y

#
# Reporting subsystems
#
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_MM_EDAC=y
# CONFIG_EDAC_AMD76X is not set
CONFIG_EDAC_E7XXX=y
CONFIG_EDAC_E752X=y
CONFIG_EDAC_I82875P=y
CONFIG_EDAC_I82860=y
CONFIG_EDAC_R82600=y
CONFIG_EDAC_POLL=y

#
# Firmware Drivers
#
# CONFIG_EDD is not set
# CONFIG_DELL_RBU is not set
# CONFIG_DCDBAS is not set

#
# File systems
#
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
# CONFIG_EXT2_FS_POSIX_ACL is not set
# CONFIG_EXT2_FS_SECURITY is not set
# CONFIG_EXT2_FS_XIP is not set
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_XATTR=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_JBD=y
# CONFIG_JBD_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
CONFIG_REISERFS_PROC_INFO=y
# CONFIG_REISERFS_FS_XATTR is not set
CONFIG_JFS_FS=y
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_XFS_FS=y
CONFIG_XFS_EXPORT=y
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_SECURITY is not set
# CONFIG_XFS_POSIX_ACL is not set
# CONFIG_XFS_RT is not set
# CONFIG_OCFS2_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_INOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_DNOTIFY=y
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set
CONFIG_FUSE_FS=y

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
CONFIG_ZISOFS_FS=y
CONFIG_UDF_FS=y
CONFIG_UDF_NLS=y

#
# DOS/FAT/NT Filesystems
#
# CONFIG_MSDOS_FS is not set
# CONFIG_VFAT_FS is not set
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_RAMFS=y
# CONFIG_RELAYFS_FS is not set
# CONFIG_CONFIGFS_FS is not set

#
# Miscellaneous filesystems
#
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
CONFIG_NFS_FS=y
CONFIG_NFS_V3=y
CONFIG_NFS_V3_ACL=y
CONFIG_NFS_V4=y
CONFIG_NFS_DIRECTIO=y
CONFIG_NFSD=y
CONFIG_NFSD_V2_ACL=y
CONFIG_NFSD_V3=y
CONFIG_NFSD_V3_ACL=y
CONFIG_NFSD_V4=y
CONFIG_NFSD_TCP=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_EXPORTFS=y
CONFIG_NFS_ACL_SUPPORT=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=y
CONFIG_RPCSEC_GSS_KRB5=y
CONFIG_RPCSEC_GSS_SPKM3=y
CONFIG_SMB_FS=y
# CONFIG_SMB_NLS_DEFAULT is not set
CONFIG_CIFS=y
CONFIG_CIFS_STATS=y
CONFIG_CIFS_STATS2=y
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_CIFS_EXPERIMENTAL=y
CONFIG_CIFS_UPCALL=y
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set
# CONFIG_9P_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y

#
# Native Language Support
#
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=y
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=y
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=y
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_UTF8=y

#
# Instrumentation Support
#
# CONFIG_PROFILING is not set
# CONFIG_KPROBES is not set

#
# Kernel hacking
#
CONFIG_PRINTK_TIME=y
# CONFIG_MAGIC_SYSRQ is not set
# CONFIG_DEBUG_KERNEL is not set
CONFIG_LOG_BUF_SHIFT=15

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY is not set

#
# Cryptographic options
#
CONFIG_CRYPTO=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_TGR192=y
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_AES is not set
CONFIG_CRYPTO_AES_X86_64=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_KHAZAD=y
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_TEST is not set

#
# Hardware crypto devices
#

#
# Library routines
#
CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC32=y
CONFIG_LIBCRC32C=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="ok-cpufreq-info.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ok-cpufreq-info.txt"

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 0 2
  hardware limits: 425 MHz - 3.40 GHz
  available frequency steps: 425 MHz, 850 MHz, 1.28 GHz, 1.70 GHz, 2.13 GHz, 2.55 GHz, 2.98 GHz, 3.40 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 425 MHz and 1.70 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 425 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 1 3
  hardware limits: 425 MHz - 3.40 GHz
  available frequency steps: 425 MHz, 850 MHz, 1.28 GHz, 1.70 GHz, 2.13 GHz, 2.55 GHz, 2.98 GHz, 3.40 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 425 MHz and 1.70 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 425 MHz (asserted by call to hardware).
analyzing CPU 2:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 0 2
  hardware limits: 425 MHz - 3.40 GHz
  available frequency steps: 425 MHz, 850 MHz, 1.28 GHz, 1.70 GHz, 2.13 GHz, 2.55 GHz, 2.98 GHz, 3.40 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 425 MHz and 1.70 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 425 MHz (asserted by call to hardware).
analyzing CPU 3:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 1 3
  hardware limits: 425 MHz - 3.40 GHz
  available frequency steps: 425 MHz, 850 MHz, 1.28 GHz, 1.70 GHz, 2.13 GHz, 2.55 GHz, 2.98 GHz, 3.40 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 425 MHz and 1.70 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 425 MHz (asserted by call to hardware).

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="ok-dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ok-dmesg.txt"

[    0.000000] Bootdata ok (command line is auto BOOT_IMAGE=2.6.16.20-1 ro root=801)
[    0.000000] Linux version 2.6.16.20-1 (root@bigbit) (gcc version 3.4.4) #1 SMP Mon Jun 19 21:06:52 CEST 2006
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009f800 (usable)
[    0.000000]  BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 00000000bffcdfb9 (usable)
[    0.000000]  BIOS-e820: 00000000bffcdfb9 - 00000000bfff0000 (reserved)
[    0.000000]  BIOS-e820: 00000000bfff0000 - 00000000bffff000 (ACPI data)
[    0.000000]  BIOS-e820: 00000000bffff000 - 00000000c0000000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec86000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000ffc00000 - 0000000100000000 (reserved)
[    0.000000]  BIOS-e820: 0000000100000000 - 0000000340000000 (usable)
[    0.000000] ACPI: RSDP (v000 ACPIAM                                ) @ 0x00000000000f7de0
[    0.000000] ACPI: RSDT (v001 A M I  OEMRSDT  0x09000520 MSFT 0x00000097) @ 0x00000000bfff0000
[    0.000000] ACPI: FADT (v001 A M I  OEMFACP  0x09000520 MSFT 0x00000097) @ 0x00000000bfff0200
[    0.000000] ACPI: MADT (v001 A M I  OEMAPIC  0x09000520 MSFT 0x00000097) @ 0x00000000bfff0300
[    0.000000] ACPI: MCFG (v001 A M I  OEMMCFG  0x09000520 MSFT 0x00000097) @ 0x00000000bfff03e0
[    0.000000] ACPI: OEMB (v001 A M I  OEMBIOS  0x09000520 MSFT 0x00000097) @ 0x00000000bffff040
[    0.000000] ACPI: DSDT (v001  LHREF LHREF001 0x00000001 INTL 0x02002026) @ 0x0000000000000000
[    0.000000] On node 0 totalpages: 3097199
[    0.000000]   DMA zone: 2154 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 768005 pages, LIFO batch:31
[    0.000000]   Normal zone: 2327040 pages, LIFO batch:31
[    0.000000]   HighMem zone: 0 pages, LIFO batch:0
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] Processor #0 15:4 APIC version 20
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x06] enabled)
[    0.000000] Processor #6 15:4 APIC version 20
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x01] enabled)
[    0.000000] Processor #1 15:4 APIC version 20
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x07] enabled)
[    0.000000] Processor #7 15:4 APIC version 20
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: IOAPIC (id[0x09] address[0xfec10000] gsi_base[24])
[    0.000000] IOAPIC[1]: apic_id 9, version 32, address 0xfec10000, GSI 24-47
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Setting APIC routing to flat
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] Allocating PCI resources starting at c4000000 (gap: c0000000:3ec00000)
[    0.000000] Checking aperture...
[    0.000000] Built 1 zonelists
[    0.000000] Kernel command line: auto BOOT_IMAGE=2.6.16.20-1 ro root=801
[    0.000000] Initializing CPU#0
[    0.000000] PID hash table entries: 4096 (order: 12, 131072 bytes)
[    0.000000] time.c: Using 3.579545 MHz WALL PM GTOD PIT/TSC timer.
[    0.000000] time.c: Detected 3391.662 MHz processor.
[   80.091409] Console: colour dummy device 80x25
[   80.105199] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[   80.125573] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[   80.132370] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[   80.187425] Placing software IO TLB between 0xde75000 - 0x11e75000
[   80.357153] Memory: 12297584k/13631488k available (4472k kernel code, 284512k reserved, 1885k data, 244k init)
[   80.436337] Calibrating delay using timer specific routine.. 6792.94 BogoMIPS (lpj=13585897)
[   80.436399] Mount-cache hash table entries: 256
[   80.436546] CPU: Trace cache: 12K uops, L1 D cache: 16K
[   80.436551] CPU: L2 cache: 2048K
[   80.436555] using mwait in idle threads.
[   80.436559] CPU: Physical Processor ID: 0
[   80.436573] CPU0: Thermal monitoring enabled (TM1)
[   80.479414] Using local APIC timer interrupts.
[   80.508813] result 12469259
[   80.508816] Detected 12.469 MHz APIC timer.
[   80.512232] Booting processor 1/4 APIC 0x6
[   80.522811] Initializing CPU#1
[   80.599837] Calibrating delay using timer specific routine.. 6783.58 BogoMIPS (lpj=13567177)
[   80.599849] CPU: Trace cache: 12K uops, L1 D cache: 16K
[   80.599852] CPU: L2 cache: 2048K
[   80.599855] CPU: Physical Processor ID: 3
[   80.599866] CPU1: Thermal monitoring enabled (TM1)
[   80.600219]                   Intel(R) Xeon(TM) CPU 3.40GHz stepping 03
[   80.603830] APIC error on CPU1: 00(40)
[   80.603921] Booting processor 2/4 APIC 0x1
[   80.614808] Initializing CPU#2
[   80.691559] Calibrating delay using timer specific routine.. 6783.61 BogoMIPS (lpj=13567227)
[   80.691574] CPU: Trace cache: 12K uops, L1 D cache: 16K
[   80.691577] CPU: L2 cache: 2048K
[   80.691580] CPU: Physical Processor ID: 0
[   80.691593] CPU2: Thermal monitoring enabled (TM1)
[   80.691954]                   Intel(R) Xeon(TM) CPU 3.40GHz stepping 03
[   80.695552] APIC error on CPU2: 00(40)
[   80.695703] Booting processor 3/4 APIC 0x7
[   80.706261] Initializing CPU#3
[   80.783280] Calibrating delay using timer specific routine.. 6783.60 BogoMIPS (lpj=13567201)
[   80.783293] CPU: Trace cache: 12K uops, L1 D cache: 16K
[   80.783295] CPU: L2 cache: 2048K
[   80.783298] CPU: Physical Processor ID: 3
[   80.783310] CPU3: Thermal monitoring enabled (TM1)
[   80.783665]                   Intel(R) Xeon(TM) CPU 3.40GHz stepping 03
[   80.787279] APIC error on CPU3: 00(40)
[   80.787288] Brought up 4 CPUs
[   80.787334] testing NMI watchdog ... OK.
[   81.224813] migration_cost=24,2077
[   81.225540] DMI 2.3 present.
[   81.225661] NET: Registered protocol family 16
[   81.225694] ACPI: bus type pci registered
[   81.225705] PCI: Using configuration type 1
[   81.233336] PCI: Using MMCONFIG at e0000000
[   81.234255] ACPI: Subsystem revision 20060127
[   81.238096] ACPI: Interpreter enabled
[   81.238101] ACPI: Using IOAPIC for interrupt routing
[   81.238613] ACPI: PCI Root Bridge [PCI0] (0000:00)
[   81.238619] PCI: Probing PCI hardware (bus 00)
[   81.240794] PCI quirk: region 0800-087f claimed by ICH4 ACPI/GPIO/TCO
[   81.240799] PCI quirk: region 0480-04bf claimed by ICH4 GPIO
[   81.240836] PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
[   81.241304] Boot video device is 0000:04:02.0
[   81.241383] PCI: Transparent bridge - 0000:00:1e.0
[   81.241419] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[   81.244228] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
[   81.244450] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P2._PRT]
[   81.244916] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P4._PRT]
[   81.245338] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P5._PRT]
[   81.248905] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
[   81.249162] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
[   81.249415] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 6 7 9 10 11 12 14 15)
[   81.249665] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 *9 10 11 12 14 15)
[   81.249916] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, disabled.
[   81.250167] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, disabled.
[   81.250427] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 *7 10 11 12 14 15)
[   81.250676] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
[   81.250848] Linux Plug and Play Support v0.97 (c) Adam Belay
[   81.250863] pnp: PnP ACPI init
[   81.255436] pnp: PnP ACPI: found 13 devices
[   81.255634] SCSI subsystem initialized
[   81.255697] PCI: Using ACPI for IRQ routing
[   81.255702] PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a report
[   81.257083] pnp: 00:08: ioport range 0x460-0x47f has been reserved
[   81.257088] pnp: 00:08: ioport range 0x420-0x43f has been reserved
[   81.257092] pnp: 00:08: ioport range 0x560-0x56f could not be reserved
[   81.257095] pnp: 00:08: ioport range 0x6c0-0x6df has been reserved
[   81.257099] pnp: 00:08: ioport range 0x7100-0x711f has been reserved
[   81.257102] pnp: 00:08: ioport range 0x520-0x53f has been reserved
[   81.257106] pnp: 00:08: ioport range 0x540-0x54f has been reserved
[   81.257449] PCI: Bridge: 0000:00:02.0
[   81.257452]   IO window: disabled.
[   81.257456]   MEM window: disabled.
[   81.257459]   PREFETCH window: disabled.
[   81.257463] PCI: Bridge: 0000:00:03.0
[   81.257466]   IO window: d000-dfff
[   81.257470]   MEM window: ded00000-dedfffff
[   81.257474]   PREFETCH window: disabled.
[   81.257477] PCI: Bridge: 0000:00:1c.0
[   81.257480]   IO window: disabled.
[   81.257484]   MEM window: dee00000-deefffff
[   81.257488]   PREFETCH window: ddf00000-ddffffff
[   81.257494] PCI: Bridge: 0000:00:1e.0
[   81.257497]   IO window: e000-efff
[   81.257502]   MEM window: def00000-dfffffff
[   81.257506]   PREFETCH window: c4000000-c40fffff
[   81.257520] GSI 16 sharing vector 0xA9 and IRQ 16
[   81.257525] ACPI: PCI Interrupt 0000:00:02.0[A] -> GSI 16 (level, low) -> IRQ 169
[   81.257533] PCI: Setting latency timer of device 0000:00:02.0 to 64
[   81.257540] ACPI: PCI Interrupt 0000:00:03.0[A] -> GSI 16 (level, low) -> IRQ 169
[   81.257546] PCI: Setting latency timer of device 0000:00:03.0 to 64
[   81.257557] PCI: Setting latency timer of device 0000:00:1e.0 to 64
[   81.258957] IA32 emulation $Id: sys_ia32.c,v 1.32 2002/03/24 13:02:28 ak Exp $
[   81.265203] Total HugeTLB memory allocated, 0
[   81.265647] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[   81.265990] fuse init (API version 7.6)
[   81.266104] JFS: nTxBlock = 8192, nTxLock = 65536
[   81.271397] SGI XFS with large block/inode numbers, no debug enabled
[   81.271857] Initializing Cryptographic API
[   81.271882] io scheduler noop registered
[   81.271893] io scheduler anticipatory registered (default)
[   81.271905] io scheduler deadline registered
[   81.271929] io scheduler cfq registered
[   81.275370] ACPI: PCI Interrupt 0000:00:02.0[A] -> GSI 16 (level, low) -> IRQ 169
[   81.275387] PCI: Setting latency timer of device 0000:00:02.0 to 64
[   81.275410] Allocate Port Service[0000:00:02.0:pcie00]
[   81.275482] Allocate Port Service[0000:00:02.0:pcie01]
[   81.275540] ACPI: PCI Interrupt 0000:00:03.0[A] -> GSI 16 (level, low) -> IRQ 169
[   81.275548] PCI: Setting latency timer of device 0000:00:03.0 to 64
[   81.275567] Allocate Port Service[0000:00:03.0:pcie00]
[   81.275629] Allocate Port Service[0000:00:03.0:pcie01]
[   81.275819] vesafb: framebuffer at 0xdf000000, mapped to 0xffffc20010680000, using 1536k, total 8128k
[   81.275826] vesafb: mode is 1024x768x8, linelength=1024, pages=9
[   81.275830] vesafb: scrolling: redraw
[   81.275834] vesafb: Pseudocolor: size=6:6:6:6, shift=0:0:0:0
[   81.296623] Console: switching to colour frame buffer device 128x48
[   81.296755] fb0: VESA VGA frame buffer device
[   81.296941] vga16fb: initializing
[   81.296945] vga16fb: mapped to 0xffff8100000a0000
[   81.297104] fb1: VGA16 VGA frame buffer device
[   81.297244] ACPI: Power Button (FF) [PWRF]
[   81.297346] ACPI: Power Button (CM) [PWRB]
[   81.297895] ACPI: Processor [CPU1] (supports 8 throttling states)
[   81.325160] Real Time Clock Driver v1.12ac
[   81.325289] Non-volatile memory driver v1.2
[   81.325439] hw_random hardware driver 1.0.0 loaded
[   81.325609] i6300ESB timer: initialized (0xffffc2000001c800). heartbeat=30 sec (nowayout=0)
[   81.325809] i8xx TCO timer: cannot register miscdev on minor=130 (err=-16)
[   81.325951] SoftDog: cannot register miscdev on minor=130 (err=-16)
[   81.326078] Linux agpgart interface v0.101 (c) Dave Jones
[   81.326189] ipmi message handler version 38.0
[   81.326279] ipmi device interface
[   81.326352] IPMI System Interface driver.
[   81.326496] ipmi_si: Trying "kcs" at I/O port 0xca2
[   81.342771] ipmi_si: Trying "smic" at I/O port 0xca9
[   81.358729] ipmi_si: Trying "bt" at I/O port 0xe4
[   81.374687] ipmi_si: Unable to find any System Interface(s)
[   81.376489] IPMI Watchdog: driver initialized
[   81.378342] Copyright (C) 2004 MontaVista Software - IPMI Powerdown via sys_reboot.
[   81.380385] Hangcheck: starting hangcheck timer 0.9.0 (tick is 180 seconds, margin is 60 seconds).
[   81.382599] Hangcheck: Using monotonic_clock().
[   81.385179] PNP: No PS/2 controller found. Probing ports directly.
[   81.389789] serio: i8042 AUX port at 0x60,0x64 irq 12
[   81.392295] serio: i8042 KBD port at 0x60,0x64 irq 1
[   81.394777] Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
[   81.397529] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[   81.400357] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[   81.403588] 00:05: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[   81.406581] 00:06: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[   81.409627] Floppy drive(s): fd0 is 1.44M
[   81.429797] FDC 0 is a National Semiconductor PC87306
[   81.434403] RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
[   81.437872] loop: loaded (max 8 devices)
[   81.441048] Intel(R) PRO/1000 Network Driver - version 6.3.9-k4
[   81.444340] Copyright (c) 1999-2005 Intel Corporation.
[   81.447772] GSI 17 sharing vector 0xB1 and IRQ 17
[   81.451217] ACPI: PCI Interrupt 0000:04:03.0[A] -> GSI 17 (level, low) -> IRQ 177
[   81.742696] e1000: 0000:04:03.0: e1000_probe: (PCI:33MHz:32-bit) 00:0e:0c:4c:38:19
[   81.931146] e1000: eth0: e1000_probe: Intel(R) PRO/1000 Network Connection
[   81.934900] pcnet32.c:v1.31c 01.Nov.2005 tsbogend@alpha.franken.de
[   81.938679] e100: Intel(R) PRO/100 Network Driver, 3.5.10-k2-NAPI
[   81.942447] e100: Copyright(c) 1999-2005 Intel Corporation
[   81.946357] Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
[   81.950197] ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
[   81.954221] ICH5: IDE controller at PCI slot 0000:00:1f.1
[   81.958197] GSI 18 sharing vector 0xB9 and IRQ 18
[   81.962141] ACPI: PCI Interrupt 0000:00:1f.1[A] -> GSI 18 (level, low) -> IRQ 185
[   81.966220] ICH5: chipset revision 2
[   81.970247] ICH5: not 100% native mode: will probe irqs later
[   81.974265]     ide0: BM-DMA at 0xfc00-0xfc07, BIOS settings: hda:pio, hdb:pio
[   81.978327]     ide1: BM-DMA at 0xfc08-0xfc0f, BIOS settings: hdc:pio, hdd:DMA
[   81.982306] Probing IDE interface ide0...
[   82.547292] Probing IDE interface ide1...
[   83.560356] hdd: _NEC DVD_RW ND-6750A, ATAPI CD/DVD-ROM drive
[   83.622591] ide1 at 0x170-0x177,0x376 on irq 15
[   83.626691] Probing IDE interface ide0...
[   84.198151] hdd: ATAPI 24X DVD-ROM DVD-R CD-R/RW drive, 2048kB Cache, UDMA(33)
[   84.202256] Uniform CD-ROM driver Revision: 3.20
[   84.227136] megaraid cmm: 2.20.2.6 (Release Date: Mon Mar 7 00:01:03 EST 2005)
[   84.231321] megaraid: 2.20.4.7 (Release Date: Mon Nov 14 12:27:22 EST 2005)
[   84.235585] megaraid: probe new device 0x1000:0x1960:0x1000:0x4523: bus 3:slot 3:func 0
[   84.239918] GSI 19 sharing vector 0xC1 and IRQ 19
[   84.244222] ACPI: PCI Interrupt 0000:03:03.0[A] -> GSI 24 (level, low) -> IRQ 193
[   84.266205] megaraid: fw version:[713N] bios version:[G119]
[   84.310216] scsi0 : LSI Logic MegaRAID driver
[   84.314646] scsi[0]: scanning scsi channel 0 [Phy 0] for non-raid devices
[   84.400872] scsi[0]: scanning scsi channel 1 [virtual] for logical drives
[   84.405630]   Vendor: MegaRAID  Model: LD 0 RAID1  286G  Rev: 713N
[   84.410068]   Type:   Direct-Access                      ANSI SCSI revision: 02
[   84.414993]   Vendor: MegaRAID  Model: LD 1 RAID0  190G  Rev: 713N
[   84.419514]   Type:   Direct-Access                      ANSI SCSI revision: 02
[   84.429596] 3ware 9000 Storage Controller device driver for Linux v2.26.02.007.
[   84.434184] libata version 1.20 loaded.
[   84.434548] SCSI device sda: 586061824 512-byte hdwr sectors (300064 MB)
[   84.439015] sda: Write Protect is off
[   84.443486] sda: Mode Sense: 00 00 00 00
[   84.443501] sda: asking for cache data failed
[   84.447960] sda: assuming drive cache: write through
[   84.452630] SCSI device sda: 586061824 512-byte hdwr sectors (300064 MB)
[   84.457141] sda: Write Protect is off
[   84.461544] sda: Mode Sense: 00 00 00 00
[   84.461568] sda: asking for cache data failed
[   84.465941] sda: assuming drive cache: write through
[   84.470301]  sda: sda1 sda2 sda3
[   84.475144] sd 0:1:0:0: Attached scsi disk sda
[   84.479583] SCSI device sdb: 390711296 512-byte hdwr sectors (200044 MB)
[   84.483901] sdb: Write Protect is off
[   84.488134] sdb: Mode Sense: 00 00 00 00
[   84.488147] sdb: asking for cache data failed
[   84.492336] sdb: assuming drive cache: write through
[   84.496691] SCSI device sdb: 390711296 512-byte hdwr sectors (200044 MB)
[   84.500930] sdb: Write Protect is off
[   84.505078] sdb: Mode Sense: 00 00 00 00
[   84.505093] sdb: asking for cache data failed
[   84.509174] sdb: assuming drive cache: write through
[   84.513206]  sdb: sdb1
[   84.517571] sd 0:1:1:0: Attached scsi disk sdb
[   84.521573] sd 0:1:0:0: Attached scsi generic sg0 type 0
[   84.525509] sd 0:1:1:0: Attached scsi generic sg1 type 0
[   84.529358] Fusion MPT base driver 3.03.07
[   84.533126] Copyright (c) 1999-2005 LSI Logic Corporation
[   84.536988] Fusion MPT SPI Host driver 3.03.07
[   84.540830] Fusion MPT misc device (ioctl) driver 3.03.07
[   84.544675] mptctl: Registered with Fusion MPT base driver
[   84.548448] mptctl: /dev/mptctl @ (major,minor=10,220)
[   84.552231] mice: PS/2 mouse device common for all mice
[   84.555949] i2c /dev entries driver
[   84.559984] i2c-parport: using default base 0x378
[   84.563792] i2c-sis96x version 1.0.0
[   87.486716] pc87360: PC8736x not detected, module not inserted.
[   87.504074] md: linear personality registered for level -1
[   87.507584] md: raid0 personality registered for level 0
[   87.511077] md: raid1 personality registered for level 1
[   87.514488] md: raid10 personality registered for level 10
[   87.517915] md: raid5 personality registered for level 5
[   87.521305] md: raid4 personality registered for level 4
[   87.524611] raid5: automatically using best checksumming function: generic_sse
[   87.546743]    generic_sse:  5158.000 MB/sec
[   87.550039] raid5: using function: generic_sse (5158.000 MB/sec)
[   87.618537] raid6: int64x1   1546 MB/s
[   87.686339] raid6: int64x2   2138 MB/s
[   87.754122] raid6: int64x4   2790 MB/s
[   87.821910] raid6: int64x8   1830 MB/s
[   87.889716] raid6: sse2x1    2504 MB/s
[   87.957509] raid6: sse2x2    2252 MB/s
[   88.025304] raid6: sse2x4    3222 MB/s
[   88.028195] raid6: using algorithm sse2x4 (3222 MB/s)
[   88.031116] md: raid6 personality registered for level 6
[   88.034057] md: multipath personality registered for level -4
[   88.037024] md: faulty personality registered for level -5
[   88.039967] md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
[   88.042902] md: bitmap version 4.39
[   88.045917] device-mapper: 4.5.0-ioctl (2005-10-04) initialised: dm-devel@redhat.com
[   88.049132] device-mapper: dm-multipath version 1.0.4 loaded
[   88.052164] device-mapper: dm-round-robin version 1.0.0 loaded
[   88.055146] device-mapper: dm-emc version 0.0.3 loaded
[   88.058196] MC: drivers/edac/edac_mc.c version edac_mc  Ver: 2.0.0 Jun 19 2006
[   88.061510] tolm = c0000, remapbase = 300000, remaplimit = 33c000
[   88.064819] EDAC MC0: Giving out device to "e752x_edac" E7320: PCI 0000:00:00.0
[   88.068182] NET: Registered protocol family 2
[   88.119440] IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
[   88.126395] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[   88.133337] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[   88.137666] TCP: Hash tables configured (established 262144 bind 65536)
[   88.141091] TCP reno registered
[   88.144527] TCP bic registered
[   88.147899] NET: Registered protocol family 1
[   88.151245] NET: Registered protocol family 17
[   88.154905] p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
[   88.158528] md: Autodetecting RAID arrays.
[   88.161883] md: autorun ...
[   88.165210] md: ... autorun DONE.
[   88.203962] kjournald starting.  Commit interval 5 seconds
[   88.203981] EXT3-fs: mounted filesystem with ordered data mode.
[   88.204064] VFS: Mounted root (ext3 filesystem) readonly.
[   88.204486] Freeing unused kernel memory: 244k freed
[   89.354869] Adding 3911816k swap on /dev/sda2.  Priority:-1 extents:1 across:3911816k
[   89.435141] EXT3 FS on sda1, internal journal
[   90.107934] XFS mounting filesystem sda3
[   90.206667] Ending clean XFS mount for filesystem: sda3
[   90.234133] XFS mounting filesystem sdb1
[   90.334396] Ending clean XFS mount for filesystem: sdb1
[   92.167008] e1000: eth0: e1000_watchdog_task: NIC Link is Up 100 Mbps Full Duplex

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="ok-cpuinfo.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="ok-cpuinfo.txt"

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.40GHz
stepping	: 3
cpu MHz		: 425.000
cache size	: 2048 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl est cid cx16 xtpr
bogomips	: 6792.94
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.40GHz
stepping	: 3
cpu MHz		: 425.000
cache size	: 2048 KB
physical id	: 3
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl est cid cx16 xtpr
bogomips	: 6783.58
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.40GHz
stepping	: 3
cpu MHz		: 425.000
cache size	: 2048 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl est cid cx16 xtpr
bogomips	: 6783.61
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.40GHz
stepping	: 3
cpu MHz		: 425.000
cache size	: 2048 KB
physical id	: 3
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl est cid cx16 xtpr
bogomips	: 6783.60
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:


--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="notok-dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="notok-dmesg.txt"

[    0.000000] Bootdata ok (command line is auto BOOT_IMAGE=2.6.16.20-1 ro root=801 hangcheck-tick=30 hangcheck-margin=180)
[    0.000000] Linux version 2.6.16.20-1 (root@bigbit) (gcc version 3.4.4) #1 SMP Mon Jun 19 21:06:52 CEST 2006
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009f400 (usable)
[    0.000000]  BIOS-e820: 000000000009f400 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 00000000bffcdfb9 (usable)
[    0.000000]  BIOS-e820: 00000000bffcdfb9 - 00000000bfff0000 (reserved)
[    0.000000]  BIOS-e820: 00000000bfff0000 - 00000000bffff000 (ACPI data)
[    0.000000]  BIOS-e820: 00000000bffff000 - 00000000c0000000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec86000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000ffc00000 - 0000000100000000 (reserved)
[    0.000000]  BIOS-e820: 0000000100000000 - 0000000340000000 (usable)
[    0.000000] ACPI: RSDP (v000 ACPIAM                                ) @ 0x00000000000f7de0
[    0.000000] ACPI: RSDT (v001 A M I  OEMRSDT  0x07000520 MSFT 0x00000097) @ 0x00000000bfff0000
[    0.000000] ACPI: FADT (v001 A M I  OEMFACP  0x07000520 MSFT 0x00000097) @ 0x00000000bfff0200
[    0.000000] ACPI: MADT (v001 A M I  OEMAPIC  0x07000520 MSFT 0x00000097) @ 0x00000000bfff0300
[    0.000000] ACPI: MCFG (v001 A M I  OEMMCFG  0x07000520 MSFT 0x00000097) @ 0x00000000bfff03e0
[    0.000000] ACPI: OEMB (v001 A M I  OEMBIOS  0x07000520 MSFT 0x00000097) @ 0x00000000bffff040
[    0.000000] ACPI: DSDT (v001  LHREF LHREF001 0x00000001 INTL 0x02002026) @ 0x0000000000000000
[    0.000000] On node 0 totalpages: 3097199
[    0.000000]   DMA zone: 2154 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 768005 pages, LIFO batch:31
[    0.000000]   Normal zone: 2327040 pages, LIFO batch:31
[    0.000000]   HighMem zone: 0 pages, LIFO batch:0
[    0.000000] ACPI: PM-Timer IO Port: 0x808
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
[    0.000000] Processor #0 15:4 APIC version 20
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x06] enabled)
[    0.000000] Processor #6 15:4 APIC version 20
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x01] enabled)
[    0.000000] Processor #1 15:4 APIC version 20
[    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x07] enabled)
[    0.000000] Processor #7 15:4 APIC version 20
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x08] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: IOAPIC (id[0x09] address[0xfec10000] gsi_base[24])
[    0.000000] IOAPIC[1]: apic_id 9, version 32, address 0xfec10000, GSI 24-47
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Setting APIC routing to flat
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] Allocating PCI resources starting at c4000000 (gap: c0000000:3ec00000)
[    0.000000] Checking aperture...
[    0.000000] Built 1 zonelists
[    0.000000] Kernel command line: auto BOOT_IMAGE=2.6.16.20-1 ro root=801 hangcheck-tick=30 hangcheck-margin=180
[    0.000000] Initializing CPU#0
[    0.000000] PID hash table entries: 4096 (order: 12, 131072 bytes)
[    0.000000] time.c: Using 3.579545 MHz WALL PM GTOD PIT/TSC timer.
[    0.000000] time.c: Detected 3192.137 MHz processor.
[  107.209126] Console: colour dummy device 80x25
[  107.222948] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes)
[  107.243399] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes)
[  107.250191] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[  107.305407] Placing software IO TLB between 0xde75000 - 0x11e75000
[  107.477231] Memory: 12297584k/13631488k available (4472k kernel code, 284512k reserved, 1885k data, 244k init)
[  107.554257] Calibrating delay using timer specific routine.. 6393.54 BogoMIPS (lpj=12787084)
[  107.554321] Mount-cache hash table entries: 256
[  107.554469] CPU: Trace cache: 12K uops, L1 D cache: 16K
[  107.554474] CPU: L2 cache: 2048K
[  107.554478] using mwait in idle threads.
[  107.554482] CPU: Physical Processor ID: 0
[  107.554496] CPU0: Thermal monitoring enabled (TM1)
[  107.597540] Using local APIC timer interrupts.
[  107.628796] result 12469215
[  107.628799] Detected 12.469 MHz APIC timer.
[  107.630203] Booting processor 1/4 APIC 0x6
[  107.640788] Initializing CPU#1
[  107.717853] Calibrating delay using timer specific routine.. 6384.57 BogoMIPS (lpj=12769144)
[  107.717866] CPU: Trace cache: 12K uops, L1 D cache: 16K
[  107.717869] CPU: L2 cache: 2048K
[  107.717872] CPU: Physical Processor ID: 3
[  107.717884] CPU1: Thermal monitoring enabled (TM1)
[  107.718255]                   Intel(R) Xeon(TM) CPU 3.20GHz stepping 03
[  107.721848] APIC error on CPU1: 00(40)
[  107.721941] Booting processor 2/4 APIC 0x1
[  107.732838] Initializing CPU#2
[  107.809628] Calibrating delay using timer specific routine.. 6384.43 BogoMIPS (lpj=12768863)
[  107.809644] CPU: Trace cache: 12K uops, L1 D cache: 16K
[  107.809647] CPU: L2 cache: 2048K
[  107.809651] CPU: Physical Processor ID: 0
[  107.809664] CPU2: Thermal monitoring enabled (TM1)
[  107.810030]                   Intel(R) Xeon(TM) CPU 3.20GHz stepping 03
[  107.813633] APIC error on CPU2: 00(40)
[  107.813781] Booting processor 3/4 APIC 0x7
[  107.824347] Initializing CPU#3
[  107.901403] Calibrating delay using timer specific routine.. 6384.55 BogoMIPS (lpj=12769105)
[  107.901417] CPU: Trace cache: 12K uops, L1 D cache: 16K
[  107.901419] CPU: L2 cache: 2048K
[  107.901423] CPU: Physical Processor ID: 3
[  107.901434] CPU3: Thermal monitoring enabled (TM1)
[  107.901797]                   Intel(R) Xeon(TM) CPU 3.20GHz stepping 03
[  107.905400] APIC error on CPU3: 00(40)
[  107.905411] Brought up 4 CPUs
[  107.905456] testing NMI watchdog ... OK.
[  108.355463] migration_cost=12,2329
[  108.356212] DMI 2.3 present.
[  108.356341] NET: Registered protocol family 16
[  108.356375] ACPI: bus type pci registered
[  108.356386] PCI: Using configuration type 1
[  108.364283] PCI: Using MMCONFIG at e0000000
[  108.365233] ACPI: Subsystem revision 20060127
[  108.369275] ACPI: Interpreter enabled
[  108.369281] ACPI: Using IOAPIC for interrupt routing
[  108.369822] ACPI: PCI Root Bridge [PCI0] (0000:00)
[  108.369828] PCI: Probing PCI hardware (bus 00)
[  108.372117] PCI quirk: region 0800-087f claimed by ICH4 ACPI/GPIO/TCO
[  108.372123] PCI quirk: region 0480-04bf claimed by ICH4 GPIO
[  108.372160] PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
[  108.372847] Boot video device is 0000:05:02.0
[  108.372928] PCI: Transparent bridge - 0000:00:1e.0
[  108.372965] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[  108.375973] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P1._PRT]
[  108.376211] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P2._PRT]
[  108.376702] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P4._PRT]
[  108.377148] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P0P5._PRT]
[  108.381189] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 *10 11 12 14 15)
[  108.381472] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *9 10 11 12 14 15)
[  108.381739] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 6 7 9 10 11 12 14 15)
[  108.382004] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 *9 10 11 12 14 15)
[  108.382269] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, disabled.
[  108.382534] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, disabled.
[  108.382802] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 *7 10 11 12 14 15)
[  108.383065] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
[  108.383243] Linux Plug and Play Support v0.97 (c) Adam Belay
[  108.383257] pnp: PnP ACPI init
[  108.388254] pnp: PnP ACPI: found 15 devices
[  108.388458] SCSI subsystem initialized
[  108.388523] PCI: Using ACPI for IRQ routing
[  108.388528] PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a report
[  108.390013] pnp: 00:0a: ioport range 0x460-0x47f has been reserved
[  108.390018] pnp: 00:0a: ioport range 0x420-0x43f has been reserved
[  108.390023] pnp: 00:0a: ioport range 0x560-0x56f could not be reserved
[  108.390027] pnp: 00:0a: ioport range 0x6c0-0x6df has been reserved
[  108.390030] pnp: 00:0a: ioport range 0x7100-0x711f has been reserved
[  108.390034] pnp: 00:0a: ioport range 0x520-0x53f has been reserved
[  108.390038] pnp: 00:0a: ioport range 0x540-0x54f has been reserved
[  108.390393] PCI: Bridge: 0000:00:02.0
[  108.390397]   IO window: disabled.
[  108.390400]   MEM window: disabled.
[  108.390404]   PREFETCH window: disabled.
[  108.390408] PCI: Bridge: 0000:00:03.0
[  108.390411]   IO window: d000-dfff
[  108.390416]   MEM window: dec00000-decfffff
[  108.390419]   PREFETCH window: disabled.
[  108.390423] PCI: Bridge: 0000:03:03.0
[  108.390426]   IO window: disabled.
[  108.390431]   MEM window: ded00000-deefffff
[  108.390436]   PREFETCH window: ddf00000-ddffffff
[  108.390441] PCI: Bridge: 0000:00:1c.0
[  108.390444]   IO window: disabled.
[  108.390448]   MEM window: ded00000-deefffff
[  108.390453]   PREFETCH window: ddf00000-ddffffff
[  108.390458] PCI: Bridge: 0000:00:1e.0
[  108.390462]   IO window: e000-efff
[  108.390467]   MEM window: def00000-dfffffff
[  108.390471]   PREFETCH window: c4000000-c40fffff
[  108.390486] GSI 16 sharing vector 0xA9 and IRQ 16
[  108.390491] ACPI: PCI Interrupt 0000:00:02.0[A] -> GSI 16 (level, low) -> IRQ 169
[  108.390499] PCI: Setting latency timer of device 0000:00:02.0 to 64
[  108.390507] ACPI: PCI Interrupt 0000:00:03.0[A] -> GSI 16 (level, low) -> IRQ 169
[  108.390513] PCI: Setting latency timer of device 0000:00:03.0 to 64
[  108.390533] PCI: Setting latency timer of device 0000:00:1e.0 to 64
[  108.391980] IA32 emulation $Id: sys_ia32.c,v 1.32 2002/03/24 13:02:28 ak Exp $
[  108.398144] Total HugeTLB memory allocated, 0
[  108.398589] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
[  108.398939] fuse init (API version 7.6)
[  108.399056] JFS: nTxBlock = 8192, nTxLock = 65536
[  108.404422] SGI XFS with large block/inode numbers, no debug enabled
[  108.404861] Initializing Cryptographic API
[  108.404887] io scheduler noop registered
[  108.404899] io scheduler anticipatory registered (default)
[  108.404911] io scheduler deadline registered
[  108.404936] io scheduler cfq registered
[  108.408359] ACPI: PCI Interrupt 0000:00:02.0[A] -> GSI 16 (level, low) -> IRQ 169
[  108.408376] PCI: Setting latency timer of device 0000:00:02.0 to 64
[  108.408403] Allocate Port Service[0000:00:02.0:pcie00]
[  108.408472] Allocate Port Service[0000:00:02.0:pcie01]
[  108.408530] ACPI: PCI Interrupt 0000:00:03.0[A] -> GSI 16 (level, low) -> IRQ 169
[  108.408539] PCI: Setting latency timer of device 0000:00:03.0 to 64
[  108.408557] Allocate Port Service[0000:00:03.0:pcie00]
[  108.408614] Allocate Port Service[0000:00:03.0:pcie01]
[  108.408823] vesafb: framebuffer at 0xdf000000, mapped to 0xffffc20010680000, using 1536k, total 8128k
[  108.408830] vesafb: mode is 1024x768x8, linelength=1024, pages=9
[  108.408834] vesafb: scrolling: redraw
[  108.408839] vesafb: Pseudocolor: size=6:6:6:6, shift=0:0:0:0
[  108.429665] Console: switching to colour frame buffer device 128x48
[  108.429798] fb0: VESA VGA frame buffer device
[  108.429984] vga16fb: initializing
[  108.429988] vga16fb: mapped to 0xffff8100000a0000
[  108.430148] fb1: VGA16 VGA frame buffer device
[  108.430290] ACPI: Power Button (FF) [PWRF]
[  108.430396] ACPI: Power Button (CM) [PWRB]
[  108.430745] ACPI: Processor [CPU1] (supports 8 throttling states)
[  108.457935] Real Time Clock Driver v1.12ac
[  108.458087] Non-volatile memory driver v1.2
[  108.458306] hw_random hardware driver 1.0.0 loaded
[  108.458499] i6300ESB timer: initialized (0xffffc2000001c800). heartbeat=30 sec (nowayout=0)
[  108.458692] i8xx TCO timer: cannot register miscdev on minor=130 (err=-16)
[  108.458834] SoftDog: cannot register miscdev on minor=130 (err=-16)
[  108.458962] Linux agpgart interface v0.101 (c) Dave Jones
[  108.459073] ipmi message handler version 38.0
[  108.459163] ipmi device interface
[  108.459238] IPMI System Interface driver.
[  108.459385] ipmi_si: Trying "kcs" at I/O port 0xca2
[  108.477306] ipmi_si: Trying "smic" at I/O port 0xca9
[  108.493274] ipmi_si: Trying "bt" at I/O port 0xe4
[  108.509241] ipmi_si: Unable to find any System Interface(s)
[  108.511056] IPMI Watchdog: driver initialized
[  108.512931] Copyright (C) 2004 MontaVista Software - IPMI Powerdown via sys_reboot.
[  108.515000] Hangcheck: starting hangcheck timer 0.9.0 (tick is 180 seconds, margin is 60 seconds).
[  108.517238] Hangcheck: Using monotonic_clock().
[  108.519786] PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M] at 0x60,0x64 irq 1,12
[  108.524473] serio: i8042 AUX port at 0x60,0x64 irq 12
[  108.527058] serio: i8042 KBD port at 0x60,0x64 irq 1
[  108.529608] Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
[  108.532438] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[  108.535342] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[  108.538636] 00:07: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[  108.541707] 00:08: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[  108.564398] FDC 0 is a National Semiconductor PC87306
[  108.568935] RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
[  108.572413] loop: loaded (max 8 devices)
[  108.575597] Intel(R) PRO/1000 Network Driver - version 6.3.9-k4
[  108.578904] Copyright (c) 1999-2005 Intel Corporation.
[  108.582358] GSI 17 sharing vector 0xB1 and IRQ 17
[  108.585815] ACPI: PCI Interrupt 0000:05:03.0[A] -> GSI 17 (level, low) -> IRQ 177
[  108.877481] e1000: 0000:05:03.0: e1000_probe: (PCI:33MHz:32-bit) 00:0e:0c:4b:f0:99
[  109.066029] e1000: eth0: e1000_probe: Intel(R) PRO/1000 Network Connection
[  109.069895] pcnet32.c:v1.31c 01.Nov.2005 tsbogend@alpha.franken.de
[  109.073777] e100: Intel(R) PRO/100 Network Driver, 3.5.10-k2-NAPI
[  109.077623] e100: Copyright(c) 1999-2005 Intel Corporation
[  109.081619] Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
[  109.085533] ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
[  109.089586] ICH5: IDE controller at PCI slot 0000:00:1f.1
[  109.093656] GSI 18 sharing vector 0xB9 and IRQ 18
[  109.097711] ACPI: PCI Interrupt 0000:00:1f.1[A] -> GSI 18 (level, low) -> IRQ 185
[  109.101865] ICH5: chipset revision 2
[  109.105975] ICH5: not 100% native mode: will probe irqs later
[  109.110141]     ide0: BM-DMA at 0xfc00-0xfc07, BIOS settings: hda:pio, hdb:pio
[  109.114337]     ide1: BM-DMA at 0xfc08-0xfc0f, BIOS settings: hdc:DMA, hdd:pio
[  109.118445] Probing IDE interface ide0...
[  109.686508] Probing IDE interface ide1...
[  110.420841] hdc: _NEC DVD+/-RW ND-6650A, ATAPI CD/DVD-ROM drive
[  111.097719] ide1 at 0x170-0x177,0x376 on irq 15
[  111.101926] Probing IDE interface ide0...
[  111.673574] hdc: ATAPI 24X DVD-ROM DVD-R CD-R/RW drive, 2048kB Cache, UDMA(33)
[  111.677756] Uniform CD-ROM driver Revision: 3.20
[  111.703760] megaraid cmm: 2.20.2.6 (Release Date: Mon Mar 7 00:01:03 EST 2005)
[  111.708034] megaraid: 2.20.4.7 (Release Date: Mon Nov 14 12:27:22 EST 2005)
[  111.712370] megaraid: probe new device 0x1000:0x0409:0x1000:0x3008: bus 4:slot 14:func 0
[  111.716786] GSI 19 sharing vector 0xC1 and IRQ 19
[  111.721179] ACPI: PCI Interrupt 0000:04:0e.0[C] -> GSI 24 (level, low) -> IRQ 193
[  111.741480] megaraid: fw version:[814B] bios version:[H431]
[  111.753754] scsi0 : LSI Logic MegaRAID driver
[  111.758370] scsi[0]: scanning scsi channel 0 [Phy 0] for non-raid devices
[  111.975736] scsi[0]: scanning scsi channel 1 [virtual] for logical drives
[  111.980341]   Vendor: MegaRAID  Model: LD 0 RAID1  237G  Rev: 814B
[  111.984869]   Type:   Direct-Access                      ANSI SCSI revision: 02
[  111.989592]   Vendor: MegaRAID  Model: LD 1 RAID0  237G  Rev: 814B
[  111.994183]   Type:   Direct-Access                      ANSI SCSI revision: 02
[  112.002025] 3ware 9000 Storage Controller device driver for Linux v2.26.02.007.
[  112.006633] libata version 1.20 loaded.
[  112.006993] SCSI device sda: 486326272 512-byte hdwr sectors (248999 MB)
[  112.011541] sda: Write Protect is off
[  112.016014] sda: Mode Sense: 00 00 00 00
[  112.016029] sda: asking for cache data failed
[  112.020541] sda: assuming drive cache: write through
[  112.025209] SCSI device sda: 486326272 512-byte hdwr sectors (248999 MB)
[  112.029750] sda: Write Protect is off
[  112.034197] sda: Mode Sense: 00 00 00 00
[  112.034211] sda: asking for cache data failed
[  112.038628] sda: assuming drive cache: write through
[  112.043038]  sda: sda1 sda2 sda3
[  112.067859] sd 0:1:0:0: Attached scsi disk sda
[  112.072290] SCSI device sdb: 486326272 512-byte hdwr sectors (248999 MB)
[  112.076663] sdb: Write Protect is off
[  112.080936] sdb: Mode Sense: 00 00 00 00
[  112.080952] sdb: asking for cache data failed
[  112.085178] sdb: assuming drive cache: write through
[  112.089526] SCSI device sdb: 486326272 512-byte hdwr sectors (248999 MB)
[  112.093795] sdb: Write Protect is off
[  112.097988] sdb: Mode Sense: 00 00 00 00
[  112.098002] sdb: asking for cache data failed
[  112.102121] sdb: assuming drive cache: write through
[  112.106199]  sdb: sdb1
[  112.129298] sd 0:1:1:0: Attached scsi disk sdb
[  112.133366] sd 0:1:0:0: Attached scsi generic sg0 type 0
[  112.137355] sd 0:1:1:0: Attached scsi generic sg1 type 0
[  112.141255] Fusion MPT base driver 3.03.07
[  112.145064] Copyright (c) 1999-2005 LSI Logic Corporation
[  112.148963] Fusion MPT SPI Host driver 3.03.07
[  112.152849] Fusion MPT misc device (ioctl) driver 3.03.07
[  112.156733] mptctl: Registered with Fusion MPT base driver
[  112.160534] mptctl: /dev/mptctl @ (major,minor=10,220)
[  112.164364] mice: PS/2 mouse device common for all mice
[  112.168120] i2c /dev entries driver
[  112.172246] i2c-parport: using default base 0x378
[  112.176130] i2c-sis96x version 1.0.0
[  112.193873] input: AT Translated Set 2 keyboard as /class/input/input0
[  112.425480] input: ImExPS/2 Generic Explorer Mouse as /class/input/input1
[  115.099212] pc87360: PC8736x not detected, module not inserted.
[  115.116556] md: linear personality registered for level -1
[  115.120119] md: raid0 personality registered for level 0
[  115.123702] md: raid1 personality registered for level 1
[  115.127197] md: raid10 personality registered for level 10
[  115.130657] md: raid5 personality registered for level 5
[  115.134083] md: raid4 personality registered for level 4
[  115.137419] raid5: automatically using best checksumming function: generic_sse
[  115.159629]    generic_sse:  4867.000 MB/sec
[  115.162925] raid5: using function: generic_sse (4867.000 MB/sec)
[  115.231486] raid6: int64x1   1456 MB/s
[  115.299289] raid6: int64x2   2016 MB/s
[  115.367141] raid6: int64x4   2623 MB/s
[  115.434973] raid6: int64x8   1722 MB/s
[  115.502813] raid6: sse2x1    2365 MB/s
[  115.570622] raid6: sse2x2    2121 MB/s
[  115.638466] raid6: sse2x4    3024 MB/s
[  115.641458] raid6: using algorithm sse2x4 (3024 MB/s)
[  115.644472] md: raid6 personality registered for level 6
[  115.647468] md: multipath personality registered for level -4
[  115.650460] md: faulty personality registered for level -5
[  115.653472] md: md driver 0.90.3 MAX_MD_DEVS=256, MD_SB_DISKS=27
[  115.656519] md: bitmap version 4.39
[  115.659598] device-mapper: 4.5.0-ioctl (2005-10-04) initialised: dm-devel@redhat.com
[  115.662897] device-mapper: dm-multipath version 1.0.4 loaded
[  115.666000] device-mapper: dm-round-robin version 1.0.0 loaded
[  115.669096] device-mapper: dm-emc version 0.0.3 loaded
[  115.672227] MC: drivers/edac/edac_mc.c version edac_mc  Ver: 2.0.0 Jun 19 2006
[  115.675670] tolm = c0000, remapbase = 300000, remaplimit = 33c000
[  115.679155] EDAC MC0: Giving out device to "e752x_edac" E7320: PCI 0000:00:00.0
[  115.682744] NET: Registered protocol family 2
[  115.736309] IP route cache hash table entries: 524288 (order: 10, 4194304 bytes)
[  115.743332] TCP established hash table entries: 262144 (order: 10, 4194304 bytes)
[  115.750328] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[  115.754742] TCP: Hash tables configured (established 262144 bind 65536)
[  115.758245] TCP reno registered
[  115.761751] TCP bic registered
[  115.765210] NET: Registered protocol family 1
[  115.768644] NET: Registered protocol family 17
[  115.772363] p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
[  115.776102] md: Autodetecting RAID arrays.
[  115.779548] md: autorun ...
[  115.782898] md: ... autorun DONE.
[  115.795301] kjournald starting.  Commit interval 5 seconds
[  115.795332] EXT3-fs: mounted filesystem with ordered data mode.
[  115.795422] VFS: Mounted root (ext3 filesystem) readonly.
[  115.795946] Freeing unused kernel memory: 244k freed
[  116.758698] Adding 3911816k swap on /dev/sda2.  Priority:0 extents:1 across:3911816k
[  116.834045] EXT3 FS on sda1, internal journal
[  117.261644] XFS mounting filesystem sda3
[  117.353599] Ending clean XFS mount for filesystem: sda3
[  117.394877] XFS mounting filesystem sdb1
[  117.501679] Ending clean XFS mount for filesystem: sdb1
[  119.305094] e1000: eth0: e1000_watchdog_task: NIC Link is Up 100 Mbps Full Duplex

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="notok-cpufreq-info.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="notok-cpufreq-info.txt"

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 0 2
  hardware limits: 350 MHz - 2.80 GHz
  available frequency steps: 350 MHz, 700 MHz, 1.05 GHz, 1.40 GHz, 1.75 GHz, 2.10 GHz, 2.45 GHz, 2.80 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 350 MHz and 1.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 350 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 1 3
  hardware limits: 350 MHz - 2.80 GHz
  available frequency steps: 350 MHz, 700 MHz, 1.05 GHz, 1.40 GHz, 1.75 GHz, 2.10 GHz, 2.45 GHz, 2.80 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 350 MHz and 1.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 350 MHz (asserted by call to hardware).
analyzing CPU 2:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 0 2
  hardware limits: 350 MHz - 2.80 GHz
  available frequency steps: 350 MHz, 700 MHz, 1.05 GHz, 1.40 GHz, 1.75 GHz, 2.10 GHz, 2.45 GHz, 2.80 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 350 MHz and 1.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 350 MHz (asserted by call to hardware).
analyzing CPU 3:
  driver: p4-clockmod
  CPUs which need to switch frequency at the same time: 1 3
  hardware limits: 350 MHz - 2.80 GHz
  available frequency steps: 350 MHz, 700 MHz, 1.05 GHz, 1.40 GHz, 1.75 GHz, 2.10 GHz, 2.45 GHz, 2.80 GHz
  available cpufreq governors: conservative, ondemand, powersave, userspace, performance
  current policy: frequency should be within 350 MHz and 1.40 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 350 MHz (asserted by call to hardware).

--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain;
  charset="utf-8";
  name="notok-cpuinfo.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="notok-cpuinfo.txt"

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.20GHz
stepping	: 3
cpu MHz		: 2450.000
cache size	: 2048 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl cid cx16 xtpr
bogomips	: 6393.54
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.20GHz
stepping	: 3
cpu MHz		: 1400.000
cache size	: 2048 KB
physical id	: 3
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl cid cx16 xtpr
bogomips	: 6384.57
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.20GHz
stepping	: 3
cpu MHz		: 2450.000
cache size	: 2048 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl cid cx16 xtpr
bogomips	: 6384.43
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 15
model		: 4
model name	:                   Intel(R) Xeon(TM) CPU 3.20GHz
stepping	: 3
cpu MHz		: 1400.000
cache size	: 2048 KB
physical id	: 3
siblings	: 2
core id		: 0
cpu cores	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 5
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall lm constant_tsc pni monitor ds_cpl cid cx16 xtpr
bogomips	: 6384.55
clflush size	: 64
cache_alignment	: 128
address sizes	: 36 bits physical, 48 bits virtual
power management:


--Boundary-00=_GyTmEbZ54H+1bqW
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_GyTmEbZ54H+1bqW--

