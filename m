From: Markus Trippelsdorf <markus@trippelsdorf.de>
Subject: RE: powernow-k8 problem
Date: Wed, 01 Dec 2004 16:09:07 +0100
Message-ID: <1101913748.1966.6.camel@lb.loomes.de>
References: <84EA05E2CA77634C82730353CBE3A8430153A588@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-kiP7GCO/s+a6Kof4KFCW"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8430153A588@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: cpufreq@www.linux.org.uk


--=-kiP7GCO/s+a6Kof4KFCW
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-12-01 at 08:26 -0600, Devriendt, Paul wrote:
> I am not sure what is going on to cause this transition
> frequency failed. It would be a big help if you could rebuild 
> the driver for debug and post the system log (dmesg) of this
> failure. 

As I wrote in a private mail to your colleague Mark Langsdorf,
everything is fine if I disable CONFIG_ACPI_PROCESSOR and
CONFIG_ACPI_FAN in my kernel configuration.

Markus

Here are two debug dmesg:

--=-kiP7GCO/s+a6Kof4KFCW
Content-Disposition: attachment; filename=dmesg1
Content-Type: text/plain; name=dmesg1; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

formation
Built 1 zonelists
Kernel command line: root=/dev/hda2 video=radeonfb:1024x768-32@100 elevator=deadline hdc=ide-scsi console=tty0
ide_setup: hdc=ide-scsi
Initializing CPU#0
PID hash table entries: 4096 (order: 12, 131072 bytes)
time.c: Using 1.193182 MHz PIT timer.
time.c: Detected 2002.619 MHz processor.
Console: colour VGA+ 80x25
Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes)
Memory: 1025944k/1048256k available (2593k kernel code, 21644k reserved, 645k data, 464k init)
Calibrating delay loop... 3923.96 BogoMIPS (lpj=1961984)
Mount-cache hash table entries: 256 (order: 0, 4096 bytes)
CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K (64 bytes/line)
CPU: L2 Cache: 512K (64 bytes/line)
CPU: AMD Athlon(tm) 64 Processor 3200+ stepping 00
Using local APIC NMI watchdog using perfctr0
Using local APIC timer interrupts.
Detected 12.516 MHz APIC timer.
NET: Registered protocol family 16
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040816
ACPI: Interpreter enabled
ACPI: Using IOAPIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 7 10 *11 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 7 *10 11 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 7 10 11 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 7 10 11 14 15) *0, disabled.
SCSI subsystem initialized
usbcore: registered new driver usbfs
usbcore: registered new driver hub
PCI: Using ACPI for IRQ routing
ACPI: PCI interrupt 0000:00:07.0[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI interrupt 0000:00:0a.0[A] -> GSI 17 (level, low) -> IRQ 17
ACPI: PCI interrupt 0000:00:0c.0[A] -> GSI 17 (level, low) -> IRQ 17
ACPI: PCI interrupt 0000:00:0c.1[A] -> GSI 17 (level, low) -> IRQ 17
ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 20 (level, low) -> IRQ 20
ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (level, low) -> IRQ 20
ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 21 (level, low) -> IRQ 21
ACPI: PCI interrupt 0000:00:10.1[A] -> GSI 21 (level, low) -> IRQ 21
ACPI: PCI interrupt 0000:00:10.2[B] -> GSI 21 (level, low) -> IRQ 21
ACPI: PCI interrupt 0000:00:10.3[B] -> GSI 21 (level, low) -> IRQ 21
ACPI: PCI interrupt 0000:00:10.4[C] -> GSI 21 (level, low) -> IRQ 21
ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 22 (level, low) -> IRQ 22
ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16
IA32 emulation $Id: sys_ia32.c,v 1.32 2002/03/24 13:02:28 ak Exp $
devfs: 2004-01-31 Richard Gooch (rgooch@atnf.csiro.au)
devfs: boot_options: 0x1
SGI XFS with large block/inode numbers, no debug enabled
PCI: Via IRQ fixup for 0000:00:10.0, from 11 to 5
PCI: Via IRQ fixup for 0000:00:10.1, from 11 to 5
PCI: Via IRQ fixup for 0000:00:10.2, from 10 to 5
PCI: Via IRQ fixup for 0000:00:10.3, from 10 to 5
inotify init: minor=63
lp: driver loaded but no devices found
Real Time Clock Driver v1.12
Linux agpgart interface v0.100 (c) Dave Jones
agpgart: Detected AGP bridge 0
agpgart: Maximum main memory to use for agp memory: 941M
agpgart: AGP aperture is 64M @ 0xe8000000
ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16
[drm] Initialized radeon 1.11.0 20020828 on minor 0: ATI Technologies Inc Radeon RV200 QW [Radeon 7500]
ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 16 (level, low) -> IRQ 16
radeonfb: Found Intel x86 BIOS ROM Image
radeonfb: Retreived PLL infos from BIOS
radeonfb: Reference=27.00 MHz (RefDiv=12) Memory=290.00 Mhz, System=230.00 MHz
radeonfb: Monitor 1 type CRT found
radeonfb: Monitor 2 type no found
Console: switching to colour frame buffer device 128x48
radeonfb: ATI Radeon QW  DDR SGRAM 64 MB
ACPI: Power Button (FF) [PWRF]
ACPI: Sleep Button (CM) [SLPB]
ACPI: Processor [CPU1] (supports C1)
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
input: AT Translated Set 2 keyboard on isa0060/serio0
parport0: PC-style at 0x378 [PCSPP(,...)]
lp0: using parport0 (polling).
Using deadline io scheduler
Floppy drive(s): fd0 is 1.44M
FDC 0 is a post-1991 82077
loop: loaded (max 8 devices)
ACPI: PCI interrupt 0000:00:0a.0[A] -> GSI 17 (level, low) -> IRQ 17
ACPI: PCI interrupt 0000:00:0a.0[A] -> GSI 17 (level, low) -> IRQ 17
eth0: Yukon Gigabit Ethernet 10/100/1000Base-T Adapter
      PrefPort:A  RlmtMode:Check Link State
Linux video capture interface: v1.00
bttv: driver version 0.9.15 loaded
bttv: using 8 buffers with 2080k (520 pages) each for capture
bttv: Bt8xx card found (0).
ACPI: PCI interrupt 0000:00:0c.0[A] -> GSI 17 (level, low) -> IRQ 17
bttv0: Bt878 (rev 17) at 0000:00:0c.0, irq: 17, latency: 64, mmio: 0xefe00000
bttv0: detected: Pinnacle PCTV [card=39], PCI subsystem ID is 11bd:0012
bttv0: using: Pinnacle PCTV Studio/Rave [card=39,autodetected]
bttv0: gpio: en=00000000, out=00000000 in=00ffffff [init]
bttv0: i2c: checking for MSP34xx @ 0x80... not found
bttv0: pinnacle/mt: id=1 info="PAL / mono" radio=no
bttv0: using tuner=33
bttv0: i2c: checking for MSP34xx @ 0x80... not found
bttv0: i2c: checking for TDA9875 @ 0xb0... not found
bttv0: i2c: checking for TDA7432 @ 0x8a... not found
bttv0: registered device video0
bttv0: registered device vbi0
bttv0: PLL: 28636363 => 35468950 .. ok
tvaudio: TV audio decoder + audio/video mux driver
tvaudio: known chips: tda9840,tda9873h,tda9874h/a,tda9850,tda9855,tea6300,tea6420,tda8425,pic16c54 (PV951),ta8874z
tuner: chip found at addr 0xc0 i2c-bus bt878 #0 [sw]
tuner: type set to 33 (MT20xx universal) by bt878 #0 [sw]
tuner: microtune: companycode=4d54 part=04 rev=04
tuner: microtune MT2032 found, OK
tda9885/6/7: chip found @ 0x86
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
VP_IDE: IDE controller at PCI slot 0000:00:0f.1
ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 20 (level, low) -> IRQ 20
VP_IDE: chipset revision 6
VP_IDE: not 100% native mode: will probe irqs later
VP_IDE: VIA vt8237 (rev 00) IDE UDMA133 controller on pci0000:00:0f.1
    ide0: BM-DMA at 0xfc00-0xfc07, BIOS settings: hda:DMA, hdb:DMA
    ide1: BM-DMA at 0xfc08-0xfc0f, BIOS settings: hdc:DMA, hdd:pio
Probing IDE interface ide0...
hda: MAXTOR 6L040J2, ATA DISK drive
hdb: Maxtor 4R080J0, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Probing IDE interface ide1...
hdc: LITE-ON DVD SOHD-167T, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 128KiB
hda: 78177792 sectors (40027 MB) w/1819KiB Cache, CHS=65535/16/63, UDMA(133)
hda: cache flushes supported
 /dev/ide/host0/bus0/target0/lun0: p1 p2
hdb: max request size: 128KiB
hdb: 160086528 sectors (81964 MB) w/2048KiB Cache, CHS=65535/16/63, UDMA(133)
hdb: cache flushes supported
 /dev/ide/host0/bus0/target1/lun0: p1
ide-scsi is deprecated for cd burning! Use ide-cd and give dev=/dev/hdX as device
scsi0 : SCSI host adapter emulation for IDE ATAPI devices
  Vendor: LITE-ON   Model: DVD SOHD-167T     Rev: 9S16
  Type:   CD-ROM                             ANSI SCSI revision: 02
sr0: scsi3-mmc drive: 48x/48x cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
Attached scsi CD-ROM sr0 at scsi0, channel 0, id 0, lun 0
Attached scsi generic sg0 at scsi0, channel 0, id 0, lun 0,  type 5
ACPI: PCI interrupt 0000:00:10.4[C] -> GSI 21 (level, low) -> IRQ 21
ehci_hcd 0000:00:10.4: VIA Technologies, Inc. USB 2.0
ehci_hcd 0000:00:10.4: irq 21, pci mem ffffff0000016000
ehci_hcd 0000:00:10.4: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:10.4: USB 2.0 enabled, EHCI 1.00, driver 2004-May-10
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 8 ports detected
USB Universal Host Controller Interface driver v2.2
ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:10.0: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller
uhci_hcd 0000:00:10.0: irq 21, io base 000000000000c400
uhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ACPI: PCI interrupt 0000:00:10.1[A] -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:10.1: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (#2)
uhci_hcd 0000:00:10.1: irq 21, io base 000000000000c800
uhci_hcd 0000:00:10.1: new USB bus registered, assigned bus number 3
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ACPI: PCI interrupt 0000:00:10.2[B] -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:10.2: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (#3)
uhci_hcd 0000:00:10.2: irq 21, io base 000000000000d000
uhci_hcd 0000:00:10.2: new USB bus registered, assigned bus number 4
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
ACPI: PCI interrupt 0000:00:10.3[B] -> GSI 21 (level, low) -> IRQ 21
uhci_hcd 0000:00:10.3: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (#4)
uhci_hcd 0000:00:10.3: irq 21, io base 000000000000d400
uhci_hcd 0000:00:10.3: new USB bus registered, assigned bus number 5
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 2 ports detected
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.6 (Sun Aug 15 07:17:53 2004 UTC).
via82xx: Assuming DXS channels with 48k fixed sample rate.
         Please try dxs_support=1 or dxs_support=4 option
         and report if it works on your machine.
ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 22 (level, low) -> IRQ 22
PCI: Setting latency timer of device 0000:00:11.5 to 64
usb 3-2: new low speed USB device using address 2
input: USB HID v1.10 Mouse [Logitech USB-PS/2 Optical Mouse] on usb-0000:00:10.1-2
ALSA device list:
  #0: VIA 823x rev60 at 0xd800, irq 22
NET: Registered protocol family 2
IP: routing cache hash table of 8192 buckets, 64Kbytes
TCP: Hash tables configured (established 262144 bind 65536)
NET: Registered protocol family 1
NET: Registered protocol family 17
powernow-k8: Found 1 AMD Athlon 64 / Opteron processors (version 1.00.09b)
powernow-k8: register performance failed
powernow-k8: found PSB header at 0x00000100000f0e30
powernow-k8: table vers: 0x14
powernow-k8: flags: 0x0
powernow-k8: voltage stabilization time: 5(*20us)
powernow-k8: flags2: 0xe
powernow-k8: ramp voltage offset: 2
powernow-k8: isochronous relief time: 3
powernow-k8: maximum voltage step: 0 - 0x1
powernow-k8: numpst: 0x1
powernow-k8: plllocktime: 0x2 (units 1us)
powernow-k8: maxfid: 0xc
powernow-k8: maxvid: 0x4
powernow-k8: numpstates: 0x3
powernow-k8: cfid 0xc, cvid 0x4
powernow-k8:    0 : fid 0x2 (1000 MHz), vid 0x12 (1100 mV)
powernow-k8:    1 : fid 0xa (1800 MHz), vid 0x8 (1350 mV)
powernow-k8:    2 : fid 0xc (2000 MHz), vid 0x6 (1400 mV)
powernow-k8: currfid/vid do not match PST, ignoring
powernow-k8: cpu0, init lo 0x40c, hi 0x1
powernow-k8: policy current frequency 2000000 kHz
powernow-k8: cpu_init done, current fid 0xc, vid 0x4
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0xc, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0xc, currvid 0x4, reqvid 0x6, rvo 0x2
powernow-k8: ph1 complete, currfid 0xc, currvid 0x4
powernow-k8: ph2 null fid transition 0xc
powernow-k8: ph3 (cpu0): starting, currfid 0xc, currvid 0x4
powernow-k8: writing vid 0x6, lo 0x1060c, hi 0x1
powernow-k8: ph3 complete, currfid 0xc, currvid 0x6
powernow-k8: transitioned (cpu0): new fid 0xc, vid 0x6
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0xc, vid 0x6
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: target matches current values (fid 0xc, vid 0x6)
XFS mounting filesystem hda2
Ending clean XFS mount for filesystem: hda2
VFS: Mounted root (xfs filesystem) readonly.
Mounted devfs on /dev
Freeing unused kernel memory: 464k freed
Adding 1953464k swap on /dev/hda1.  Priority:-1 extents:1
XFS mounting filesystem hdb1
Ending clean XFS mount for filesystem: hdb1
eth0: network connection down
eth0: network connection up using port A
    speed:           10
    autonegotiation: yes
    duplex mode:     half
    flowctrl:        none
    irq moderation:  disabled
    scatter-gather:  enabled
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0xc, vid 0x6
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: target matches current values (fid 0xc, vid 0x6)
agpgart: Found an AGP 3.0 compliant device at 0000:00:00.0.
agpgart: Device is in legacy mode, falling back to 2.x
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode
powernow-k8: targ: cpu 0, 1900000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0xc, vid 0x6
powernow-k8: cpu 0 transition to index 1
powernow-k8: table matched fid 0xa, giving vid 0x8
powernow-k8: cpu 0, changing to fid 0xa, vid 0x8
powernow-k8: ph1 (cpu0): start, currfid 0xc, currvid 0x6, reqvid 0x8, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x5
powernow-k8: writing vid 0x5, lo 0x1050c, hi 0x1
powernow-k8: ph1 complete, currfid 0xc, currvid 0x5
powernow-k8: ph2 (cpu0): starting, currfid 0xc, currvid 0x5, reqfid 0xa
powernow-k8: writing fid 0xa, lo 0x1050a, hi 0x2580
powernow-k8: ph2 complete, currfid 0xa, currvid 0x5
powernow-k8: ph3 (cpu0): starting, currfid 0xa, currvid 0x5
powernow-k8: writing vid 0x8, lo 0x1080a, hi 0x1
powernow-k8: ph3 complete, currfid 0xa, currvid 0x8
powernow-k8: transitioned (cpu0): new fid 0xa, vid 0x8
powernow-k8: targ: cpu 0, 1700000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0xa, vid 0x8
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x2, giving vid 0x12
powernow-k8: cpu 0, changing to fid 0x2, vid 0x12
powernow-k8: ph1 (cpu0): start, currfid 0xa, currvid 0x8, reqvid 0x12, rvo 0x3
powernow-k8: ph1 complete, currfid 0xa, currvid 0x8
powernow-k8: ph2 (cpu0): starting, currfid 0xa, currvid 0x8, reqfid 0x2
powernow-k8: writing fid 0x2, lo 0x10802, hi 0x1450
powernow-k8: ph2 complete, currfid 0x2, currvid 0x8
powernow-k8: ph3 (cpu0): starting, currfid 0x2, currvid 0x8
powernow-k8: writing vid 0x12, lo 0x11202, hi 0x1
powernow-k8: ph3 complete, currfid 0x2, currvid 0x12
powernow-k8: transitioned (cpu0): new fid 0x2, vid 0x12
powernow-k8: targ: cpu 0, 900000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x12
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x2, giving vid 0x12
powernow-k8: target matches current values (fid 0x2, vid 0x12)
powernow-k8: targ: cpu 0, 900000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x12
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x2, giving vid 0x12
powernow-k8: target matches current values (fid 0x2, vid 0x12)

--=-kiP7GCO/s+a6Kof4KFCW
Content-Disposition: attachment; filename=dmesg2
Content-Type: text/plain; name=dmesg2; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

g vid 0x12
powernow-k8: target matches current values (fid 0x2, vid 0x12)
powernow-k8: targ: cpu 0, 900000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x12
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x2, giving vid 0x12
powernow-k8: target matches current values (fid 0x2, vid 0x12)
powernow-k8: targ: cpu 0, 900000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x12
powernow-k8: cpu 0 transition to index 0
powernow-k8: table matched fid 0x2, giving vid 0x12
powernow-k8: target matches current values (fid 0x2, vid 0x12)
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x12
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x12, reqvid 0x6, rvo 0x3
powernow-k8: ph1: curr 0x12, req vid 0x6
powernow-k8: writing vid 0x11, lo 0x11102, hi 0x1
powernow-k8: ph1: curr 0x11, req vid 0x6
powernow-k8: writing vid 0x10, lo 0x11002, hi 0x1
powernow-k8: ph1: curr 0x10, req vid 0x6
powernow-k8: writing vid 0xf, lo 0x10f02, hi 0x1
powernow-k8: ph1: curr 0xf, req vid 0x6
powernow-k8: writing vid 0xe, lo 0x10e02, hi 0x1
powernow-k8: ph1: curr 0xe, req vid 0x6
powernow-k8: writing vid 0xd, lo 0x10d02, hi 0x1
powernow-k8: ph1: curr 0xd, req vid 0x6
powernow-k8: writing vid 0xc, lo 0x10c02, hi 0x1
powernow-k8: ph1: curr 0xc, req vid 0x6
powernow-k8: writing vid 0xb, lo 0x10b02, hi 0x1
powernow-k8: ph1: curr 0xb, req vid 0x6
powernow-k8: writing vid 0xa, lo 0x10a02, hi 0x1
powernow-k8: ph1: curr 0xa, req vid 0x6
powernow-k8: writing vid 0x9, lo 0x10902, hi 0x1
powernow-k8: ph1: curr 0x9, req vid 0x6
powernow-k8: writing vid 0x8, lo 0x10802, hi 0x1
powernow-k8: ph1: curr 0x8, req vid 0x6
powernow-k8: writing vid 0x7, lo 0x10702, hi 0x1
powernow-k8: ph1: curr 0x7, req vid 0x6
powernow-k8: writing vid 0x6, lo 0x10602, hi 0x1
powernow-k8: ph1: changing vid for rvo, req 0x5
powernow-k8: writing vid 0x5, lo 0x10502, hi 0x1
powernow-k8: ph1: changing vid for rvo, req 0x4
powernow-k8: writing vid 0x4, lo 0x10402, hi 0x1
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: targ: cpu 0, 2000000 kHz, min 1000000, max 2000000, relation 1
powernow-k8: targ: curr fid 0x2, vid 0x4
powernow-k8: cpu 0 transition to index 2
powernow-k8: table matched fid 0xc, giving vid 0x6
powernow-k8: cpu 0, changing to fid 0xc, vid 0x6
powernow-k8: ph1 (cpu0): start, currfid 0x2, currvid 0x4, reqvid 0x6, rvo 0x3
powernow-k8: ph1: changing vid for rvo, req 0x3
powernow-k8: writing vid 0x3, lo 0x10302, hi 0x1
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed

--=-kiP7GCO/s+a6Kof4KFCW
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--=-kiP7GCO/s+a6Kof4KFCW--


