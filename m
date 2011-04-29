From: Tomas.Linden@helsinki.fi
Subject: Intel Core 2 Quad Q8400 reported as Unknown CPU
Date: Fri, 29 Apr 2011 17:50:00 +0300 (EEST)
Message-ID: <alpine.LFD.2.00.1104291730500.2256@tux.hip.helsinki.fi>
Reply-To: Tomas.Linden@helsinki.fi
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1453962444-1304087787=:2256"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-ID: <alpine.LFD.2.00.1104291737240.2256@tux.hip.helsinki.fi>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: cpufreq@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1453962444-1304087787=:2256
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-ID: <alpine.LFD.2.00.1104291737241.2256@tux.hip.helsinki.fi>

Hello!

I upgraded my Intel Core 2 Duo to a Core 2 Quad Q8400 on my Intel DP35DP mo=
therboard.
I send this mail because I found this messages in my dmesg:

p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>

cpuinfo and dmesg are at the end of this e-mail. I'm a bit worried because
I bought the new CPU to have hardware virtualization support (VT-X).
  http://ark.intel.com/Product.aspx?id=3D38512&processor=3DQ8400&spec-codes=
=3DSLGT6
but cpuinfo does not list the vtx flag for me. I'm using Fedora 13 and I
tried booting to a F14 USB stick as well and neither shows the vtx flag.

uname -a
Linux tux.hip.helsinki.fi 2.6.34.8-68.fc13.x86_64 #1 SMP Thu Feb 17
15:03:58 UTC 2011 x86_64 x86_64 x86_64 GNU/Linux

Best regards,                          Tomas Lind=E9n
--------------------------------------------------------------------------
I           ,                                                            I
I Tomas Linden                   Helsinki Institute of Physics (HIP)     I
I Tomas.Linden@Helsinki.FI       P.O. Box 64 (Gustaf H=E4llstr=F6min katu 2=
) I
I phone: +358-9-191 505 63       FI-00014 UNIVERSITY OF HELSINKI         I
I fax:   +358-9-191 505 22       Finland                                 I
I WWW: http://www.physics.helsinki.fi/~tlinden/eindex.html               I
--------------------------------------------------------------------------

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: 06/17
stepping	: 10
cpu MHz		: 2666.121
cache size	: 2048 KB
physical id	: 0
siblings	: 4
core id		: 0
cpu cores	: 4
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca cmov pat pse3=
6 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_ts=
c arch_perfmon pebs bts rep_good aperfmperf pni tm2 ssse3 lahf_lm
bogomips	: 5332.24
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: 06/17
stepping	: 10
cpu MHz		: 2666.121
cache size	: 2048 KB
physical id	: 0
siblings	: 4
core id		: 2
cpu cores	: 4
apicid		: 2
initial apicid	: 2
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca cmov pat pse3=
6 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_ts=
c arch_perfmon pebs bts rep_good aperfmperf pni tm2 ssse3 lahf_lm
bogomips	: 5332.55
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 2
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: 06/17
stepping	: 10
cpu MHz		: 2666.121
cache size	: 2048 KB
physical id	: 0
siblings	: 4
core id		: 1
cpu cores	: 4
apicid		: 1
initial apicid	: 1
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca cmov pat pse3=
6 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_ts=
c arch_perfmon pebs bts rep_good aperfmperf pni tm2 ssse3 lahf_lm
bogomips	: 5332.53
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

processor	: 3
vendor_id	: GenuineIntel
cpu family	: 6
model		: 23
model name	: 06/17
stepping	: 10
cpu MHz		: 2666.121
cache size	: 2048 KB
physical id	: 0
siblings	: 4
core id		: 3
cpu cores	: 4
apicid		: 3
initial apicid	: 3
fpu		: yes
fpu_exception	: yes
cpuid level	: 13
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic mtrr pge mca cmov pat pse3=
6 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx lm constant_ts=
c arch_perfmon pebs bts rep_good aperfmperf pni tm2 ssse3 lahf_lm
bogomips	: 5332.54
clflush size	: 64
cache_alignment	: 64
address sizes	: 36 bits physical, 48 bits virtual
power management:

Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 2.6.34.8-68.fc13.x86_64 (mockbuild@x86-03.phx2.fedoraproject.=
org) (gcc version 4.4.5 20101112 (Red Hat 4.4.5-2) (GCC) ) #1 SMP Thu Feb 1=
7 15:03:58 UTC 2011
Command line: ro root=3DUUID=3Dae23d95e-b0e0-48ca-81e7-eccef48aade8 rd_MD_U=
UID=3D7988d98b:93cfc98d:579630b2:b0330fd3 rd_NO_LUKS rd_NO_LVM rd_NO_DM LAN=
G=3Den_US SYSFONT=3Dlat0-16 KEYBOARDTYPE=3Dpc KEYTABLE=3Dfi-latin1 nomodese=
t vga=3D792 nouveau.modeset=3D0 rdblacklist=3Dnouveau selinx=3D0 SYSFONTACM=
=3Diso15
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009e000 (usable)
 BIOS-e820: 000000000009e000 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 00000000cea8f000 (usable)
 BIOS-e820: 00000000cea8f000 - 00000000ceb6d000 (ACPI NVS)
 BIOS-e820: 00000000ceb6d000 - 00000000cfd5f000 (usable)
 BIOS-e820: 00000000cfd5f000 - 00000000cfd61000 (reserved)
 BIOS-e820: 00000000cfd61000 - 00000000cfe6f000 (usable)
 BIOS-e820: 00000000cfe6f000 - 00000000cfee5000 (ACPI NVS)
 BIOS-e820: 00000000cfee5000 - 00000000cfeeb000 (usable)
 BIOS-e820: 00000000cfeeb000 - 00000000cfef2000 (ACPI data)
 BIOS-e820: 00000000cfef2000 - 00000000cfef3000 (usable)
 BIOS-e820: 00000000cfef3000 - 00000000cfeff000 (ACPI data)
 BIOS-e820: 00000000cfeff000 - 00000000cff00000 (usable)
 BIOS-e820: 00000000cff00000 - 00000000d0000000 (reserved)
 BIOS-e820: 00000000f0000000 - 00000000f8000000 (reserved)
 BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
 BIOS-e820: 0000000100000000 - 000000012c000000 (usable)
NX (Execute Disable) protection: active
DMI 2.4 present.
e820 update range: 0000000000000000 - 0000000000001000 (usable) =3D=3D> (re=
served)
e820 remove range: 00000000000a0000 - 0000000000100000 (usable)
No AGP bridge found
last_pfn =3D 0x12c000 max_arch_pfn =3D 0x400000000
MTRR default type: write-back
MTRR fixed ranges enabled:
  00000-9FFFF write-back
  A0000-BFFFF uncachable
  C0000-DFFFF write-protect
  E0000-FFFFF uncachable
MTRR variable ranges enabled:
  0 base 0CFF00000 mask FFFF00000 uncachable
  1 base 0D0000000 mask FF0000000 uncachable
  2 base 0E0000000 mask FE0000000 uncachable
  3 base 0CFE8B000 mask FFFFFF000 write-back
  4 disabled
  5 disabled
  6 disabled
x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600070106
last_pfn =3D 0xcff00 max_arch_pfn =3D 0x400000000
initial memory mapped : 0 - 20000000
found SMP MP-table at [ffff8800000fe200] fe200
init_memory_mapping: 0000000000000000-00000000cff00000
 0000000000 - 00cfe00000 page 2M
 00cfe00000 - 00cff00000 page 4k
kernel direct mapping tables up to cff00000 @ 8000-e000
init_memory_mapping: 0000000100000000-000000012c000000
 0100000000 - 012c000000 page 2M
kernel direct mapping tables up to 12c000000 @ c000-12000
RAMDISK: 3739b000 - 37ff0000
ACPI: RSDP 00000000000fe020 00014 (v00 INTEL )
ACPI: RSDT 00000000cfefd038 00058 (v01 INTEL  DP35DP   0000023C      010000=
13)
ACPI: FACP 00000000cfefc000 00074 (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: DSDT 00000000cfef8000 03DE9 (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: FACS 00000000cfe7a000 00040
ACPI: APIC 00000000cfef7000 00078 (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: WDDT 00000000cfef6000 00040 (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: MCFG 00000000cfef5000 0003C (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: ASF! 00000000cfef4000 000A6 (v32 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: HPET 00000000cfef3000 00038 (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: ASPT 00000000cfef1000 00034 (v03 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: WDTT 00000000cfef0000 002CC (v01 INTEL  DP35DP   0000023C MSFT 010000=
13)
ACPI: SSDT 00000000cfeef000 00204 (v01 INTEL     CpuPm 0000023C MSFT 010000=
13)
ACPI: SSDT 00000000cfeee000 001CF (v01 INTEL   Cpu0Cst 0000023C MSFT 010000=
13)
ACPI: SSDT 00000000cfeed000 001CF (v01 INTEL   Cpu1Cst 0000023C MSFT 010000=
13)
ACPI: SSDT 00000000cfeec000 001CF (v01 INTEL   Cpu2Cst 0000023C MSFT 010000=
13)
ACPI: SSDT 00000000cfeeb000 001CF (v01 INTEL   Cpu3Cst 0000023C MSFT 010000=
13)
ACPI: Local APIC address 0xfee00000
No NUMA configuration found
Faking a node at 0000000000000000-000000012c000000
Initmem setup node 0 0000000000000000-000000012c000000
  NODE_DATA [0000000100000000 - 0000000100013fff]
  bootmap [0000000100014000 -  00000001000397ff] pages 26
(13/32 early reservations) =3D=3D> bootmem [0000000000 - 012c000000]
  #0 [0001000000 - 0001e0ae88]    TEXT DATA BSS =3D=3D> [0001000000 - 0001e=
0ae88]
  #1 [003739b000 - 0037ff0000]          RAMDISK =3D=3D> [003739b000 - 0037f=
f0000]
  #2 [0001e0b000 - 0001e0b15e]              BRK =3D=3D> [0001e0b000 - 0001e=
0b15e]
  #3 [000009e000 - 00000fe200]    BIOS reserved =3D=3D> [000009e000 - 00000=
fe200]
  #4 [00000fe200 - 00000fe210]     MP-table mpf =3D=3D> [00000fe200 - 00000=
fe210]
  #5 [00000fe250 - 0000100000]    BIOS reserved =3D=3D> [00000fe250 - 00001=
00000]
  #6 [00000fe210 - 00000fe250]     MP-table mpc =3D=3D> [00000fe210 - 00000=
fe250]
  #7 [0000001000 - 0000003000]       TRAMPOLINE =3D=3D> [0000001000 - 00000=
03000]
  #8 [0000003000 - 0000007000]      ACPI WAKEUP =3D=3D> [0000003000 - 00000=
07000]
  #9 [0000008000 - 000000c000]          PGTABLE =3D=3D> [0000008000 - 00000=
0c000]
  #10 [000000c000 - 000000d000]          PGTABLE =3D=3D> [000000c000 - 0000=
00d000]
  #11 [0100000000 - 0100014000]        NODE_DATA =3D=3D> [0100000000 - 0100=
014000]
  #12 [0100014000 - 010003a000]          BOOTMAP =3D=3D> [0100014000 - 0100=
03a000]
 [ffffea0000000000-ffffea00043fffff] PMD -> [ffff880100600000-ffff880103fff=
fff] on node 0
Zone PFN ranges:
  DMA      0x00000001 -> 0x00001000
  DMA32    0x00001000 -> 0x00100000
  Normal   0x00100000 -> 0x0012c000
Movable zone start PFN for each node
early_node_map[8] active PFN ranges
    0: 0x00000001 -> 0x0000009e
    0: 0x00000100 -> 0x000cea8f
    0: 0x000ceb6d -> 0x000cfd5f
    0: 0x000cfd61 -> 0x000cfe6f
    0: 0x000cfee5 -> 0x000cfeeb
    0: 0x000cfef2 -> 0x000cfef3
    0: 0x000cfeff -> 0x000cff00
    0: 0x00100000 -> 0x0012c000
On node 0 totalpages: 1031476
  DMA zone: 56 pages used for memmap
  DMA zone: 108 pages reserved
  DMA zone: 3833 pages, LIFO batch:0
  DMA32 zone: 14280 pages used for memmap
  DMA32 zone: 832975 pages, LIFO batch:31
  Normal zone: 2464 pages used for memmap
  Normal zone: 177760 pages, LIFO batch:31
ACPI: PM-Timer IO Port: 0x408
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-23
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Using ACPI (MADT) for SMP configuration information
ACPI: HPET id: 0x8086a301 base: 0xfed00000
SMP: Allowing 4 CPUs, 0 hotplug CPUs
nr_irqs_gsi: 24
PM: Registered nosave memory: 000000000009e000 - 00000000000a0000
PM: Registered nosave memory: 00000000000a0000 - 00000000000e0000
PM: Registered nosave memory: 00000000000e0000 - 0000000000100000
PM: Registered nosave memory: 00000000cea8f000 - 00000000ceb6d000
PM: Registered nosave memory: 00000000cfd5f000 - 00000000cfd61000
PM: Registered nosave memory: 00000000cfe6f000 - 00000000cfee5000
PM: Registered nosave memory: 00000000cfeeb000 - 00000000cfef2000
PM: Registered nosave memory: 00000000cfef3000 - 00000000cfeff000
PM: Registered nosave memory: 00000000cff00000 - 00000000d0000000
PM: Registered nosave memory: 00000000d0000000 - 00000000f0000000
PM: Registered nosave memory: 00000000f0000000 - 00000000f8000000
PM: Registered nosave memory: 00000000f8000000 - 00000000fff00000
PM: Registered nosave memory: 00000000fff00000 - 0000000100000000
Allocating PCI resources starting at d0000000 (gap: d0000000:20000000)
Booting paravirtualized kernel on bare hardware
setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:4 nr_node_ids:1
PERCPU: Embedded 29 pages/cpu @ffff880002000000 s89768 r8192 d20824 u524288
pcpu-alloc: s89768 r8192 d20824 u524288 alloc=3D1*2097152
pcpu-alloc: [0] 0 1 2 3
Built 1 zonelists in Node order, mobility grouping on.  Total pages: 1014568
Policy zone: Normal
Kernel command line: ro root=3DUUID=3Dae23d95e-b0e0-48ca-81e7-eccef48aade8 =
rd_MD_UUID=3D7988d98b:93cfc98d:579630b2:b0330fd3 rd_NO_LUKS rd_NO_LVM rd_NO=
_DM LANG=3Den_US SYSFONT=3Dlat0-16 KEYBOARDTYPE=3Dpc KEYTABLE=3Dfi-latin1 n=
omodeset vga=3D792 nouveau.modeset=3D0 rdblacklist=3Dnouveau selinx=3D0 SYS=
FONTACM=3Diso15
PID hash table entries: 4096 (order: 3, 32768 bytes)
Checking aperture...
No AGP bridge found
Calgary: detecting Calgary via BIOS EBDA area
Calgary: Unable to locate Rio Grande table in EBDA - bailing!
Memory: 3972596k/4915200k available (4437k kernel code, 789296k absent, 153=
308k reserved, 7430k data, 920k init)
SLUB: Genslabs=3D14, HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, N=
odes=3D1
Hierarchical RCU implementation.
NR_IRQS:16640 nr_irqs:440
Console: colour dummy device 80x25
console [tty0] enabled
allocated 41943040 bytes of page_cgroup
please try 'cgroup_disable=3Dmemory' option if you don't want memory cgroups
hpet clockevent registered
Fast TSC calibration using PIT
Detected 2666.121 MHz processor.
Calibrating delay loop (skipped), value calculated using timer frequency.. =
5332.24 BogoMIPS (lpj=3D2666121)
Security Framework initialized
SELinux:  Initializing.
SELinux:  Starting in permissive mode
Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Mount-cache hash table entries: 256
Initializing cgroup subsys ns
Initializing cgroup subsys cpuacct
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
Initializing cgroup subsys net_cls
Initializing cgroup subsys blkio
CPU: Physical Processor ID: 0
CPU: Processor Core ID: 0
mce: CPU supports 6 MCE banks
CPU0: Thermal monitoring enabled (TM2)
Performance Events: Core2 events, Intel PMU driver.
... version:                2
... bit width:              40
... generic registers:      2
... value mask:             000000ffffffffff
... max period:             000000007fffffff
... fixed-purpose events:   3
... event mask:             0000000700000003
ACPI: Core revision 20100121
ftrace: converting mcount calls to 0f 1f 44 00 00
ftrace: allocating 20500 entries in 81 pages
Setting APIC routing to flat
..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1
CPU0: Intel 06/17 stepping 0a
Booting Node   0, Processors  #1 #2 #3 Ok.
Brought up 4 CPUs
Total of 4 processors activated (21329.87 BogoMIPS).
sizeof(vma)=3D184 bytes
sizeof(page)=3D56 bytes
sizeof(inode)=3D584 bytes
sizeof(dentry)=3D192 bytes
sizeof(ext3inode)=3D800 bytes
sizeof(buffer_head)=3D104 bytes
sizeof(skbuff)=3D232 bytes
sizeof(task_struct)=3D6000 bytes
devtmpfs: initialized
Time: 14:26:56  Date: 04/29/11
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000-0xf7ffffff] (b=
ase 0xf0000000)
PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in E820
PCI: Using configuration type 1 for base access
bio: create slab <bio-0> at 0
ACPI: EC: Look up EC in DSDT
ACPI: Interpreter enabled
ACPI: (supports S0 S1 S3 S4 S5)
ACPI: Using IOAPIC for interrupt routing
ACPI: No dock devices found.
PCI: Ignoring host bridge windows from ACPI; if necessary, use "pci=3Duse_c=
rs" and report a bug
ACPI: PCI Root Bridge [PCI0] (0000:00)
pci_root PNP0A03:00: host bridge window [io  0x0000-0x0cf7] (ignored)
pci_root PNP0A03:00: host bridge window [io  0x0d00-0xffff] (ignored)
pci_root PNP0A03:00: host bridge window [mem 0x000a0000-0x000bffff] (ignore=
d)
pci_root PNP0A03:00: host bridge window [mem 0x000e0000-0x000effff] (ignore=
d)
pci_root PNP0A03:00: host bridge window [mem 0xf8000000-0xfeafffff] (ignore=
d)
pci_root PNP0A03:00: host bridge window [mem 0xd0000000-0xefffffff] (ignore=
d)
pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
pci 0000:00:01.0: PME# disabled
pci 0000:00:03.0: reg 10: [mem 0xe3226100-0xe322610f 64bit]
pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
pci 0000:00:03.0: PME# disabled
pci 0000:00:19.0: reg 10: [mem 0xe3200000-0xe321ffff]
pci 0000:00:19.0: reg 14: [mem 0xe3224000-0xe3224fff]
pci 0000:00:19.0: reg 18: [io  0x3400-0x341f]
pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
pci 0000:00:19.0: PME# disabled
pci 0000:00:1a.0: reg 20: [io  0x30e0-0x30ff]
pci 0000:00:1a.1: reg 20: [io  0x30c0-0x30df]
pci 0000:00:1a.2: reg 20: [io  0x30a0-0x30bf]
pci 0000:00:1a.7: reg 10: [mem 0xe3225c00-0xe3225fff]
pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1a.7: PME# disabled
pci 0000:00:1b.0: reg 10: [mem 0xe3220000-0xe3223fff 64bit]
pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1b.0: PME# disabled
pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.0: PME# disabled
pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.1: PME# disabled
pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.2: PME# disabled
pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.3: PME# disabled
pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
pci 0000:00:1c.4: PME# disabled
pci 0000:00:1d.0: reg 20: [io  0x3080-0x309f]
pci 0000:00:1d.1: reg 20: [io  0x3060-0x307f]
pci 0000:00:1d.2: reg 20: [io  0x3040-0x305f]
pci 0000:00:1d.7: reg 10: [mem 0xe3225800-0xe3225bff]
pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
pci 0000:00:1d.7: PME# disabled
pci 0000:00:1f.0: quirk: [io  0x0400-0x047f] claimed by ICH6 ACPI/GPIO/TCO
pci 0000:00:1f.0: quirk: [io  0x0500-0x053f] claimed by ICH6 GPIO
pci 0000:00:1f.0: ICH7 LPC Generic IO decode 1 PIO at 0680 (mask 007f)
pci 0000:00:1f.0: ICH7 LPC Generic IO decode 2 PIO at 0810 (mask 007f)
pci 0000:00:1f.2: reg 10: [io  0x3428-0x342f]
pci 0000:00:1f.2: reg 14: [io  0x3434-0x3437]
pci 0000:00:1f.2: reg 18: [io  0x3420-0x3427]
pci 0000:00:1f.2: reg 1c: [io  0x3430-0x3433]
pci 0000:00:1f.2: reg 20: [io  0x3020-0x303f]
pci 0000:00:1f.2: reg 24: [mem 0xe3225000-0xe32257ff]
pci 0000:00:1f.2: PME# supported from D3hot
pci 0000:00:1f.2: PME# disabled
pci 0000:00:1f.3: reg 10: [mem 0xe3226000-0xe32260ff 64bit]
pci 0000:00:1f.3: reg 20: [io  0x3000-0x301f]
pci 0000:01:00.0: reg 10: [mem 0xe2000000-0xe2ffffff]
pci 0000:01:00.0: reg 14: [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:01:00.0: reg 1c: [mem 0xe0000000-0xe1ffffff 64bit]
pci 0000:01:00.0: reg 24: [io  0x2000-0x207f]
pci 0000:01:00.0: reg 30: [mem 0xfffe0000-0xffffffff pref]
pci 0000:00:01.0: PCI bridge to [bus 01-01]
pci 0000:00:01.0:   bridge window [io  0x2000-0x2fff]
pci 0000:00:01.0:   bridge window [mem 0xe0000000-0xe2ffffff]
pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:00:1c.0: PCI bridge to [bus 02-02]
pci 0000:00:1c.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1c.0:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:1c.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:03:00.0: reg 10: [io  0x1018-0x101f]
pci 0000:03:00.0: reg 14: [io  0x1024-0x1027]
pci 0000:03:00.0: reg 18: [io  0x1010-0x1017]
pci 0000:03:00.0: reg 1c: [io  0x1020-0x1023]
pci 0000:03:00.0: reg 20: [io  0x1000-0x100f]
pci 0000:03:00.0: reg 24: [mem 0xe3100000-0xe31001ff]
pci 0000:03:00.0: supports D1
pci 0000:03:00.0: PME# supported from D0 D1 D3hot
pci 0000:03:00.0: PME# disabled
pci 0000:03:00.0: disabling ASPM on pre-1.1 PCIe device.  You can enable it=
 with 'pcie_aspm=3Dforce'
pci 0000:00:1c.1: PCI bridge to [bus 03-03]
pci 0000:00:1c.1:   bridge window [io  0x1000-0x1fff]
pci 0000:00:1c.1:   bridge window [mem 0xe3100000-0xe31fffff]
pci 0000:00:1c.1:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:00:1c.2: PCI bridge to [bus 04-04]
pci 0000:00:1c.2:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1c.2:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:1c.2:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:00:1c.3: PCI bridge to [bus 05-05]
pci 0000:00:1c.3:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1c.3:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:1c.3:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:00:1c.4: PCI bridge to [bus 06-06]
pci 0000:00:1c.4:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1c.4:   bridge window [mem 0xfff00000-0x000fffff] (disabled)
pci 0000:00:1c.4:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:07:03.0: reg 10: [mem 0xe3004000-0xe30047ff]
pci 0000:07:03.0: reg 14: [mem 0xe3000000-0xe3003fff]
pci 0000:07:03.0: supports D1 D2
pci 0000:07:03.0: PME# supported from D0 D1 D2 D3hot
pci 0000:07:03.0: PME# disabled
pci 0000:00:1e.0: PCI bridge to [bus 07-07] (subtractive decode)
pci 0000:00:1e.0:   bridge window [io  0xf000-0x0000] (disabled)
pci 0000:00:1e.0:   bridge window [mem 0xe3000000-0xe30fffff]
pci 0000:00:1e.0:   bridge window [mem 0xfff00000-0x000fffff pref] (disable=
d)
pci 0000:00:1e.0:   bridge window [io  0x0000-0xffff] (subtractive decode)
pci 0000:00:1e.0:   bridge window [mem 0x00000000-0xffffffffffffffff] (subt=
ractive decode)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.P32_._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX1._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX2._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX3._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PEX4._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 7 9 10 *11 12)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 *9 10 11 12)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7 9 *10 11 12)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 9 10 *11 12)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 *9 10 11 12)
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 9 10 *11 12)
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7 9 *10 11 12)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 7 9 10 *11 12)
vgaarb: device added: PCI:0000:01:00.0,decodes=3Dio+mem,owns=3Dio+mem,locks=
=3Dnone
vgaarb: loaded
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
PCI: Using ACPI for IRQ routing
PCI: pci_cache_line_size set to 64 bytes
reserve RAM buffer: 000000000009e000 - 000000000009ffff
reserve RAM buffer: 00000000cea8f000 - 00000000cfffffff
reserve RAM buffer: 00000000cfd5f000 - 00000000cfffffff
reserve RAM buffer: 00000000cfe6f000 - 00000000cfffffff
reserve RAM buffer: 00000000cfeeb000 - 00000000cfffffff
reserve RAM buffer: 00000000cfef3000 - 00000000cfffffff
reserve RAM buffer: 00000000cff00000 - 00000000cfffffff
NetLabel: Initializing
NetLabel:  domain hash size =3D 128
NetLabel:  protocols =3D UNLABELED CIPSOv4
NetLabel:  unlabeled traffic allowed by default
HPET: 4 timers in total, 0 timers will be used for per-cpu timer
hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
hpet0: 4 comparators, 64-bit 14.318180 MHz counter
Switching to clocksource tsc
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 11 devices
ACPI: ACPI bus type pnp unregistered
system 00:01: [mem 0xf0000000-0xf7ffffff] has been reserved
system 00:01: [mem 0xfeb00000-0xfeb03fff] has been reserved
system 00:01: [mem 0xfed13000-0xfed13fff] has been reserved
system 00:01: [mem 0xfed14000-0xfed17fff] has been reserved
system 00:01: [mem 0xfed18000-0xfed18fff] has been reserved
system 00:01: [mem 0xfed19000-0xfed19fff] has been reserved
system 00:01: [mem 0xfed1c000-0xfed1ffff] has been reserved
system 00:01: [mem 0xfed20000-0xfed3ffff] has been reserved
system 00:01: [mem 0xfed45000-0xfed99fff] has been reserved
system 00:01: [mem 0x000c0000-0x000dffff] has been reserved
system 00:01: [mem 0x000e0000-0x000fffff] could not be reserved
system 00:01: [mem 0xffc00000-0xffffffff] could not be reserved
system 00:06: [io  0x0500-0x053f] has been reserved
system 00:06: [io  0x0400-0x047f] has been reserved
system 00:06: [io  0x0680-0x06ff] has been reserved
pci 0000:01:00.0: no compatible bridge window for [mem 0xfffe0000-0xfffffff=
f pref]
pci 0000:00:1c.0: BAR 14: assigned [mem 0xe3300000-0xe34fffff]
pci 0000:00:1c.0: BAR 15: assigned [mem 0xe3500000-0xe36fffff 64bit pref]
pci 0000:00:1c.1: BAR 15: assigned [mem 0xe3700000-0xe38fffff 64bit pref]
pci 0000:00:1c.2: BAR 14: assigned [mem 0xe3900000-0xe3afffff]
pci 0000:00:1c.2: BAR 15: assigned [mem 0xe3b00000-0xe3cfffff 64bit pref]
pci 0000:00:1c.3: BAR 14: assigned [mem 0xe3d00000-0xe3efffff]
pci 0000:00:1c.3: BAR 15: assigned [mem 0xe3f00000-0xe40fffff 64bit pref]
pci 0000:00:1c.4: BAR 14: assigned [mem 0xe4100000-0xe42fffff]
pci 0000:00:1c.4: BAR 15: assigned [mem 0xe4300000-0xe44fffff 64bit pref]
pci 0000:00:1c.0: BAR 13: assigned [io  0x4000-0x4fff]
pci 0000:00:1c.2: BAR 13: assigned [io  0x5000-0x5fff]
pci 0000:00:1c.3: BAR 13: assigned [io  0x6000-0x6fff]
pci 0000:00:1c.4: BAR 13: assigned [io  0x7000-0x7fff]
pci 0000:01:00.0: BAR 6: can't assign mem pref (size 0x20000)
pci 0000:00:01.0: PCI bridge to [bus 01-01]
pci 0000:00:01.0:   bridge window [io  0x2000-0x2fff]
pci 0000:00:01.0:   bridge window [mem 0xe0000000-0xe2ffffff]
pci 0000:00:01.0:   bridge window [mem 0xd0000000-0xdfffffff 64bit pref]
pci 0000:00:1c.0: PCI bridge to [bus 02-02]
pci 0000:00:1c.0:   bridge window [io  0x4000-0x4fff]
pci 0000:00:1c.0:   bridge window [mem 0xe3300000-0xe34fffff]
pci 0000:00:1c.0:   bridge window [mem 0xe3500000-0xe36fffff 64bit pref]
pci 0000:00:1c.1: PCI bridge to [bus 03-03]
pci 0000:00:1c.1:   bridge window [io  0x1000-0x1fff]
pci 0000:00:1c.1:   bridge window [mem 0xe3100000-0xe31fffff]
pci 0000:00:1c.1:   bridge window [mem 0xe3700000-0xe38fffff 64bit pref]
pci 0000:00:1c.2: PCI bridge to [bus 04-04]
pci 0000:00:1c.2:   bridge window [io  0x5000-0x5fff]
pci 0000:00:1c.2:   bridge window [mem 0xe3900000-0xe3afffff]
pci 0000:00:1c.2:   bridge window [mem 0xe3b00000-0xe3cfffff 64bit pref]
pci 0000:00:1c.3: PCI bridge to [bus 05-05]
pci 0000:00:1c.3:   bridge window [io  0x6000-0x6fff]
pci 0000:00:1c.3:   bridge window [mem 0xe3d00000-0xe3efffff]
pci 0000:00:1c.3:   bridge window [mem 0xe3f00000-0xe40fffff 64bit pref]
pci 0000:00:1c.4: PCI bridge to [bus 06-06]
pci 0000:00:1c.4:   bridge window [io  0x7000-0x7fff]
pci 0000:00:1c.4:   bridge window [mem 0xe4100000-0xe42fffff]
pci 0000:00:1c.4:   bridge window [mem 0xe4300000-0xe44fffff 64bit pref]
pci 0000:00:1e.0: PCI bridge to [bus 07-07]
pci 0000:00:1e.0:   bridge window [io  disabled]
pci 0000:00:1e.0:   bridge window [mem 0xe3000000-0xe30fffff]
pci 0000:00:1e.0:   bridge window [mem pref disabled]
  alloc irq_desc for 16 on node -1
  alloc kstat_irqs on node -1
pci 0000:00:01.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
pci 0000:00:01.0: setting latency timer to 64
pci 0000:00:1c.0: enabling device (0000 -> 0003)
  alloc irq_desc for 17 on node -1
  alloc kstat_irqs on node -1
pci 0000:00:1c.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.0: setting latency timer to 64
  alloc irq_desc for 20 on node -1
  alloc kstat_irqs on node -1
pci 0000:00:1c.1: PCI INT B -> GSI 20 (level, low) -> IRQ 20
pci 0000:00:1c.1: setting latency timer to 64
pci 0000:00:1c.2: enabling device (0000 -> 0003)
  alloc irq_desc for 18 on node -1
  alloc kstat_irqs on node -1
pci 0000:00:1c.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
pci 0000:00:1c.2: setting latency timer to 64
pci 0000:00:1c.3: enabling device (0000 -> 0003)
  alloc irq_desc for 19 on node -1
  alloc kstat_irqs on node -1
pci 0000:00:1c.3: PCI INT D -> GSI 19 (level, low) -> IRQ 19
pci 0000:00:1c.3: setting latency timer to 64
pci 0000:00:1c.4: enabling device (0000 -> 0003)
pci 0000:00:1c.4: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pci 0000:00:1c.4: setting latency timer to 64
pci 0000:00:1e.0: setting latency timer to 64
pci_bus 0000:00: resource 0 [io  0x0000-0xffff]
pci_bus 0000:00: resource 1 [mem 0x00000000-0xffffffffffffffff]
pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
pci_bus 0000:01: resource 1 [mem 0xe0000000-0xe2ffffff]
pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bit pref]
pci_bus 0000:02: resource 0 [io  0x4000-0x4fff]
pci_bus 0000:02: resource 1 [mem 0xe3300000-0xe34fffff]
pci_bus 0000:02: resource 2 [mem 0xe3500000-0xe36fffff 64bit pref]
pci_bus 0000:03: resource 0 [io  0x1000-0x1fff]
pci_bus 0000:03: resource 1 [mem 0xe3100000-0xe31fffff]
pci_bus 0000:03: resource 2 [mem 0xe3700000-0xe38fffff 64bit pref]
pci_bus 0000:04: resource 0 [io  0x5000-0x5fff]
pci_bus 0000:04: resource 1 [mem 0xe3900000-0xe3afffff]
pci_bus 0000:04: resource 2 [mem 0xe3b00000-0xe3cfffff 64bit pref]
pci_bus 0000:05: resource 0 [io  0x6000-0x6fff]
pci_bus 0000:05: resource 1 [mem 0xe3d00000-0xe3efffff]
pci_bus 0000:05: resource 2 [mem 0xe3f00000-0xe40fffff 64bit pref]
pci_bus 0000:06: resource 0 [io  0x7000-0x7fff]
pci_bus 0000:06: resource 1 [mem 0xe4100000-0xe42fffff]
pci_bus 0000:06: resource 2 [mem 0xe4300000-0xe44fffff 64bit pref]
pci_bus 0000:07: resource 1 [mem 0xe3000000-0xe30fffff]
pci_bus 0000:07: resource 4 [io  0x0000-0xffff]
pci_bus 0000:07: resource 5 [mem 0x00000000-0xffffffffffffffff]
NET: Registered protocol family 2
IP route cache hash table entries: 131072 (order: 8, 1048576 bytes)
TCP established hash table entries: 524288 (order: 11, 8388608 bytes)
TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
TCP: Hash tables configured (established 524288 bind 65536)
TCP reno registered
UDP hash table entries: 2048 (order: 4, 65536 bytes)
UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
NET: Registered protocol family 1
pci 0000:01:00.0: Boot video device
PCI: CLS 64 bytes, default 64
Trying to unpack rootfs image as initramfs...
Freeing initrd memory: 12628k freed
PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
Placing 64MB software IO TLB between ffff88000219d000 - ffff88000619d000
software IO TLB at phys 0x219d000 - 0x619d000
audit: initializing netlink socket (disabled)
type=3D2000 audit(1304087216.569:1): initialized
HugeTLB registered 2 MB page size, pre-allocated 0 pages
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
msgmni has been set to 7783
SELinux:  Registering netfilter hooks
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
pcieport 0000:00:01.0: setting latency timer to 64
  alloc irq_desc for 24 on node -1
  alloc kstat_irqs on node -1
pcieport 0000:00:01.0: irq 24 for MSI/MSI-X
pcieport 0000:00:1c.0: setting latency timer to 64
  alloc irq_desc for 25 on node -1
  alloc kstat_irqs on node -1
pcieport 0000:00:1c.0: irq 25 for MSI/MSI-X
pcieport 0000:00:1c.1: setting latency timer to 64
  alloc irq_desc for 26 on node -1
  alloc kstat_irqs on node -1
pcieport 0000:00:1c.1: irq 26 for MSI/MSI-X
pcieport 0000:00:1c.2: setting latency timer to 64
  alloc irq_desc for 27 on node -1
  alloc kstat_irqs on node -1
pcieport 0000:00:1c.2: irq 27 for MSI/MSI-X
pcieport 0000:00:1c.3: setting latency timer to 64
  alloc irq_desc for 28 on node -1
  alloc kstat_irqs on node -1
pcieport 0000:00:1c.3: irq 28 for MSI/MSI-X
pcieport 0000:00:1c.4: setting latency timer to 64
  alloc irq_desc for 29 on node -1
  alloc kstat_irqs on node -1
pcieport 0000:00:1c.4: irq 29 for MSI/MSI-X
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
pciehp: PCI Express Hot Plug Controller Driver version: 0.4
acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
pci-stub: invalid id string ""
vesafb: framebuffer at 0xe1000000, mapped to 0xffffc90009100000, using 6144=
k, total 14336k
vesafb: mode is 1024x768x32, linelength=3D4096, pages=3D1
vesafb: scrolling: redraw
vesafb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
Console: switching to colour frame buffer device 128x48
fb0: VESA VGA frame buffer device
input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/in=
put0
ACPI: Sleep Button [SLPB]
input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input1
ACPI: Power Button [PWRF]
Monitor-Mwait will be used to enter C-1 state
Non-volatile memory driver v1.3
Linux agpgart interface v0.103
Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
serial8250: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
serial8250: ttyS1 at I/O 0x2f8 (irq =3D 3) is a NS16550A
00:08: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
brd: module loaded
loop: module loaded
ahci 0000:00:1f.2: version 3.0
  alloc irq_desc for 21 on node -1
  alloc kstat_irqs on node -1
ahci 0000:00:1f.2: PCI INT A -> GSI 21 (level, low) -> IRQ 21
  alloc irq_desc for 30 on node -1
  alloc kstat_irqs on node -1
ahci 0000:00:1f.2: irq 30 for MSI/MSI-X
ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 6 ports 3 Gbps 0x3f impl SATA mo=
de
ahci 0000:00:1f.2: flags: 64bit ncq sntf led clo pmp pio slum part ccc ems
ahci 0000:00:1f.2: setting latency timer to 64
scsi0 : ahci
scsi1 : ahci
scsi2 : ahci
scsi3 : ahci
scsi4 : ahci
scsi5 : ahci
ata1: SATA max UDMA/133 irq_stat 0x00400040, connection status changed irq =
30
ata2: SATA max UDMA/133 irq_stat 0x00400040, connection status changed irq =
30
ata3: SATA max UDMA/133 irq_stat 0x00400040, connection status changed irq =
30
ata4: SATA max UDMA/133 abar m2048@0xe3225000 port 0xe3225280 irq 30
ata5: SATA max UDMA/133 abar m2048@0xe3225000 port 0xe3225300 irq 30
ata6: SATA max UDMA/133 abar m2048@0xe3225000 port 0xe3225380 irq 30
Fixed MDIO Bus: probed
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ehci_hcd 0000:00:1a.7: PCI INT C -> GSI 17 (level, low) -> IRQ 17
ehci_hcd 0000:00:1a.7: setting latency timer to 64
ehci_hcd 0000:00:1a.7: EHCI Host Controller
ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:1a.7: debug port 1
ehci_hcd 0000:00:1a.7: cache line size of 64 is not supported
ehci_hcd 0000:00:1a.7: irq 17, io mem 0xe3225c00
ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 ehci_hcd
usb usb1: SerialNumber: 0000:00:1a.7
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
  alloc irq_desc for 23 on node -1
  alloc kstat_irqs on node -1
ehci_hcd 0000:00:1d.7: PCI INT A -> GSI 23 (level, low) -> IRQ 23
ehci_hcd 0000:00:1d.7: setting latency timer to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 2
ehci_hcd 0000:00:1d.7: debug port 1
ehci_hcd 0000:00:1d.7: cache line size of 64 is not supported
ehci_hcd 0000:00:1d.7: irq 23, io mem 0xe3225800
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0002
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: EHCI Host Controller
usb usb2: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 ehci_hcd
usb usb2: SerialNumber: 0000:00:1d.7
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 6 ports detected
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
uhci_hcd: USB Universal Host Controller Interface driver
uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1a.0: setting latency timer to 64
uhci_hcd 0000:00:1a.0: UHCI Host Controller
uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1a.0: irq 18, io base 0x000030e0
usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb3: Product: UHCI Host Controller
usb usb3: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 uhci_hcd
usb usb3: SerialNumber: 0000:00:1a.0
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:1a.1: setting latency timer to 64
uhci_hcd 0000:00:1a.1: UHCI Host Controller
uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1a.1: irq 21, io base 0x000030c0
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb4: Product: UHCI Host Controller
usb usb4: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 uhci_hcd
usb usb4: SerialNumber: 0000:00:1a.1
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
uhci_hcd 0000:00:1a.2: PCI INT C -> GSI 17 (level, low) -> IRQ 17
uhci_hcd 0000:00:1a.2: setting latency timer to 64
uhci_hcd 0000:00:1a.2: UHCI Host Controller
ata4: SATA link down (SStatus 0 SControl 300)
ata6: SATA link down (SStatus 0 SControl 300)
ata5: SATA link down (SStatus 0 SControl 300)
uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus number 5
uhci_hcd 0000:00:1a.2: irq 17, io base 0x000030a0
usb usb5: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb5: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb5: Product: UHCI Host Controller
usb usb5: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 uhci_hcd
usb usb5: SerialNumber: 0000:00:1a.2
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 23 (level, low) -> IRQ 23
uhci_hcd 0000:00:1d.0: setting latency timer to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 6
uhci_hcd 0000:00:1d.0: irq 23, io base 0x00003080
usb usb6: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb6: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb6: Product: UHCI Host Controller
usb usb6: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 uhci_hcd
usb usb6: SerialNumber: 0000:00:1d.0
hub 6-0:1.0: USB hub found
hub 6-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 19 (level, low) -> IRQ 19
uhci_hcd 0000:00:1d.1: setting latency timer to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 7
uhci_hcd 0000:00:1d.1: irq 19, io base 0x00003060
usb usb7: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb7: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb7: Product: UHCI Host Controller
usb usb7: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 uhci_hcd
usb usb7: SerialNumber: 0000:00:1d.1
hub 7-0:1.0: USB hub found
hub 7-0:1.0: 2 ports detected
uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> IRQ 18
uhci_hcd 0000:00:1d.2: setting latency timer to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 8
uhci_hcd 0000:00:1d.2: irq 18, io base 0x00003040
usb usb8: New USB device found, idVendor=3D1d6b, idProduct=3D0001
usb usb8: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb8: Product: UHCI Host Controller
usb usb8: Manufacturer: Linux 2.6.34.8-68.fc13.x86_64 uhci_hcd
usb usb8: SerialNumber: 0000:00:1d.2
hub 8-0:1.0: USB hub found
hub 8-0:1.0: 2 ports detected
PNP: No PS/2 controller found. Probing ports directly.
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mice: PS/2 mouse device common for all mice
rtc_cmos 00:03: RTC can wake from S4
rtc_cmos 00:03: rtc core: registered rtc_cmos as rtc0
rtc0: alarms up to one month, 114 bytes nvram, hpet irqs
device-mapper: uevent: version 1.0.3
device-mapper: ioctl: 4.17.0-ioctl (2010-03-05) initialised: dm-devel@redha=
t.com
cpuidle: using governor ladder
cpuidle: using governor menu
usbcore: registered new interface driver hiddev
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
nf_conntrack version 0.5.0 (16384 buckets, 65536 max)
CONFIG_NF_CT_ACCT is deprecated and will be removed soon. Please use
nf_conntrack.acct=3D1 kernel parameter, acct=3D1 nf_conntrack module option=
 or
sysctl net.netfilter.nf_conntrack_acct=3D1 to enable it.
ip_tables: (C) 2000-2006 Netfilter Core Team
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 17
PM: Resume from disk failed.
registered taskstats version 1
  Magic number: 7:27:436
rtc_cmos 00:03: setting system clock to 2011-04-29 14:26:57 UTC (1304087217)
Initalizing network drop monitor service
usb 2-6: new high speed USB device using ehci_hcd and address 2
ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata3: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
ata3.00: ATAPI: TSSTcorp CDDVDW SH-S203P, SB01, max UDMA/100
ata1.00: ATA-7: ST3250410AS, 3.AAC, max UDMA/133
ata1.00: 488397168 sectors, multi 0: LBA48 NCQ (depth 31/32)
ata1.00: configured for UDMA/133
scsi 0:0:0:0: Direct-Access     ATA      ST3250410AS      3.AA PQ: 0 ANSI: 5
sd 0:0:0:0: Attached scsi generic sg0 type 0
sd 0:0:0:0: [sda] 488397168 512-byte logical blocks: (250 GB/232 GiB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
 sda:
ata3.00: configured for UDMA/100
 sda1 sda2 sda3 sda4 < sda5 >
sd 0:0:0:0: [sda] Attached SCSI disk
ata2.00: ATA-7: ST3250410AS, 3.AAC, max UDMA/133
ata2.00: 488397168 sectors, multi 0: LBA48 NCQ (depth 31/32)
ata2.00: configured for UDMA/133
scsi 1:0:0:0: Direct-Access     ATA      ST3250410AS      3.AA PQ: 0 ANSI: 5
usb 2-6: New USB device found, idVendor=3D058f, idProduct=3D6362
usb 2-6: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 2-6: Product: Mass Storage Device
usb 2-6: Manufacturer: Generic
usb 2-6: SerialNumber: 058F312D81B
sd 1:0:0:0: [sdb] 488397168 512-byte logical blocks: (250 GB/232 GiB)
sd 1:0:0:0: Attached scsi generic sg1 type 0
scsi 2:0:0:0: CD-ROM            TSSTcorp CDDVDW SH-S203P  SB01 PQ: 0 ANSI: 5
sd 1:0:0:0: [sdb] Write Protect is off
sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't suppor=
t DPO or FUA
 sdb: sdb1 sdb2 sdb3 sdb4 <sr0: scsi3-mmc drive: 48x/48x writer dvd-ram cd/=
rw xa/form2 cdda tray
 sdb5 >
Uniform CD-ROM driver Revision: 3.20
sr 2:0:0:0: Attached scsi CD-ROM sr0
sr 2:0:0:0: Attached scsi generic sg2 type 5
sd 1:0:0:0: [sdb] Attached SCSI disk
Freeing unused kernel memory: 920k freed
usb 5-1: new low speed USB device using uhci_hcd and address 2
Write protecting the kernel read-only data: 10240k
Freeing unused kernel memory: 1688k freed
Freeing unused kernel memory: 1944k freed
dracut: dracut-005-5.fc13
dracut: rd_NO_LUKS: removing cryptoluks activation
dracut: rd_NO_LVM: removing LVM activation
udev: starting version 153
dracut: Starting plymouth daemon
usb 5-1: New USB device found, idVendor=3D04d9, idProduct=3D1400
usb 5-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
dracut: rd_NO_DM: removing DM RAID activation
input: HID 04d9:1400 as /devices/pci0000:00/0000:00:1a.2/usb5/5-1/5-1:1.0/i=
nput/input2
generic-usb 0003:04D9:1400.0001: input,hidraw0: USB HID v1.10 Keyboard [HID=
 04d9:1400] on usb-0000:00:1a.2-1/input0
pata_marvell 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ 17
pata_marvell 0000:03:00.0: setting latency timer to 64
input: HID 04d9:1400 as /devices/pci0000:00/0000:00:1a.2/usb5/5-1/5-1:1.1/i=
nput/input3
scsi6 : pata_marvell
scsi7 : pata_marvell
ata7: PATA max UDMA/100 cmd 0x1018 ctl 0x1024 bmdma 0x1000 irq 17
ata8: DUMMY
Initializing USB Mass Storage driver...
scsi8 : usb-storage 2-6:1.0
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
generic-usb 0003:04D9:1400.0002: input,hidraw1: USB HID v1.10 Mouse [HID 04=
d9:1400] on usb-0000:00:1a.2-1/input1
firewire_ohci 0000:07:03.0: PCI INT A -> GSI 19 (level, low) -> IRQ 19
firewire_ohci: Added fw-ohci device 0000:07:03.0, OHCI v1.10, 4 IR + 8 IT c=
ontexts, quirks 0x2
usb 3-2: new full speed USB device using uhci_hcd and address 2
dracut: Autoassembling MD Raid
md: md0 stopped.
md: bind<sdb1>
md: bind<sda1>
md: raid1 personality registered for level 1
raid1: raid set md0 active with 2 out of 2 mirrors
md0: detected capacity change from 0 to 106823680
dracut: mdadm: /dev/md0 has been started with 2 drives.
 md0: unknown partition table
md: md1 stopped.
md: bind<sdb3>
md: bind<sda3>
raid1: raid set md1 active with 2 out of 2 mirrors
md1: detected capacity change from 0 to 16392912896
dracut: mdadm: /dev/md1 has been started with 2 drives.
 md1: unknown partition table
usb 3-2: New USB device found, idVendor=3D046d, idProduct=3D08b2
usb 3-2: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
md: md2 stopped.
md: bind<sdb5>
md: bind<sda5>
raid1: raid set md2 active with 2 out of 2 mirrors
md2: detected capacity change from 0 to 222296276992
dracut: mdadm: /dev/md2 has been started with 2 drives.
 md2: unknown partition table
firewire_core: created device fw0: GUID 009027000033420f, S400
dracut: Autoassembling MD Raid
scsi 8:0:0:0: Direct-Access     Generic  USB SD Reader    1.00 PQ: 0 ANSI: 0
scsi 8:0:0:1: Direct-Access     Generic  USB CF Reader    1.01 PQ: 0 ANSI: 0
scsi 8:0:0:2: Direct-Access     Generic  USB SM Reader    1.02 PQ: 0 ANSI: 0
scsi 8:0:0:3: Direct-Access     Generic  USB MS Reader    1.03 PQ: 0 ANSI: 0
sd 8:0:0:0: Attached scsi generic sg3 type 0
sd 8:0:0:1: Attached scsi generic sg4 type 0
sd 8:0:0:2: Attached scsi generic sg5 type 0
sd 8:0:0:0: [sdc] Attached SCSI removable disk
sd 8:0:0:3: Attached scsi generic sg6 type 0
sd 8:0:0:1: [sdd] Attached SCSI removable disk
sd 8:0:0:3: [sdf] Attached SCSI removable disk
sd 8:0:0:2: [sde] Attached SCSI removable disk
EXT4-fs (md1): mounted filesystem with ordered data mode
dracut: Mounted root filesystem /dev/md1
dracut: Loading SELinux policy
SELinux:  Disabled at runtime.
SELinux:  Unregistering netfilter hooks
type=3D1404 audit(1304087220.069:2): selinux=3D0 auid=3D4294967295 ses=3D42=
94967295
dracut: /sbin/load_policy: Can't load policy file /etc/selinux/targeted/pol=
icy/policy.15: No such file or directory
dracut: Switching root
readahead: starting
udev: starting version 153
microcode: CPU0 sig=3D0x1067a, pf=3D0x10, revision=3D0x0
microcode: CPU1 sig=3D0x1067a, pf=3D0x10, revision=3D0x0
microcode: CPU2 sig=3D0x1067a, pf=3D0x10, revision=3D0x0
microcode: CPU3 sig=3D0x1067a, pf=3D0x10, revision=3D0x0
microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Pe=
ter Oruba
Linux video capture interface: v2.00
microcode: CPU0 updated to revision 0xa07, date =3D 2008-04-09
microcode: CPU1 updated to revision 0xa07, date =3D 2008-04-09
microcode: CPU2 updated to revision 0xa07, date =3D 2008-04-09
microcode: CPU3 updated to revision 0xa07, date =3D 2008-04-09
pwc: Philips webcam module version 10.0.13 loaded.
pwc: Supports Philips PCA645/646, PCVC675/680/690, PCVC720[40]/730/740/750 =
& PCVC830/840.
pwc: Also supports the Askey VC010, various Logitech Quickcams, Samsung MPC=
-C10 and MPC-C30,
pwc: the Creative WebCam 5 & Pro Ex, SOTEC Afina Eye and Visionite VCS-UC30=
0 and VCS-UM100.
pwc: Logitech QuickCam 4000 Pro USB webcam detected.
pwc: Registered as video0.
input: PWC snapshot button as /devices/pci0000:00/0000:00:1a.0/usb3/3-2/inp=
ut/input4
usbcore: registered new interface driver Philips webcam
e1000e: Intel(R) PRO/1000 Network Driver - 1.0.2-k2
e1000e: Copyright (c) 1999 - 2009 Intel Corporation.
e1000e 0000:00:19.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
e1000e 0000:00:19.0: setting latency timer to 64
  alloc irq_desc for 31 on node -1
  alloc kstat_irqs on node -1
e1000e 0000:00:19.0: irq 31 for MSI/MSI-X
0000:00:19.0: eth0: (PCI Express:2.5GB/s:Width x1) 00:1c:c0:29:b5:09
0000:00:19.0: eth0: Intel(R) PRO/1000 Network Connection
0000:00:19.0: eth0: MAC: 7, PHY: 6, PBA No: ffffff-0ff
i801_smbus 0000:00:1f.3: PCI INT B -> GSI 18 (level, low) -> IRQ 18
iTCO_vendor_support: vendor-support=3D0
iTCO_wdt: Intel TCO WatchDog Timer Driver v1.05
iTCO_wdt: Found a ICH9R TCO device (Version=3D2, TCOBASE=3D0x0460)
iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=3D0)
  alloc irq_desc for 22 on node -1
  alloc kstat_irqs on node -1
HDA Intel 0000:00:1b.0: PCI INT A -> GSI 22 (level, low) -> IRQ 22
  alloc irq_desc for 32 on node -1
  alloc kstat_irqs on node -1
HDA Intel 0000:00:1b.0: irq 32 for MSI/MSI-X
HDA Intel 0000:00:1b.0: setting latency timer to 64
ALSA sound/pci/hda/hda_codec.c:4385: autoconfig: line_outs=3D3 (0xd/0xf/0x1=
0/0x0/0x0)
ALSA sound/pci/hda/hda_codec.c:4389:    speaker_outs=3D0 (0x0/0x0/0x0/0x0/0=
x0)
ALSA sound/pci/hda/hda_codec.c:4393:    hp_outs=3D1 (0xa/0x0/0x0/0x0/0x0)
ALSA sound/pci/hda/hda_codec.c:4394:    mono: mono_out=3D0x0
ALSA sound/pci/hda/hda_codec.c:4397:    dig-out=3D0x21/0x0
ALSA sound/pci/hda/hda_codec.c:4405:    inputs: mic=3D0xe, fmic=3D0xb, line=
=3D0xc, fline=3D0x0, cd=3D0x0, aux=3D0x0
ALSA sound/pci/hda/patch_sigmatel.c:3014: stac92xx: dac_nids=3D3 (0x2/0x5/0=
x4/0x0/0x0)
nvidia: module license 'NVIDIA' taints kernel.
Disabling lock debugging due to kernel taint
input: HDA Intel Line In at Ext Rear Jack as /devices/pci0000:00/0000:00:1b=
.0/sound/card0/input5
input: HDA Intel Mic at Ext Front Jack as /devices/pci0000:00/0000:00:1b.0/=
sound/card0/input6
input: HDA Intel Mic at Ext Rear Jack as /devices/pci0000:00/0000:00:1b.0/s=
ound/card0/input7
input: HDA Intel Speaker at Ext Rear Jack as /devices/pci0000:00/0000:00:1b=
.0/sound/card0/input8
input: HDA Intel Speaker at Ext Rear Jack as /devices/pci0000:00/0000:00:1b=
.0/sound/card0/input9
input: HDA Intel Speaker at Ext Rear Jack as /devices/pci0000:00/0000:00:1b=
.0/sound/card0/input10
input: HDA Intel HP Out at Ext Front Jack as /devices/pci0000:00/0000:00:1b=
.0/sound/card0/input11
usbcore: registered new interface driver snd-usb-audio
nvidia 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nvidia 0000:01:00.0: setting latency timer to 64
vgaarb: device changed decodes: PCI:0000:01:00.0,olddecodes=3Dio+mem,decode=
s=3Dnone:owns=3Dio+mem
NVRM: loading NVIDIA UNIX x86_64 Kernel Module  260.19.36  Tue Jan 18 16:56=
:11 PST 2011
kjournald starting.  Commit interval 5 seconds
EXT3-fs (md0): using internal journal
EXT3-fs (md0): mounted filesystem with ordered data mode
kjournald starting.  Commit interval 5 seconds
EXT3-fs (md2): using internal journal
EXT3-fs (md2): mounted filesystem with ordered data mode
Adding 2040248k swap on /dev/sda2.  Priority:-1 extents:1 across:2040248k
Adding 2040248k swap on /dev/sdb2.  Priority:-2 extents:1 across:2040248k
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
p4-clockmod: Unknown CPU. Please send an e-mail to <cpufreq@vger.kernel.org>
e1000e 0000:00:19.0: irq 31 for MSI/MSI-X
e1000e 0000:00:19.0: irq 31 for MSI/MSI-X
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
e1000e: eth0 NIC Link is Up 100 Mbps Full Duplex, Flow Control: None
0000:00:19.0: eth0: 10/100 speed: disabling TSO
Bridge firewalling registered
virbr0: starting userspace STP failed, starting kernel STP
Ebtables v2.0 registered
ip6_tables: (C) 2000-2006 Netfilter Core Team
fuse init (API version 7.13)
--8323328-1453962444-1304087787=:2256--
