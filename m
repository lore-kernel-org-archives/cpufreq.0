From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6005] New: can't change cpu frequency on pentium M
Date: Fri, 3 Feb 2006 13:28:56 -0800
Message-ID: <200602032128.k13LSuEG010206@fire-2.osdl.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6005

           Summary: can't change cpu frequency on pentium M
    Kernel Version: 2.6.16-rc2
            Status: NEW
          Severity: blocking
             Owner: cpufreq@www.linux.org.uk
         Submitter: nahoo82@terra.es


Most recent kernel where this bug did not occur: 2.6.16-rc1
Distribution: Debian Sid
Hardware Environment: 


dmesg
 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 2048K
CPU: After all inits, caps: afe9fbff 00100000 00000000 00000040 00000180
00000000 00000000
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU: Intel(R) Pentium(R) M processor 1.86GHz stepping 08
Checking 'hlt' instruction... OK.
ENABLING IO-APIC IRQs
..TIMER: vector=0x31 apic1=0 pin1=2 apic2=-1 pin2=-1
checking if image is initramfs... it is
Freeing initrd memory: 2064k freed
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: PCI BIOS revision 2.10 entry at 0xfd944, last bus=7
PCI: Using MMCONFIG
ACPI: Subsystem revision 20060127
ACPI: Interpreter enabled
ACPI: Using IOAPIC for interrupt routing
ACPI Error (nsxfeval-0242): Handle is NULL and Pathname is relative [20060127]
ACPI Error (nsxfeval-0242): Handle is NULL and Pathname is relative [20060127]
ACPI Error (nsxfeval-0242): Handle is NULL and Pathname is relative [20060127]
ACPI Error (nsxfeval-0242): Handle is NULL and Pathname is relative [20060127]
ACPI: PCI Root Bridge [PCI0] (0000:00)
PCI: Probing PCI hardware (bus 00)
Boot video device is 0000:00:02.0
PCI quirk: region 1000-107f claimed by ICH6 ACPI/GPIO/TCO
PCI quirk: region 1180-11bf claimed by ICH6 GPIO
PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.2
PCI: Transparent bridge - 0000:00:1e.0
PCI: Bus #07 (-#0a) may be hidden behind transparent bridge #06 (-#07) (try
'pci=assign-busses')
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.RP01._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIB._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7 *10 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 5 6 7 11 12 14 15) *10
ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7 10 12 14 15) *11
ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 5 6 7 10 12 14 15) *11
ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 4 5 6 7 11 12 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKG] (IRQs 1 3 4 5 6 7 10 12 14 15) *11
ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 7 *11 12 14 15)
ACPI: Embedded Controller [EC0] (gpe 29) interrupt mode.
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: PnP ACPI init
pnp: PnP ACPI: found 10 devices
PCI: Using ACPI for IRQ routing
PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a report
pnp: 00:01: ioport range 0xfe00-0xfe7f has been reserved
pnp: 00:01: ioport range 0xfe80-0xfeff has been reserved
pnp: 00:01: ioport range 0xff00-0xff7f has been reserved
PCI: Ignore bogus resource 6 [0:0] of 0000:00:02.0
PCI: Bridge: 0000:00:1c.0
  IO window: 3000-3fff
  MEM window: b4000000-b7ffffff
  PREFETCH window: d0000000-d3ffffff
PCI: Bus 7, cardbus bridge: 0000:06:04.0
  IO window: 00004000-000040ff
  IO window: 00004400-000044ff
  PREFETCH window: 50000000-51ffffff
  MEM window: 54000000-55ffffff
PCI: Bridge: 0000:00:1e.0
  IO window: 4000-4fff
  MEM window: b8000000-b80fffff
  PREFETCH window: 50000000-51ffffff
ACPI: PCI Interrupt 0000:00:1c.0[A] -> GSI 17 (level, low) -> IRQ 169
PCI: Setting latency timer of device 0000:00:1c.0 to 64
PCI: Setting latency timer of device 0000:00:1e.0 to 64
ACPI: PCI Interrupt 0000:06:04.0[A] -> GSI 16 (level, low) -> IRQ 177
Simple Boot Flag at 0x36 set to 0x1
audit: initializing netlink socket (disabled)
audit(1139004474.691:1): initialized
highmem bounce pool size: 64 pages
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
io scheduler noop registered
io scheduler cfq registered (default)
ACPI: PCI Interrupt 0000:00:1c.0[A] -> GSI 17 (level, low) -> IRQ 169
PCI: Setting latency timer of device 0000:00:1c.0 to 64
assign_interrupt_mode Found MSI capability
Allocate Port Service[0000:00:1c.0:pcie00]
Allocate Port Service[0000:00:1c.0:pcie02]
Allocate Port Service[0000:00:1c.0:pcie03]
vesafb: framebuffer at 0xc0000000, mapped to 0xf8880000, using 3072k, total 7872k
vesafb: mode is 1024x768x16, linelength=2048, pages=4
vesafb: protected mode interface info at 00ff:44f0
vesafb: scrolling: redraw
vesafb: Truecolor: size=0:5:6:5, shift=0:11:5:0
Console: switching to colour frame buffer device 128x48
fb0: VESA VGA frame buffer device
PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
i8042.c: Detected active multiplexing controller, rev 1.1.
serio: i8042 AUX0 port at 0x60,0x64 irq 12
serio: i8042 AUX1 port at 0x60,0x64 irq 12
serio: i8042 AUX2 port at 0x60,0x64 irq 12
serio: i8042 AUX3 port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing enabled
ACPI: PCI Interrupt 0000:00:1e.3[B] -> GSI 20 (level, low) -> IRQ 201
ACPI: PCI interrupt for device 0000:00:1e.3 disabled
RAMDISK driver initialized: 16 RAM disks of 8192K size 1024 blocksize
MC: drivers/edac/edac_mc.c version edac_mc  Ver: 2.0.0 Feb  3 2006
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 7, 524288 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
TCP bic registered
ieee80211: 802.11 data/management/control stack, git-1.1.7
ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
ieee80211_crypt: registered algorithm 'NULL'
Using IPI Shortcut mode
ACPI wakeup devices:
RP01 USB1 USB2 USB3 USB4 USB7 MODM
ACPI: (supports S0 S3 S4 S5)
Freeing unused kernel memory: 168k freed
usbcore: registered new driver usbfs
usbcore: registered new driver hub
USB Universal Host Controller Interface driver v2.3
ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 23 (level, low) -> IRQ 209
PCI: Setting latency timer of device 0000:00:1d.0 to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 1
uhci_hcd 0000:00:1d.0: irq 209, io base 0x00001820
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.1[B] -> GSI 19 (level, low) -> IRQ 217
PCI: Setting latency timer of device 0000:00:1d.1 to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:1d.1: irq 217, io base 0x00001840
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.2[C] -> GSI 18 (level, low) -> IRQ 225
PCI: Setting latency timer of device 0000:00:1d.2 to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1d.2: irq 225, io base 0x00001860
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
usb 1-1: new full speed USB device using uhci_hcd and address 2
ACPI: PCI Interrupt 0000:00:1d.3[D] -> GSI 16 (level, low) -> IRQ 177
PCI: Setting latency timer of device 0000:00:1d.3 to 64
uhci_hcd 0000:00:1d.3: UHCI Host Controller
uhci_hcd 0000:00:1d.3: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1d.3: irq 177, io base 0x00001880
usb usb4: configuration #1 chosen from 1 choice
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
usb 1-1: configuration #1 chosen from 1 choice
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 4 ports detected
input: AT Translated Set 2 keyboard as /class/input/input0
ACPI: PCI Interrupt 0000:00:1d.7[A] -> GSI 23 (level, low) -> IRQ 209
PCI: Setting latency timer of device 0000:00:1d.7 to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: debug port 1
PCI: cache line size of 32 is not supported by device 0000:00:1d.7
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 5
ehci_hcd 0000:00:1d.7: irq 209, io mem 0xb0040000
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb5: configuration #1 chosen from 1 choice
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 8 ports detected
usb 1-1: USB disconnect, address 2
usbcore: registered new driver usbkbd
drivers/usb/input/usbkbd.c: :USB HID Boot Protocol keyboard driver
usbcore: registered new driver hiddev
usbcore: registered new driver usbhid
drivers/usb/input/hid-core.c: v2.6:USB HID core driver
mice: PS/2 mouse device common for all mice
SCSI subsystem initialized
libata version 1.20 loaded.
ata_piix 0000:00:1f.2: version 1.05
ACPI: PCI Interrupt 0000:00:1f.2[B] -> GSI 19 (level, low) -> IRQ 217
PCI: Setting latency timer of device 0000:00:1f.2 to 64
ata1: SATA max UDMA/133 cmd 0x1F0 ctl 0x3F6 bmdma 0x18B0 irq 14
ata1: dev 0 cfg 49:0f00 82:746b 83:7fe8 84:4023 85:f469 86:3c48 87:4023 88:203f
ata1: dev 0 ATA-6, max UDMA/100, 156301488 sectors: LBA48
ata1(0): applying bridge limits
ata1: dev 0 configured for UDMA/100
scsi0 : ata_piix
  Vendor: ATA       Model: IC25N080ATMR04-0  Rev: MO4O
  Type:   Direct-Access                      ANSI SCSI revision: 05
ata2: SATA max UDMA/133 cmd 0x170 ctl 0x376 bmdma 0x18B8 irq 15
usb 1-1: new full speed USB device using uhci_hcd and address 3
ata2: dev 0 cfg 49:0f00 82:0000 83:0000 84:0000 85:0000 86:0000 87:0000 88:0407
ata2: dev 0 ATAPI, max UDMA/33
ata2(0): applying bridge limits
ata2: dev 0 configured for UDMA/33
scsi1 : ata_piix
  Vendor: MATSHITA  Model: DVD-RAM UJ-831S   Rev: 1.40
  Type:   CD-ROM                             ANSI SCSI revision: 05
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
SCSI device sda: 156301488 512-byte hdwr sectors (80026 MB)
sda: Write Protect is off
sda: Mode Sense: 00 3a 00 00
SCSI device sda: drive cache: write back
usb 1-1: configuration #1 chosen from 1 choice
SCSI device sda: 156301488 512-byte hdwr sectors (80026 MB)
hub 1-1:1.0: USB hub found
sda: Write Protect is off
sda: Mode Sense: 00 3a 00 00
SCSI device sda: drive cache: write back
hub 1-1:1.0: 4 ports detected
 sda: sda1 sda2 < sda5 > sda3
sd 0:0:0:0: Attached scsi disk sda
device-mapper: 4.5.0-ioctl (2005-10-04) initialised: dm-devel@redhat.com
SGI XFS with ACLs, security attributes, realtime, large block numbers, no debug
enabled
SGI XFS Quota Management subsystem
XFS mounting filesystem dm-0
usb 1-1.2: new full speed USB device using uhci_hcd and address 4
Ending clean XFS mount for filesystem: dm-0
usb 1-1.2: configuration #1 chosen from 1 choice
input: USB HIDBP Keyboard 05f3:0007 as /class/input/input1
input: HID 05f3:0007 as /class/input/input2
input: USB HID v1.00 Device [HID 05f3:0007] on usb-0000:00:1d.0-1.2
usb 1-1.4: new low speed USB device using uhci_hcd and address 5
usb 1-1.4: configuration #1 chosen from 1 choice
input: Logitech USB Trackball as /class/input/input3
input: USB HID v1.10 Mouse [Logitech USB Trackball] on usb-0000:00:1d.0-1.4
NET: Registered protocol family 1
ACPI: PCI Interrupt 0000:02:00.0[A] -> GSI 16 (level, low) -> IRQ 177
PCI: Setting latency timer of device 0000:02:00.0 to 64
sky2 v0.13 addr 0xb4000000 irq 177 Yukon-FE (0xb7) rev 1
sky2 eth0: addr 00:0f:b0:84:80:56
hw_random: RNG not detected
Real Time Clock Driver v1.12ac
parport: PnPBIOS parport detected.
parport0: PC-style at 0x378, irq 7 [PCSPP,TRISTATE,EPP]
Linux agpgart interface v0.101 (c) Dave Jones
agpgart: Detected an Intel 915GM Chipset.
agpgart: Detected 7932K stolen memory.
agpgart: AGP aperture is 256M @ 0xc0000000
ACPI: PCI Interrupt 0000:00:1e.2[A] -> GSI 17 (level, low) -> IRQ 169
PCI: Setting latency timer of device 0000:00:1e.2 to 64
input: PS/2 Mouse as /class/input/input4
input: AlpsPS/2 ALPS GlidePoint as /class/input/input5
ipw2200: Intel(R) PRO/Wireless 2200/2915 Network Driver, git-1.0.8
ipw2200: Copyright(c) 2003-2005 Intel Corporation
ieee1394: Initialized config rom entry `ip1394'
sr0: scsi3-mmc drive: 24x/24x writer dvd-ram cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi CD-ROM sr0
intel8x0_measure_ac97_clock: measured 50437 usecs
intel8x0: clocking to 48000
ACPI: PCI Interrupt 0000:00:1e.3[B] -> GSI 20 (level, low) -> IRQ 201
PCI: Setting latency timer of device 0000:00:1e.3 to 64
ACPI: PCI Interrupt 0000:06:04.0[A] -> GSI 16 (level, low) -> IRQ 177
Yenta: CardBus bridge found at 0000:06:04.0 [1179:ff00]
Yenta: Enabling burst memory read transactions
Yenta: Using CSCINT to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta TI: socket 0000:06:04.0, mfunc 0x10aa1b22, devctl 0x66
Yenta: ISA IRQ mask 0x0c78, PCI irq 177
Socket status: 30000006
pcmcia: parent PCI bridge I/O window: 0x4000 - 0x4fff
pcmcia: parent PCI bridge Memory window: 0xb8000000 - 0xb80fffff
pcmcia: parent PCI bridge Memory window: 0x50000000 - 0x51ffffff
ACPI: PCI Interrupt 0000:06:04.2[C] -> GSI 18 (level, low) -> IRQ 225
ohci1394: fw-host0: OHCI-1394 1.1 (PCI): IRQ=[225]  MMIO=[b8008000-b80087ff] 
Max Packet=[2048]  IR/IT contexts=[4/8]
ACPI: PCI Interrupt 0000:06:02.0[A] -> GSI 22 (level, low) -> IRQ 233
ipw2200: Detected Intel PRO/Wireless 2200BG Network Connection
ieee1394: Host added: ID:BUS[0-00:1023]  GUID[00023f556940415e]
eth1394: eth2: IEEE-1394 IPv4 over 1394 Ethernet (fw-host0)
ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3] C4[C3])
ACPI: Battery Slot [BAT1] (battery present)
fuse init (API version 7.6)
ipw2200: Firmware error detected.  Restarting.
ipw2200: Sysfs 'error' log captured.
XFS mounting filesystem dm-2
ipw2200: Firmware error detected.  Restarting.
ipw2200: Sysfs 'error' log already exists.
Ending clean XFS mount for filesystem: dm-2
NTFS driver 2.1.25 [Flags: R/W MODULE].
NTFS volume version 3.1.
NTFS-fs warning (device sda1): load_system_files(): $LogFile is not clean.  Will
not be able to remount read-write.  Mount in Windows.
pcmcia: Detected deprecated PCMCIA ioctl usage.
pcmcia: This interface will soon be removed from the kernel; please expect
breakage unless you upgrade to new tools.
pcmcia: see http://www.kernel.org/pub/linux/utils/kernel/pcmcia/pcmcia.html for
details.
hw_random: RNG not detected
NET: Registered protocol family 17
ip_tables: (C) 2000-2006 Netfilter Core Team
Netfilter messages via NETLINK v0.30.
ip_conntrack version 2.4 (8119 buckets, 64952 max) - 232 bytes per conntrack
Inbound IN=eth1 OUT= MAC=00:12:f0:6d:e2:55:00:03:c9:b4:57:b8:08:00
SRC=85.178.231.253 DST=192.168.2.32 LEN=1480 TOS=0x00 PREC=0x00 TTL=121 ID=10597
DF PROTO=TCP SPT=6974 DPT=39155 WINDOW=65518 RES=0x00 ACK PSH URGP=0
ACPI: AC Adapter [ACAD] (on-line)
ACPI: Power Button (FF) [PWRF]
ACPI: Lid Switch [LID0]
ACPI: Power Button (CM) [PWRB]
lp0: using parport0 (interrupt-driven).
[drm] Initialized drm 1.0.1 20051102
ACPI: PCI Interrupt 0000:00:02.0[A] -> GSI 16 (level, low) -> IRQ 177
[drm] Initialized i915 1.4.0 20060119 on minor 0




cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.86GHz
stepping        : 8
cpu MHz         : 1862.249
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov
pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
bogomips        : 3728.77

Problem Description:

The cpu frequency is alwais at maximun, and the aplications that change it
doesn't work. There is no /sys/devices/system/cpu/cpu0/cpufreq/ dir.

------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
