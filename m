From: Willy <domenico.rizzo@gmail.com>
Subject: Fwd: cpufreq-set: I can't change frequency
Date: Wed, 30 Jul 2008 15:29:58 +0200
Message-ID: <894176e50807300629r29483b3dxb4fa0354f2c96b44@mail.gmail.com>
References: <894176e50807281515o7f684357s5807472d9ffd98c9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <894176e50807281515o7f684357s5807472d9ffd98c9@mail.gmail.com>
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
To: cpufreq@lists.linux.org.uk

Hello, today I switch on my pc and cpufreq-set doesn't work no longer and I
can't change my cpu frequency Thanks in advance, please help me because my
freq is locket at 800 and I can't watch any video.
I report some output:



# lsmod
Module                  Size  Used by
acpi_cpufreq            5516  0
freq_table              3524  1 acpi_cpufreq
ntfs                   97984  1
usb_storage            35904  0
fglrx                1674196  21
i2c_i801                8656  0
ipw2200               125232  0
psmouse                35664  0
intel_agp              22908  0
i2c_core               18704  1 i2c_i801
dcdbas                  6368  0
evdev                   8768  5
pcspkr                  2240  0
agpgart                26864  2 fglrx,intel_agp
sr_mod                 13220  0






# cpufreq-info
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0
  hardware limits: 800 MHz - 1.60 GHz
  available frequency steps: 1.60 GHz, 1.33 GHz, 1.07 GHz, 800 MHz
  available cpufreq governors: userspace
  current policy: frequency should be within 800 MHz and 800 MHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).



# cpufreq-set -d 1333MHz
Error setting new values. Common errors:
- Do you have proper administration rights? (super-user?)
- Is the governor you requested available and modprobed?
- Trying to set an invalid policy?
- Trying to set a specific frequency, but userspace governor is not
available,
   for example because of hardware which cannot be set to a specific
frequency
   or because the userspace governor isn't loaded?




# cpufreq-set -u 1333MHz
# (nothing output, it seems to work but cpufreq-info shows no changes)



# cpufreq-set -f 1333MHz
# (it has no response but cpufreq-info shows no freq change)




# dmesg
00   ( 119 MB)
    lowmem  : 0xc0000000 - 0xf8000000   ( 896 MB)
      .init : 0xc04cc000 - 0xc0504000   ( 224 kB)
      .data : 0xc03d5f06 - 0xc04c9240   ( 972 kB)
      .text : 0xc0100000 - 0xc03d5f06   (2903 kB)
Checking if this processor honours the WP bit even in supervisor mode...Ok.
CPA: page pool initialized 1 of 1 pages preallocated
Calibrating delay using timer specific routine.. 3195.58 BogoMIPS
(lpj=6391168)
Mount-cache hash table entries: 512
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 2048K
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
Compat vDSO mapped to ffffe000.
CPU: Intel(R) Pentium(R) M processor 1.60GHz stepping 08
Checking 'hlt' instruction... OK.
Freeing SMP alternatives: 0k freed
ACPI: Core revision 20070126
ENABLING IO-APIC IRQs
..TIMER: vector=0x31 apic1=0 pin1=2 apic2=-1 pin2=-1
net_namespace: 440 bytes
NET: Registered protocol family 16
No dock devices found.
ACPI: bus type pci registered
PCI: Using MMCONFIG for extended config space
PCI: Using configuration type 1
Setting up standard PCI resources
ACPI: EC: Look up EC in DSDT
ACPI: Interpreter enabled
ACPI: (supports S0 S5)
ACPI: Using IOAPIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (0000:00)
pci 0000:00:1f.0: quirk: region 1000-107f claimed by ICH6 ACPI/GPIO/TCO
pci 0000:00:1f.0: quirk: region 1080-10bf claimed by ICH6 GPIO
PCI: Transparent bridge - 0000:00:1e.0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7) *10
ACPI: PCI Interrupt Link [LNKC] (IRQs *9 10 11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 5 *7 9 10 11)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0,
disabled.
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0,
disabled.
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 11 12 14 15) *0,
disabled.
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 11 devices
ACPI: ACPI bus type pnp unregistered
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
PCI: Using ACPI for IRQ routing
PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a
report
system 00:00: iomem range 0x0-0x9fbff could not be reserved
system 00:00: iomem range 0x9fc00-0x9ffff could not be reserved
system 00:00: iomem range 0xc0000-0xcffff could not be reserved
system 00:00: iomem range 0xe0000-0xfffff could not be reserved
system 00:00: iomem range 0x100000-0x3ffd9fff could not be reserved
system 00:00: iomem range 0x3ffda000-0x3fffffff could not be reserved
system 00:00: iomem range 0xfeda0000-0xfedfffff could not be reserved
system 00:00: iomem range 0xffb00000-0xffffffff could not be reserved
system 00:00: iomem range 0xfec00000-0xfec0ffff could not be reserved
system 00:00: iomem range 0xfee00000-0xfee0ffff could not be reserved
system 00:00: iomem range 0xfed20000-0xfed9ffff could not be reserved
system 00:00: iomem range 0xf0000000-0xf0003fff could not be reserved
system 00:00: iomem range 0xf0004000-0xf0004fff could not be reserved
system 00:00: iomem range 0xf0005000-0xf0005fff could not be reserved
system 00:00: iomem range 0xf0006000-0xf0006fff could not be reserved
system 00:00: iomem range 0xf0008000-0xf000bfff could not be reserved
system 00:00: iomem range 0xe0000000-0xefffffff could not be reserved
system 00:02: ioport range 0x4d0-0x4d1 has been reserved
system 00:02: ioport range 0x1000-0x1005 has been reserved
system 00:02: ioport range 0x1008-0x100f has been reserved
system 00:03: ioport range 0xf400-0xf4fe has been reserved
system 00:03: ioport range 0x1006-0x1007 has been reserved
system 00:03: ioport range 0x100a-0x1059 could not be reserved
system 00:03: ioport range 0x1060-0x107f has been reserved
system 00:03: ioport range 0x1080-0x10bf has been reserved
system 00:03: ioport range 0x10c0-0x10df has been reserved
system 00:03: ioport range 0x10e0-0x10ff has been reserved
system 00:08: ioport range 0x900-0x90f has been reserved
system 00:08: ioport range 0x910-0x91f has been reserved
system 00:08: ioport range 0x920-0x92f has been reserved
system 00:08: ioport range 0x930-0x93f has been reserved
system 00:08: ioport range 0x940-0x97f has been reserved
PCI: Bridge: 0000:00:01.0
  IO window: d000-dfff
  MEM window: 0xdfd00000-0xdfefffff
  PREFETCH window: 0x00000000d0000000-0x00000000d7ffffff
PCI: Bus 4, cardbus bridge: 0000:03:01.0
  IO window: 0x00002000-0x000020ff
  IO window: 0x00002400-0x000024ff
  PREFETCH window: 0x50000000-0x53ffffff
  MEM window: 0x54000000-0x57ffffff
PCI: Bridge: 0000:00:1e.0
  IO window: 2000-2fff
  MEM window: 0xdfc00000-0xdfcfffff
  PREFETCH window: 0x0000000050000000-0x0000000053ffffff
ACPI: PCI Interrupt 0000:00:01.0[A] -> GSI 16 (level, low) -> IRQ 16
PCI: Setting latency timer of device 0000:00:01.0 to 64
PCI: Setting latency timer of device 0000:00:1e.0 to 64
PCI: Enabling device 0000:03:01.0 (0000 -> 0003)
ACPI: PCI Interrupt 0000:03:01.0[A] -> GSI 19 (level, low) -> IRQ 19
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
Simple Boot Flag at 0x79 set to 0x1
Machine check exception polling timer started.
io scheduler noop registered
io scheduler anticipatory registered (default)
io scheduler deadline registered
io scheduler cfq registered
pci 0000:01:00.0: Boot video device
PCI: Setting latency timer of device 0000:00:01.0 to 64
assign_interrupt_mode Found MSI capability
Allocate Port Service[0000:00:01.0:pcie00]
Allocate Port Service[0000:00:01.0:pcie03]
ACPI: AC Adapter [AC] (on-line)
ACPI: Battery Slot [BAT0] (battery present)
input: Lid Switch as /devices/LNXSYSTM:00/device:00/PNP0C0D:00/input/input0
ACPI: Lid Switch [LID]
input: Power Button (CM) as
/devices/LNXSYSTM:00/device:00/PNP0C0C:00/input/input1
ACPI: Power Button (CM) [PBTN]
input: Sleep Button (CM) as
/devices/LNXSYSTM:00/device:00/PNP0C0E:00/input/input2
ACPI: Sleep Button (CM) [SBTN]
ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3] C4[C3])
ACPI: ACPI0007:00 is registered as cooling_device0
ACPI: Processor [CPU0] (supports 8 throttling states)
ACPI: LNXTHERM:01 is registered as thermal_zone0
ACPI: Thermal Zone [THM] (55 C)
brd: module loaded
loop: module loaded
ACPI: PCI Interrupt 0000:03:00.0[A] -> GSI 18 (level, low) -> IRQ 18
Marking TSC unstable due to: possible TSC halt in C2.
Switched to NOHz mode on CPU #0
ssb: Sonics Silicon Backplane found on PCI device 0000:03:00.0
b44.c:v2.0
eth0: Broadcom 44xx/47xx 10/100BaseT Ethernet 00:11:43:79:64:5e
Linux video capture interface: v2.00
Uniform Multi-Platform E-IDE driver
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Probing IDE interface ide2...
Probing IDE interface ide3...
Clocksource tsc unstable (delta = -494583263 ns)
Probing IDE interface ide4...
Probing IDE interface ide5...
Driver 'sd' needs updating - please use bus_type methods
ahci 0000:00:1f.2: version 3.0
ACPI: PCI Interrupt 0000:00:1f.2[B] -> GSI 17 (level, low) -> IRQ 17
ACPI: PCI interrupt for device 0000:00:1f.2 disabled
ahci: probe of 0000:00:1f.2 failed with error -22
ata_piix 0000:00:1f.2: version 2.12
ACPI: PCI Interrupt 0000:00:1f.2[B] -> GSI 17 (level, low) -> IRQ 17
ata_piix 0000:00:1f.2: MAP [ P0 P2 IDE IDE ]
PCI: Setting latency timer of device 0000:00:1f.2 to 64
scsi0 : ata_piix
scsi1 : ata_piix
ata1: SATA max UDMA/133 cmd 0x1f0 ctl 0x3f6 bmdma 0xbfa0 irq 14
ata2: PATA max UDMA/100 cmd 0x170 ctl 0x376 bmdma 0xbfa8 irq 15
ata1.00: ATA-6: TOSHIBA MK6026GAX, PA202D, max UDMA/100
ata1.00: 117210240 sectors, multi 8: LBA
ata1.00: applying bridge limits
ata1.00: configured for UDMA/100
ata2.00: ATAPI: SONY DVD+/-RW DW-D56A, PDS3, max UDMA/33
ata2.00: configured for UDMA/33
scsi 0:0:0:0: Direct-Access     ATA      TOSHIBA MK6026GA PA20 PQ: 0 ANSI: 5

sd 0:0:0:0: [sda] 117210240 512-byte hardware sectors (60012 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support
DPO or FUA
sd 0:0:0:0: [sda] 117210240 512-byte hardware sectors (60012 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support
DPO or FUA
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 sda8 >
sd 0:0:0:0: [sda] Attached SCSI disk
sd 0:0:0:0: Attached scsi generic sg0 type 0
scsi 1:0:0:0: CD-ROM            SONY     DVD+-RW DW-D56A  PDS3 PQ: 0 ANSI: 5

scsi 1:0:0:0: Attached scsi generic sg1 type 5
ACPI: PCI Interrupt 0000:03:01.1[B] -> GSI 18 (level, low) -> IRQ 18
ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[18]  MMIO=[dfcfc800-dfcfcfff]
Max Packet=[2048]  IR/IT contexts=[4/4]
ieee1394: raw1394: /dev/raw1394 device initialized
usbmon: debugfs is not available
ACPI: PCI Interrupt 0000:00:1d.7[A] -> GSI 16 (level, low) -> IRQ 16
PCI: Setting latency timer of device 0000:00:1d.7 to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:1d.7: debug port 1
PCI: cache line size of 32 is not supported by device 0000:00:1d.7
ehci_hcd 0000:00:1d.7: irq 16, io mem 0xffa80800
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 8 ports detected
USB Universal Host Controller Interface driver v3.0
ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 16 (level, low) -> IRQ 16
PCI: Setting latency timer of device 0000:00:1d.0 to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:1d.0: irq 16, io base 0x0000bf80
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.1[B] -> GSI 17 (level, low) -> IRQ 17
PCI: Setting latency timer of device 0000:00:1d.1 to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1d.1: irq 17, io base 0x0000bf60
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.2[C] -> GSI 18 (level, low) -> IRQ 18
PCI: Setting latency timer of device 0000:00:1d.2 to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1d.2: irq 18, io base 0x0000bf40
usb usb4: configuration #1 chosen from 1 choice
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.3[D] -> GSI 19 (level, low) -> IRQ 19
PCI: Setting latency timer of device 0000:00:1d.3 to 64
uhci_hcd 0000:00:1d.3: UHCI Host Controller
uhci_hcd 0000:00:1d.3: new USB bus registered, assigned bus number 5
uhci_hcd 0000:00:1d.3: irq 19, io base 0x0000bf20
usb usb5: configuration #1 chosen from 1 choice
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
PNP: PS/2 Controller [PNP0303:KBC,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mice: PS/2 mouse device common for all mice
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.16rc2 (Thu Jan 31
16:40:16 2008 UTC).
ACPI: PCI Interrupt 0000:00:1e.2[A] -> GSI 16 (level, low) -> IRQ 16
PCI: Setting latency timer of device 0000:00:1e.2 to 64
input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input3
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[354fc000258c4c30]
intel8x0_measure_ac97_clock: measured 55118 usecs
intel8x0: clocking to 48000
ALSA device list:
  #0: Intel ICH6 with STAC9750,51 at irq 16
TCP cubic registered
NET: Registered protocol family 1
NET: Registered protocol family 17
ieee80211: 802.11 data/management/control stack, git-1.1.13
ieee80211: Copyright (C) 2004-2005 Intel Corporation <
jketreno@linux.intel.com>
ieee80211_crypt: registered algorithm 'NULL'
ieee80211_crypt: registered algorithm 'WEP'
ieee80211_crypt: registered algorithm 'CCMP'
ieee80211_crypt: registered algorithm 'TKIP'
Using IPI Shortcut mode
ReiserFS: sda6: found reiserfs format "3.6" with standard journal
ReiserFS: sda6: using ordered data mode
ReiserFS: sda6: journal params: device sda6, size 8192, journal first block
18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: sda6: checking transaction log (sda6)
ReiserFS: sda6: Using r5 hash to sort names
VFS: Mounted root (reiserfs filesystem) readonly.
Freeing unused kernel memory: 224k freed
Driver 'sr' needs updating - please use bus_type methods
sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi CD-ROM sr0
input: PC Speaker as /devices/platform/pcspkr/input/input4
Linux agpgart interface v0.103
ipw2200: Intel(R) PRO/Wireless 2200/2915 Network Driver, 1.2.2k
ipw2200: Copyright(c) 2003-2006 Intel Corporation
ACPI: PCI Interrupt 0000:03:03.0[A] -> GSI 17 (level, low) -> IRQ 17
ipw2200: Detected Intel PRO/Wireless 2200BG Network Connection
input: PS/2 Mouse as /devices/platform/i8042/serio1/input/input5
input: AlpsPS/2 ALPS GlidePoint as
/devices/platform/i8042/serio1/input/input6
dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.2)
fglrx: module license 'Proprietary. (C) 2002 - ATI Technologies, Starnberg,
GERMANY' taints kernel.
Symbol init_mm is marked as UNUSED, however this module is using it.
This symbol will go away in the future.
Please evalute if this is the right api to use, and if it really is, submit
a report the linux kernel mailinglist together with submitting your code for
inclusion.
[fglrx]   vendor: 1002 device: 5460 count: 1
[fglrx] Maximum main memory to use for locked dma buffers: 803 MBytes.
[fglrx] PAT is enabled successfully!
[fglrx] module loaded - fglrx 8.50.3 [Jun  2 2008] with 1 minors
ipw2200: Detected geography ZZD (13 802.11bg channels, 0 802.11a channels)
ACPI: PCI Interrupt 0000:00:1f.3[B] -> GSI 17 (level, low) -> IRQ 17
udev: renamed network interface eth1 to eth2
Initializing USB Mass Storage driver...
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda5, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
NTFS driver 2.1.29 [Flags: R/O MODULE].
NTFS volume version 3.1.
Adding 2008084k swap on /dev/sda7.  Priority:-1 extents:1 across:2008084k
ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16
[fglrx] Reserved FB block: Shared offset:0, size:40000
[fglrx] Reserved FB block: Unshared offset:3fae000, size:40000
[fglrx] Reserved FB block: Unshared offset:3fee000, size:1000
[fglrx] Reserved FB block: Unshared offset:3fef000, size:1000
[fglrx] Reserved FB block: Unshared offset:3ff0000, size:10000
