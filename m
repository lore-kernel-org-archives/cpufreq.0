From: jy <jy454@yahoo.fr>
Subject: Re: Acer Aspire  1350 broken PST
Date: Fri, 16 Apr 2004 17:19:56 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <c5otiu$ime$1@sea.gmane.org>
References: <c5n0ms$7nc$1@sea.gmane.org>
	<20040416120519.GT8953@poupinou.org>	<c5osds$fed$1@sea.gmane.org>
	<20040416151135.GV8953@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040416151135.GV8953@poupinou.org>
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
To: cpufreq@www.linux.org.uk

Bruno Ducrot wrote:
> On Fri, Apr 16, 2004 at 05:00:10PM +0200, jy wrote:

> 
> Indeed.  Could you please post the full dmesg please?
> 

Linux version 2.6.5 (root@jy-portable) (version gcc 3.3.3 (Debian 
20040401)) #1 SMP Fri Apr 16 15:06:26 CEST 2004
BIOS-provided physical RAM map:
  BIOS-e820: 0000000000000000 - 000000000009f800 (usable)
  BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)
  BIOS-e820: 00000000000d8000 - 0000000000100000 (reserved)
  BIOS-e820: 0000000000100000 - 000000001fef0000 (usable)
  BIOS-e820: 000000001fef0000 - 000000001fefb000 (ACPI data)
  BIOS-e820: 000000001fefb000 - 000000001ff00000 (ACPI NVS)
  BIOS-e820: 000000001ff00000 - 0000000020000000 (reserved)
  BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)
0MB HIGHMEM available.
510MB LOWMEM available.
On node 0 totalpages: 130800
   DMA zone: 4096 pages, LIFO batch:1
   Normal zone: 126704 pages, LIFO batch:16
   HighMem zone: 0 pages, LIFO batch:1
DMI 2.3 present.
ACPI: RSDP (v000 PTLTD                                     ) @ 0x000f68c0
ACPI: RSDT (v001 PTLTD    RSDT   0x06040000  LTP 0x00000000) @ 0x1fef5b3e
ACPI: FADT (v001 KN400  PTLTW    0x06040000 PTL_ 0x000f4240) @ 0x1fefae74
ACPI: SSDT (v001 PTLTD  POWERNOW 0x06040000  LTP 0x00000001) @ 0x1fefaee8
ACPI: DSDT (v001  VIA   PTL_ACPI 0x06040000 MSFT 0x0100000e) @ 0x00000000
Built 1 zonelists
Kernel command line: BOOT_IMAGE=Knoppix ro ramdisk_size=100000 
init=/etc/init nomce lang=fr 2.6.5
Unknown boot option `2.6.5': ignoring
Local APIC disabled by BIOS -- reenabling.
Found and enabled local APIC!
Initializing CPU#0
PID hash table entries: 2048 (order 11: 16384 bytes)
Detected 796.461 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Memory: 513196k/523200k available (1744k kernel code, 9232k reserved, 
701k data, 268k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay loop... 1564.67 BogoMIPS
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU:     After generic identify, caps: 0383fbff c1cbfbff 00000000 00000000
CPU:     After vendor identify, caps: 0383fbff c1cbfbff 00000000 00000000
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
CPU:     After all inits, caps: 0383fbff c1cbfbff 00000000 00000020
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
Checking for popad bug... OK.
POSIX conformance testing by UNIFIX
CPU0: AMD Mobile AMD Athlon(tm) XP 3000+ stepping 00
per-CPU timeslice cutoff: 1462.20 usecs.
task migration cache decay timeout: 2 msecs.
SMP motherboard not detected.
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 795.0981 MHz.
..... host bus clock speed is 265.0326 MHz.
Brought up 1 CPUs
NET: Registered protocol family 16
EISA bus registered
PCI: PCI BIOS revision 2.10 entry at 0xfd65c, last bus=1
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040326
spurious 8259A interrupt: IRQ7.
ACPI: IRQ10 SCI: Edge set to Level Trigger.
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs *4)
ACPI: PCI Interrupt Link [LNKB] (IRQs *5)
ACPI: PCI Interrupt Link [LNKC] (IRQs *9)
ACPI: PCI Interrupt Link [LNKD] (IRQs *11)
ACPI: Embedded Controller [EC0] (gpe 1)
Linux Plug and Play Support v0.97 (c) Adam Belay
PnPBIOS: Scanning system for PnP BIOS support...
PnPBIOS: Found PnP BIOS installation structure at 0xc00f6900
PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0xb5c9, dseg 0x400
pnp: 00:09: ioport range 0xfe00-0xfe01 has been reserved
pnp: 00:0c: ioport range 0x4d0-0x4d1 has been reserved
pnp: 00:0c: ioport range 0x4000-0x407f has been reserved
pnp: 00:0c: ioport range 0x8100-0x810f has been reserved
PnPBIOS: 18 nodes reported by PnP BIOS; 18 recorded by driver
SCSI subsystem initialized
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 5
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 9
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 4
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
PCI: Using ACPI for IRQ routing
PCI: if you experience problems, try using option 'pci=noacpi' or even 
'acpi=off'
Total HugeTLB memory allocated, 0
VFS: Disk quotas dquot_6.5.1
Initializing Cryptographic API
PCI: Via IRQ fixup for 0000:00:10.0, from 0 to 4
PCI: Via IRQ fixup for 0000:00:10.1, from 0 to 5
PCI: Via IRQ fixup for 0000:00:10.2, from 0 to 9
ACPI: Processor [CPU0] (supports C1 C2)
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Using anticipatory io scheduler
FDC 0 is a National Semiconductor PC87306
RAMDISK driver initialized: 16 RAM disks of 100000K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: IDE controller at PCI slot 0000:00:11.1
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
VP_IDE: VIA vt8235 (rev 00) IDE UDMA133 controller on pci0000:00:11.1
     ide0: BM-DMA at 0x2060-0x2067, BIOS settings: hda:DMA, hdb:pio
     ide1: BM-DMA at 0x2068-0x206f, BIOS settings: hdc:DMA, hdd:pio
hda: HITACHI_DK23FA-60, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hdc: PIONEER DVD-RW DVR-K12RA, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 128KiB
hda: 117210240 sectors (60011 MB) w/8192KiB Cache, CHS=65535/16/63
  hda: hda1 hda2 < hda5 hda6 hda7 hda8 hda9 hda10 hda11 hda12 >
hdc: ATAPI 63X DVD-ROM DVD-R CD-R/RW drive, 2000kB Cache
Uniform CD-ROM driver Revision: 3.20
mice: PS/2 mouse device common for all mice
serio: i8042 AUX port at 0x60,0x64 irq 12
synaptics reset failed
synaptics reset failed
synaptics reset failed
Synaptics Touchpad, model: 1
  Firmware: 5.8
  180 degree mounted touchpad
  Sensor: 29
  new absolute packet format
  Touchpad has extended capability bits
  -> 4 multi-buttons, i.e. besides standard buttons
  -> multifinger detection
  -> palm detection
input: SynPS/2 Synaptics TouchPad on isa0060/serio1
serio: i8042 KBD port at 0x60,0x64 irq 1
input: AT Translated Set 2 keyboard on isa0060/serio0
EISA: Probing bus 0 at eisa0
Cannot allocate resource for EISA slot 1
Cannot allocate resource for EISA slot 2
Cannot allocate resource for EISA slot 4
EISA: Detected 0 cards.
NET: Registered protocol family 2
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 32768 bind 32768)
NET: Registered protocol family 1
NET: Registered protocol family 15
PM: Reading pmdisk image.
PM: Resume from disk failed.
ACPI: (supports S0 S3 S4 S5)
EXT2-fs warning (device hda9): ext2_fill_super: mounting ext3 filesystem 
as ext2

VFS: Mounted root (ext2 filesystem) readonly.
Freeing unused kernel memory: 268k freed
Real Time Clock Driver v1.12
Adding 305192k swap on /dev/hda7.  Priority:-1 extents:1
warning: process `update' used the obsolete bdflush system call
Fix your initscripts?
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apm: overridden by ACPI.
Linux Kernel Card Services
   options:  [pci] [cardbus] [pm]
Yenta: CardBus bridge found at 0000:00:07.0 [1025:0033]
Yenta: Enabling burst memory read transactions
Yenta: Using CSCINT to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta: ISA IRQ mask 0x0088, PCI irq 5
Socket status: 30000006
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
USB Universal Host Controller Interface driver v2.2
uhci_hcd 0000:00:10.0: VIA Technologies, Inc. USB
uhci_hcd 0000:00:10.0: irq 4, io base 00002000
uhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 1
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
uhci_hcd 0000:00:10.1: VIA Technologies, Inc. USB (#2)
uhci_hcd 0000:00:10.1: irq 5, io base 00002020
uhci_hcd 0000:00:10.1: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
uhci_hcd 0000:00:10.2: VIA Technologies, Inc. USB (#3)
uhci_hcd 0000:00:10.2: irq 9, io base 00002040
uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 3
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ohci_hcd: 2004 Feb 02 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
usb 2-1: new low speed USB device using address 2
ieee1394: Initialized config rom entry `ip1394'
ohci1394: $Rev: 1172 $ Ben Collins <bcollins@debian.org>
ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[5] 
MMIO=[d0004000-d00047ff]  Max Packet=[2048]
drivers/usb/core/usb.c: registered new driver hiddev
input: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on 
usb-0000:00:10.1-1
drivers/usb/core/usb.c: registered new driver hid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
ts: Compaq touchscreen protocol output
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[00c09f000014c6a6]
sbp2: $Rev: 1170 $ Ben Collins <bcollins@debian.org>
ip1394: $Rev: 1175 $ Ben Collins <bcollins@debian.org>
ip1394: eth0: IEEE-1394 IPv4 over 1394 Ethernet (fw-host0)
ehci_hcd 0000:00:10.3: VIA Technologies, Inc. USB 2.0
ehci_hcd 0000:00:10.3: irq 11, pci mem e0870c00
ehci_hcd 0000:00:10.3: new USB bus registered, assigned bus number 4
ehci_hcd 0000:00:10.3: USB 2.0 enabled, EHCI 1.00, driver 2003-Dec-29
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 6 ports detected
usb 2-1: USB disconnect, address 2
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB:  48.270 MHz
powernow: Found PSB header at c00f06f0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).
powernow: No PST tables match this cpuid (0x7a0)
powernow: This is indicative of a broken BIOS.
powernow: Trying ACPI perflib
powernow: acpi:  P0: 2200 MHz 75000 mW 125 uS control 00d058fb SGTC 13334
powernow:    FID: 0x1b (16.5x [796MHz])	VID: 0x7 (1.650V)
powernow: acpi:  P1: 1800 MHz 55000 mW 125 uS control 00d05935 SGTC 13334
powernow:    FID: 0x15 (13.5x [651MHz])	VID: 0x9 (1.550V)
powernow: acpi:  P2: 1467 MHz 32000 mW 125 uS control 00d059c0 SGTC 13334
powernow:    FID: 0x0 (11.0x [530MHz])	VID: 0xe (1.300V)
powernow: acpi:  P3: 1064 MHz 30000 mW 125 uS control 00d059ca SGTC 13334
powernow:    FID: 0xa (8.0x [386MHz])	VID: 0xe (1.300V)
powernow: acpi:  P4: 800 MHz 26000 mW 125 uS control 00d059c6 SGTC 13334
powernow:    FID: 0x6 (6.0x [289MHz])	VID: 0xe (1.300V)
powernow: Minimum speed 289 MHz. Maximum speed 796 MHz.
Losing too many ticks!
TSC cannot be used as a timesource.  <4>Possible reasons for this are:
   You're running with Speedstep,
   You don't have DMA enabled for your hard disk (see hdparm),
   Incorrect TSC synchronization on an SMP system (see dmesg).
Falling back to a sane timesource now.
Serial: 8250/16550 driver $Revision: 1.90 $ 14 ports, IRQ sharing disabled
parport: PnPBIOS parport detected.
parport0: PC-style at 0x378, irq 7 [PCSPP]
NET: Registered protocol family 23
via-rhine.c:v1.10-LK1.1.19-2.5  July-12-2003  Written by Donald Becker
   http://www.scyld.com/network/via-rhine.html
eth1: VIA VT6102 Rhine-II at 0xd0005000, 00:c0:9f:34:de:c1, IRQ 4.
eth1: MII PHY found at address 1, status 0x7869 advertising 05e1 Link 45e1.
Via 686a/8233/8235 audio driver 1.9.1-ac4-2.5
via82cxxx: Six channel audio available
PCI: Setting latency timer of device 0000:00:11.5 to 64
ac97_codec: AC97 Audio codec, id: ALG64 (Unknown)
via82cxxx: board #1 at 0x1400, IRQ 9
NET: Registered protocol family 17
NET: Registered protocol family 10
Disabled Privacy Extensions on device c0341b80(lo)
IPv6 over IPv4 tunneling driver
usb 2-1: new low speed USB device using address 3
input: USB HID v1.10 Mouse [Logitech Optical USB Mouse] on 
usb-0000:00:10.1-1
ext3: No journal on filesystem on hda10
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
FAT: Unrecognized mount option "uid=knoppix" or missing value
FAT: Unrecognized mount option "uid=knoppix" or missing value
FAT: Unrecognized mount option "uid=knoppix" or missing value
eth1: Setting full-duplex based on MII #1 link partner capability of 45e1.
cs: IO port probe 0x0c00-0x0cff: clean.
cs: IO port probe 0x0820-0x08ff: clean.
cs: IO port probe 0x0800-0x080f: clean.
cs: IO port probe 0x0100-0x04ff: excluding 0x3c0-0x3df
cs: IO port probe 0x0a00-0x0aff: clean.
eth1: no IPv6 routers present
device-mapper: 4.1.0-ioctl (2003-12-10) initialised: dm@uk.sistina.com
ttyS0: LSR safety check engaged!
ttyS0: LSR safety check engaged!
ttyS1: LSR safety check engaged!
ttyS1: LSR safety check engaged!
ACPI: AC Adapter [ACAD] (on-line)
ACPI: Battery Slot [BAT1] (battery absent)
ACPI: Power Button (FF) [PWRF]
ACPI: Sleep Button (CM) [SLPB]
ACPI: Lid Switch [LID]
ACPI: Thermal Zone [THRM] (60 C)
lp0: using parport0 (interrupt-driven).
lp0: console ready
NET: Registered protocol family 4
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apm: overridden by ACPI.
atkbd.c: Unknown key released (translated set 2, code 0x7a on 
isa0060/serio0).
atkbd.c: This is an XFree86 bug. It shouldn't access hardware directly.
atkbd.c: Unknown key released (translated set 2, code 0x7a on 
isa0060/serio0).
atkbd.c: This is an XFree86 bug. It shouldn't access hardware directly.
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apm: overridden by ACPI.
eth1: Setting full-duplex based on MII #1 link partner capability of 45e1.
eth1: no IPv6 routers present
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apm: overridden by ACPI.
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
apm: overridden by ACPI.
