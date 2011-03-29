From: Patrick McLean <patrick@cim.mcgill.ca>
Subject: Core 2 Duo E6600 (2.4GHz) reporting max frequency of 900MHz
Date: Tue, 29 Mar 2011 11:19:02 -0400
Message-ID: <4D91F866.20503@cim.mcgill.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050401090707080508000602"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

This is a multi-part message in MIME format.
--------------050401090707080508000602
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This also happens on 2.6.38.1, the kernel reports that the machine can
only run at 600 and 900MHz, and /proc/cpuinfo always agrees with the
cpufreq reported frequency. This is on an "IBM IntelliStation M Pro
-[9229MC1]" with both vanilla and Ubuntu kernels. Below is my
/proc/cpuinfo, the output of cpufreq-info and I have attached my dmesg
output from the 2.6.32 Ubuntu 10.04 kernel. I can get the info from
2.6.38 if needed as well.

> # cat /proc/cpuinfo 
> processor	: 0
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 15
> model name	: Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
> stepping	: 6
> cpu MHz		: 600.000
> cache size	: 4096 KB
> physical id	: 0
> siblings	: 2
> core id		: 0
> cpu cores	: 2
> apicid		: 0
> initial apicid	: 0
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 10
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm lahf_lm tpr_shadow
> bogomips	: 4800.03
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 36 bits physical, 48 bits virtual
> power management:
> 
> processor	: 1
> vendor_id	: GenuineIntel
> cpu family	: 6
> model		: 15
> model name	: Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz
> stepping	: 6
> cpu MHz		: 600.000
> cache size	: 4096 KB
> physical id	: 0
> siblings	: 2
> core id		: 1
> cpu cores	: 2
> apicid		: 1
> initial apicid	: 1
> fpu		: yes
> fpu_exception	: yes
> cpuid level	: 10
> wp		: yes
> flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_tsc arch_perfmon pebs bts rep_good aperfmperf pni dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm lahf_lm tpr_shadow
> bogomips	: 4800.24
> clflush size	: 64
> cache_alignment	: 64
> address sizes	: 36 bits physical, 48 bits virtual
> power management:

> # cpufreq-info 
> cpufrequtils 006: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0
>   CPUs which need to have their frequency coordinated by software: 0
>   maximum transition latency: 10.0 us.
>   hardware limits: 600 MHz - 900 MHz
>   available frequency steps: 900 MHz, 600 MHz
>   available cpufreq governors: conservative, ondemand, userspace, powersave, performance
>   current policy: frequency should be within 600 MHz and 900 MHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 600 MHz (asserted by call to hardware).
>   cpufreq stats: 900 MHz:3.89%, 600 MHz:96.11%  (13875)
> analyzing CPU 1:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 1
>   CPUs which need to have their frequency coordinated by software: 1
>   maximum transition latency: 10.0 us.
>   hardware limits: 600 MHz - 900 MHz
>   available frequency steps: 900 MHz, 600 MHz
>   available cpufreq governors: conservative, ondemand, userspace, powersave, performance
>   current policy: frequency should be within 600 MHz and 900 MHz.
>                   The governor "ondemand" may decide which speed to use
>                   within this range.
>   current CPU frequency is 600 MHz (asserted by call to hardware).
>   cpufreq stats: 900 MHz:4.56%, 600 MHz:95.44%  (15507)


--------------050401090707080508000602
Content-Type: text/plain;
 name="dmesg"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmesg"

[    0.000000] Initializing cgroup subsys cpuset
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Linux version 2.6.32-30-generic (buildd@crested) (gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5) ) #59-Ubuntu SMP Tue Mar 1 21:30:46 UTC 2011 (Ubuntu 2.6.32-30.59-generic 2.6.32.29+drm33.13)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-2.6.32-30-generic root=UUID=cd3c7621-befc-4a17-976c-bd31c8a92d46 ro quiet splash
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009dc00 (usable)
[    0.000000]  BIOS-e820: 000000000009dc00 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000ce000 - 00000000000d0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000e4000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 00000000bfe80000 (usable)
[    0.000000]  BIOS-e820: 00000000bfe80000 - 00000000bfe92000 (ACPI data)
[    0.000000]  BIOS-e820: 00000000bfe92000 - 00000000bff00000 (ACPI NVS)
[    0.000000]  BIOS-e820: 00000000bff00000 - 00000000c0000000 (reserved)
[    0.000000]  BIOS-e820: 00000000e0000000 - 00000000f0000000 (reserved)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec10000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000ff000000 - 0000000100000000 (reserved)
[    0.000000] DMI present.
[    0.000000] last_pfn = 0xbfe80 max_arch_pfn = 0x400000000
[    0.000000] MTRR default type: uncachable
[    0.000000] MTRR fixed ranges enabled:
[    0.000000]   00000-9FFFF write-back
[    0.000000]   A0000-BFFFF uncachable
[    0.000000]   C0000-C7FFF write-protect
[    0.000000]   C8000-DFFFF uncachable
[    0.000000]   E0000-FFFFF write-protect
[    0.000000] MTRR variable ranges enabled:
[    0.000000]   0 base 000000000 mask F80000000 write-back
[    0.000000]   1 base 080000000 mask FC0000000 write-back
[    0.000000]   2 base 0BFF00000 mask FFFF00000 uncachable
[    0.000000]   3 disabled
[    0.000000]   4 disabled
[    0.000000]   5 disabled
[    0.000000]   6 disabled
[    0.000000]   7 disabled
[    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
[    0.000000] e820 update range: 0000000000001000 - 0000000000006000 (usable) ==> (reserved)
[    0.000000] Scanning 1 areas for low memory corruption
[    0.000000] modified physical RAM map:
[    0.000000]  modified: 0000000000000000 - 0000000000001000 (usable)
[    0.000000]  modified: 0000000000001000 - 0000000000006000 (reserved)
[    0.000000]  modified: 0000000000006000 - 000000000009dc00 (usable)
[    0.000000]  modified: 000000000009dc00 - 00000000000a0000 (reserved)
[    0.000000]  modified: 00000000000ce000 - 00000000000d0000 (reserved)
[    0.000000]  modified: 00000000000e4000 - 0000000000100000 (reserved)
[    0.000000]  modified: 0000000000100000 - 00000000bfe80000 (usable)
[    0.000000]  modified: 00000000bfe80000 - 00000000bfe92000 (ACPI data)
[    0.000000]  modified: 00000000bfe92000 - 00000000bff00000 (ACPI NVS)
[    0.000000]  modified: 00000000bff00000 - 00000000c0000000 (reserved)
[    0.000000]  modified: 00000000e0000000 - 00000000f0000000 (reserved)
[    0.000000]  modified: 00000000fec00000 - 00000000fec10000 (reserved)
[    0.000000]  modified: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  modified: 00000000ff000000 - 0000000100000000 (reserved)
[    0.000000] initial memory mapped : 0 - 20000000
[    0.000000] init_memory_mapping: 0000000000000000-00000000bfe80000
[    0.000000] NX (Execute Disable) protection: active
[    0.000000]  0000000000 - 00bfe00000 page 2M
[    0.000000]  00bfe00000 - 00bfe80000 page 4k
[    0.000000] kernel direct mapping tables up to bfe80000 @ 8000-d000
[    0.000000] RAMDISK: 377fa000 - 37fef04a
[    0.000000] ACPI: RSDP 00000000000f6320 00014 (v00 PTLTD )
[    0.000000] ACPI: RSDT 00000000bfe8abca 00044 (v01 PTLTD    RSDT   06040000  LTP 00000000)
[    0.000000] ACPI: FACP 00000000bfe91c7b 00074 (v01 INTEL           06040000 PTL  00000003)
[    0.000000] ACPI: DSDT 00000000bfe8b8f1 0638A (v01  INTEL GLENWOOD 06040000 MSFT 0100000E)
[    0.000000] ACPI: FACS 00000000bfe92fc0 00040
[    0.000000] ACPI: SLIC 00000000bfe91cef 00176 (v01                 06040000 ASUS 00000001)
[    0.000000] ACPI: MCFG 00000000bfe91e65 0003C (v01 PTLTD    MCFG   06040000  LTP 00000000)
[    0.000000] ACPI: HPET 00000000bfe91ea1 00038 (v01 PTLTD  HPETTBL  06040000  LTP 00000001)
[    0.000000] ACPI: APIC 00000000bfe91ed9 00068 (v01 PTLTD  ? APIC   06040000  LTP 00000000)
[    0.000000] ACPI: BOOT 00000000bfe91f41 00028 (v01 PTLTD  $SBFTBL$ 06040000  LTP 00000001)
[    0.000000] ACPI: ASF! 00000000bfe91f69 00097 (v32    MBI          06040000      00000000)
[    0.000000] ACPI: SSDT 00000000bfe8ac0e 00A35 (v01 PTLTD    RSDT   00003000 INTL 20050228)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] No NUMA configuration found
[    0.000000] Faking a node at 0000000000000000-00000000bfe80000
[    0.000000] Bootmem setup node 0 0000000000000000-00000000bfe80000
[    0.000000]   NODE_DATA [000000000000b000 - 000000000000ffff]
[    0.000000]   bootmap [0000000000010000 -  0000000000027fcf] pages 18
[    0.000000] (7 early reservations) ==> bootmem [0000000000 - 00bfe80000]
[    0.000000]   #0 [0000000000 - 0000001000]   BIOS data page ==> [0000000000 - 0000001000]
[    0.000000]   #1 [0000006000 - 0000008000]       TRAMPOLINE ==> [0000006000 - 0000008000]
[    0.000000]   #2 [0001000000 - 0001a32a24]    TEXT DATA BSS ==> [0001000000 - 0001a32a24]
[    0.000000]   #3 [00377fa000 - 0037fef04a]          RAMDISK ==> [00377fa000 - 0037fef04a]
[    0.000000]   #4 [000009dc00 - 0000100000]    BIOS reserved ==> [000009dc00 - 0000100000]
[    0.000000]   #5 [0001a33000 - 0001a331d9]              BRK ==> [0001a33000 - 0001a331d9]
[    0.000000]   #6 [0000008000 - 000000b000]          PGTABLE ==> [0000008000 - 000000b000]
[    0.000000] found SMP MP-table at [ffff8800000f6350] f6350
[    0.000000]  [ffffea0000000000-ffffea00029fffff] PMD -> [ffff880002000000-ffff8800049fffff] on node 0
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000000 -> 0x00001000
[    0.000000]   DMA32    0x00001000 -> 0x00100000
[    0.000000]   Normal   0x00100000 -> 0x00100000
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[3] active PFN ranges
[    0.000000]     0: 0x00000000 -> 0x00000001
[    0.000000]     0: 0x00000006 -> 0x0000009d
[    0.000000]     0: 0x00000100 -> 0x000bfe80
[    0.000000] On node 0 totalpages: 785944
[    0.000000]   DMA zone: 56 pages used for memmap
[    0.000000]   DMA zone: 104 pages reserved
[    0.000000]   DMA zone: 3832 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 10691 pages used for memmap
[    0.000000]   DMA32 zone: 771261 pages, LIFO batch:31
[    0.000000] ACPI: PM-Timer IO Port: 0x1008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 high edge)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0xffffffff base: 0xfed00000
[    0.000000] SMP: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] nr_irqs_gsi: 24
[    0.000000] PM: Registered nosave memory: 0000000000001000 - 0000000000006000
[    0.000000] PM: Registered nosave memory: 000000000009d000 - 000000000009e000
[    0.000000] PM: Registered nosave memory: 000000000009e000 - 00000000000a0000
[    0.000000] PM: Registered nosave memory: 00000000000a0000 - 00000000000ce000
[    0.000000] PM: Registered nosave memory: 00000000000ce000 - 00000000000d0000
[    0.000000] PM: Registered nosave memory: 00000000000d0000 - 00000000000e4000
[    0.000000] PM: Registered nosave memory: 00000000000e4000 - 0000000000100000
[    0.000000] Allocating PCI resources starting at c0000000 (gap: c0000000:20000000)
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:2 nr_node_ids:1
[    0.000000] PERCPU: Embedded 30 pages/cpu @ffff880001c00000 s91544 r8192 d23144 u1048576
[    0.000000] pcpu-alloc: s91544 r8192 d23144 u1048576 alloc=1*2097152
[    0.000000] pcpu-alloc: [0] 0 1 
[    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 775093
[    0.000000] Policy zone: DMA32
[    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-2.6.32-30-generic root=UUID=cd3c7621-befc-4a17-976c-bd31c8a92d46 ro quiet splash
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Initializing CPU#0
[    0.000000] Checking aperture...
[    0.000000] No AGP bridge found
[    0.000000] Calgary: detecting Calgary via BIOS EBDA area
[    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.000000] Memory: 3081700k/3144192k available (5428k kernel code, 416k absent, 62076k reserved, 2982k data, 880k init)
[    0.000000] SLUB: Genslabs=14, HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Hierarchical RCU implementation.
[    0.000000] NR_IRQS:4352 nr_irqs:424
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    0.000000] allocated 31457280 bytes of page_cgroup
[    0.000000] please try 'cgroup_disable=memory' option if you don't want memory cgroups
[    0.000000] hpet clockevent registered
[    0.000000] HPET: 3 timers in total, 0 timers will be used for per-cpu timer
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 2400.019 MHz processor.
[    0.010007] Calibrating delay loop (skipped), value calculated using timer frequency.. 4800.03 BogoMIPS (lpj=24000190)
[    0.010037] Security Framework initialized
[    0.010057] AppArmor: AppArmor initialized
[    0.010434] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.013572] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.015166] Mount-cache hash table entries: 256
[    0.015337] Initializing cgroup subsys ns
[    0.015342] Initializing cgroup subsys cpuacct
[    0.015346] Initializing cgroup subsys memory
[    0.015356] Initializing cgroup subsys devices
[    0.015358] Initializing cgroup subsys freezer
[    0.015360] Initializing cgroup subsys net_cls
[    0.015382] CPU: L1 I cache: 32K, L1 D cache: 32K
[    0.015384] CPU: L2 cache: 4096K
[    0.015387] CPU 0/0x0 -> Node 0
[    0.015390] CPU: Physical Processor ID: 0
[    0.015391] CPU: Processor Core ID: 0
[    0.015394] mce: CPU supports 6 MCE banks
[    0.015402] CPU0: Thermal monitoring handled by SMI
[    0.015407] using mwait in idle threads.
[    0.015408] Performance Events: Core2 events, Intel PMU driver.
[    0.015414] ... version:                2
[    0.015416] ... bit width:              40
[    0.015417] ... generic registers:      2
[    0.015419] ... value mask:             000000ffffffffff
[    0.015421] ... max period:             000000007fffffff
[    0.015422] ... fixed-purpose events:   3
[    0.015424] ... event mask:             0000000700000003
[    0.017702] ACPI: Core revision 20090903
[    0.026666] ftrace: converting mcount calls to 0f 1f 44 00 00
[    0.026672] ftrace: allocating 22549 entries in 89 pages
[    0.030056] Setting APIC routing to flat
[    0.030363] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.136862] CPU0: Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz stepping 06
[    0.140000] Booting processor 1 APIC 0x1 ip 0x6000
[    0.020000] Initializing CPU#1
[    0.020000] CPU: L1 I cache: 32K, L1 D cache: 32K
[    0.020000] CPU: L2 cache: 4096K
[    0.020000] CPU 1/0x1 -> Node 0
[    0.020000] CPU: Physical Processor ID: 0
[    0.020000] CPU: Processor Core ID: 1
[    0.020000] CPU1: Thermal monitoring handled by SMI
[    0.290040] CPU1: Intel(R) Core(TM)2 CPU          6600  @ 2.40GHz stepping 06
[    0.290047] checking TSC synchronization [CPU#0 -> CPU#1]: passed.
[    0.300029] Brought up 2 CPUs
[    0.300032] Total of 2 processors activated (9600.28 BogoMIPS).
[    0.300638] CPU0 attaching sched-domain:
[    0.300643]  domain 0: span 0-1 level MC
[    0.300645]   groups: 0 1
[    0.300650] CPU1 attaching sched-domain:
[    0.300652]  domain 0: span 0-1 level MC
[    0.300655]   groups: 1 0
[    0.300718] devtmpfs: initialized
[    0.300718] regulator: core version 0.5
[    0.300718] Time: 12:29:04  Date: 03/29/11
[    0.300718] NET: Registered protocol family 16
[    0.300718] Trying to unpack rootfs image as initramfs...
[    0.300718] ACPI: bus type pci registered
[    0.300718] PCI: MCFG configuration 0: base e0000000 segment 0 buses 0 - 32
[    0.300718] PCI: MCFG area at e0000000 reserved in E820
[    0.300731] PCI: Using MMCONFIG at e0000000 - e20fffff
[    0.300733] PCI: Using configuration type 1 for base access
[    0.310124] bio: create slab <bio-0> at 0
[    0.310680] ACPI: EC: Look up EC in DSDT
[    0.314622] ACPI: Interpreter enabled
[    0.314625] ACPI: (supports S0 S3 S4 S5)
[    0.314640] ACPI: Using IOAPIC for interrupt routing
[    0.318943] ACPI: No dock devices found.
[    0.319835] ACPI: PCI Root Bridge [PCI0] (0000:00)
[    0.319939] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.319942] pci 0000:00:01.0: PME# disabled
[    0.320013] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
[    0.320016] pci 0000:00:03.0: PME# disabled
[    0.320078] pci 0000:00:1b.0: reg 10 64bit mmio: [0xd2400000-0xd2403fff]
[    0.320116] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.320120] pci 0000:00:1b.0: PME# disabled
[    0.320177] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.320180] pci 0000:00:1c.0: PME# disabled
[    0.320244] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
[    0.320248] pci 0000:00:1c.4: PME# disabled
[    0.320306] pci 0000:00:1c.5: PME# supported from D0 D3hot D3cold
[    0.320309] pci 0000:00:1c.5: PME# disabled
[    0.320351] pci 0000:00:1d.0: reg 20 io port: [0x3000-0x301f]
[    0.320395] pci 0000:00:1d.1: reg 20 io port: [0x3020-0x303f]
[    0.320444] pci 0000:00:1d.2: reg 20 io port: [0x3040-0x305f]
[    0.320488] pci 0000:00:1d.3: reg 20 io port: [0x3060-0x307f]
[    0.320537] pci 0000:00:1d.7: reg 10 32bit mmio: [0xd2404000-0xd24043ff]
[    0.320584] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.320588] pci 0000:00:1d.7: PME# disabled
[    0.320702] pci 0000:00:1f.0: quirk: region 1000-107f claimed by ICH6 ACPI/GPIO/TCO
[    0.320706] pci 0000:00:1f.0: quirk: region 1180-11bf claimed by ICH6 GPIO
[    0.320711] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 2 PIO at 0500 (mask 007f)
[    0.320714] pci 0000:00:1f.0: ICH7 LPC Generic IO decode 3 PIO at 0500 (mask 00ff)
[    0.320751] pci 0000:00:1f.1: reg 10 io port: [0x00-0x07]
[    0.320758] pci 0000:00:1f.1: reg 14 io port: [0x00-0x03]
[    0.320765] pci 0000:00:1f.1: reg 18 io port: [0x00-0x07]
[    0.320770] pci 0000:00:1f.1: reg 1c io port: [0x00-0x03]
[    0.320776] pci 0000:00:1f.1: reg 20 io port: [0x30a0-0x30af]
[    0.320812] pci 0000:00:1f.2: reg 10 io port: [0x30e8-0x30ef]
[    0.320817] pci 0000:00:1f.2: reg 14 io port: [0x30dc-0x30df]
[    0.320823] pci 0000:00:1f.2: reg 18 io port: [0x30e0-0x30e7]
[    0.320828] pci 0000:00:1f.2: reg 1c io port: [0x30d8-0x30db]
[    0.320833] pci 0000:00:1f.2: reg 20 io port: [0x30b0-0x30bf]
[    0.320838] pci 0000:00:1f.2: reg 24 32bit mmio: [0xd2404400-0xd24047ff]
[    0.320857] pci 0000:00:1f.2: PME# supported from D3hot
[    0.320860] pci 0000:00:1f.2: PME# disabled
[    0.320901] pci 0000:00:1f.3: reg 20 io port: [0x3080-0x309f]
[    0.320951] pci 0000:01:00.0: reg 10 32bit mmio: [0xd1000000-0xd1ffffff]
[    0.320961] pci 0000:01:00.0: reg 14 64bit mmio pref: [0xc0000000-0xcfffffff]
[    0.320969] pci 0000:01:00.0: reg 1c 64bit mmio: [0xd0000000-0xd0ffffff]
[    0.320976] pci 0000:01:00.0: reg 30 32bit mmio pref: [0x000000-0x01ffff]
[    0.321030] pci 0000:00:01.0: bridge 32bit mmio: [0xd0000000-0xd1ffffff]
[    0.321034] pci 0000:00:01.0: bridge 64bit mmio pref: [0xc0000000-0xcfffffff]
[    0.321164] pci 0000:19:00.0: reg 10 64bit mmio: [0xd2000000-0xd200ffff]
[    0.321232] pci 0000:19:00.0: PME# supported from D3hot D3cold
[    0.321236] pci 0000:19:00.0: PME# disabled
[    0.321280] pci 0000:00:1c.4: bridge 32bit mmio: [0xd2000000-0xd20fffff]
[    0.321368] pci 0000:21:09.0: reg 10 32bit mmio: [0xd2104000-0xd21047ff]
[    0.321375] pci 0000:21:09.0: reg 14 32bit mmio: [0xd2100000-0xd2103fff]
[    0.321416] pci 0000:21:09.0: supports D1 D2
[    0.321418] pci 0000:21:09.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.321422] pci 0000:21:09.0: PME# disabled
[    0.321456] pci 0000:00:1e.0: transparent bridge
[    0.321461] pci 0000:00:1e.0: bridge 32bit mmio: [0xd2100000-0xd21fffff]
[    0.321486] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.321669] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP1._PRT]
[    0.321726] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP5._PRT]
[    0.321780] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP6._PRT]
[    0.321835] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIB._PRT]
[    0.327221] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 *10 11 14 15)
[    0.327307] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 *10 11 14 15)
[    0.327384] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 10 *11 14 15)
[    0.327461] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 *10 11 14 15)
[    0.327545] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 10 11 14 15) *0, disabled.
[    0.327629] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 10 11 14 15) *0, disabled.
[    0.327714] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 10 *11 14 15)
[    0.327798] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 10 11 14 15) *5
[    0.327916] vgaarb: device added: PCI:0000:01:00.0,decodes=io+mem,owns=io+mem,locks=none
[    0.327919] vgaarb: loaded
[    0.328031] SCSI subsystem initialized
[    0.328117] libata version 3.00 loaded.
[    0.328187] usbcore: registered new interface driver usbfs
[    0.328197] usbcore: registered new interface driver hub
[    0.328224] usbcore: registered new device driver usb
[    0.328348] ACPI: WMI: Mapper loaded
[    0.328350] PCI: Using ACPI for IRQ routing
[    0.328499] NetLabel: Initializing
[    0.328501] NetLabel:  domain hash size = 128
[    0.328502] NetLabel:  protocols = UNLABELED CIPSOv4
[    0.328518] NetLabel:  unlabeled traffic allowed by default
[    0.328549] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.328554] hpet0: 3 comparators, 64-bit 14.318180 MHz counter
[    0.340040] Switching to clocksource tsc
[    0.341799] AppArmor: AppArmor Filesystem Enabled
[    0.341816] pnp: PnP ACPI init
[    0.341831] ACPI: bus type pnp registered
[    0.345795] pnp: PnP ACPI: found 13 devices
[    0.345797] ACPI: ACPI bus type pnp unregistered
[    0.345809] system 00:01: iomem range 0xe0000000-0xefffffff has been reserved
[    0.345817] system 00:02: ioport range 0x500-0x57f has been reserved
[    0.345819] system 00:02: ioport range 0x800-0x80f has been reserved
[    0.345822] system 00:02: ioport range 0x1000-0x107f has been reserved
[    0.345824] system 00:02: ioport range 0x1180-0x11bf has been reserved
[    0.345827] system 00:02: ioport range 0x4d0-0x4d1 has been reserved
[    0.345829] system 00:02: ioport range 0xfe00-0xfe00 has been reserved
[    0.345832] system 00:02: iomem range 0xfed14000-0xfed17fff has been reserved
[    0.345834] system 00:02: iomem range 0xfed13000-0xfed13fff has been reserved
[    0.345837] system 00:02: iomem range 0xe0000000-0xefffffff has been reserved
[    0.345839] system 00:02: iomem range 0xfed20000-0xfed8ffff has been reserved
[    0.345842] system 00:02: iomem range 0xfef00000-0xfeffffff has been reserved
[    0.350601] pci 0000:01:00.0: BAR 6: can't allocate mem resource [0xd0000000-0xcfffffff]
[    0.350604] pci 0000:00:01.0: PCI bridge, secondary bus 0000:01
[    0.350606] pci 0000:00:01.0:   IO window: disabled
[    0.350609] pci 0000:00:01.0:   MEM window: 0xd0000000-0xd1ffffff
[    0.350612] pci 0000:00:01.0:   PREFETCH window: 0x000000c0000000-0x000000cfffffff
[    0.350617] pci 0000:00:03.0: PCI bridge, secondary bus 0000:05
[    0.350618] pci 0000:00:03.0:   IO window: disabled
[    0.350621] pci 0000:00:03.0:   MEM window: disabled
[    0.350623] pci 0000:00:03.0:   PREFETCH window: disabled
[    0.350627] pci 0000:00:1c.0: PCI bridge, secondary bus 0000:09
[    0.350630] pci 0000:00:1c.0:   IO window: 0x2000-0x2fff
[    0.350634] pci 0000:00:1c.0:   MEM window: 0xd2200000-0xd23fffff
[    0.350638] pci 0000:00:1c.0:   PREFETCH window: 0x000000d2500000-0x000000d26fffff
[    0.350644] pci 0000:00:1c.4: PCI bridge, secondary bus 0000:19
[    0.350646] pci 0000:00:1c.4:   IO window: 0x4000-0x4fff
[    0.350651] pci 0000:00:1c.4:   MEM window: 0xd2000000-0xd20fffff
[    0.350655] pci 0000:00:1c.4:   PREFETCH window: 0x000000d2700000-0x000000d28fffff
[    0.350661] pci 0000:00:1c.5: PCI bridge, secondary bus 0000:1d
[    0.350663] pci 0000:00:1c.5:   IO window: 0x5000-0x5fff
[    0.350668] pci 0000:00:1c.5:   MEM window: 0xd2900000-0xd2afffff
[    0.350672] pci 0000:00:1c.5:   PREFETCH window: 0x000000d2b00000-0x000000d2cfffff
[    0.350677] pci 0000:00:1e.0: PCI bridge, secondary bus 0000:21
[    0.350679] pci 0000:00:1e.0:   IO window: disabled
[    0.350683] pci 0000:00:1e.0:   MEM window: 0xd2100000-0xd21fffff
[    0.350686] pci 0000:00:1e.0:   PREFETCH window: disabled
[    0.350698]   alloc irq_desc for 16 on node -1
[    0.350700]   alloc kstat_irqs on node -1
[    0.350705] pci 0000:00:01.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.350709] pci 0000:00:01.0: setting latency timer to 64
[    0.350714] pci 0000:00:03.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.350716] pci 0000:00:03.0: setting latency timer to 64
[    0.350724] pci 0000:00:1c.0: enabling device (0140 -> 0143)
[    0.350727] pci 0000:00:1c.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.350731] pci 0000:00:1c.0: setting latency timer to 64
[    0.350739] pci 0000:00:1c.4: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.350742] pci 0000:00:1c.4: setting latency timer to 64
[    0.350749] pci 0000:00:1c.5: enabling device (0000 -> 0003)
[    0.350752]   alloc irq_desc for 17 on node -1
[    0.350754]   alloc kstat_irqs on node -1
[    0.350757] pci 0000:00:1c.5: PCI INT B -> GSI 17 (level, low) -> IRQ 17
[    0.350761] pci 0000:00:1c.5: setting latency timer to 64
[    0.350767] pci 0000:00:1e.0: setting latency timer to 64
[    0.350770] pci_bus 0000:00: resource 0 io:  [0x00-0xffff]
[    0.350772] pci_bus 0000:00: resource 1 mem: [0x000000-0xffffffffffffffff]
[    0.350775] pci_bus 0000:01: resource 1 mem: [0xd0000000-0xd1ffffff]
[    0.350777] pci_bus 0000:01: resource 2 pref mem [0xc0000000-0xcfffffff]
[    0.350779] pci_bus 0000:09: resource 0 io:  [0x2000-0x2fff]
[    0.350781] pci_bus 0000:09: resource 1 mem: [0xd2200000-0xd23fffff]
[    0.350783] pci_bus 0000:09: resource 2 pref mem [0xd2500000-0xd26fffff]
[    0.350786] pci_bus 0000:19: resource 0 io:  [0x4000-0x4fff]
[    0.350788] pci_bus 0000:19: resource 1 mem: [0xd2000000-0xd20fffff]
[    0.350790] pci_bus 0000:19: resource 2 pref mem [0xd2700000-0xd28fffff]
[    0.350792] pci_bus 0000:1d: resource 0 io:  [0x5000-0x5fff]
[    0.350794] pci_bus 0000:1d: resource 1 mem: [0xd2900000-0xd2afffff]
[    0.350796] pci_bus 0000:1d: resource 2 pref mem [0xd2b00000-0xd2cfffff]
[    0.350798] pci_bus 0000:21: resource 1 mem: [0xd2100000-0xd21fffff]
[    0.350800] pci_bus 0000:21: resource 3 io:  [0x00-0xffff]
[    0.350802] pci_bus 0000:21: resource 4 mem: [0x000000-0xffffffffffffffff]
[    0.350838] NET: Registered protocol family 2
[    0.351008] IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
[    0.352198] TCP established hash table entries: 524288 (order: 11, 8388608 bytes)
[    0.358806] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.359679] TCP: Hash tables configured (established 524288 bind 65536)
[    0.359682] TCP reno registered
[    0.359809] NET: Registered protocol family 1
[    0.359926] pci 0000:01:00.0: Boot video device
[    0.359982] Simple Boot Flag at 0x38 set to 0x1
[    0.360162] Scanning for low memory corruption every 60 seconds
[    0.360313] audit: initializing netlink socket (disabled)
[    0.360323] type=2000 audit(1301401744.359:1): initialized
[    0.368827] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.370138] VFS: Disk quotas dquot_6.5.2
[    0.370190] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.370736] fuse init (API version 7.13)
[    0.370814] msgmni has been set to 6018
[    0.371006] alg: No test for stdrng (krng)
[    0.371055] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
[    0.371057] io scheduler noop registered
[    0.371059] io scheduler anticipatory registered
[    0.371061] io scheduler deadline registered
[    0.371092] io scheduler cfq registered (default)
[    0.371225]   alloc irq_desc for 24 on node -1
[    0.371227]   alloc kstat_irqs on node -1
[    0.371235] pcieport 0000:00:01.0: irq 24 for MSI/MSI-X
[    0.371241] pcieport 0000:00:01.0: setting latency timer to 64
[    0.371318]   alloc irq_desc for 25 on node -1
[    0.371320]   alloc kstat_irqs on node -1
[    0.371324] pcieport 0000:00:03.0: irq 25 for MSI/MSI-X
[    0.371329] pcieport 0000:00:03.0: setting latency timer to 64
[    0.371409]   alloc irq_desc for 26 on node -1
[    0.371411]   alloc kstat_irqs on node -1
[    0.371417] pcieport 0000:00:1c.0: irq 26 for MSI/MSI-X
[    0.371423] pcieport 0000:00:1c.0: setting latency timer to 64
[    0.371528]   alloc irq_desc for 27 on node -1
[    0.371529]   alloc kstat_irqs on node -1
[    0.371535] pcieport 0000:00:1c.4: irq 27 for MSI/MSI-X
[    0.371542] pcieport 0000:00:1c.4: setting latency timer to 64
[    0.371643]   alloc irq_desc for 28 on node -1
[    0.371644]   alloc kstat_irqs on node -1
[    0.371650] pcieport 0000:00:1c.5: irq 28 for MSI/MSI-X
[    0.371657] pcieport 0000:00:1c.5: setting latency timer to 64
[    0.371734] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.371812] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
[    0.371929] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/PNP0C0C:00/input/input0
[    0.371937] ACPI: Power Button [PWRB]
[    0.371975] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
[    0.371977] ACPI: Power Button [PWRF]
[    0.372520] ACPI: SSDT 00000000bfe8b643 0017C (v01 PTLTD    RSDT   00003000 INTL 20050228)
[    0.372711] processor LNXCPU:00: registered as cooling_device0
[    0.373058] ACPI: SSDT 00000000bfe8b7bf 00066 (v01 PTLTD    RSDT   00003000 INTL 20050228)
[    0.373227] processor LNXCPU:01: registered as cooling_device1
[    0.376618] Linux agpgart interface v0.103
[    0.376649] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.376747] serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.376838] serial8250: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[    0.377111] 00:09: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
[    0.377238] 00:0a: ttyS1 at I/O 0x2f8 (irq = 3) is a 16550A
[    0.378149] brd: module loaded
[    0.378570] loop: module loaded
[    0.378644] input: Macintosh mouse button emulation as /devices/virtual/input/input2
[    0.378736] ata_piix 0000:00:1f.1: version 2.13
[    0.378748]   alloc irq_desc for 18 on node -1
[    0.378749]   alloc kstat_irqs on node -1
[    0.378755] ata_piix 0000:00:1f.1: PCI INT A -> GSI 18 (level, low) -> IRQ 18
[    0.378795] ata_piix 0000:00:1f.1: setting latency timer to 64
[    0.378882] scsi0 : ata_piix
[    0.378944] scsi1 : ata_piix
[    0.379715] ata1: PATA max UDMA/100 cmd 0x1f0 ctl 0x3f6 bmdma 0x30a0 irq 14
[    0.379718] ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0x30a8 irq 15
[    0.379737]   alloc irq_desc for 19 on node -1
[    0.379739]   alloc kstat_irqs on node -1
[    0.379743] ata_piix 0000:00:1f.2: PCI INT B -> GSI 19 (level, low) -> IRQ 19
[    0.379747] ata_piix 0000:00:1f.2: MAP [ P0 P2 P1 P3 ]
[    0.468103] Freeing initrd memory: 8148k freed
[    0.539827] ata_piix 0000:00:1f.2: setting latency timer to 64
[    0.539963] scsi2 : ata_piix
[    0.540087] scsi3 : ata_piix
[    0.540851] ata3: SATA max UDMA/133 cmd 0x30e8 ctl 0x30dc bmdma 0x30b0 irq 19
[    0.540853] ata4: SATA max UDMA/133 cmd 0x30e0 ctl 0x30d8 bmdma 0x30b8 irq 19
[    0.541153] Fixed MDIO Bus: probed
[    0.541183] PPP generic driver version 2.4.2
[    0.541255] tun: Universal TUN/TAP device driver, 1.6
[    0.541257] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
[    0.541348] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.541373]   alloc irq_desc for 23 on node -1
[    0.541375]   alloc kstat_irqs on node -1
[    0.541381] ehci_hcd 0000:00:1d.7: PCI INT A -> GSI 23 (level, low) -> IRQ 23
[    0.541402] ehci_hcd 0000:00:1d.7: setting latency timer to 64
[    0.541405] ehci_hcd 0000:00:1d.7: EHCI Host Controller
[    0.541433] ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
[    0.541455] ehci_hcd 0000:00:1d.7: using broken periodic workaround
[    0.541464] ehci_hcd 0000:00:1d.7: debug port 1
[    0.545351] ehci_hcd 0000:00:1d.7: cache line size of 32 is not supported
[    0.545363] ehci_hcd 0000:00:1d.7: irq 23, io mem 0xd2404000
[    0.559877] ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    0.559982] usb usb1: configuration #1 chosen from 1 choice
[    0.560018] hub 1-0:1.0: USB hub found
[    0.560026] hub 1-0:1.0: 8 ports detected
[    0.560116] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.560128] uhci_hcd: USB Universal Host Controller Interface driver
[    0.560143] ata1.00: ATAPI: HL-DT-ST RW/DVD GCC-H20N, 1.05, max UDMA/33
[    0.560173] uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
[    0.560180] uhci_hcd 0000:00:1d.0: setting latency timer to 64
[    0.560182] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    0.560213] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
[    0.560240] uhci_hcd 0000:00:1d.0: irq 23, io base 0x00003000
[    0.560313] usb usb2: configuration #1 chosen from 1 choice
[    0.560337] hub 2-0:1.0: USB hub found
[    0.560343] hub 2-0:1.0: 2 ports detected
[    0.560380] uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
[    0.560385] uhci_hcd 0000:00:1d.1: setting latency timer to 64
[    0.560388] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    0.560413] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 3
[    0.560434] uhci_hcd 0000:00:1d.1: irq 19, io base 0x00003020
[    0.560509] usb usb3: configuration #1 chosen from 1 choice
[    0.560529] hub 3-0:1.0: USB hub found
[    0.560536] hub 3-0:1.0: 2 ports detected
[    0.560575] uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
[    0.560580] uhci_hcd 0000:00:1d.2: setting latency timer to 64
[    0.560583] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    0.560608] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
[    0.560635] uhci_hcd 0000:00:1d.2: irq 18, io base 0x00003040
[    0.560708] usb usb4: configuration #1 chosen from 1 choice
[    0.560728] hub 4-0:1.0: USB hub found
[    0.560734] hub 4-0:1.0: 2 ports detected
[    0.560771] uhci_hcd 0000:00:1d.3: PCI INT D -> GSI 16 (level, low) -> IRQ 16
[    0.560776] uhci_hcd 0000:00:1d.3: setting latency timer to 64
[    0.560779] uhci_hcd 0000:00:1d.3: UHCI Host Controller
[    0.560813] uhci_hcd 0000:00:1d.3: new USB bus registered, assigned bus number 5
[    0.560840] uhci_hcd 0000:00:1d.3: irq 16, io base 0x00003060
[    0.560915] usb usb5: configuration #1 chosen from 1 choice
[    0.560936] hub 5-0:1.0: USB hub found
[    0.560941] hub 5-0:1.0: 2 ports detected
[    0.561023] PNP: No PS/2 controller found. Probing ports directly.
[    0.563709] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.563715] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.563799] mice: PS/2 mouse device common for all mice
[    0.563891] rtc_cmos 00:06: RTC can wake from S4
[    0.563927] rtc_cmos 00:06: rtc core: registered rtc_cmos as rtc0
[    0.563949] rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    0.564056] device-mapper: uevent: version 1.0.3
[    0.564144] device-mapper: ioctl: 4.15.0-ioctl (2009-04-01) initialised: dm-devel@redhat.com
[    0.564221] device-mapper: multipath: version 1.1.0 loaded
[    0.564223] device-mapper: multipath round-robin: version 1.0.0 loaded
[    0.564381] cpuidle: using governor ladder
[    0.564383] cpuidle: using governor menu
[    0.564689] TCP cubic registered
[    0.564824] NET: Registered protocol family 10
[    0.565194] lo: Disabled Privacy Extensions
[    0.565430] NET: Registered protocol family 17
[    0.565752] PM: Resume from disk failed.
[    0.565764] registered taskstats version 1
[    0.566046]   Magic number: 3:359:482
[    0.566120] rtc_cmos 00:06: setting system clock to 2011-03-29 12:29:04 UTC (1301401744)
[    0.566123] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
[    0.566124] EDD information not available.
[    0.600234] ata1.00: configured for UDMA/33
[    0.601316] scsi 0:0:0:0: CD-ROM            HL-DT-ST RW/DVD GCC-H20N  1.05 PQ: 0 ANSI: 5
[    0.603678] sr0: scsi3-mmc drive: 48x/48x writer cd/rw xa/form2 cdda tray
[    0.603682] Uniform CD-ROM driver Revision: 3.20
[    0.603790] sr 0:0:0:0: Attached scsi CD-ROM sr0
[    0.603850] sr 0:0:0:0: Attached scsi generic sg0 type 5
[    0.730775] ata3.00: ATA-7: WDC WD1600YS-23SHB0, 20.06C04, max UDMA/133
[    0.730780] ata3.00: 312581808 sectors, multi 16: LBA48 NCQ (depth 0/32)
[    0.750837] ata3.00: configured for UDMA/133
[    0.750937] scsi 2:0:0:0: Direct-Access     ATA      WDC WD1600YS-23S 20.0 PQ: 0 ANSI: 5
[    0.751079] sd 2:0:0:0: [sda] 312581808 512-byte logical blocks: (160 GB/149 GiB)
[    0.751084] sd 2:0:0:0: Attached scsi generic sg1 type 0
[    0.751150] sd 2:0:0:0: [sda] Write Protect is off
[    0.751154] sd 2:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    0.751198] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
[    0.751361]  sda: sda1 sda2 sda3
[    0.762469] sd 2:0:0:0: [sda] Attached SCSI disk
[    0.762488] Freeing unused kernel memory: 880k freed
[    0.762741] Write protecting the kernel read-only data: 7704k
[    0.775375] udev: starting version 151
[    0.862856] tg3.c:v3.102 (September 1, 2009)
[    0.862876] tg3 0000:19:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    0.862884] tg3 0000:19:00.0: setting latency timer to 64
[    0.866092] ohci1394 0000:21:09.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
[    0.884301] FDC 0 is a post-1991 82077
[    0.905730] eth0: Tigon3 [partno(BCM95752) rev 6002] (PCI Express) MAC address 00:14:5e:64:b4:1c
[    0.905733] eth0: attached PHY is 5752 (10/100/1000Base-T Ethernet) (WireSpeed[1])
[    0.905735] eth0: RXcsums[1] LinkChgREG[0] MIirq[0] ASF[0] TSOcap[1]
[    0.905737] eth0: dma_rwctrl[76180000] dma_mask[64-bit]
[    0.920959] ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[23]  MMIO=[d2104000-d21047ff]  Max Packet=[2048]  IR/IT contexts=[4/8]
[    1.059528] EXT4-fs (sda2): INFO: recovery required on readonly filesystem
[    1.059534] EXT4-fs (sda2): write access will be enabled during recovery
[    1.140389] EXT4-fs (sda2): orphan cleanup on readonly fs
[    1.153278] EXT4-fs (sda2): ext4_orphan_cleanup: deleting unreferenced inode 528340
[    1.160204] EXT4-fs (sda2): ext4_orphan_cleanup: deleting unreferenced inode 528338
[    1.160704] EXT4-fs (sda2): ext4_orphan_cleanup: deleting unreferenced inode 528335
[    1.160734] EXT4-fs (sda2): ext4_orphan_cleanup: deleting unreferenced inode 528986
[    1.160759] EXT4-fs (sda2): 4 orphan inodes deleted
[    1.160763] EXT4-fs (sda2): recovery complete
[    1.280034] usb 3-2: new low speed USB device using uhci_hcd and address 2
[    1.452606] usb 3-2: configuration #1 chosen from 1 choice
[    1.463055] usbcore: registered new interface driver hiddev
[    1.475778] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1d.1/usb3/3-2/3-2:1.0/input/input3
[    1.475865] generic-usb 0003:0461:4D22.0001: input,hidraw0: USB HID v1.11 Mouse [USB Optical Mouse] on usb-0000:00:1d.1-2/input0
[    1.475884] usbcore: registered new interface driver usbhid
[    1.475886] usbhid: v2.6:USB HID core driver
[    1.525419] EXT4-fs (sda2): mounted filesystem with ordered data mode
[    1.732553] usb 4-1: new low speed USB device using uhci_hcd and address 2
[    1.913813] usb 4-1: configuration #1 chosen from 1 choice
[    1.932046] input: CHICONY USB NetVista Full Width Keyboard as /devices/pci0000:00/0000:00:1d.2/usb4/4-1/4-1:1.0/input/input4
[    1.932102] generic-usb 0003:04B3:3025.0002: input,hidraw1: USB HID v1.10 Keyboard [CHICONY USB NetVista Full Width Keyboard] on usb-0000:00:1d.2-1/input0
[    2.210119] usb 5-1: new full speed USB device using uhci_hcd and address 2
[    2.240218] ieee1394: Host added: ID:BUS[0-00:1023]  GUID[0011d8000187b1a7]
[    2.433044] usb 5-1: configuration #1 chosen from 1 choice
[    2.441988] input: Logitech Logitech USB Headset as /devices/pci0000:00/0000:00:1d.3/usb5/5-1/5-1:1.3/input/input5
[    2.442065] generic-usb 0003:046D:0A0C.0003: input,hidraw2: USB HID v1.00 Device [Logitech Logitech USB Headset] on usb-0000:00:1d.3-1/input3
[    3.540240] Adding 7811064k swap on /dev/sda1.  Priority:-1 extents:1 across:7811064k 
[    3.784252] udev: starting version 151
[    4.361048] EDAC MC: Ver: 2.1.0 Mar  1 2011
[    4.361559] [drm] Initialized drm 1.1.0 20060810
[    4.610826] lp: driver loaded but no devices found
[    4.651067] parport_pc 00:0c: reported by Plug and Play ACPI
[    4.651126] parport0: PC-style at 0x378 (0x778), irq 7, dma 1 [PCSPP,TRISTATE,COMPAT,ECP,DMA]
[    4.652185] intel_rng: FWH not detected
[    4.653123] EDAC MC0: Giving out device to 'i82975x_edac' 'i82975x': DEV <NULL>
[    4.690323] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    4.690329] nouveau 0000:01:00.0: setting latency timer to 64
[    4.693823] [drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x044500a2)
[    4.694065] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PROM
[    4.694398] ppdev: user-space parallel port driver
[    4.722703] lp0: using parport0 (interrupt-driven).
[    4.893507] [drm] nouveau 0000:01:00.0: ... appears to be valid
[    4.893512] [drm] nouveau 0000:01:00.0: BIT BIOS found
[    4.893514] [drm] nouveau 0000:01:00.0: Bios version 05.44.02.63
[    4.893518] [drm] nouveau 0000:01:00.0: BIT table 'd' not found
[    4.893520] [drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
[    4.893523] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 7 2
[    4.893526] [drm] nouveau 0000:01:00.0:   0: 0x00001038: type 0x38 idx 0 tag 0x07
[    4.893528] [drm] nouveau 0000:01:00.0:   1: 0x00002039: type 0x39 idx 0 tag 0x08
[    4.893530] [drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[    4.893533] [drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 2 tag 0xff
[    4.893535] [drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 2 tag 0xff
[    4.893537] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
[    4.893539] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 01000302 00000000
[    4.893541] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02011310 00000028
[    4.893543] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 04011312 00000000
[    4.893550] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xB1C9
[    4.893740] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xB52E
[    5.040266] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xBA68
[    5.040282] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xBBBD
[    5.060191] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xBD67
[    5.070084] [TTM] Zone  kernel: Available graphics memory: 1545366 kiB.
[    5.070093] [drm] nouveau 0000:01:00.0: 128 MiB VRAM
[    5.071435] [drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[    5.072593] [drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[    5.073315] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[    5.073322] [drm] nouveau 0000:01:00.0: Initial CRTC_OWNER is 0
[    5.073329] [drm] nouveau 0000:01:00.0: Saving VGA fonts
[    5.127319] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[    5.127374] [drm] nouveau 0000:01:00.0: Detected a DVI-I connector
[    5.128853] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[    5.128856] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1)
[    5.128859] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
[    5.128861] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 3)
[    5.312762] [drm] nouveau 0000:01:00.0: allocated 1280x1024 fb: 0x49000, bo ffff8800b1b45600
[    5.312848] fb0: nouveaufb frame buffer device
[    5.312850] registered panic notifier
[    5.312855] [drm] Initialized nouveau 0.0.15 20090420 for 0000:01:00.0 on minor 0
[    5.396587] vga16fb: initializing
[    5.396591] vga16fb: mapped to 0xffff8800000a0000
[    5.396594] vga16fb: not registering due to another framebuffer present
[    5.505472] usbcore: registered new interface driver snd-usb-audio
[    5.534513] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[    5.534517] [drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 0 using output A
[    5.536801] Console: switching to colour frame buffer device 160x64
[    5.543422]   alloc irq_desc for 22 on node -1
[    5.543425]   alloc kstat_irqs on node -1
[    5.543431] HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
[    5.543468] HDA Intel 0000:00:1b.0: setting latency timer to 64
[    5.768691] type=1505 audit(1301401749.693:2):  operation="profile_load" pid=478 name="/sbin/dhclient3"
[    5.768699] type=1505 audit(1301401749.693:3):  operation="profile_replace" pid=480 name="/sbin/dhclient3"
[    5.769288] type=1505 audit(1301401749.693:4):  operation="profile_load" pid=478 name="/usr/lib/NetworkManager/nm-dhcp-client.action"
[    5.769301] type=1505 audit(1301401749.693:5):  operation="profile_replace" pid=480 name="/usr/lib/NetworkManager/nm-dhcp-client.action"
[    5.769617] type=1505 audit(1301401749.693:6):  operation="profile_load" pid=478 name="/usr/lib/connman/scripts/dhclient-script"
[    5.769633] type=1505 audit(1301401749.693:7):  operation="profile_replace" pid=480 name="/usr/lib/connman/scripts/dhclient-script"
[    5.788003] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1b.0/input/input6
[    5.924310] type=1505 audit(1301401749.853:8):  operation="profile_load" pid=687 name="/usr/sbin/ntpd"
[    5.924322] type=1505 audit(1301401749.853:9):  operation="profile_replace" pid=686 name="/usr/sbin/ntpd"
[    7.829131]   alloc irq_desc for 29 on node -1
[    7.829134]   alloc kstat_irqs on node -1
[    7.829148] tg3 0000:19:00.0: irq 29 for MSI/MSI-X
[    7.861743] ADDRCONF(NETDEV_UP): eth0: link is not ready
[    9.389180] EXT4-fs (sda3): mounted filesystem with ordered data mode
[    9.425649] tg3: eth0: Link is up at 100 Mbps, full duplex.
[    9.425652] tg3: eth0: Flow control is off for TX and off for RX.
[    9.426110] ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[   10.363496] type=1505 audit(1301401754.293:10):  operation="profile_replace" pid=859 name="/sbin/dhclient3"
[   10.364090] type=1505 audit(1301401754.293:11):  operation="profile_replace" pid=859 name="/usr/lib/NetworkManager/nm-dhcp-client.action"
[   10.605939] ip_tables: (C) 2000-2006 Netfilter Core Team
[   11.835780] Netfilter messages via NETLINK v0.30.
[   11.977767] nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
[   11.977973] CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
[   11.977975] nf_conntrack.acct=1 kernel parameter, acct=1 nf_conntrack module option or
[   11.977977] sysctl net.netfilter.nf_conntrack_acct=1 to enable it.
[   13.105085] [drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[   13.105812] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 1
[   13.769015] ctnetlink v0.93: registering with nfnetlink.
[   13.852849] ClusterIP Version 0.8 loaded successfully
[   15.640600] xt_time: kernel timezone is -0400
[   15.990754] u32 classifier
[   15.990756]     Actions configured 
[   19.520047] eth0: no IPv6 routers present
[   31.952908] RPC: Registered udp transport module.
[   31.952911] RPC: Registered tcp transport module.
[   31.952913] RPC: Registered tcp NFSv4.1 backchannel transport module.
[   32.014222] svc: failed to register lockdv1 RPC service (errno 97).
[ 1752.041002] __ratelimit: 27 callbacks suppressed
[ 1752.041008] npviewer.bin[2093]: segfault at 418 ip 00000000f60e0d36 sp 00000000ff819408 error 6 in libflashplayer.so[f5e73000+b5f000]
[ 3725.033884] npviewer.bin[3183]: segfault at 0 ip 00000000f61ba8d1 sp 00000000ffd446e0 error 4 in libflashplayer.so[f5df2000+b5f000]
[ 3967.266166] npviewer.bin[3291]: segfault at 0 ip 00000000f61e48d1 sp 00000000fffa9a40 error 4 in libflashplayer.so[f5e1c000+b5f000]
[ 3975.917553] npviewer.bin[3455]: segfault at 0 ip 00000000f61cf8d1 sp 00000000ffdad110 error 4 in libflashplayer.so[f5e07000+b5f000]
[ 4021.690387] npviewer.bin[3504]: segfault at f5a2b0b4 ip 00000000f61e98c3 sp 00000000ff852a20 error 4 in libflashplayer.so[f5e21000+b5f000]
[ 4031.748502] npviewer.bin[3626]: segfault at 0 ip 00000000f61e98d1 sp 00000000ffbf0700 error 4 in libflashplayer.so[f5e21000+b5f000]
[ 4095.802436] npviewer.bin[3656]: segfault at 418 ip 00000000f60a9d36 sp 00000000ff904618 error 6 in libflashplayer.so[f5e3c000+b5f000]
[ 4118.662147] npviewer.bin[3800]: segfault at 0 ip 00000000f61638d1 sp 00000000ff9f31f0 error 4 in libflashplayer.so[f5d9b000+b5f000]
[ 7753.042556] usb 5-1: USB disconnect, address 2
[ 7753.372526] usb 5-1: new full speed USB device using uhci_hcd and address 3
[ 7753.595588] usb 5-1: configuration #1 chosen from 1 choice
[ 7753.676542] input: Logitech Logitech USB Headset as /devices/pci0000:00/0000:00:1d.3/usb5/5-1/5-1:1.3/input/input7
[ 7753.676663] generic-usb 0003:046D:0A0C.0004: input,hidraw2: USB HID v1.00 Device [Logitech Logitech USB Headset] on usb-0000:00:1d.3-1/input3
[ 7753.792553] usb 1-8: new high speed USB device using ehci_hcd and address 5
[ 7753.945047] usb 1-8: configuration #1 chosen from 1 choice
[ 7753.999967] Initializing USB Mass Storage driver...
[ 7754.000360] scsi4 : SCSI emulation for USB Mass Storage devices
[ 7754.000472] usbcore: registered new interface driver usb-storage
[ 7754.000476] USB Mass Storage support registered.
[ 7754.001953] usb-storage: device found at 5
[ 7754.001956] usb-storage: waiting for device to settle before scanning
[ 7759.000836] usb-storage: device scan complete
[ 7759.001563] scsi 4:0:0:0: Direct-Access     Kingston DataTraveler 2.0 PMAP PQ: 0 ANSI: 0 CCS
[ 7759.003203] sd 4:0:0:0: Attached scsi generic sg2 type 0
[ 7760.959803] sd 4:0:0:0: [sdb] 4030464 512-byte logical blocks: (2.06 GB/1.92 GiB)
[ 7760.960293] sd 4:0:0:0: [sdb] Write Protect is off
[ 7760.960297] sd 4:0:0:0: [sdb] Mode Sense: 23 00 00 00
[ 7760.960300] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 7760.962544] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 7760.962550]  sdb: sdb1
[ 7760.964675] sd 4:0:0:0: [sdb] Assuming drive cache: write through
[ 7760.964681] sd 4:0:0:0: [sdb] Attached SCSI removable disk
[ 8592.238164] npviewer.bin[4972]: segfault at f2c290ac ip 00000000f617e8e7 sp 00000000ff8e5640 error 4 in libflashplayer.so[f5db6000+b5f000]
[ 8714.481781] type=1503 audit(1301410457.293:21):  operation="link" pid=5472 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.open8RU8SV" name2="/home/markov/arman/.local/share/gvfs-metadata/home"
[ 8714.503702] type=1503 audit(1301410457.321:22):  operation="link" pid=5472 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.open1QC8SV" name2="/home/markov/arman/.local/share/gvfs-metadata/home-9d5a7d88.log"
[ 8725.126364] type=1503 audit(1301410467.941:23):  operation="link" pid=5504 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.openBE8MTV" name2="/home/markov/arman/.local/share/gvfs-metadata/home"
[ 8725.136520] type=1503 audit(1301410467.951:24):  operation="link" pid=5504 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.openAB5MTV" name2="/home/markov/arman/.local/share/gvfs-metadata/home-2b01b8c8.log"
[ 9305.808826] type=1503 audit(1301411048.621:25):  operation="link" pid=5863 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.openYQ3CTV" name2="/home/markov/arman/.local/share/gvfs-metadata/home"
[ 9305.809361] type=1503 audit(1301411048.621:26):  operation="link" pid=5863 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.openV43CTV" name2="/home/markov/arman/.local/share/gvfs-metadata/home-4ccad62b.log"
[ 9399.901164] type=1503 audit(1301411142.721:27):  operation="link" pid=5884 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.openCONGTV" name2="/home/markov/arman/.local/share/gvfs-metadata/home"
[ 9399.901726] type=1503 audit(1301411142.721:28):  operation="link" pid=5884 parent=5447 profile="/usr/bin/evince" requested_mask="l::" denied_mask="l::" fsuid=2524 ouid=2524 name="/home/markov/arman/.local/share/gvfs-metadata/.openS0NGTV" name2="/home/markov/arman/.local/share/gvfs-metadata/home-8690fb42.log"

--------------050401090707080508000602--
