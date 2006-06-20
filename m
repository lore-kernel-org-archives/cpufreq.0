From: "Ben Kevan" <ben.kevan@gmail.com>
Subject: Re: 2.6.16.x CPUFREQ / SpeedStep-Centrino: couldn't enable
	Enchanced SpeedStep
Date: Mon, 19 Jun 2006 22:24:21 -0700
Message-ID: <b360fed70606192224w63f27116k986ca579ddf9ed5e@mail.gmail.com>
References: <200606191610.40597.ben.kevan@gmail.com>
	<20060619231323.GC17134@redhat.com>
	<200606191807.14091.ben.kevan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200606191807.14091.ben.kevan@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Ben.Kevan@gmail.com, linux@brodo.de

Hi Dave,

I installed 2.6.17 and kept the Kernel Vanilla, and still came up with the
same output as the originating message, here is the dmesg output with
cpufreq.debug=7:

Linux version 2.6.17-default (root@linux-if3t) (gcc version 4.1.0 (SUSE
Linux)) #1 Mon Jun 19 21:10:57 PDT 2006
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 00000000000eee00 (reserved)
 BIOS-e820: 00000000000eee00 - 00000000000ef000 (ACPI NVS)
 BIOS-e820: 00000000000ef000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000003ffd0000 (usable)
 BIOS-e820: 000000003ffd0000 - 000000003ffe0000 (ACPI data)
 BIOS-e820: 000000003ffe0000 - 0000000040000000 (reserved)
 BIOS-e820: 00000000feda0000 - 00000000fedc0000 (reserved)
 BIOS-e820: 00000000ffb80000 - 00000000ffc00000 (reserved)
 BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
127MB HIGHMEM available.
896MB LOWMEM available.
On node 0 totalpages: 262096
  DMA zone: 4096 pages, LIFO batch:0
  Normal zone: 225280 pages, LIFO batch:31
  HighMem zone: 32720 pages, LIFO batch:7
DMI 2.3 present.
ACPI: RSDP (v000 TOSHIB                                ) @ 0x000f0180
ACPI: RSDT (v001 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x3ffd0000
ACPI: FADT (v002 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x3ffd0058
ACPI: SSDT (v001 TOSHIB M1       0x20030212 MSFT 0x0100000e) @ 0x3ffd6cd6
ACPI: BOOT (v001 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x3ffd0030
ACPI: DSDT (v001 TOSHIB M1       0x20050329 MSFT 0x0100000e) @ 0x00000000
ACPI: PM-Timer IO Port: 0xd808
Allocating PCI resources starting at 50000000 (gap: 40000000:beda0000)
Built 1 zonelists
Kernel command line: root=/dev/hda1 vga=0x31a    resume=/dev/hda2
splash=silent cpufreq.debug=7
Unknown boot option `cpufreq.debug=7': ignoring
Local APIC disabled by BIOS -- you can enable it with "lapic"
mapped APIC to ffffd000 (01804000)
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Initializing CPU#0
PID hash table entries: 4096 (order: 12, 16384 bytes)
Detected 598.600 MHz processor.
Using pmtmr for high-res timesource
Console: colour dummy device 80x25
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1033856k/1048384k available (1403k kernel code, 13724k reserved,
568k data, 148k init, 130880k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay using timer specific routine.. 1198.33 BogoMIPS
(lpj=2396674)
Security Framework v1.0.0 initialized
Mount-cache hash table entries: 512
CPU: After generic identify, caps: a7e9f9bf 00000000 00000000 00000000
00000180 00000000 00000000
CPU: After vendor identify, caps: a7e9f9bf 00000000 00000000 00000000
00000180 00000000 00000000
CPU: L1 I cache: 32K, L1 D cache: 32K
CPU: L2 cache: 1024K
CPU: After all inits, caps: a7e9f9bf 00000000 00000000 00000040 00000180
00000000 00000000
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU: Intel(R) Pentium(R) M processor 1600MHz stepping 05
Checking 'hlt' instruction... OK.
SMP alternatives: switching to UP code
Freeing SMP alternatives: 0k freed
ACPI: setting ELCR to 0200 (from 0a00)
checking if image is initramfs... it is
Freeing initrd memory: 2241k freed
NET: Registered protocol family 16
ACPI: bus type pci registered
PCI: PCI BIOS revision 2.10 entry at 0xfd65f, last bus=5
Setting up standard PCI resources
ACPI: Subsystem revision 20060127
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 10 *11)
ACPI: PCI Root Bridge [PCI0] (0000:00)
PCI: Probing PCI hardware (bus 00)
ACPI: Assume root bridge [\_SB_.PCI0] bus is 0
PCI quirk: region d800-d87f claimed by ICH4 ACPI/GPIO/TCO
PCI quirk: region eec0-eeff claimed by ICH4 GPIO
PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
Boot video device is 0000:01:00.0
PCI: Transparent bridge - 0000:00:1e.0
PCI: Bus #05 (-#08) is hidden behind transparent bridge #02 (-#05) (try
'pci=assign-busses')
Please report the result to linux-kernel to fix this permanently
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIB._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCI1._PRT]
ACPI: Device [LCD] status [0000000e]: functional but not present; setting
present
ACPI: Power Resource [PFAN] (off)
Linux Plug and Play Support v0.97 (c) Adam Belay
pnp: PnP ACPI init
pnp: PnP ACPI: found 12 devices
PCI: Using ACPI for IRQ routing
PCI: If a device doesn't work, try "pci=routeirq".  If it helps, post a
report
TC classifier action (bugs to netdev@vger.kernel.org cc hadi@cyberus.ca)
PCI: Bridge: 0000:00:01.0
  IO window: disabled.
  MEM window: dff00000-f7ffffff
  PREFETCH window: 54000000-540fffff
PCI: Bus 3, cardbus bridge: 0000:02:0b.0
  IO window: 0000c000-0000c0ff
  IO window: 0000c400-0000c4ff
  PREFETCH window: 50000000-51ffffff
  MEM window: 56000000-57ffffff
PCI: Bus 5, cardbus bridge: 0000:02:0b.1
  IO window: 0000c800-0000c8ff
  IO window: 0000cc00-0000ccff
  PREFETCH window: 52000000-53ffffff
  MEM window: 58000000-59ffffff
PCI: Bridge: 0000:00:1e.0
  IO window: c000-cfff
  MEM window: dfd00000-dfdfffff
  PREFETCH window: 50000000-53ffffff
PCI: Setting latency timer of device 0000:00:1e.0 to 64
PCI: Enabling device 0000:02:0b.0 (0000 -> 0003)
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
PCI: setting IRQ 11 as level-triggered
ACPI: PCI Interrupt 0000:02:0b.0[A] -> Link [LNKA] -> GSI 11 (level, low) ->
IRQ 11
PCI: Enabling device 0000:02:0b.1 (0000 -> 0003)
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
ACPI: PCI Interrupt 0000:02:0b.1[B] -> Link [LNKD] -> GSI 11 (level, low) ->
IRQ 11
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
TCP established hash table entries: 131072 (order: 7, 524288 bytes)
TCP bind hash table entries: 65536 (order: 6, 262144 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
Simple Boot Flag at 0x7c set to 0x1
apm: BIOS version 1.2 Flags 0x02 (Driver version 1.16ac)
apm: overridden by ACPI.
audit: initializing netlink socket (disabled)
audit(1150780789.860:1): initialized
highmem bounce pool size: 64 pages
Total HugeTLB memory allocated, 0
VFS: Disk quotas dquot_6.5.1
Dquot-cache hash table entries: 1024 (order 0, 4096 bytes)
Initializing Cryptographic API
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
vesafb: framebuffer at 0xf0000000, mapped to 0xf8880000, using 5120k, total
32768k
vesafb: mode is 1280x1024x16, linelength=2560, pages=11
vesafb: protected mode interface info at c000:85ba
vesafb: scrolling: redraw
vesafb: Truecolor: size=0:5:6:5, shift=0:11:5:0
Console: switching to colour frame buffer device 160x64
fb0: VESA VGA frame buffer device
ACPI: Fan [FAN] (off)
ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3])
isapnp: Scanning for PnP cards...
isapnp: No Plug & Play device found
Real Time Clock Driver v1.12ac
Floppy drive(s): fd0 is 1.44M
floppy0: no floppy controllers found
RAMDISK driver initialized: 16 RAM disks of 64000K size 1024 blocksize
PNP: PS/2 Controller [PNP0303:KBC,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
serio: i8042 AUX port at 0x60,0x64 irq 12
serio: i8042 KBD port at 0x60,0x64 irq 1
mice: PS/2 mouse device common for all mice
input: PC Speaker as /class/input/input0
input: AT Translated Set 2 keyboard as /class/input/input1
NET: Registered protocol family 1
Using IPI Shortcut mode
ACPI wakeup devices:
MPC0 MPC1 GLAN VIY0 VIY1  COM USB1 USB2 USB3 USB4 AMDM PWRB  LID
ACPI: (supports S0 S3 S4 S5)
Freeing unused kernel memory: 148k freed
Write protecting the kernel read-only data: 265k
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
ICH4: IDE controller at PCI slot 0000:00:1f.1
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:1f.1[A] -> Link [LNKC] -> GSI 11 (level, low) ->
IRQ 11
ICH4: chipset revision 3
ICH4: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xbfa0-0xbfa7, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xbfa8-0xbfaf, BIOS settings: hdc:DMA, hdd:pio
Probing IDE interface ide0...
input: DualPoint Stick as /class/input/input2
input: AlpsPS/2 ALPS DualPoint TouchPad as /class/input/input3
hda: TOSHIBA MK4019GAX, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hda: max request size: 128KiB
hda: 78140160 sectors (40007 MB), CHS=65535/16/63, UDMA(100)
hda: cache flushes supported
 hda: hda1 hda2 hda3
Probing IDE interface ide1...
hdc: DW-224E, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
ACPI: Thermal Zone [THRM] (40 C)
Attempting manual resume
ReiserFS: hda1: found reiserfs format "3.6" with standard journal
ReiserFS: hda1: using ordered data mode
ReiserFS: hda1: journal params: device hda1, size 8192, journal first block
18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: hda1: checking transaction log (hda1)
ReiserFS: hda1: Using r5 hash to sort names
Adding 1534196k swap on /dev/hda2.  Priority:-1 extents:1 across:1534196k
Serial: 8250/16550 driver $Revision: 1.90 $ 4 ports, IRQ sharing disabled
serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Linux agpgart interface v0.101 (c) Dave Jones
usbcore: registered new driver usbfs
usbcore: registered new driver hub
agpgart: Detected an Intel 855PM Chipset.
USB Universal Host Controller Interface driver v3.0
agpgart: AGP aperture is 256M @ 0xc0000000
ACPI: PCI Interrupt 0000:00:1d.0[A] -> Link [LNKA] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.0 to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 1
uhci_hcd 0000:00:1d.0: irq 11, io base 0x0000efe0
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.1[B] -> Link [LNKD] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.1 to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:1d.1: irq 11, io base 0x0000ef80
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
hdc: ATAPI 24X DVD-ROM CD-R/RW drive, 1658kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
PCI: Enabling device 0000:00:1d.2 (0000 -> 0001)
ACPI: PCI Interrupt 0000:00:1d.2[C] -> Link [LNKC] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.2 to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1d.2: irq 11, io base 0x000018c0
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
ACPI: PCI Interrupt 0000:02:0b.0[A] -> Link [LNKA] -> GSI 11 (level, low) ->
IRQ 11
Yenta: CardBus bridge found at 0000:02:0b.0 [1179:0001]
PCI: Enabling device 0000:00:1d.7 (0000 -> 0002)
ACPI: PCI Interrupt Link [LNKH] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:1d.7[D] -> Link [LNKH] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.7 to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 4
ehci_hcd 0000:00:1d.7: debug port 1
PCI: cache line size of 32 is not supported by device 0000:00:1d.7
ehci_hcd 0000:00:1d.7: irq 11, io mem 0x54100000
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb4: configuration #1 chosen from 1 choice
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 6 ports detected
Intel(R) PRO/1000 Network Driver - version 7.0.33-k2-NAPI
Copyright (c) 1999-2005 Intel Corporation.
Yenta: ISA IRQ mask 0x04b8, PCI irq 11
Socket status: 30000007
pcmcia: parent PCI bridge I/O window: 0xc000 - 0xcfff
cs: IO port probe 0xc000-0xcfff: clean.
pcmcia: parent PCI bridge Memory window: 0xdfd00000 - 0xdfdfffff
pcmcia: parent PCI bridge Memory window: 0x50000000 - 0x53ffffff
ACPI: PCI Interrupt 0000:02:0b.1[B] -> Link [LNKD] -> GSI 11 (level, low) ->
IRQ 11
Yenta: CardBus bridge found at 0000:02:0b.1 [1179:0001]
i8xx TCO timer: initialized (0xd860). heartbeat=30 sec (nowayout=0)
ieee80211_crypt: registered algorithm 'NULL'
ieee80211: 802.11 data/management/control stack, git-1.1.7
ieee80211: Copyright (C) 2004-2005 Intel Corporation <
jketreno@linux.intel.com>
Yenta: ISA IRQ mask 0x04b8, PCI irq 11
Socket status: 30000007
pcmcia: parent PCI bridge I/O window: 0xc000 - 0xcfff
cs: IO port probe 0xc000-0xcfff: clean.
pcmcia: parent PCI bridge Memory window: 0xdfd00000 - 0xdfdfffff
pcmcia: parent PCI bridge Memory window: 0x50000000 - 0x53ffffff
ipw2100: Intel(R) PRO/Wireless 2100 Network Driver, git-1.2.2
ipw2100: Copyright(c) 2003-2006 Intel Corporation
ACPI: PCI Interrupt 0000:02:0a.0[A] -> Link [LNKD] -> GSI 11 (level, low) ->
IRQ 11
ipw2100: Detected Intel PRO/Wireless 2100 Network Connection
ACPI: PCI Interrupt Link [LNKE] enabled at IRQ 11
ACPI: PCI Interrupt 0000:02:09.0[A] -> Link [LNKE] -> GSI 11 (level, low) ->
IRQ 11
e1000: 0000:02:09.0: e1000_probe: (PCI:33MHz:32-bit) 00:0e:7b:7c:60:a2
e1000: eth1: e1000_probe: Intel(R) PRO/1000 Network Connection
shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
PCI: Enabling device 0000:00:1f.5 (0000 -> 0003)
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:1f.5[B] -> Link [LNKB] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1f.5 to 64
cs: IO port probe 0x100-0x3af: clean.
cs: IO port probe 0x3e0-0x4ff: excluding 0x4d0-0x4d7
cs: IO port probe 0x820-0x8ff: clean.
cs: IO port probe 0xc00-0xcf7: clean.
cs: IO port probe 0xa00-0xaff: clean.
cs: IO port probe 0x100-0x3af: clean.
cs: IO port probe 0x3e0-0x4ff: excluding 0x4d0-0x4d7
cs: IO port probe 0x820-0x8ff: clean.
cs: IO port probe 0xc00-0xcf7: clean.
cs: IO port probe 0xa00-0xaff: clean.
hw_random: RNG not detected
ALSA sound/pci/ac97/ac97_codec.c:1905: AC'97 1 does not respond - RESET
ALSA sound/pci/ac97/ac97_codec.c:1914: AC'97 1 access is not valid
[0xffffffff], removing mixer.
ALSA sound/pci/intel8x0.c:2126: Unable to initialize codec #1
intel8x0_measure_ac97_clock: measured 55799 usecs
intel8x0: clocking to 48000
loop: loaded (max 8 devices)
ReiserFS: hda3: found reiserfs format "3.6" with standard journal
ReiserFS: hda3: using ordered data mode
ReiserFS: hda3: journal params: device hda3, size 8192, journal first block
18, max trans len 1024, max batch 900, max commit age 30, max trans age 30
ReiserFS: hda3: checking transaction log (hda3)
ReiserFS: hda3: Using r5 hash to sort names
ip_tables: (C) 2000-2006 Netfilter Core Team
Netfilter messages via NETLINK v0.30.
ip_conntrack version 2.4 (8190 buckets, 65520 max) - 224 bytes per conntrack
ACPI: AC Adapter [ADP1] (on-line)
ACPI: Battery Slot [BAT1] (battery present)
ACPI: Battery Slot [BAT2] (battery absent)
ACPI: Power Button (FF) [PWRF]
ACPI: Power Button (CM) [PWRB]
ACPI: Lid Switch [LID]
toshiba_acpi: Toshiba Laptop ACPI Extras version 0.18
toshiba_acpi:     HCI method: \_SB_.VALD.GHCI
BIOS EDD facility v0.16 2004-Jun-25, 1 devices found
audit(1150780823.618:2): audit_backlog_limit=256 old=64 by auid=4294967295
audit(1150780823.682:3): audit_pid=2446 old=0 by auid=4294967295
IA-32 Microcode Update Driver: v1.14 <tigran@veritas.com>
speedstep-centrino: couldn't enable Enhanced SpeedStep
e1000: eth0: e1000_watchdog_task: NIC Link is Up 100 Mbps Full Duplex
NET: Registered protocol family 17
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=78 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353 LEN=58
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=78 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353 LEN=58
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=78 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353 LEN=58
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=112 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353
LEN=92
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=112 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353
LEN=92
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=112 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353
LEN=92
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=112 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353
LEN=92
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=112 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353
LEN=92
ISO 9660 Extensions: Microsoft Joliet Level 3
ISO 9660 Extensions: RRIP_1991A
SFW2-INext-DROP-DEFLT IN=eth0 OUT= MAC= SRC=192.168.1.100
DST=224.0.0.251LEN=112 TOS=0x00 PREC=0x00 TTL=255 ID=0 DF PROTO=UDP
SPT=5353 DPT=5353
LEN=92
bkevan@linux-if3t:~>

Also, Yes, I have the most updated BIOS for my computer.

Please let me know what you get out of this. Again thank you guys so much
for your assistance. Wish there were a "Donation" bin :o)

Ben

On 6/19/06, Ben Kevan <ben.kevan@gmail.com> wrote:
>
> Hi Dave,
>
> Thanks for the awesome speed reply. I have not yet tried with 2.6.17, I
> will
> have to find the SuSE Kernel Patches to see if I can install vanilla
> kernel
> then SuSE patch it, and log on.
>
> You wouldn't happen to know where they are located off the top of your
> head
> would you? If not, no worries, I can find them. Is there a known broken
> cpufreq issue in 2.6.16.x ? that would possibly cause this speedstep
> issue?
>
> I'll try to get back to you tomorrow with the results of 2.6.17 if I can
> figure out how to install the Vanilla Kernel into SuSE10.1
>
> Ben
>
> On Monday 19 June 2006 16:13, Dave Jones wrote:
> > On Mon, Jun 19, 2006 at 04:10:40PM -0700, Ben Kevan wrote:
> >  > Hi,
> >  >
> >  > I copied both on this because I thought you both may be interested.
> My
> >  > problem is, my Toshiba Tecra M1 will only run at 598Mhz, and I can
> not
> >  > use toshutils or anything else to configure speedstep to run higher.
> Or
> >  > in any other way can I use it to run higher.
> >  >
> >  > Below are a bunch of commands to give you an idea of what's going on.
> Is
> >  > this a bug with the 2.6.16.x build? Or is it something else that I am
> >  > just oblivious too (ACPI?).
> >  >
> >  > Any information would be greatly appreciated.
> >  >
> >  > LSHESU01004839:/home/bkevan # dmesg | grep speedstep
> >  > speedstep-centrino: couldn't enable Enhanced SpeedStep
> >  > speedstep-centrino: couldn't enable Enhanced SpeedStep
> >  > speedstep-centrino: couldn't enable Enhanced SpeedStep
> >  > speedstep-centrino: couldn't enable Enhanced SpeedStep
> >  >
> >  > LSHESU01004839:/home/bkevan # modprobe speedstep_centrino
> >  > FATAL: Error inserting speedstep_centrino
> >  >
> (/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/sp
> >  >eedstep-centrino.ko): No such device
> >  > LSHESU01004839:/home/bkevan # modprobe acpi_cpufreq
> >  > FATAL: Error inserting acpi_cpufreq
> >  >
> (/lib/modules/2.6.16.13-4-default/kernel/arch/i386/kernel/cpu/cpufreq/ac
> >  >pi-cpufreq.ko): No such device
> >
> > Does this still happen in 2.6.17 ?
> > If so, can you boot with cpufreq.debug=7 and post the output of dmesg
> here
> > ?
> >
> > Thanks,
> >
> >               Dave
>
