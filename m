From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 8601] 'conservative' governor never changes cpu speed
	(2.6.22.5)
Date: Sat,  1 Sep 2007 22:23:07 -0700 (PDT)
Message-ID: <20070902052307.B7F8D108012@picon.linux-foundation.org>
References: <bug-8601-3570@http.bugzilla.kernel.org/>
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-8601-3570@http.bugzilla.kernel.org/>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=8601


paul14075@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
      KernelVersion|2.6.21.3                    |2.6.22.5
            Summary|'conservative' governor     |'conservative' governor
                   |never changes cpu speed     |never changes cpu speed
                   |(2.6.21.3)                  |(2.6.22.5)




------- Comment #2 from paul14075@gmail.com  2007-09-01 22:23 -------
I am using the kernel acpi module I believe, and I didn't even know there was
centrino speedstep module.  I'll attach my kernel config if it'll help.  I now
have 2.6.22.5 (compiled myself & running on fedora7).  The 'conservative'
governor still doesn't work right.  However I don't consider it a huge problem
because the 'ondemand' governor works fine.  (I do believe that conservative is
slightly better with power consumption but I may just be imagining that.) 
Anyway, heres the dmesg with cpufreq.debug=7.  I rebooted, the default
'ondemand' governor loaded.  i started glxgears, it jumped to the full 1.7GHz. 
I switched to 'conservative' governor and ran glxgears and it stayed at 600MHz.

>Time: acpi_pm clocksource has been installed.
Switched to high resolution mode on CPU 0
Clocksource tsc unstable (delta = -490676515 ns)
floppy0: no floppy controllers found
Intel(R) PRO/1000 Network Driver - version 7.3.20-k2
Copyright (c) 1999-2006 Intel Corporation.
ACPI: PCI Interrupt 0000:02:01.0[A] -> Link [LNKA] -> GSI 11 (level, low) ->
IRQ 11
e1000: 0000:02:01.0: e1000_probe: (PCI:33MHz:32-bit) 00:11:25:80:30:41
e1000: eth0: e1000_probe: Intel(R) PRO/1000 Network Connection
st: Version 20070203, fixed bufsize 32768, s/g segs 256
osst :I: Tape driver with OnStream support version 0.99.4
osst :I: $Id: osst.c,v 1.73 2005/01/01 21:13:34 wriede Exp $
SCSI Media Changer driver v0.25
ata_piix 0000:00:1f.1: version 2.11
PCI: Enabling device 0000:00:1f.1 (0005 -> 0007)
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:1f.1[A] -> Link [LNKC] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1f.1 to 64
scsi0 : ata_piix
scsi1 : ata_piix
ata1: PATA max UDMA/100 cmd 0x000101f0 ctl 0x000103f6 bmdma 0x00011860 irq 14
ata2: PATA max UDMA/100 cmd 0x00010170 ctl 0x00010376 bmdma 0x00011868 irq 15
ata1.00: ATA-6: HTS726060M9AT00, MH4OA6GA, max UDMA/100
ata1.00: 117210240 sectors, multi 16: LBA
ata1.00: configured for UDMA/100
ata2.00: ATAPI: HL-DT-STCD-RW/DVD DRIVE GCC-4242N, 0201, max UDMA/33
ata2.00: configured for UDMA/33
scsi 0:0:0:0: Direct-Access     ATA      HTS726060M9AT00  MH4O PQ: 0 ANSI: 5
sd 0:0:0:0: [sda] 117210240 512-byte hardware sectors (60012 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support
DPO
or FUA
sd 0:0:0:0: [sda] 117210240 512-byte hardware sectors (60012 MB)
sd 0:0:0:0: [sda] Write Protect is off
sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support
DPO
or FUA
 sda: sda1 sda2 sda3 sda4 < sda5 sda6 sda7 >
sd 0:0:0:0: [sda] Attached SCSI disk
sd 0:0:0:0: Attached scsi generic sg0 type 0
scsi 1:0:0:0: CD-ROM            HL-DT-ST RW/DVD GCC-4242N 0201 PQ: 0 ANSI: 5
sr0: scsi3-mmc drive: 24x/24x writer cd/rw xa/form2 cdda tray
Uniform CD-ROM driver Revision: 3.20
sr 1:0:0:0: Attached scsi CD-ROM sr0
sr 1:0:0:0: Attached scsi generic sg1 type 5
Yenta: CardBus bridge found at 0000:02:00.0 [1014:0552]
Yenta: Using INTVAL to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta TI: socket 0000:02:00.0, mfunc 0x01d21b22, devctl 0x64
Yenta: ISA IRQ mask 0x04f8, PCI irq 11
Socket status: 30000086
pcmcia: parent PCI bridge I/O window: 0x4000 - 0x8fff
pcmcia: parent PCI bridge Memory window: 0xc0200000 - 0xcfffffff
pcmcia: parent PCI bridge Memory window: 0xe8000000 - 0xefffffff
Yenta: CardBus bridge found at 0000:02:00.1 [1014:0552]
Yenta: Using INTVAL to route CSC interrupts to PCI
Yenta: Routing CardBus interrupts to PCI
Yenta TI: socket 0000:02:00.1, mfunc 0x01d21b22, devctl 0x64
Yenta: ISA IRQ mask 0x04f8, PCI irq 11
Socket status: 30000086
pcmcia: parent PCI bridge I/O window: 0x4000 - 0x8fff
pcmcia: parent PCI bridge Memory window: 0xc0200000 - 0xcfffffff
pcmcia: parent PCI bridge Memory window: 0xe8000000 - 0xefffffff
ACPI: PCI Interrupt Link [LNKH] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:1d.7[D] -> Link [LNKH] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.7 to 64
ehci_hcd 0000:00:1d.7: EHCI Host Controller
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
ehci_hcd 0000:00:1d.7: debug port 1
PCI: cache line size of 32 is not supported by device 0000:00:1d.7
ehci_hcd 0000:00:1d.7: irq 11, io mem 0xc0000000
ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
usb usb1: configuration #1 chosen from 1 choice
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
ohci_hcd: 2006 August 04 USB 1.1 'Open' Host Controller (OHCI) Driver
USB Universal Host Controller Interface driver v3.0
ACPI: PCI Interrupt 0000:00:1d.0[A] -> Link [LNKA] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.0 to 64
uhci_hcd 0000:00:1d.0: UHCI Host Controller
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
uhci_hcd 0000:00:1d.0: irq 11, io base 0x00001800
usb usb2: configuration #1 chosen from 1 choice
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
ACPI: PCI Interrupt 0000:00:1d.1[B] -> Link [LNKD] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.1 to 64
uhci_hcd 0000:00:1d.1: UHCI Host Controller
uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 3
uhci_hcd 0000:00:1d.1: irq 11, io base 0x00001820
usb usb3: configuration #1 chosen from 1 choice
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 2 ports detected
ACPI: PCI Interrupt 0000:00:1d.2[C] -> Link [LNKC] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1d.2 to 64
uhci_hcd 0000:00:1d.2: UHCI Host Controller
uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 4
uhci_hcd 0000:00:1d.2: irq 11, io base 0x00001840
usb usb4: configuration #1 chosen from 1 choice
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 2 ports detected
Initializing USB Mass Storage driver...
usb 3-2: new low speed USB device using uhci_hcd and address 2
usb 3-2: configuration #1 chosen from 1 choice
usbcore: registered new interface driver usb-storage
USB Mass Storage support registered.
usbcore: registered new interface driver libusual
PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
serio: i8042 KBD port at 0x60,0x64 irq 1
serio: i8042 AUX port at 0x60,0x64 irq 12
mice: PS/2 mouse device common for all mice
input: AT Translated Set 2 keyboard as /class/input/input3
input: PC Speaker as /class/input/input4
Synaptics Touchpad, model: 1, fw: 5.9, id: 0x2c6ab1, caps: 0x884793/0x0
serio: Synaptics pass-through port at isa0060/serio1/input0
input: SynPS/2 Synaptics TouchPad as /class/input/input5
i2c /dev entries driver
ACPI: PCI Interrupt 0000:00:1f.3[B] -> Link [LNKB] -> GSI 11 (level, low) ->
IRQ 11
md: linear personality registered for level -1
md: raid0 personality registered for level 0
md: raid1 personality registered for level 1
md: raid10 personality registered for level 10
raid6: int32x1    505 MB/s
raid6: int32x2    620 MB/s
raid6: int32x4    526 MB/s
raid6: int32x8    558 MB/s
raid6: mmxx1     1442 MB/s
raid6: mmxx2     1831 MB/s
raid6: sse1x1    1236 MB/s
raid6: sse1x2    1965 MB/s
raid6: sse2x1    2102 MB/s
raid6: sse2x2    2463 MB/s
raid6: using algorithm sse2x2 (2463 MB/s)
md: raid6 personality registered for level 6
md: raid5 personality registered for level 5
md: raid4 personality registered for level 4
raid5: automatically using best checksumming function: pIII_sse
   pIII_sse  :  4496.000 MB/sec
raid5: using function: pIII_sse (4496.000 MB/sec)
md: multipath personality registered for level -4
md: faulty personality registered for level -5
device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised:
dm-devel@redhat.com
device-mapper: multipath: version 1.0.5 loaded
device-mapper: multipath round-robin: version 1.0.0 loaded
device-mapper: multipath emc: version 0.0.3 loaded
usbcore: registered new interface driver hiddev
input: Microsoft Microsoft 3-Button Mouse with IntelliEye(TM) as
/class/input/input6
input: USB HID v1.10 Mouse [Microsoft Microsoft 3-Button Mouse with
IntelliEye(TM)] on usb-0000:00:1d.1-2
usbcore: registered new interface driver usbhid
drivers/hid/usbhid/hid-core.c: v2.6:USB HID core driver
Advanced Linux Sound Architecture Driver Version 1.0.14 (Thu May 31 09:03:25
2007 UTC).
ACPI: PCI Interrupt 0000:00:1f.5[B] -> Link [LNKB] -> GSI 11 (level, low) ->
IRQ 11
PCI: Setting latency timer of device 0000:00:1f.5 to 64
intel8x0_measure_ac97_clock: measured 55512 usecs
intel8x0: clocking to 48000
ALSA device list:
  #0: Intel 82801DB-ICH4 with AD1981B at irq 11
TCP cubic registered
Initializing XFRM netlink socket
NET: Registered protocol family 1
NET: Registered protocol family 10
lo: Disabled Privacy Extensions
IPv6 over IPv4 tunneling driver
sit0: Disabled Privacy Extensions
NET: Registered protocol family 17
NET: Registered protocol family 15
acpi-cpufreq: acpi_cpufreq_init
acpi-cpufreq: acpi_cpufreq_early_init
cpufreq-core: trying to register driver acpi-cpufreq
cpufreq-core: adding CPU 0
acpi-cpufreq: acpi_cpufreq_cpu_init
acpi-cpufreq: HARDWARE addr space
freq-table: table entry 0: 1700000 kHz, 0 index
freq-table: table entry 1: 1400000 kHz, 1 index
freq-table: table entry 2: 1200000 kHz, 2 index
freq-table: table entry 3: 1000000 kHz, 3 index
freq-table: table entry 4: 800000 kHz, 4 index
freq-table: table entry 5: 600000 kHz, 5 index
acpi-cpufreq: get_cur_freq_on_cpu (0)
acpi-cpufreq: get_cur_val = 100667688
acpi-cpufreq: cur freq = 1700000
acpi-cpufreq: CPU0 - ACPI performance management activated.
acpi-cpufreq:      *P0: 1700 MHz, 21000 mW, 500 uS
acpi-cpufreq:       P1: 1400 MHz, 17500 mW, 500 uS
acpi-cpufreq:       P2: 1200 MHz, 15000 mW, 500 uS
acpi-cpufreq:       P3: 1000 MHz, 12500 mW, 500 uS
acpi-cpufreq:       P4: 800 MHz, 10000 mW, 500 uS
acpi-cpufreq:       P5: 600 MHz, 7500 mW, 500 uS
freq-table: setting show_table for cpu 0 to f7dc6b00
cpufreq-core: setting new policy for CPU 0: 600000 - 1700000 kHz
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (600000 - 1700000 kHz) for cpu 0
freq-table: verification lead to (600000 - 1700000 kHz) for cpu 0
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (600000 - 1700000 kHz) for cpu 0
freq-table: verification lead to (600000 - 1700000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 600000 - 1700000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 1
performance: setting to 1700000 kHz because of event 1
cpufreq-core: target for CPU 0: 1700000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1700000 (0)
freq-table: request for target 1700000 kHz (relation: 1) for cpu 0
freq-table: target is 0 (1700000 kHz, 0)
acpi-cpufreq: Called after resume, resetting to P0
cpufreq-core: notification 0 of frequency transition to 1700000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1700000 kHz
cpufreq-core: saving 6798664 as reference value for loops_per_jiffy;freq is
1700000 kHz
cpufreq-core: notification 1 of frequency transition to 1700000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1700000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
performance: setting to 1700000 kHz because of event 3
cpufreq-core: target for CPU 0: 1700000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1700000 (0)
freq-table: request for target 1700000 kHz (relation: 1) for cpu 0
freq-table: target is 0 (1700000 kHz, 0)
acpi-cpufreq: Already at target state (P0)
cpufreq-core: initialization complete
cpufreq-core: driver acpi-cpufreq up and running
cpufreq-core: trying to register driver centrino
Using IPI Shortcut mode
Freeing unused kernel memory: 224k freed
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
IBM TrackPoint firmware: 0x0e, buttons: 3/3
input: TPPS/2 IBM TrackPoint as /class/input/input7
Linux agpgart interface v0.102 (c) Dave Jones
agpgart: Detected an Intel 855PM Chipset.
agpgart: AGP aperture is 256M @ 0xd0000000
ieee80211_crypt: registered algorithm 'NULL'
ieee80211: 802.11 data/management/control stack, 1.2.18
ieee80211: Copyright (C) 2004-2005 Intel Corporation <jketreno@linux.intel.com>
ipw2200: Intel(R) PRO/Wireless 2200/2915 Network Driver, 1.2.2dmq
ipw2200: Copyright(c) 2003-2006 Intel Corporation
ACPI: PCI Interrupt 0000:02:02.0[A] -> Link [LNKC] -> GSI 11 (level, low) ->
IRQ 11
ipw2200: Detected Intel PRO/Wireless 2200BG Network Connection
NET: Registered protocol family 23
nsc_ircc: Unknown parameter `PNP0511'
parport_pc 00:0a: reported by Plug and Play ACPI
parport0: PC-style at 0x3bc, irq 7 [PCSPP,TRISTATE]
ipw2200: Detected geography ZZM (11 802.11bg channels, 0 802.11a channels)
EXT3 FS on sda5, internal journal
kjournald starting.  Commit interval 5 seconds
EXT3 FS on sda3, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
Adding 779112k swap on /dev/sda6.  Priority:-1 extents:1 across:779112k
IA-32 Microcode Update Driver: v1.14a <tigran@aivazian.fsnet.co.uk>
ip6_tables: (C) 2000-2006 Netfilter Core Team
ip_tables: (C) 2000-2006 Netfilter Core Team
Netfilter messages via NETLINK v0.30.
nf_conntrack version 0.5.0 (7168 buckets, 57344 max)
ADDRCONF(NETDEV_UP): eth1: link is not ready
ADDRCONF(NETDEV_UP): eth1: link is not ready
ACPI: PCI Interrupt 0000:01:00.0[A] -> Link [LNKA] -> GSI 11 (level, low) ->
IRQ 11
[drm] Initialized drm 1.1.0 20060810
[drm] Initialized radeon 1.27.0 20060524 on minor 0
agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 1x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 1x mode
[drm] Setting GART location based on new memory map
[drm] Loading R300 Microcode
[drm] writeback test succeeded in 2 usecs
cpufreq-core: setting new policy for CPU 0: 600000 - 1700000 kHz
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (600000 - 1700000 kHz) for cpu 0
freq-table: verification lead to (600000 - 1700000 kHz) for cpu 0
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (600000 - 1700000 kHz) for cpu 0
freq-table: verification lead to (600000 - 1700000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 600000 - 1700000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 2
cpufreq-core: __cpufreq_governor for CPU 0, event 1
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 1651428 kHz, relation 0
acpi-cpufreq: acpi_cpufreq_target 1651428 (0)
freq-table: request for target 1651428 kHz (relation: 0) for cpu 0
freq-table: target is 0 (1700000 kHz, 0)
acpi-cpufreq: Already at target state (P0)
cpufreq-core: target for CPU 0: 825714 kHz, relation 0
acpi-cpufreq: acpi_cpufreq_target 825714 (0)
freq-table: request for target 825714 kHz (relation: 0) for cpu 0
freq-table: target is 3 (1000000 kHz, 3)
cpufreq-core: notification 0 of frequency transition to 1000000 kHz
printk: 22 messages suppressed.
cpufreq-core: target for CPU 0: 48571 kHz, relation 0
ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
printk: 8 messages suppressed.
cpufreq-core: target for CPU 0: 1700000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1700000 (0)
eth0: no IPv6 routers present
cpufreq-core: setting new policy for CPU 0: 600000 - 1700000 kHz
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (600000 - 1700000 kHz) for cpu 0
freq-table: verification lead to (600000 - 1700000 kHz) for cpu 0
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (600000 - 1700000 kHz) for cpu 0
freq-table: verification lead to (600000 - 1700000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 600000 - 1700000 kHz
cpufreq-core: governor switch
cpufreq-core: __cpufreq_governor for CPU 0, event 2
cpufreq-core: __cpufreq_governor for CPU 0, event 1
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3

Thanks


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
