From: Alex Simonov <a_simonov@yahoo.com>
Subject: Mobile Athlon XP 1900+ PST table ???
Date: Wed, 17 Sep 2003 01:57:42 -0700 (PDT)
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030917085742.78372.qmail@web20807.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="0-1196672411-1063789062=:78242"
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
To: cpufreq@www.linux.org.uk

--0-1196672411-1063789062=:78242
Content-Type: text/plain; charset=us-ascii
Content-Id: 
Content-Disposition: inline

Hello all,

This mail list is the last hope in my desperate
efforts to find a solution of my problem.
Recently the 1GHz Mobile Duron of my Sony Vaio
FX502 got damaged, so I replaced it with Mobile
Athlon 1900+ (FSB 100, CPUID 0x781).
Unfortunately the BIOS supports only up to Athlon
XP 1600+, so the powernow is not working :( The
XP 1600+ PST table is the last one of 28
available PST tables, and has the following data:

CPUID: 0x780
FSB: 0x64 (100 MHz)
max FID: 0x16 (14x)
start VID: 0xE (1.300V)
Num states: 6 as follows:

1. 0x4 (5x), 0xE (1.300V)
2. 0x6 (6x), 0xE (1.300V)
3. 0xA (8x), 0xE (1.300V)
4. 0xE (10x), 0xE (1.300V)
5. 0x2 (12x), 0xE (1.300V)
6. 0x16(14x), 0xE (1.300V) 

Does anybody have the right PST table values for
Athlon 1900+, FSB100, which I could use to
override in the CPUFREQ module? If this could
help, I'm sending the output of x86info utility
and dmesg of my system.

Thank you very much to all of you in advance,

Regards,

Alex



__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com
--0-1196672411-1063789062=:78242
Content-Type: text/plain; name="x86info.txt"
Content-Description: x86info.txt
Content-Disposition: inline; filename="x86info.txt"

[root@localhost x86info]# ./x86info -a
x86info v1.13.  Dave Jones 2001-2003
Feedback to <davej@redhat.com>.

Found 1 CPU
--------------------------------------------------------------------------
eax in: 0x00000000, eax = 00000001 ebx = 68747541 ecx = 444d4163 edx = 69746e65
eax in: 0x00000001, eax = 00000681 ebx = 00000000 ecx = 00000000 edx = 0383f9ff

eax in: 0x80000000, eax = 80000008 ebx = 68747541 ecx = 444d4163 edx = 69746e65
eax in: 0x80000001, eax = 00000781 ebx = 00000000 ecx = 00000000 edx = c1cbf9ff
eax in: 0x80000002, eax = 69626f6d ebx = 4120656c ecx = 4120444d edx = 6f6c6874
eax in: 0x80000003, eax = 6d74286e ebx = 50582029 ecx = 30393120 edx = 20202b30
eax in: 0x80000004, eax = 00000000 ebx = 00000000 ecx = 00000000 edx = 00000000
eax in: 0x80000005, eax = 0408ff08 ebx = ff20ff10 ecx = 40020140 edx = 40020140
eax in: 0x80000006, eax = 00000000 ebx = 41004100 ecx = 01008140 edx = 00000000
eax in: 0x80000007, eax = 00000000 ebx = 00000000 ecx = 00000000 edx = 00000007
eax in: 0x80000008, eax = 00002022 ebx = 00000000 ecx = 00000000 edx = 00000000

Family: 6 Model: 8 Stepping: 1
CPU Model : Mobile Athlon XP (Thoroughbred)[B0]
Feature flags:
        Onboard FPU
        Virtual Mode Extensions
        Debugging Extensions
        Page Size Extensions
        Time Stamp Counter
        Model-Specific Registers
        Physical Address Extensions
        Machine Check Architecture
        CMPXCHG8 instruction
        SYSENTER/SYSEXIT
        Memory Type Range Registers
        Page Global Enable
        Machine Check Architecture
        CMOV instruction
        Page Attribute Table
        36-bit PSEs
        MMX support
        FXSAVE and FXRESTORE instructions
        SSE support

Extended feature flags:
 syscall mp mmxext 3dnowext 3dnow
MSR: 0x0000002a=0x00000000 : 00000000 00000000 00000000 00000000
MSR: 0xc0000080=0x00000000 : 00000000 00000000 00000000 00000000
MSR: 0xc0010010=0x001e0604 : 00000000 00011110 00000110 00000100
MSR: 0xc0010015=0x04031008 : 00000100 00000011 00010000 00001000
MSR: 0xc001001b=0x20031223 : 00100000 00000011 00010010 00100011

Number of reporting banks : 4

MCG_CTL:
 Data cache check enabled
  ECC 1 bit error reporting disabled
  ECC multi bit error reporting disabled
  Data cache data parity disabled
  Data cache main tag parity disabled
  Data cache snoop tag parity disabled
  L1 TLB parity disabled
  L2 TLB parity disabled
 Instruction cache check enabled
  ECC 1 bit error reporting enabled
  ECC multi bit error reporting enabled
  Instruction cache data parity enabled
  IC main tag parity enabled
  IC snoop tag parity enabled
  L1 TLB parity enabled
  L2 TLB parity enabled
  Predecode array parity enabled
  Target selector parity enabled
  Read data error enabled
 Bus unit check enabled
  External L2 tag parity error enabled
  L2 partial tag parity error enabled
  System ECC TLB reload error enabled
  L2 ECC TLB reload error enabled
  L2 ECC K7 deallocate enabled
  L2 ECC probe deallocate enabled
  System datareaderror reporting enabled
 Load/Store unit check enabled
  Read data error enable (loads) enabled
  Read data error enable (stores) enabled

           31       23       15       7
Bank: 0 (0x400)
MC0CTL:    00000000 00000000 00000000 00000000
MC0STATUS: 00000000 00000000 00000000 00000000
MC0ADDR:   11101111 11111111 10111111 11111000
MC0MISC:   00000000 00000000 00000000 00000000

Bank: 1 (0x404)
MC1CTL:    11111111 11111111 11111111 11111111
MC1STATUS: 00000000 00000000 00000000 00000000
MC1ADDR:   11111011 11111011 11111011 01111111
MC1MISC:   00000000 00000000 00000000 00000000

Bank: 2 (0x408)
MC2CTL:    00000000 00000000 00000111 11111111
MC2STATUS: 00000000 00000000 00000000 00000000
MC2ADDR:   11111111 11111111 11111111 10001111
MC2MISC:   11111111 11111111 11111111 10001111

Bank: 3 (0x40c)
MC3CTL:    00000000 00000000 00000000 00000111
MC3STATUS: 00000000 00000000 00000000 00000000
MC3ADDR:   11111111 11111111 01111101 11011111
MC3MISC:   00000000 00000000 00000000 00000000

Instruction TLB: Fully associative. 16 entries.
Data TLB: Fully associative. 32 entries.
L1 Data cache:
        Size: 64Kb      2-way associative.
        lines per tag=1 line size=64 bytes.
L1 Instruction cache:
        Size: 64Kb      2-way associative.
        lines per tag=1 line size=64 bytes.
L2 (on CPU) cache:
        Size: 256Kb     8-way associative.
        lines per tag=1 line size=64 bytes.

PowerNOW! Technology information
Available features:
        Temperature sensing diode present.
        Bus divisor control
        Voltage ID control

MSR: 0xc0010041=0x0000000000130d1a : 00000000 00000000 00000000 00000000
           00000000 00010011 00001101 00011010
MSR: 0xc0010042=0x000d0d0d001a041a : 00000000 00001101 00001101 00001101
           00000000 00011010 00000100 00011010

FID changes will happen
VID changes will happen
Current VID multiplier code: 1.350
Current FSB multiplier code: 16.0
Voltage ID codes: Maximum=1.350V Startup=1.350V Currently=1.350V
Frequency ID codes: Maximum=16.0x Startup=5.0x Currently=16.0x
Decoding BIOS PST tables (maxfid=1a, startvid=d)
Found PSB header at 0x4018c4d0
Table version: 0x12
Flags: 0x0 (Mobile voltage regulator)
Settling Time: 100 microseconds.
Has 28 PST tables. (Only dumping ones relevant to this CPU).
Connector type: Socket A (462 Pin PGA)


MTRR registers:
MTRRcap (0xfe): 0x0000000000000508
MTRRphysBase0 (0x200): 0x0000000000000006
MTRRphysMask0 (0x201): 0x0000000fe0000800
MTRRphysBase1 (0x202): 0x00000000e9000001
MTRRphysMask1 (0x203): 0x0000000fff800800
MTRRphysBase2 (0x204): 0x0000000000000000
MTRRphysMask2 (0x205): 0x0000000000000000
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
MTRRfix64K_00000 (0x250): 0x1e1e1e1e1e1e1e1e
MTRRfix16K_80000 (0x258): 0x1e1e1e1e1e1e1e1e
MTRRfix16K_A0000 (0x259): 0x0000000000000000
MTRRfix4K_C8000 (0x269): 0x1515151515151515
MTRRfix4K_D0000 0x26a: 0x000000001e1e1e1e
MTRRfix4K_D8000 0x26b: 0x1e1e1e1e00000000
MTRRfix4K_E0000 0x26c: 0x1515151500000000
MTRRfix4K_E8000 0x26d: 0x1515151515151515
MTRRfix4K_F0000 0x26e: 0x1515151515151515
MTRRfix4K_F8000 0x26f: 0x1515151515151515
MTRRdefType (0x2ff): 0x0000000000000c00


1.6Ghz processor (estimate).

[root@localhost x86info]# dmesg
Linux version 2.4.22-1mdk-noapic (root@localhost) (gcc version 3.2.2 (Mandrake Linux 9.1 3.2.2-3mdk)) #19 Tue Sep 16 22:57:32 CEST 2003
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009f000 (usable)
 BIOS-e820: 000000000009f000 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000c0000 - 00000000000d4000 (reserved)
 BIOS-e820: 00000000000dc000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000001fef0000 (usable)
 BIOS-e820: 000000001fef0000 - 000000001feff000 (ACPI data)
 BIOS-e820: 000000001feff000 - 000000001ff00000 (ACPI NVS)
 BIOS-e820: 000000001ff00000 - 0000000020000000 (usable)
 BIOS-e820: 00000000fffe0000 - 0000000100000000 (reserved)
512MB LOWMEM available.
ACPI: have wakeup address 0xc0001000
On node 0 totalpages: 131072
zone(0): 4096 pages.
zone(1): 126976 pages.
zone(2): 0 pages.
Sony Vaio laptop detected.
ACPI: RSDP (v000 PTLTD                                     ) @ 0x000f7700
ACPI: RSDT (v001 SONY   K5       0x06040000  LTP 0x00000000) @ 0x1fef9ea5
ACPI: FADT (v001 SONY   K5       0x06040000 PTL_ 0x000f4240) @ 0x1fefef64
ACPI: BOOT (v001 PTLTD  $SBFTBL$ 0x06040000  LTP 0x00000001) @ 0x1fefefd8
ACPI: DSDT (v001  SONY  K5       0x06040000 MSFT 0x0100000d) @ 0x00000000
Building zonelist for node : 0
Kernel command line: BOOT_IMAGE=2422-1 ro root=307 noapic devfs=mount hdc=ide-scsi resume=/dev/hda6 cpufreq=500000-850000
ide_setup: hdc=ide-scsi
Initializing CPU#0
Detected 1600.099 MHz processor.
Console: colour VGA+ 80x25
Calibrating delay loop... 3191.60 BogoMIPS
Memory: 514764k/524288k available (1658k kernel code, 9072k reserved, -2055k data, 144k init, 0k highmem, 0k BadRAM)
Dentry cache hash table entries: 65536 (order: 7, 524288 bytes)
Inode cache hash table entries: 32768 (order: 6, 262144 bytes)
Mount cache hash table entries: 512 (order: 0, 4096 bytes)
Buffer cache hash table entries: 32768 (order: 5, 131072 bytes)
Page-cache hash table entries: 131072 (order: 7, 524288 bytes)
CPU: CLK_CTL MSR was 60031223. Reprogramming to 20031223
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 256K (64 bytes/line)
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU:     After generic, caps: 0383f9ff c1cbf9ff 00000000 00000000
CPU:             Common caps: 0383f9ff c1cbf9ff 00000000 00000000
CPU: AMD mobile AMD Athlon(tm) XP 1900+   stepping 01
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
mtrr: v1.40 (20010327) Richard Gooch (rgooch@atnf.csiro.au)
mtrr: detected mtrr type: Intel
ACPI: Subsystem revision 20030813
PCI: PCI BIOS revision 2.10 entry at 0xfd7cd, last bus=1
PCI: Using configuration type 1
Looking for DSDT in initrd ... not found!<6>ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: System [ACPI] (supports S0 S3 (swsusp) S4 S5)
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 7 *9 10 11 12)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 9 *10 11 12)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 7 9 10 11 12)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 *9 10 11 12)
ACPI: Embedded Controller [EC0] (gpe 1)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PPB_._PRT]
ACPI: Power Resource [PCR0] (off)
ACPI: Power Resource [PCR1] (off)
PCI: Probing PCI hardware
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 5
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 10
PCI: Using ACPI for IRQ routing
PCI: if you experience problems, try using option 'pci=noacpi' or even 'acpi=off'
Applying VIA southbridge workaround.
PCI: Via IRQ fixup for 00:07.2, from 9 to 11
PCI: Via IRQ fixup for 00:07.3, from 9 to 11
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
IA-32 Microcode Update Driver: v1.11 <tigran@veritas.com>
apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16)
apm: overridden by ACPI.
powernow: AMD K7 CPU detected.
powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: Found PSB header at c00f74d0
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 28 PST tables. (Only dumping ones relevant to this CPU).
Starting kswapd
kinoded started
VFS: Disk quotas vdquot_6.5.1
devfs: v1.12c (20020818) Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
NTFS driver 2.1.4a [Flags: R/O].
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with HUB-6 MANY_PORTS MULTIPORT SHARE_IRQ SERIAL_PCI ISAPNP enabled
ttyS00 at 0x03f8 (irq = 4) is a 16550A
RAMDISK driver initialized: 16 RAM disks of 32000K size 1024 blocksize
Uniform Multi-Platform E-IDE driver Revision: 7.00beta4-2.4
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: IDE controller at PCI slot 00:07.1
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
VP_IDE: VIA vt82c686b (rev 40) IDE UDMA100 controller on pci00:07.1
    ide0: BM-DMA at 0x1c40-0x1c47, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0x1c48-0x1c4f, BIOS settings: hdc:DMA, hdd:pio
hda: TOSHIBA MK6022GAX, ATA DISK drive
blk: queue c0176520, I/O limit 4095Mb (mask 0xffffffff)
hdc: HL-DT-ST CD-RW/DVD DRIVE GCC-4080N, ATAPI CD/DVD-ROM drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
ide1 at 0x170-0x177,0x376 on irq 15
hda: attached ide-disk driver.
hda: host protected area => 1
hda: 117210240 sectors (60012 MB), CHS=7296/255/63, UDMA(100)
Partition check:
 /dev/ide/host0/bus0/target0/lun0: p1 p2 p3 p4 < p5 p6 p7 p8 >
ide: late registration of driver.
md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
md: Autodetecting RAID arrays.
md: autorun ...
md: ... autorun DONE.
Initializing Cryptographic API
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 4096 buckets, 32Kbytes
TCP: Hash tables configured (established 131072 bind 65536)
Linux IP multicast router 0.06 plus PIM-SM
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Resume Machine:   This is normal swap space
RAMDISK: Compressed image found at block 0
Swsusp 1.0.3: kswsuspd starting
Freeing initrd memory: 83k freed
VFS: Mounted root (ext2 filesystem).
Mounted devfs on /dev
Journalled Block Device driver loaded
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
Mounted devfs on /dev
Freeing unused kernel memory: 144k freed
Real Time Clock Driver v1.10e
usb.c: registered new driver usbdevfs
usb.c: registered new driver hub
usb-uhci.c: $Revision: 1.275 $ time 22:21:15 Sep 13 2003
usb-uhci.c: High bandwidth mode enabled
PCI: Setting latency timer of device 00:07.2 to 64
usb-uhci.c: USB UHCI at I/O 0x1c00, IRQ 11
usb-uhci.c: Detected 2 ports
usb.c: new USB bus registered, assigned bus number 1
hub.c: USB hub found
hub.c: 2 ports detected
PCI: Setting latency timer of device 00:07.3 to 64
usb-uhci.c: USB UHCI at I/O 0x1c20, IRQ 11
usb-uhci.c: Detected 2 ports
usb.c: new USB bus registered, assigned bus number 2
hub.c: USB hub found
hub.c: 2 ports detected
usb-uhci.c: v1.275:USB Universal Host Controller Interface driver
usbdevfs: remount parameter error
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,7), internal journal
Adding Swap: 875500k swap-space (priority -1)
hub.c: new USB device 00:07.2-1, assigned address 2
hub.c: USB hub found
hub.c: 4 ports detected
hub.c: new USB device 00:07.2-2, assigned address 3
usb.c: USB device 3 (vend/prod 0x547/0x2131) is not claimed by any active driver.
hub.c: new USB device 00:07.2-1.4, assigned address 4
usb.c: USB device 4 (vend/prod 0x46d/0xc001) is not claimed by any active driver.
SCSI subsystem driver Revision: 1.00
hdc: attached ide-scsi driver.
scsi0 : SCSI host adapter emulation for IDE ATAPI devices
  Vendor: HL-DT-ST  Model: RW/DVD GCC-4080N  Rev: 0010
  Type:   CD-ROM                             ANSI SCSI revision: 02
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,5), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
kjournald starting.  Commit interval 5 seconds
EXT3 FS 2.4-0.9.19, 19 August 2002 on ide0(3,8), internal journal
EXT3-fs: mounted filesystem with ordered data mode.
MSDOS FS: IO charset utf8
NTFS volume version 3.1.
MSDOS FS: IO charset utf8
usb.c: registered new driver hiddev
usb.c: registered new driver hid
input: USB HID v1.10 Mouse [Logitech USB Mouse] on usb1:4.0
hid-core.c: v1.8.1 Andreas Gal, Vojtech Pavlik <vojtech@suse.cz>
hid-core.c: USB HID support drivers
mice: PS/2 mouse device common for all mice
usb.c: registered new driver usbmouse
usbmouse.c: v1.6:USB HID Boot Protocol mouse driver
ohci1394: $Rev$ Ben Collins <bcollins@debian.org>
PCI: Setting latency timer of device 00:0e.0 to 64
ohci1394_0: OHCI-1394 1.0 (PCI): IRQ=[11]  MMIO=[e8004000-e80047ff]  Max Packet=[2048]
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[0800460300f5b7d8]
8139too Fast Ethernet driver 0.9.26
eth0: RealTek RTL8139 Fast Ethernet at 0xe09b0800, 08:00:46:30:23:2c, IRQ 10
eth0:  Identified 8139 chip type 'RTL-8139C'
ACPI: Battery Slot [BAT1] (battery present)
ACPI: Battery Slot [BAT2] (battery absent)
ACPI: AC Adapter [ACAD] (on-line)
ACPI: Processor [CPU0] (supports C1 C2, 16 throttling states)
ACPI: Thermal Zone [THRM] (64 C)
ACPI: Power Button (FF) [PWRF]
ACPI: Sleep Button (CM) [SBTN]
ACPI: Lid Switch [LID]
inserting floppy driver for 2.4.22-1mdk-noapic
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 0, lun 0
sr0: scsi3-mmc drive: 10x/24x writer cd/rw xa/form2 cdda tray
sr0: mmc-3 profile capable, current profile: 0h
Uniform CD-ROM driver Revision: 3.12
sr0: mmc-3 profile: 0h
sr0: mmc-3 profile: 0h
Linux Kernel Card Services Kernel Version
  options:  [pci] [cardbus] [pm]
Yenta IRQ list 0008, PCI irq11
Socket status: 30000006
Yenta IRQ list 0008, PCI irq10
Socket status: 30000006
cs: IO port probe 0x0c00-0x0cff: clean.
cs: IO port probe 0x0100-0x04ff: excluding 0x378-0x37f 0x4d0-0x4d7
cs: IO port probe 0x0a00-0x0aff: clean.
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Via 686a/8233/8235 audio driver 1.9.1-ac3
PCI: Setting latency timer of device 00:07.5 to 64
ac97_codec: AC97  codec, id:  (Unknown)
via82cxxx: Codec rate locked at 48Khz
via82cxxx: board #1 at 0x1000, IRQ 5
parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE]
parport_pc: Via 686A parallel port: io=0x378
lp0: using parport0 (polling).
via_audio: ignoring drain playback error -11
via_audio: ignoring drain playback error -11
[root@localhost x86info]#
--0-1196672411-1063789062=:78242
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--0-1196672411-1063789062=:78242--

