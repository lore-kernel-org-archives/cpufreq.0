From: ". ." <matheng10@hotmail.com>
Subject: Problems on Dell D800 with Dothan 1.8
Date: Wed, 28 Jul 2004 16:06:14 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <BAY15-F17EI5WzJ7D9t0002075c@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi everyone, I'm having problems with cpufreq.

Symptoms:
========
- I can see the directory /sys/devices/system/cpu/cpu0/ but it's empy
- installing cpufreqd debian package tells me that it doesn't find "kernel 
interfaces for cpufreqd"

System
======
- Dell D800 laptop with Dothan 1.8
- output of /proc/cpuinfo:

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.80GHz
stepping        : 6
cpu MHz         : 1794.484
cache size      : 64 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov pat 
clflush dts acpi mmx fxsr sse sse2 ss tm pbe tm2 est
bogomips        : 3555.32

Followed procedure:
============
- downloaded debian kernel sources for 2.6.7
- compiled and installed a new kernel with
#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
# CONFIG_CPU_FREQ_PROC_INTF is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_24_API is not set
CONFIG_CPU_FREQ_TABLE=y
#
# CPUFreq processor drivers
#
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=y
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_LONGRUN is not set

Any suggestion?
Can the problem be related to a buggy ACPI DSDT or are the two issue 
completely unrelated?

Thank you very much...

output of dmesg:
BIOS-provided physical RAM map:
BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
BIOS-e820: 000000000009f000 - 00000000000a0000 (reserved)
BIOS-e820: 0000000000100000 - 000000001ffae000 (usable)
BIOS-e820: 000000001ffae000 - 0000000020000000 (reserved)
BIOS-e820: 00000000feda0000 - 00000000fee00000 (reserved)
BIOS-e820: 00000000ffb00000 - 0000000100000000 (reserved)
0MB HIGHMEM available.
511MB LOWMEM available.
On node 0 totalpages: 130990
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 126894 pages, LIFO batch:16
  HighMem zone: 0 pages, LIFO batch:1
DMI 2.3 present.
ACPI: RSDP (v000 DELL                                      ) @ 0x000fdf00
ACPI: RSDT (v001 DELL    CPi R   0x27d4041a ASL  0x00000061) @ 0x1fff0000
ACPI: FADT (v001 DELL    CPi R   0x27d4041a ASL  0x00000061) @ 0x1fff0400
ACPI: ASF! (v016 DELL    CPi R   0x27d4041a ASL  0x00000061) @ 0x1fff0800
ACPI: DSDT (v001 INT430 SYSFexxx 0x00001001 MSFT 0x0100000e) @ 0x00000000
Built 1 zonelists
Kernel command line: root=/dev/hda7 ro
Initializing CPU#0
PID hash table entries: 2048 (order 11: 16384 bytes)
Detected 1794.484 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Memory: 516280k/523960k available (1611k kernel code, 6920k reserved, 740k 
data, 208k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay loop... 3555.32 BogoMIPS
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU:     After generic identify, caps: afe9f9bf 00000000 00000000 00000000
CPU:     After vendor identify, caps: afe9f9bf 00000000 00000000 00000000
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU:     After all inits, caps: afe9f9bf 00000000 00000000 00000040
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU: Intel(R) Pentium(R) M processor 1.80GHz stepping 06
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
NET: Registered protocol family 16
EISA bus registered
PCI: PCI BIOS revision 2.10 entry at 0xfc96e, last bus=2
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040326
tbxface-0117 [03] acpi_load_tables      : ACPI Tables successfully acquired
Parsing all Control 
Methods:...................................................................................................................................................................................
Table [DSDT](id F004) - 431 Objects with 69 Devices 179 Methods 5 Regions
ACPI Namespace successfully loaded at root c039865c
ACPI: IRQ9 SCI: Edge set to Level Trigger.
evxfevnt-0093 [04] acpi_enable           : Transition to ACPI mode 
successful
evgpeblk-0867 [06] ev_create_gpe_block   : GPE 00 to 31 [_GPE] 4 regs at 
0000000000000828 on int 9
evgpeblk-0925 [06] ev_create_gpe_block   : Found 0 Wake, Enabled 9 Runtime 
GPEs in this block
Completing Region/Field/Buffer/Package 
initialization:...............................................................
Initialized 5/5 Regions 9/9 Fields 23/23 Buffers 26/26 Packages (440 nodes)
Executing all Device _STA and_INI 
methods:.......................................................................
71 Devices found containing: 71 _STA, 3 _INI methods
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
PCI: Transparent bridge - 0000:00:1e.0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7) *11
ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 5 7 9 10 *11)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0, 
disabled.
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
Linux Plug and Play Support v0.97 (c) Adam Belay
PnPBIOS: Scanning system for PnP BIOS support...
PnPBIOS: Found PnP BIOS installation structure at 0xc00fe2d0
PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0xe2f4, dseg 0x40
pnp: 00:01: ioport range 0x800-0x85f has been reserved
pnp: 00:01: ioport range 0x860-0x87f has been reserved
pnp: 00:01: ioport range 0x880-0x8bf has been reserved
pnp: 00:01: ioport range 0x8c0-0x8ff has been reserved
pnp: 00:01: ioport range 0x3f0-0x3f1 has been reserved
pnp: 00:01: ioport range 0x900-0x97f has been reserved
pnp: 00:01: ioport range 0xf400-0xf4fe has been reserved
PnPBIOS: 13 nodes reported by PnP BIOS; 13 recorded by driver
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKH] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 7
PCI: Using ACPI for IRQ routing
vesafb: probe of vesafb0 failed with error -6
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
ACPI: AC Adapter [AC] (on-line)
ACPI: Battery Slot [BAT0] (battery present)
ACPI: Battery Slot [BAT1] (battery absent)
ACPI: Lid Switch [LID]
ACPI: Power Button (CM) [PBTN]
ACPI: Sleep Button (CM) [SBTN]
ACPI: Processor [CPU0] (supports C1 C2 C3, 8 throttling states)
ACPI: Thermal Zone [THM] (57 C)
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Using anticipatory io scheduler
floppy0: no floppy controllers found
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
ICH4: IDE controller at PCI slot 0000:00:1f.1
PCI: Enabling device 0000:00:1f.1 (0005 -> 0007)
ICH4: chipset revision 1
ICH4: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xbfa0-0xbfa7, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xbfa8-0xbfaf, BIOS settings: hdc:DMA, hdd:pio
hda: HTS548060M9AT00, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hdc: _NEC DVD+RW ND-6100A, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 1024KiB
hda: 117210240 sectors (60011 MB) w/7877KiB Cache, CHS=16383/255/63, 
UDMA(100)
hda: hda1 hda2 hda3 hda4 < hda5 hda6 hda7 >
mice: PS/2 mouse device common for all mice
serio: i8042 AUX port at 0x60,0x64 irq 12
input: ImExPS/2 Logitech Explorer Mouse on isa0060/serio1
serio: i8042 KBD port at 0x60,0x64 irq 1
input: AT Translated Set 2 keyboard on isa0060/serio0
EISA: Probing bus 0 at eisa0
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send 
/proc/cpuinfo to Jeremy Fitzhardinge <jeremy@goop.org>
ACPI: (supports S0 S1 S3 S4 S4bios S5)
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 208k freed
Adding 1574344k swap on /dev/hda3.  Priority:-1 extents:1
EXT3 FS on hda7, internal journal
Real Time Clock Driver v1.12
hdc: ATAPI 24X DVD-ROM CD-R/RW drive, 2048kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
tg3.c:v3.3 (April 27, 2004)
tg3: tg3_request_firmware (eth%d): Couldn't get firmware 
"tg3/tso_5705-1.1.0".
tg3: eth%d: Firmware "tg3/tso_5705-1.1.0" not loaded; continuing without 
TSO.
eth0: Tigon3 [partno(BCM95705A50) rev 3001 PHY(5705)] (PCI:33MHz:32-bit) 
10/100/1000BaseT Ethernet 00:0f:1f:1b:25:03
eth0: HostTXDS[1] RXcsums[1] LinkChgREG[1] MIirq[1] ASF[0] Split[0] 
WireSpeed[1] TSOcap[0]
usbcore: registered new driver usbfs
usbcore: registered new driver hub
ehci_hcd 0000:00:1d.7: Intel Corp. 82801DB (ICH4) USB2 EHCI Controller
PCI: Setting latency timer of device 0000:00:1d.7 to 64
ehci_hcd 0000:00:1d.7: irq 11, pci mem e08cbc00
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
PCI: cache line size of 32 is not supported by device 0000:00:1d.7
ehci_hcd 0000:00:1d.7: USB 2.0 enabled, EHCI 1.00, driver 2004-May-10
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
usb 1-6: new high speed USB device using address 2
hub 1-6:1.0: USB hub found
hub 1-6:1.0: 4 ports detected
usb 1-6.2: new high speed USB device using address 3
hub 1-6.2:1.0: USB hub found
hub 1-6.2:1.0: 4 ports detected
parport: PnPBIOS parport detected.
parport0: PC-style at 0x378 (0x778), irq 7, dma 1 
[PCSPP,TRISTATE,COMPAT,ECP,DMA]
Linux agpgart interface v0.100 (c) Dave Jones
agpgart: Detected an Intel 855PM Chipset.
agpgart: Maximum main memory to use for agp memory: 439M
agpgart: AGP aperture is 128M @ 0xe0000000
ieee1394: Initialized config rom entry `ip1394'
ohci1394: $Rev: 1223 $ Ben Collins <bcollins@debian.org>
ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[11]  MMIO=[fafef800-fafeffff]  
Max Packet=[2048]
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[394fc0001ee21830]
ip1394: $Rev: 1224 $ Ben Collins <bcollins@debian.org>
ip1394: eth1: IEEE-1394 IPv4 over 1394 Ethernet (fw-host0)
tg3: eth0: Link is up at 100 Mbps, full duplex.
tg3: eth0: Flow control is off for TX and off for RX.
lp0: using parport0 (interrupt-driven).
lp0: console ready
Linux Kernel Card Services
  options:  [pci] [pm]
nvidia: module license 'NVIDIA' taints kernel.
0: nvidia: loading NVIDIA Linux x86 NVIDIA Kernel Module  1.0-5336  Wed Jan 
14 18:29:26 PST 2004
agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail
