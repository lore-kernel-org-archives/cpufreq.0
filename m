From: GoatZilla <goatzilla@gmail.com>
Subject: Re: Manual PST settings for "unrecognized CPUs"
Date: Sun, 22 Aug 2004 02:12:53 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <39e34848040822001251ddd0be@mail.gmail.com>
References: <39e3484804081616133c2765ce@mail.gmail.com>
	<20040817062634.6C2404BE94@nathan.muc.de>
	<39e348480408171130537c34e6@mail.gmail.com>
	<20040819001654.32D0D4BE98@nathan.muc.de>
Reply-To: GoatZilla <goatzilla@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----=_Part_22_22629842.1093158773750"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040819001654.32D0D4BE98@nathan.muc.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk

------=_Part_22_22629842.1093158773750
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

OK, I just installed Linux on the machine and patched 2.6.8
successfully, but I'm getting a a "No such device" because the
powernow_decode_bios routine never finds the "PSB Header".  I have no
idea what a PSB header even is.

Do I need to fake the PSB header information as well?  Or is there a
simpler way around this?


I also attached the dump of x86info.  I'm not sure why it's telling me
FID changes won't work; it's looking at some FIDC bit in an MSR... 
This wouldn't affect cpufreq would it?

------=_Part_22_22629842.1093158773750
Content-Type: text/plain; name="dmesg.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="dmesg.txt"

Linux version 2.6.8 (root@broccoli) (gcc version 3.3.4 (Debian 1:3.3.4-6sar=
ge1)) #1 Sat Aug 21 19:37:58 CDT 2004
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 00000000000a0000 (usable)
 BIOS-e820: 00000000000f0000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 0000000007ff0000 (usable)
 BIOS-e820: 0000000007ff0000 - 0000000007ff3000 (ACPI NVS)
 BIOS-e820: 0000000007ff3000 - 0000000008000000 (ACPI data)
 BIOS-e820: 00000000ffff0000 - 0000000100000000 (reserved)
127MB LOWMEM available.
On node 0 totalpages: 32752
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 28656 pages, LIFO batch:6
  HighMem zone: 0 pages, LIFO batch:1
DMI 2.2 present.
ACPI: RSDP (v000 VIA694                                    ) @ 0x000f6a20
ACPI: RSDT (v001 VIA694 AWRDACPI 0x42302e31 AWRD 0x00000000) @ 0x07ff3000
ACPI: FADT (v001 VIA694 AWRDACPI 0x42302e31 AWRD 0x00000000) @ 0x07ff3040
ACPI: DSDT (v001 VIA694 AWRDACPI 0x00001000 MSFT 0x0100000e) @ 0x00000000
ACPI: PM-Timer IO Port: 0x4008
Built 1 zonelists
Kernel command line: root=3D/dev/hda2 ro=20
Local APIC disabled by BIOS -- reenabling.
Found and enabled local APIC!
Initializing CPU#0
PID hash table entries: 512 (order 9: 4096 bytes)
Detected 1347.875 MHz processor.
Using pmtmr for high-res timesource
Console: colour VGA+ 80x25
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Memory: 122532k/131008k available (1321k kernel code, 7932k reserved, 725k =
data, 204k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok=
.
Calibrating delay loop... 2670.59 BogoMIPS
Security Scaffold v1.0.0 initialized
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU: After generic identify, caps: 0383fbff c1c3fbff 00000000 00000000
CPU: After vendor identify, caps:  0383fbff c1c3fbff 00000000 00000000
CPU: CLK_CTL MSR was 60031223. Reprogramming to 20031223
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 64K (64 bytes/line)
CPU: After all inits, caps:        0383fbff c1c3fbff 00000000 00000020
CPU: AMD Unknown CPU Typ stepping 01
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
enabled ExtINT on CPU#0
ESR value before enabling vector: 00000000
ESR value after enabling vector: 00000000
Using local APIC timer interrupts.
calibrating APIC timer ...
..... CPU clock speed is 1347.0528 MHz.
..... host bus clock speed is 199.0633 MHz.
checking if image is initramfs...it isn't (ungzip failed); looks like an in=
itrd
Freeing initrd memory: 4232k freed
NET: Registered protocol family 16
EISA bus registered
PCI: PCI BIOS revision 2.10 entry at 0xfb3e0, last bus=3D1
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040326
ACPI: IRQ9 SCI: Level Trigger.
spurious 8259A interrupt: IRQ7.
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 *5 6 7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7 10 11 *12 14 15)
Linux Plug and Play Support v0.97 (c) Adam Belay
PnPBIOS: Scanning system for PnP BIOS support...
PnPBIOS: Found PnP BIOS installation structure at 0xc00fbef0
PnPBIOS: PnP BIOS version 1.0, entry 0xf0000:0xbf20, dseg 0xf0000
PnPBIOS: 13 nodes reported by PnP BIOS; 13 recorded by driver
PCI: Using ACPI for IRQ routing
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 5
ACPI: PCI interrupt 0000:00:10.1[B] -> GSI 5 (level, low) -> IRQ 5
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 10
ACPI: PCI interrupt 0000:00:10.2[C] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 12
ACPI: PCI interrupt 0000:00:10.3[D] -> GSI 12 (level, low) -> IRQ 12
ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 11 (level, low) -> IRQ 11
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x0
Initializing Cryptographic API
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Serial: 8250/16550 driver $Revision: 1.90 $ 54 ports, IRQ sharing enabled
ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
input: AT Translated Set 2 keyboard on isa0060/serio0
EISA: Probing bus 0 at eisa0
NET: Registered protocol family 2
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 8192 bind 16384)
NET: Registered protocol family 8
NET: Registered protocol family 20
ACPI: (supports S0 S1 S4 S5)
RAMDISK: cramfs filesystem found at block 0
RAMDISK: Loading 4232 blocks [1 disk] into ram disk... |=08/=08-=08\=08|=08=
/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=
=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08=
-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=
=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08=
\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=
=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08=
|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=
=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08=
/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=
=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08=
-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=
=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08=
\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=
=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08|=08/=08-=08\=08=
|=08done.
VFS: Mounted root (cramfs filesystem) readonly.
Freeing unused kernel memory: 204k freed
NET: Registered protocol family 1
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=3D=
xx
VP_IDE: IDE controller at PCI slot 0000:00:11.1
ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 11 (level, low) -> IRQ 11
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
VP_IDE: VIA vt8235 (rev 00) IDE UDMA133 controller on pci0000:00:11.1
    ide0: BM-DMA at 0xdc00-0xdc07, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0xdc08-0xdc0f, BIOS settings: hdc:pio, hdd:pio
hda: Maxtor 6Y250P0, ATA DISK drive
hdb: HL-DT-STDVD-ROM GDR8161B, ATAPI CD/DVD-ROM drive
Using anticipatory io scheduler
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hda: max request size: 1024KiB
hda: 490234752 sectors (251000 MB) w/7936KiB Cache, CHS=3D30515/255/63, UDM=
A(133)
 /dev/ide/host0/bus0/target0/lun0: p1 p2 p3
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Adding 257028k swap on /dev/hda3.  Priority:-1 extents:1
EXT3 FS on hda2, internal journal
Real Time Clock Driver v1.12
hdb: ATAPI 48X DVD-ROM drive, 256kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
irda_init()
NET: Registered protocol family 23
via-rhine.c:v1.10-LK1.1.20-2.6 May-23-2004 Written by Donald Becker
ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 11 (level, low) -> IRQ 11
eth0: VIA Rhine II at 0xe800, 00:0a:e6:f0:62:73, IRQ 11.
eth0: MII PHY found at address 1, status 0x786d advertising 05e1 Link 45e1.
Via 686a/8233/8235 audio driver 1.9.1-ac4-2.5
ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 10 (level, low) -> IRQ 10
via82cxxx: Six channel audio available
PCI: Setting latency timer of device 0000:00:11.5 to 64
ac97_codec: AC97 Audio codec, id: VIA97 (Unknown)
via82cxxx: board #1 at 0xE000, IRQ 10
usbcore: registered new driver usbfs
usbcore: registered new driver hub
ACPI: PCI interrupt 0000:00:10.3[D] -> GSI 12 (level, low) -> IRQ 12
ehci_hcd 0000:00:10.3: VIA Technologies, Inc. USB 2.0
ehci_hcd 0000:00:10.3: irq 12, pci mem c8889000
ehci_hcd 0000:00:10.3: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:10.3: USB 2.0 enabled, EHCI 1.00, driver 2004-May-10
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
input: PC Speaker
inserting floppy driver for 2.6.8
FDC 0 is a post-1991 82077
parport: PnPBIOS parport detected.
parport0: PC-style at 0x378 (0x778), irq 7, dma 3 [PCSPP,TRISTATE,COMPAT,EC=
P,DMA]
Linux agpgart interface v0.100 (c) Dave Jones
agpgart: Detected VIA KT266/KY266x/KT333 chipset
agpgart: Maximum main memory to use for agp memory: 94M
agpgart: AGP aperture is 128M @ 0xd0000000
cpci_hotplug: CompactPCI Hot Plug Core version: 0.2
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
pciehp: acpi_pciehprm:\_SB_.PCI0 evaluate _BBN fail=3D0x5
pciehp: acpi_pciehprm:get_device PCI ROOT HID fail=3D0x5
shpchp: acpi_shpchprm:\_SB_.PCI0 evaluate _BBN fail=3D0x5
shpchp: acpi_shpchprm:get_device PCI ROOT HID fail=3D0x5
USB Universal Host Controller Interface driver v2.2
ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 11 (level, low) -> IRQ 11
uhci_hcd 0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Contro=
ller
uhci_hcd 0000:00:10.0: irq 11, io base 0000d000
uhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ACPI: PCI interrupt 0000:00:10.1[B] -> GSI 5 (level, low) -> IRQ 5
uhci_hcd 0000:00:10.1: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Contro=
ller (#2)
uhci_hcd 0000:00:10.1: irq 5, io base 0000d400
uhci_hcd 0000:00:10.1: new USB bus registered, assigned bus number 3
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ACPI: PCI interrupt 0000:00:10.2[C] -> GSI 10 (level, low) -> IRQ 10
uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Contro=
ller (#3)
uhci_hcd 0000:00:10.2: irq 10, io base 0000d800
uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 4
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
eth0: Setting full-duplex based on MII #1 link partner capability of 45e1.
NET: Registered protocol family 17
NET: Registered protocol family 10
Disabled Privacy Extensions on device c02c8280(lo)
IPv6 over IPv4 tunneling driver
eth0: no IPv6 routers present
ACPI: Processor [CPU0] (supports C1 C2)
powernow_k7: Ignoring new-style parameters in presence of obsolete ones
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB:  99.842 MHz
powernow: cpuid is (0x781)
powernow: Trying ACPI perflib
powernow: ACPI perflib can not be used in this platform
powernow: ACPI and legacy methods failed
powernow: See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.sht=
ml

------=_Part_22_22629842.1093158773750
Content-Type: text/plain; name="x86info.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="x86info.txt"

x86info v1.12b.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
eax in: 0x00000000, eax =3D 00000001 ebx =3D 68747541 ecx =3D 444d4163 edx =
=3D 69746e65
eax in: 0x00000001, eax =3D 00000681 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 0383fbff

eax in: 0x80000000, eax =3D 80000008 ebx =3D 68747541 ecx =3D 444d4163 edx =
=3D 69746e65
eax in: 0x80000001, eax =3D 00000781 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D c1c3fbff
eax in: 0x80000002, eax =3D 6e6b6e55 ebx =3D 206e776f ecx =3D 20555043 edx =
=3D 00707954
eax in: 0x80000003, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0x80000004, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000
eax in: 0x80000005, eax =3D 0408ff08 ebx =3D ff20ff10 ecx =3D 40020140 edx =
=3D 40020140
eax in: 0x80000006, eax =3D 00000000 ebx =3D 41004100 ecx =3D 00408140 edx =
=3D 00000000
eax in: 0x80000007, eax =3D 00000000 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000007
eax in: 0x80000008, eax =3D 00002022 ebx =3D 00000000 ecx =3D 00000000 edx =
=3D 00000000

Family: 6 Model: 8 Stepping: 1
CPU Model : Mobile Duron  (Thoroughbred)[B0]
Feature flags:
=09Onboard FPU
=09Virtual Mode Extensions
=09Debugging Extensions
=09Page Size Extensions
=09Time Stamp Counter
=09Model-Specific Registers
=09Physical Address Extensions
=09Machine Check Architecture
=09CMPXCHG8 instruction
=09Onboard APIC
=09SYSENTER/SYSEXIT
=09Memory Type Range Registers
=09Page Global Enable
=09Machine Check Architecture
=09CMOV instruction
=09Page Attribute Table
=0936-bit PSEs
=09MMX support
=09FXSAVE and FXRESTORE instructions
=09SSE support

Extended feature flags:
 syscall mmxext 3dnowext 3dnow
MSR: 0x0000002a=3D0x00000000 : 00000000 00000000 00000000 00000000
MSR: 0xc0000080=3D0x00000000 : 00000000 00000000 00000000 00000000
MSR: 0xc0010010=3D0x00140604 : 00000000 00010100 00000110 00000100
MSR: 0xc0010015=3D0x050b1008 : 00000101 00001011 00010000 00001000
MSR: 0xc001001b=3D0x20031223 : 00100000 00000011 00010010 00100011

Number of reporting banks : 4

MCG_CTL:
 Data cache check disabled
 Instruction cache check disabled
 Bus unit check disabled
 Load/Store unit check disabled

           31       23       15       7=20
Bank: 0 (0x400)
MC0CTL:    00000000 00000000 00000000 00000000
MC0STATUS: 00000000 00000000 00000000 00000000
MC0ADDR:   00000000 00000000 00000000 00000000
MC0MISC:   00000000 00000000 00000000 00000000

Bank: 1 (0x404)
MC1CTL:    00000000 00000000 00000000 00000000
MC1STATUS: 00000000 00000000 00101010 00111010
MC1ADDR:   00000000 00000000 00101010 00111010
MC1MISC:   00000000 00000000 00000000 00000000

Bank: 2 (0x408)
MC2CTL:    00000000 00000000 00000000 00000000
MC2STATUS: 00000000 00000010 00000001 00000010
MC2ADDR:   10111101 00000000 00000000 00001111
MC2MISC:   10111101 00000000 00000000 00001111

Bank: 3 (0x40c)
MC3CTL:    00000000 00000000 00000000 00000000
MC3STATUS: 00000000 00000000 00001000 01000011
MC3ADDR:   11111111 11111111 11110111 11111111
MC3MISC:   00000000 00000000 00000000 00000000

Instruction TLB: Fully associative. 16 entries.
Data TLB: Fully associative. 32 entries.
L1 Data cache:
=09Size: 64Kb=092-way associative.=20
=09lines per tag=3D1=09line size=3D64 bytes.
L1 Instruction cache:
=09Size: 64Kb=092-way associative.=20
=09lines per tag=3D1=09line size=3D64 bytes.
L2 (on CPU) cache:
=09Size: 64Kb=098-way associative.=20
=09lines per tag=3D1=09line size=3D64 bytes.

PowerNOW! Technology information
Available features:
=09Temperature sensing diode present.
=09Bus divisor control
=09Voltage ID control

MSR: 0xc0010041=3D0x0000000000000000 : 00000000 00000000 00000000 00000000
           00000000 00000000 00000000 00000000
MSR: 0xc0010042=3D0x0000000000111515 : 00000000 00000000 00000000 00000000
           00000000 00010001 00010101 00010101

FID changes won't happen
VID changes won't happen
Voltage ID codes: Maximum=3D2.000V Startup=3D2.000V Currently=3D2.000V
Frequency ID codes: Maximum=3D19.0x Startup=3D13.5x Currently=3D13.5x
Decoding BIOS PST tables (maxfid=3D11, startvid=3D0)
Connector type: Socket A (462 Pin PGA)


MTRR registers:
MTRRcap (0xfe): 0x0000000000000508
MTRRphysBase0 (0x200): 0x0000000000000006
MTRRphysMask0 (0x201): 0x0000000ff8000800
MTRRphysBase1 (0x202): 0x00000000d0000001
MTRRphysMask1 (0x203): 0x0000000ff8000800
MTRRphysBase2 (0x204): 0x00000000d0000001
MTRRphysMask2 (0x205): 0x0000000ff8000800
MTRRphysBase3 (0x206): 0x0000000000000000
MTRRphysMask3 (0x207): 0x0000000000000000
MTRRphysBase4 (0x208): 0x0000000000000000
MTRRphysMask4 (0x209): 0x0000000000000000
MTRRphysBase5 (0x20a): 0x0000000000000000
MTRRphysMask5 (0x20b): 0x0000000000000000
MTRRphysBase6 (0x20c): 0x0000000000000000
MTRRphysMask6 (0x20d): 0x0000000000000000
MTRRphysBase7 (0x20e): 0x0000000000000000
MTRRphysMask7 (0x20f): 0x0000000000000000
MTRRfix64K_00000 (0x250): 0x0606060606060606
MTRRfix16K_80000 (0x258): 0x0606060606060606
MTRRfix16K_A0000 (0x259): 0x0000000000000000
MTRRfix4K_C8000 (0x269): 0x0000000000000000
MTRRfix4K_D0000 0x26a: 0x0000000000000000
MTRRfix4K_D8000 0x26b: 0x0000000000000000
MTRRfix4K_E0000 0x26c: 0x0000000000000000
MTRRfix4K_E8000 0x26d: 0x0000000000000000
MTRRfix4K_F0000 0x26e: 0x0000000000000000
MTRRfix4K_F8000 0x26f: 0x0000000000000000
MTRRdefType (0x2ff): 0x0000000000000c00


1.3Ghz processor (estimate).


------=_Part_22_22629842.1093158773750
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_22_22629842.1093158773750--

