From: beppuz@freemail.it
Subject: Bios PST tables no more recognized after 2.6.8.1
Date: 11 Jul 2005 06:05:05 -0000
Message-ID: <20050711060505.21067.qmail@mail.supereva.it>
Reply-To: beppuz@freemail.it
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk


Hi all,



I'm having a problem with my laptop (Acer Aspire 1356 LCi) whith an

Athlon M 2800+ CPU.

I installed kernel 2.6.x series since 2.6.3, and powernow has always run

smoothly. With kernels > 2.6.8.1 (the one I'm currently running) Bios

PST tables aren't recognized any more and even ACPI seems not to

handle correctly CPU frequencies.



Even if I'm not a kernel hacker, I'd like to help solving this issue: so

tell me what I should try in order to better understand it.



Here is the output of dmesg:



======2.6.8.1==================

Linux version 2.6.8.1 (root@toanokama) (gcc version 3.3.4 (Debian

1:3.3.4-13)) #1 Sun Jan 9 23:06:38 CET 2005 BIOS-provided physical RAM

map: BIOS-e820: 0000000000000000 - 000000000009f800 (usable)

 BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)

 BIOS-e820: 00000000000d8000 - 0000000000100000 (reserved)

 BIOS-e820: 0000000000100000 - 000000001fef0000 (usable)

 BIOS-e820: 000000001fef0000 - 000000001fefb000 (ACPI data)

 BIOS-e820: 000000001fefb000 - 000000001ff00000 (ACPI NVS)

 BIOS-e820: 000000001ff00000 - 0000000020000000 (reserved)

 BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)

510MB LOWMEM available.

On node 0 totalpages: 130800

  DMA zone: 4096 pages, LIFO batch:1

  Normal zone: 126704 pages, LIFO batch:16

  HighMem zone: 0 pages, LIFO batch:1

DMI 2.3 present.

ACPI: RSDP (v000 PTLTD                                     ) @

0x000f6890 ACPI: RSDT (v001 PTLTD    RSDT   0x06040000  LTP 0x00000000)

@ 0x1fef5b3e ACPI: FADT (v001 KN400  PTLTW    0x06040000 PTL_

0x000f4240) @ 0x1fefae74 ACPI: SSDT (v001 PTLTD  POWERNOW 0x06040000 

LTP 0x00000001) @ 0x1fefaee8 ACPI: DSDT (v001  VIA   PTL_ACPI 0x06040000

MSFT 0x0100000e) @ 0x00000000 Built 1 zonelists

Kernel command line: root=/dev/hda7 ro vga=791 

Local APIC disabled by BIOS -- reenabling.

Found and enabled local APIC!

Initializing CPU#0

PID hash table entries: 2048 (order 11: 16384 bytes)

Detected 796.538 MHz processor.

Using tsc for high-res timesource

Console: colour dummy device 80x25

Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)

Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)

Memory: 513984k/523200k available (2539k kernel code, 8444k reserved,

970k data, 160k init, 0k highmem) Checking if this processor honours the

WP bit even in supervisor mode... Ok. Calibrating delay loop... 1564.67

BogoMIPS Mount-cache hash table entries: 512 (order: 0, 4096 bytes)

CPU: After generic identify, caps: 0383fbff c1cbfbff 00000000 00000000

CPU: After vendor identify, caps:  0383fbff c1cbfbff 00000000 00000000

CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)

CPU: L2 Cache: 512K (64 bytes/line)

CPU: After all inits, caps:        0383fbff c1cbfbff 00000000 00000020

Intel machine check architecture supported.

Intel machine check reporting enabled on CPU#0.

CPU: AMD Mobile AMD Athlon(tm) XP 2800+ stepping 00

Enabling fast FPU save and restore... done.

Enabling unmasked SIMD FPU exception support... done.

Checking 'hlt' instruction... OK.

enabled ExtINT on CPU#0

ESR value before enabling vector: 00000000

ESR value after enabling vector: 00000000

Using local APIC timer interrupts.

calibrating APIC timer ...

...... CPU clock speed is 795.0955 MHz.

...... host bus clock speed is 265.0318 MHz.

NET: Registered protocol family 16

PCI: PCI BIOS revision 2.10 entry at 0xfd65c, last bus=1

PCI: Using configuration type 1

mtrr: v2.0 (20020519)

ACPI: Subsystem revision 20040326

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

PnPBIOS: Found PnP BIOS installation structure at 0xc00f68d0

PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0xb5cd, dseg 0x400

spurious 8259A interrupt: IRQ7.

pnp: 00:09: ioport range 0xfe00-0xfe01 has been reserved

pnp: 00:0c: ioport range 0x4d0-0x4d1 has been reserved

pnp: 00:0c: ioport range 0x4000-0x407f has been reserved

pnp: 00:0c: ioport range 0x8100-0x810f has been reserved

PnPBIOS: 18 nodes reported by PnP BIOS; 18 recorded by driver

Linux Kernel Card Services

  options:  [pci] [cardbus] [pm]

PCI: Using ACPI for IRQ routing

ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 5

ACPI: PCI interrupt 0000:00:07.0[A] -> GSI 5 (level, low) -> IRQ 5

ACPI: PCI interrupt 0000:00:08.0[A] -> GSI 5 (level, low) -> IRQ 5

ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 9

ACPI: PCI interrupt 0000:00:09.0[A] -> GSI 9 (level, low) -> IRQ 9

ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 4

ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 4 (level, low) -> IRQ 4

ACPI: PCI interrupt 0000:00:10.1[B] -> GSI 5 (level, low) -> IRQ 5

ACPI: PCI interrupt 0000:00:10.2[C] -> GSI 9 (level, low) -> IRQ 9

ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11

ACPI: PCI interrupt 0000:00:10.3[D] -> GSI 11 (level, low) -> IRQ 11

ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 4 (level, low) -> IRQ 4

ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 9 (level, low) -> IRQ 9

ACPI: PCI interrupt 0000:00:11.6[C] -> GSI 9 (level, low) -> IRQ 9

ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 4 (level, low) -> IRQ 4

ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 4 (level, low) -> IRQ 4

vesafb: framebuffer at 0xd8000000, mapped to 0xe080f000, size 3072k

vesafb: mode is 1024x768x16, linelength=2048, pages=41

vesafb: protected mode interface info at c000:5462

vesafb: scrolling: redraw

vesafb: directcolor: size=0:5:6:5, shift=0:11:5:0

fb0: VESA VGA frame buffer device

Machine check exception polling timer started.

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)

udf: registering filesystem

Initializing Cryptographic API

PCI: Via IRQ fixup for 0000:00:10.0, from 0 to 4

PCI: Via IRQ fixup for 0000:00:10.1, from 0 to 5

PCI: Via IRQ fixup for 0000:00:10.2, from 0 to 9

ACPI: AC Adapter [ACAD] (on-line)

ACPI: Battery Slot [BAT1] (battery absent)

ACPI: Power Button (FF) [PWRF]

ACPI: Sleep Button (CM) [SLPB]

ACPI: Lid Switch [LID]

ACPI: Processor [CPU0] (supports C1 C2)

ACPI: Thermal Zone [THRM] (36 C)

Console: switching to colour frame buffer device 128x48

Real Time Clock Driver v1.12

Linux agpgart interface v0.100 (c) Dave Jones

Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing

disabled loop: loaded (max 8 devices)

via-rhine.c:v1.10-LK1.1.20-2.6 May-23-2004 Written by Donald Becker

ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 4 (level, low) -> IRQ 4

eth0: VIA Rhine II at 0x1c00, 00:c0:9f:2c:8e:cc, IRQ 4.

eth0: MII PHY found at address 1, status 0x7869 advertising 05e1 Link

45e1. PPP generic driver version 2.4.2

Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2

ide: Assuming 33MHz system bus speed for PIO modes; override with

idebus=xx VP_IDE: IDE controller at PCI slot 0000:00:11.1

ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 4 (level, low) -> IRQ 4

VP_IDE: chipset revision 6

VP_IDE: not 100% native mode: will probe irqs later

VP_IDE: VIA vt8235 (rev 00) IDE UDMA133 controller on pci0000:00:11.1

    ide0: BM-DMA at 0x2060-0x2067, BIOS settings: hda:DMA, hdb:pio

    ide1: BM-DMA at 0x2068-0x206f, BIOS settings: hdc:DMA, hdd:pio

hda: ST94011A, ATA DISK drive

Using anticipatory io scheduler

ide0 at 0x1f0-0x1f7,0x3f6 on irq 14

hdc: Slimtype COMBO LSC-24082K, ATAPI CD/DVD-ROM drive

ide1 at 0x170-0x177,0x376 on irq 15

hda: max request size: 1024KiB

hda: 78140160 sectors (40007 MB) w/2048KiB Cache, CHS=16383/255/63

 hda: hda1 hda2 hda3 < hda5 hda6 hda7 hda8 hda9 > hda4

hdc: ATAPI 24X DVD-ROM CD-R/RW drive, 2048kB Cache

Uniform CD-ROM driver Revision: 3.20

ACPI: PCI interrupt 0000:00:07.0[A] -> GSI 5 (level, low) -> IRQ 5

Yenta: CardBus bridge found at 0000:00:07.0 [1025:0033]

Yenta: Enabling burst memory read transactions

Yenta: Using CSCINT to route CSC interrupts to PCI

Yenta: Routing CardBus interrupts to PCI

Yenta TI: socket 0000:00:07.0, mfunc 0x01201212, devctl 0x64

Yenta: ISA IRQ mask 0x0088, PCI irq 5

Socket status: 30000006

mice: PS/2 mouse device common for all mice

serio: i8042 AUX port at 0x60,0x64 irq 12

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

Advanced Linux Sound Architecture Driver Version 1.0.4 (Mon May 17

14:31:44 2004 UTC). via82xx: Assuming DXS channels with 48k fixed sample

rate.         Please try dxs_support=1 or dxs_support=4 option

         and report if it works on your machine.

ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 9 (level, low) -> IRQ 9

PCI: Setting latency timer of device 0000:00:11.5 to 64

ALSA device list:

  #0: VIA 8235 at 0x1400, irq 9

NET: Registered protocol family 2

IP: routing cache hash table of 4096 buckets, 32Kbytes

TCP: Hash tables configured (established 32768 bind 65536)

Initializing IPsec netlink socket

NET: Registered protocol family 1

NET: Registered protocol family 17

NET: Registered protocol family 15

ReiserFS: hda7: found reiserfs format "3.6" with standard journal

ReiserFS: hda7: using ordered data mode

ReiserFS: hda7: journal params: device hda7, size 8192, journal first

block 18, max trans len 1024, max batch 900, max commit age 30, max

trans age 30 ReiserFS: hda7: checking transaction log (hda7)

ReiserFS: hda7: Using r5 hash to sort names

VFS: Mounted root (reiserfs filesystem) readonly.

Freeing unused kernel memory: 160k freed

Adding 779112k swap on /dev/hda5.  Priority:-1 extents:1

usbcore: registered new driver usbfs

usbcore: registered new driver hub

USB Universal Host Controller Interface driver v2.2

ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 4 (level, low) -> IRQ 4

uhci_hcd 0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1

Controller uhci_hcd 0000:00:10.0: irq 4, io base 00002000

uhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 1

hub 1-0:1.0: USB hub found

hub 1-0:1.0: 2 ports detected

ACPI: PCI interrupt 0000:00:10.1[B] -> GSI 5 (level, low) -> IRQ 5

uhci_hcd 0000:00:10.1: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1

Controller (#2) uhci_hcd 0000:00:10.1: irq 5, io base 00002020

uhci_hcd 0000:00:10.1: new USB bus registered, assigned bus number 2

hub 2-0:1.0: USB hub found

hub 2-0:1.0: 2 ports detected

ACPI: PCI interrupt 0000:00:10.2[C] -> GSI 9 (level, low) -> IRQ 9

uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1

Controller (#3) uhci_hcd 0000:00:10.2: irq 9, io base 00002040

uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 3

hub 3-0:1.0: USB hub found

hub 3-0:1.0: 2 ports detected

usbcore: registered new driver usblp

drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver

powernow: PowerNOW! Technology present. Can scale: frequency and

voltage. powernow: FSB: 132.756 MHz

warning: process `update' used the obsolete bdflush system call

Fix your initscripts?

powernow: Found PSB header at c00f06c0

powernow: Table version: 0x12

powernow: Flags: 0x0 (Mobile voltage regulator)

powernow: Settling Time: 100 microseconds.

powernow: Has 8 PST tables. (Only dumping ones relevant to this CPU).

powernow: PST:3 (@c00f0716)

powernow:  cpuid: 0x7a0        fsb: 133        maxFID: 0x1a        startvid: 0x7

powernow:    FID: 0x0 (11.0x [1460MHz])        VID: 0xe (1.300V)

powernow:    FID: 0x1 (11.5x [1526MHz])        VID: 0xd (1.350V)

powernow:    FID: 0x2 (12.0x [1593MHz])        VID: 0xc (1.400V)

powernow:    FID: 0x3 (12.5x [1659MHz])        VID: 0xb (1.450V)

powernow:    FID: 0x14 (13.0x [1725MHz])        VID: 0xa (1.500V)

powernow:    FID: 0x15 (13.5x [1792MHz])        VID: 0x9 (1.550V)

powernow:    FID: 0x18 (15.0x [1991MHz])        VID: 0x8 (1.600V)

powernow:    FID: 0x1a (16.0x [2124MHz])        VID: 0x7 (1.650V)

powernow: SGTC: 13333

powernow: Minimum speed 1460 MHz. Maximum speed 2124 MHz.

ttyS1: LSR safety check engaged!

ttyS1: LSR safety check engaged!

ReiserFS: hda8: found reiserfs format "3.6" with standard journal

ReiserFS: hda8: using ordered data mode

ReiserFS: hda8: journal params: device hda8, size 8192, journal first

block 18, max trans len 1024, max batch 900, max commit age 30, max

trans age 30 ReiserFS: hda8: checking transaction log (hda8)

ReiserFS: hda8: replayed 112 transactions in 14 seconds

ReiserFS: hda8: Using r5 hash to sort names

eth0: Setting full-duplex based on MII #1 link partner capability of

45e1. slamr: module license 'Smart Link Ltd.' taints kernel.

slamr: SmartLink AMRMO modem.

slamr: probe 1106:3068 VIA3058 card...

ACPI: PCI interrupt 0000:00:11.6[C] -> GSI 9 (level, low) -> IRQ 9

PCI: Setting latency timer of device 0000:00:11.6 to 64

slamr: mc97 codec is 4c

slamr: slamr0 is VIA3058 card.

NET: Registered protocol family 4

Installing knfsd (copyright (C) 1996 okir@monad.swb.de).

agpgart: Detected VIA KM400/KM400A chipset

agpgart: Maximum main memory to use for agp memory: 438M

agpgart: AGP aperture is 256M @ 0xe0000000

ohci1394: $Rev: 1223 $ Ben Collins <bcollins@debian.org>

ACPI: PCI interrupt 0000:00:08.0[A] -> GSI 5 (level, low) -> IRQ 5

ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[5] 

MMIO=[d0004000-d00047ff]  Max Packet=[2048] ieee1394: Host added:

ID:BUS[0-00:1023]  GUID[00c09f00000f6957] parport: PnPBIOS parport

detected. parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]

lp0: using parport0 (interrupt-driven).

mtrr: 0xd8000000,0x4000000 overlaps existing 0xd8000000,0x200000

ISO 9660 Extensions: Microsoft Joliet Level 3

ISO 9660 Extensions: RRIP_1991A

Warning: CPU frequency out of sync: cpufreq and timing core thinks of

2124096, is 1792206 kHz. hdc: media error (bad sector): status=0x51 {

DriveReady SeekComplete Error } hdc: media error (bad sector):

error=0x30 hdc: media error (bad sector): status=0x51 { DriveReady

SeekComplete Error } hdc: media error (bad sector): error=0x30

hdc: media error (bad sector): status=0x51 { DriveReady SeekComplete

Error } hdc: media error (bad sector): error=0x30

hdc: media error (bad sector): status=0x51 { DriveReady SeekComplete

Error } hdc: media error (bad sector): error=0x30

end_request: I/O error, dev hdc, sector 635544

Buffer I/O error on device hdc, logical block 158886

hdc: media error (bad sector): status=0x51 { DriveReady SeekComplete

Error } hdc: media error (bad sector): error=0x30

hdc: media error (bad sector): status=0x51 { DriveReady SeekComplete

Error } hdc: media error (bad sector): error=0x30

end_request: I/O error, dev hdc, sector 635880

Buffer I/O error on device hdc, logical block 158970

hdc: media error (bad sector): status=0x51 { DriveReady SeekComplete

Error } hdc: media error (bad sector): error=0x30

end_request: I/O error, dev hdc, sector 635544

Buffer I/O error on device hdc, logical block 158886

ISO 9660 Extensions: Microsoft Joliet Level 3

ISO 9660 Extensions: RRIP_1991A

Warning: CPU frequency out of sync: cpufreq and timing core thinks of

2124096, is 1792206 kHz. Warning: CPU frequency out of sync: cpufreq and

timing core thinks of 2124096, is 1792206 kHz. 



========2.6.11=================

Linux version 2.6.11 (root@toanokama) (gcc version 3.3.5 (Debian

1:3.3.5-13)) #1 Mon Jul 4 08:57:36 CEST 2005 BIOS-provided physical RAM

map: BIOS-e820: 0000000000000000 - 000000000009f800 (usable)

 BIOS-e820: 000000000009f800 - 00000000000a0000 (reserved)

 BIOS-e820: 00000000000d8000 - 0000000000100000 (reserved)

 BIOS-e820: 0000000000100000 - 000000001fef0000 (usable)

 BIOS-e820: 000000001fef0000 - 000000001fefb000 (ACPI data)

 BIOS-e820: 000000001fefb000 - 000000001ff00000 (ACPI NVS)

 BIOS-e820: 000000001ff00000 - 0000000020000000 (reserved)

 BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)

510MB LOWMEM available.

On node 0 totalpages: 130800

  DMA zone: 4096 pages, LIFO batch:1

  Normal zone: 126704 pages, LIFO batch:16

  HighMem zone: 0 pages, LIFO batch:1

DMI 2.3 present.

ACPI: RSDP (v000 PTLTD                                 ) @ 0x000f6890

ACPI: RSDT (v001 PTLTD    RSDT   0x06040000  LTP 0x00000000) @

0x1fef5b3e ACPI: FADT (v001 KN400  PTLTW    0x06040000 PTL_ 0x000f4240)

@ 0x1fefae74 ACPI: SSDT (v001 PTLTD  POWERNOW 0x06040000  LTP

0x00000001) @ 0x1fefaee8 ACPI: DSDT (v001  VIA   PTL_ACPI 0x06040000

MSFT 0x0100000e) @ 0x00000000 Allocating PCI resources starting at

20000000 (gap: 20000000:dffe0000) Built 1 zonelists

Kernel command line: root=/dev/hda7 ro vga=791 

Local APIC disabled by BIOS -- you can enable it with "lapic"

mapped APIC to ffffd000 (01400000)

Initializing CPU#0

PID hash table entries: 2048 (order: 11, 32768 bytes)

Detected 796.394 MHz processor.

Using tsc for high-res timesource

Console: colour dummy device 80x25

Dentry cache hash table entries: 65536 (order: 6, 262144 bytes)

Inode-cache hash table entries: 32768 (order: 5, 131072 bytes)

Memory: 514152k/523200k available (2625k kernel code, 8488k reserved,

959k data, 168k init, 0k highmem) Checking if this processor honours the

WP bit even in supervisor mode... Ok. Calibrating delay loop... 1564.67

BogoMIPS (lpj=782336) Mount-cache hash table entries: 512 (order: 0,

4096 bytes) CPU: After generic identify, caps: 0383f9ff c1cbf9ff

00000000 00000000 00000000 00000000 00000000 CPU: After vendor identify,

caps: 0383f9ff c1cbf9ff 00000000 00000000 00000000 00000000 00000000

CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line) CPU:

L2 Cache: 512K (64 bytes/line) CPU: After all inits, caps: 0383f9ff

c1cbf9ff 00000000 00000020 00000000 00000000 00000000 Intel machine

check architecture supported. Intel machine check reporting enabled on

CPU#0. CPU: AMD Mobile AMD Athlon(tm) XP 2800+ stepping 00

Enabling fast FPU save and restore... done.

Enabling unmasked SIMD FPU exception support... done.

Checking 'hlt' instruction... OK.

ACPI: setting ELCR to 0400 (from 0a30)

NET: Registered protocol family 16

PCI: PCI BIOS revision 2.10 entry at 0xfd65c, last bus=1

PCI: Using configuration type 1

mtrr: v2.0 (20020519)

ACPI: Subsystem revision 20050211

ACPI: Interpreter enabled

ACPI: Using PIC for interrupt routing

ACPI: PCI Root Bridge [PCI0] (00:00)

PCI: Probing PCI hardware (bus 00)

PCI: Via IRQ fixup

ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]

ACPI: PCI Interrupt Link [LNKA] (IRQs *4)

ACPI: PCI Interrupt Link [LNKB] (IRQs *5)

ACPI: PCI Interrupt Link [LNKC] (IRQs *9)

ACPI: PCI Interrupt Link [LNKD] (IRQs *11)

ACPI: Embedded Controller [EC0] (gpe 1)

Linux Plug and Play Support v0.97 (c) Adam Belay

pnp: PnP ACPI init

pnp: PnP ACPI: found 11 devices

PnPBIOS: Disabled by ACPI PNP

PCI: Using ACPI for IRQ routing

** PCI interrupts are no longer routed automatically.  If this

** causes a device to stop working, it is probably because the

** driver failed to call pci_enable_device().  As a temporary

** workaround, the "pci=routeirq" argument restores the old

** behavior.  If this argument makes the device work again,

** please email the output of "lspci" to bjorn.helgaas@hp.com

** so I can fix the driver.

pnp: 00:05: ioport range 0x4d0-0x4d1 has been reserved

pnp: 00:05: ioport range 0xfe10-0xfe11 has been reserved

pnp: 00:05: ioport range 0x600-0x60f has been reserved

pnp: 00:05: ioport range 0xfe00-0xfe00 has been reserved

pnp: 00:05: ioport range 0x4000-0x407f could not be reserved

Machine check exception polling timer started.

VFS: Disk quotas dquot_6.5.1

Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)

Initializing Cryptographic API

vesafb: framebuffer at 0xd8000000, mapped to 0xe0880000, using 3072k,

total 65536k vesafb: mode is 1024x768x16, linelength=2048, pages=41

vesafb: protected mode interface info at c000:5462

vesafb: scrolling: redraw

vesafb: Truecolor: size=0:5:6:5, shift=0:11:5:0

Console: switching to colour frame buffer device 128x48

fb0: VESA VGA frame buffer device

ACPI: AC Adapter [ACAD] (on-line)

ACPI: Battery Slot [BAT1] (battery absent)

ACPI: Power Button (FF) [PWRF]

ACPI: Sleep Button (CM) [SLPB]

ACPI: Lid Switch [LID]

ACPI: CPU0 (power states: C1[C1] C2[C2])

ACPI: Thermal Zone [THRM] (57 C)

Real Time Clock Driver v1.12

Linux agpgart interface v0.100 (c) Dave Jones

serio: i8042 AUX port at 0x60,0x64 irq 12

serio: i8042 KBD port at 0x60,0x64 irq 1

Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing

disabled io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered

loop: loaded (max 8 devices)

via-rhine.c:v1.10-LK1.2.0-2.6 June-10-2004 Written by Donald Becker

ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 4

PCI: setting IRQ 4 as level-triggered

ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 4 (level, low) -> IRQ 4

eth0: VIA Rhine II at 0x11c00, 00:c0:9f:2c:8e:cc, IRQ 4.

eth0: MII PHY found at address 1, status 0x7869 advertising 05e1 Link

45e1. PPP generic driver version 2.4.2

Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2

ide: Assuming 33MHz system bus speed for PIO modes; override with

idebus=xx VP_IDE: IDE controller at PCI slot 0000:00:11.1

ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 4 (level, low) -> IRQ 4

VP_IDE: chipset revision 6

VP_IDE: not 100% native mode: will probe irqs later

VP_IDE: VIA vt8235 (rev 00) IDE UDMA133 controller on pci0000:00:11.1

    ide0: BM-DMA at 0x2060-0x2067, BIOS settings: hda:DMA, hdb:pio

    ide1: BM-DMA at 0x2068-0x206f, BIOS settings: hdc:DMA, hdd:pio

Probing IDE interface ide0...

hda: ST94011A, ATA DISK drive

ide0 at 0x1f0-0x1f7,0x3f6 on irq 14

Probing IDE interface ide1...

hdc: Slimtype COMBO LSC-24082K, ATAPI CD/DVD-ROM drive

ide1 at 0x170-0x177,0x376 on irq 15

Probing IDE interface ide2...

Probing IDE interface ide3...

Probing IDE interface ide4...

Probing IDE interface ide5...

hda: max request size: 1024KiB

hda: 78140160 sectors (40007 MB) w/2048KiB Cache, CHS=16383/255/63

hda: cache flushes supported

 hda: hda1 hda2 hda3 < hda5 hda6 hda7 hda8 hda9 > hda4

hdc: ATAPI 24X DVD-ROM CD-R/RW drive, 2048kB Cache

Uniform CD-ROM driver Revision: 3.20

mice: PS/2 mouse device common for all mice

input: AT Translated Set 2 keyboard on isa0060/serio0

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

Advanced Linux Sound Architecture Driver Version 1.0.8 (Thu Jan 13

09:39:32 2005 UTC). ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 9

PCI: setting IRQ 9 as level-triggered

ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 9 (level, low) -> IRQ 9

PCI: Setting latency timer of device 0000:00:11.5 to 64

ALSA device list:

  #0: VIA 8235 with ALC202 at 0x1400, irq 9

NET: Registered protocol family 2

IP: routing cache hash table of 4096 buckets, 32Kbytes

TCP established hash table entries: 16384 (order: 5, 131072 bytes)

TCP bind hash table entries: 16384 (order: 4, 65536 bytes)

TCP: Hash tables configured (established 16384 bind 16384)

Initializing IPsec netlink socket

NET: Registered protocol family 1

NET: Registered protocol family 17

NET: Registered protocol family 15

ReiserFS: hda7: found reiserfs format "3.6" with standard journal

ReiserFS: hda7: using ordered data mode

ReiserFS: hda7: journal params: device hda7, size 8192, journal first

block 18, max trans len 1024, max batch 900, max commit age 30, max

trans age 30 ReiserFS: hda7: checking transaction log (hda7)

ReiserFS: hda7: Using r5 hash to sort names

VFS: Mounted root (reiserfs filesystem) readonly.

Freeing unused kernel memory: 168k freed

Adding 779112k swap on /dev/hda5.  Priority:-1 extents:1

usbcore: registered new driver usbfs

usbcore: registered new driver hub

USB Universal Host Controller Interface driver v2.2

ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 4 (level, low) -> IRQ 4

uhci_hcd 0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1

Controller uhci_hcd 0000:00:10.0: irq 4, io base 0x2000

uhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 1

hub 1-0:1.0: USB hub found

hub 1-0:1.0: 2 ports detected

ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 5

PCI: setting IRQ 5 as level-triggered

ACPI: PCI interrupt 0000:00:10.1[B] -> GSI 5 (level, low) -> IRQ 5

uhci_hcd 0000:00:10.1: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1

Controller (#2) uhci_hcd 0000:00:10.1: irq 5, io base 0x2020

uhci_hcd 0000:00:10.1: new USB bus registered, assigned bus number 2

hub 2-0:1.0: USB hub found

hub 2-0:1.0: 2 ports detected

ACPI: PCI interrupt 0000:00:10.2[C] -> GSI 9 (level, low) -> IRQ 9

uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1

Controller (#3) uhci_hcd 0000:00:10.2: irq 9, io base 0x2040

uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 3

hub 3-0:1.0: USB hub found

hub 3-0:1.0: 2 ports detected

warning: process `update' used the obsolete bdflush system call

Fix your initscripts?

usbcore: registered new driver usblp

drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver

powernow: PowerNOW! Technology present. Can scale: frequency and

voltage. powernow: No PST tables match this cpuid (0x7a0)

powernow: This is indicative of a broken BIOS.

powernow: Trying ACPI perflib

spurious 8259A interrupt: IRQ7.

powernow: Minimum speed 298 MHz. Maximum speed 796 MHz.

ttyS1: LSR safety check engaged!

ttyS1: LSR safety check engaged!

ReiserFS: hda8: found reiserfs format "3.6" with standard journal

ReiserFS: hda8: using ordered data mode

ReiserFS: hda8: journal params: device hda8, size 8192, journal first

block 18, max trans len 1024, max batch 900, max commit age 30, max

trans age 30 ReiserFS: hda8: checking transaction log (hda8)

ReiserFS: hda8: replayed 19 transactions in 1 seconds

ReiserFS: hda8: Using r5 hash to sort names

eth0: link up, 100Mbps, full-duplex, lpa 0x45E1

ACPI: Video Device [VGA] (multi-head: yes  rom: no  post: no)

NET: Registered protocol family 4

Installing knfsd (copyright (C) 1996 okir@monad.swb.de).

agpgart: Detected VIA KM400/KM400A chipset

agpgart: Maximum main memory to use for agp memory: 438M

agpgart: AGP aperture is 256M @ 0xe0000000

ohci1394: $Rev: 1223 $ Ben Collins <bcollins@debian.org>

ACPI: PCI interrupt 0000:00:08.0[A] -> GSI 5 (level, low) -> IRQ 5

ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[5] 

MMIO=[d0004000-d00047ff]  Max Packet=[2048] ieee1394: Host added:

ID:BUS[0-00:1023]  GUID[00c09f00000f6957] parport: PnPBIOS parport

detected. parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]

lp0: using parport0 (interrupt-driven).



========End==============



TIA,



Giuseppe

---------------------------------------------------------------
Scegli il tuo dominio preferito e attiva la tua email! Da oggi
l'eMail di superEva e' ancora piu' veloce e ricca di funzioni!
http://webmail.supereva.it/new/
---------------------------------------------------------------
