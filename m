From: Michael Reinelt <michael@reinelt.co.at>
Subject: Re: Core2Duo locked at 800MHz
Date: Tue, 27 Nov 2007 06:10:58 +0000
Message-ID: <474BB4F2.9040604@reinelt.co.at>
References: <474A6C62.3070103@reinelt.co.at>
	<20071126190929.GE15764@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030205090902010005090301"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071126190929.GE15764@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------030205090902010005090301
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

thanks for your answer!

 >  > When I boot the notebook into single-user mode
>  > (using vanilla 2.6.23 or 2.6.24-rc3), with no modules loaded, the cpu 
>  > runs at 2.4GHz. As soon as I laod the acpi-cpufreq module, the upper 
>  > limit falls in some steps (2 GHz, 1200MHz) to 800 MHz. Note that there 
>  > is neither acpid nor any powersave daemon running!
> 
> Do you have CONFIG_CPU_FREQ_GOV_ONDEMAND enabled in your kernel ?

Yes, but as a module.

>  > At the moment my workaround is *not* to load acpi-cpufreq, so the CPU 
>  > stays at 2.4GHz all the time, but I really want to use powersaving with 
>  > the machine....
> 
> I'm confused.  It sounds like you _are_ using power saving.
> The whole purpose of cpufreq is to lower the cpu speed when idle.
I _want_ to use powersaving, but I can't, because I'd be stuck at 800 MHz.

> If you run some cpu intensive load like a big compile, does the
> speed go back up ?
No, it does not.

> the cpufreq.debug=7 logs would be a good start.

Ok, I did a debugging session this morning, a complete syslog is 
attached, and here's what I've done:

I bootet the machine with cpufreq.debug=7 into some sort of single-user 
mode, with no processes running except udevd (especially no acpid and no 
powersaved)

I manually started syslogd and klogd to get some logfiles

at this time, no cpufreq modules have been loaded.

cpufreq -info gives me:
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
   no or unknown cpufreq driver is active on this CPU
analyzing CPU 1:
   no or unknown cpufreq driver is active on this CPU

which is ok because no driver has been loaded yet.

acpitool -c says:
   CPU type               : Intel(R) Core(TM)2 Duo CPU     T7700  @ 2.40GHz
   CPU speed              : 2394.018 MHz
   Cache size             : 4096 KB
   Bogomips               : 4791.54
   Bogomips               : 4788.14

   # of CPU's found       : 2

   Processor ID           : 0
   Bus mastering control  : yes
   Power management       : yes
   Throttling control     : no
   Limit interface        : no
   Active C-state         : C0
   C-states (incl. C0)    : 4
   Usage of state C1      : 14 (0.1 %)
   Usage of state C2      : 347 (2.3 %)
   Usage of state C3      : 14933 (97.6 %)

   Processor ID           : 1
   Bus mastering control  : yes
   Power management       : yes
   Throttling control     : no
   Limit interface        : no
   Active C-state         : C0
   C-states (incl. C0)    : 4
   Usage of state C1      : 8 (0.0 %)
   Usage of state C2      : 336 (1.1 %)
   Usage of state C3      : 14955 (49.5 %)

next, I loaded acpi_cpufreq, and now cpufreq -info reports senseful info:

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
   driver: acpi-cpufreq
   CPUs which need to switch frequency at the same time: 0 1
   hardware limits: 800 MHz - 2.40 GHz
   available frequency steps: 2.40 GHz, 2.40 GHz, 2.00 GHz, 1.60 GHz, 
1.20 GHz, 800 MHz
   available cpufreq governors: ondemand, performance
   current policy: frequency should be within 800 MHz and 2.40 GHz.
                   The governor "performance" may decide which speed to use
                   within this range.
   current CPU frequency is 2.40 GHz (asserted by call to hardware).
analyzing CPU 1:
   driver: acpi-cpufreq
   CPUs which need to switch frequency at the same time: 0 1
   hardware limits: 800 MHz - 2.40 GHz
   available frequency steps: 2.40 GHz, 2.40 GHz, 2.00 GHz, 1.60 GHz, 
1.20 GHz, 800 MHz
   available cpufreq governors: ondemand, performance
   current policy: frequency should be within 800 MHz and 2.40 GHz.
                   The governor "performance" may decide which speed to use
                   within this range.
   current CPU frequency is 2.40 GHz (asserted by call to hardware).

then I loaded cpufreq_ondemand and activated it with 'cpufreq-set -g 
ondemand'

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
   driver: acpi-cpufreq
   CPUs which need to switch frequency at the same time: 0 1
   hardware limits: 800 MHz - 2.40 GHz
   available frequency steps: 2.40 GHz, 2.40 GHz, 2.00 GHz, 1.60 GHz, 
1.20 GHz, 800 MHz
   available cpufreq governors: ondemand, performance
   current policy: frequency should be within 800 MHz and 2.40 GHz.
                   The governor "ondemand" may decide which speed to use
                   within this range.
   current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 1:
   driver: acpi-cpufreq
   CPUs which need to switch frequency at the same time: 0 1
   hardware limits: 800 MHz - 2.40 GHz
   available frequency steps: 2.40 GHz, 2.40 GHz, 2.00 GHz, 1.60 GHz, 
1.20 GHz, 800 MHz
   available cpufreq governors: ondemand, performance
   current policy: frequency should be within 800 MHz and 2.40 GHz.
                   The governor "ondemand" may decide which speed to use
                   within this range.
   current CPU frequency is 800 MHz (asserted by call to hardware).

the frequency gows down to 800 MHz (which is ok because the machine is 
idle), but the limits are ok

after some seconds, the policy changes:
   current policy: frequency should be within 800 MHz and 2.00 GHz.

then I started two very cpu-intensive tasks, and the policy changes again:

   current policy: frequency should be within 800 MHz and 800 MHz.

ater this point, I'm stuck at 800 MHz, no matter if the machine is idle 
or under really heavy load


in the syslog (see attached complete log) I find the following confusing 
messages:

cpufreq-core: updating policy for CPU 0
acpi-cpufreq: get_cur_freq_on_cpu (0)
cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (800000 - 2401000 kHz) 
for cpu 0
freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (800000 - 800000 kHz) for 
cpu 0
freq-table: verification lead to (800000 - 800000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 800000 - 800000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 800000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 800000 (0)
freq-table: request for target 800000 kHz (relation: 1) for cpu 0
freq-table: target is 5 (800000 kHz, 5)
cpufreq-core: notification 0 of frequency transition to 800000 kHz
cpufreq-core: notification 0 of frequency transition to 800000 kHz
cpufreq-core: notification 1 of frequency transition to 800000 kHz
cpufreq-core: notification 1 of frequency transition to 800000 kHz
cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (800000 - 2401000 kHz) 
for cpu 0
freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
acpi-cpufreq: acpi_cpufreq_verify
freq-table: request for verification of policy (800000 - 800000 kHz) for 
cpu 0
freq-table: verification lead to (800000 - 800000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 800000 - 800000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3

there is a (correct?) request for a policy 800-2.4G, but a second 
(incorrect) for 800-800. Where does this one come from???

I really hope you can give me some hints on how to solve this strange 
problem!


TIA, Michael

-- 
Michael Reinelt <michael@reinelt.co.at>
http://home.pages.at/reinelt
GPG-Key 0xDF13BA50
ICQ #288386781

--------------030205090902010005090301
Content-Type: text/plain;
 name="Lifebook.syslog"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Lifebook.syslog"

Nov 27 05:27:27 merlin syslogd 1.5.0#1: restart.
Nov 27 05:27:33 merlin kernel: klogd 1.5.0#1, log source = /proc/kmsg started.
Nov 27 05:27:33 merlin kernel: Inspecting /usr/src/linux/System.map
Nov 27 05:27:33 merlin kernel: Loaded 23682 symbols from /usr/src/linux/System.map.
Nov 27 05:27:33 merlin kernel: Symbols match kernel version 2.6.24.
Nov 27 05:27:33 merlin kernel: Loaded 10523 symbols from 50 modules.
Nov 27 05:27:33 merlin kernel: : 00002000-000020ff
Nov 27 05:27:33 merlin kernel:   IO window: 00002400-000024ff
Nov 27 05:27:33 merlin kernel:   PREFETCH window: f0000000-f3ffffff
Nov 27 05:27:33 merlin kernel:   MEM window: f4000000-f7ffffff
Nov 27 05:27:33 merlin kernel: PCI: Bridge: 0000:00:1e.0
Nov 27 05:27:33 merlin kernel:   IO window: disabled.
Nov 27 05:27:33 merlin kernel:   MEM window: fe300000-fe3fffff
Nov 27 05:27:33 merlin kernel:   PREFETCH window: disabled.
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:00:1c.0[A] -> GSI 16 (level, low) -> IRQ 16
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1c.0 to 64
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:00:1c.1[B] -> GSI 17 (level, low) -> IRQ 17
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1c.1 to 64
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:00:1c.3[D] -> GSI 19 (level, low) -> IRQ 18
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1c.3 to 64
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1e.0 to 64
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:04:03.0[A] -> GSI 16 (level, low) -> IRQ 16
Nov 27 05:27:33 merlin kernel: PCI: Enabling device 0000:04:03.1 (0080 -> 0083)
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:04:03.1[A] -> GSI 16 (level, low) -> IRQ 16
Nov 27 05:27:33 merlin kernel: NET: Registered protocol family 2
Nov 27 05:27:33 merlin kernel: IP route cache hash table entries: 32768 (order: 5, 131072 bytes)
Nov 27 05:27:33 merlin kernel: TCP established hash table entries: 131072 (order: 8, 1048576 bytes)
Nov 27 05:27:33 merlin kernel: TCP bind hash table entries: 65536 (order: 7, 786432 bytes)
Nov 27 05:27:33 merlin kernel: TCP: Hash tables configured (established 131072 bind 65536)
Nov 27 05:27:33 merlin kernel: TCP reno registered
Nov 27 05:27:33 merlin kernel: Simple Boot Flag at 0x7b set to 0x1
Nov 27 05:27:33 merlin kernel: Machine check exception polling timer started.
Nov 27 05:27:33 merlin kernel: highmem bounce pool size: 64 pages
Nov 27 05:27:33 merlin kernel: Total HugeTLB memory allocated, 0
Nov 27 05:27:33 merlin kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
Nov 27 05:27:33 merlin kernel: io scheduler noop registered
Nov 27 05:27:33 merlin kernel: io scheduler anticipatory registered
Nov 27 05:27:33 merlin kernel: io scheduler deadline registered
Nov 27 05:27:33 merlin kernel: io scheduler cfq registered (default)
Nov 27 05:27:33 merlin kernel: Boot video device is 0000:00:02.0
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1c.0 to 64
Nov 27 05:27:33 merlin kernel: assign_interrupt_mode Found MSI capability
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.0:pcie00]
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.0:pcie02]
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.0:pcie03]
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1c.1 to 64
Nov 27 05:27:33 merlin kernel: assign_interrupt_mode Found MSI capability
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.1:pcie00]
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.1:pcie02]
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.1:pcie03]
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1c.3 to 64
Nov 27 05:27:33 merlin kernel: assign_interrupt_mode Found MSI capability
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.3:pcie00]
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.3:pcie02]
Nov 27 05:27:33 merlin kernel: Allocate Port Service[0000:00:1c.3:pcie03]
Nov 27 05:27:33 merlin kernel: vesafb: framebuffer at 0xe0000000, mapped to 0xf8880000, using 2560k, total 7616k
Nov 27 05:27:33 merlin kernel: vesafb: mode is 1280x1024x8, linelength=1280, pages=4
Nov 27 05:27:33 merlin kernel: vesafb: scrolling: redraw
Nov 27 05:27:33 merlin kernel: vesafb: Pseudocolor: size=8:8:8:8, shift=0:0:0:0
Nov 27 05:27:33 merlin kernel: Console: switching to colour frame buffer device 106x46
Nov 27 05:27:33 merlin kernel: fb0: VESA VGA frame buffer device
Nov 27 05:27:33 merlin kernel: Linux agpgart interface v0.102
Nov 27 05:27:33 merlin kernel: agpgart: Detected an Intel 965GM Chipset.
Nov 27 05:27:33 merlin kernel: agpgart: Detected 7676K stolen memory.
Nov 27 05:27:33 merlin kernel: agpgart: AGP aperture is 256M @ 0xe0000000
Nov 27 05:27:33 merlin kernel: Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
Nov 27 05:27:33 merlin kernel: ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
Nov 27 05:27:33 merlin kernel: ICH8M: IDE controller (0x8086:0x2850 rev 0x03) at  PCI slot 0000:00:1f.1
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:00:1f.1[A] -> GSI 20 (level, low) -> IRQ 19
Nov 27 05:27:33 merlin kernel: ICH8M: not 100% native mode: will probe irqs later
Nov 27 05:27:33 merlin kernel:     ide0: BM-DMA at 0x1810-0x1817, BIOS settings: hda:DMA, hdb:pio
Nov 27 05:27:33 merlin kernel:     ide1: BM-DMA at 0x1818-0x181f, BIOS settings: hdc:pio, hdd:pio
Nov 27 05:27:33 merlin kernel: Probing IDE interface ide0...
Nov 27 05:27:33 merlin kernel: Switched to high resolution mode on CPU 1
Nov 27 05:27:33 merlin kernel: Switched to high resolution mode on CPU 0
Nov 27 05:27:33 merlin kernel: hda: HL-DT-ST DVDRAM_GSA-T20N, ATAPI CD/DVD-ROM drive
Nov 27 05:27:33 merlin kernel: hda: host max PIO4 wanted PIO255(auto-tune) selected PIO4
Nov 27 05:27:33 merlin kernel: hda: UDMA 2 mode selected
Nov 27 05:27:33 merlin kernel: ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
Nov 27 05:27:33 merlin kernel: Probing IDE interface ide1...
Nov 27 05:27:33 merlin kernel: ahci 0000:00:1f.2: version 3.0
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:00:1f.2[A] -> GSI 20 (level, low) -> IRQ 19
Nov 27 05:27:33 merlin kernel: ahci 0000:00:1f.2: AHCI 0001.0100 32 slots 3 ports 3 Gbps 0x7 impl SATA mode
Nov 27 05:27:33 merlin kernel: ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part 
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:1f.2 to 64
Nov 27 05:27:33 merlin kernel: scsi0 : ahci
Nov 27 05:27:33 merlin kernel: scsi1 : ahci
Nov 27 05:27:33 merlin kernel: scsi2 : ahci
Nov 27 05:27:33 merlin kernel: ata1: SATA max UDMA/133 abar m2048@0xfe625000 port 0xfe625100 irq 220
Nov 27 05:27:33 merlin kernel: ata2: SATA max UDMA/133 abar m2048@0xfe625000 port 0xfe625180 irq 220
Nov 27 05:27:33 merlin kernel: ata3: SATA max UDMA/133 abar m2048@0xfe625000 port 0xfe625200 irq 220
Nov 27 05:27:33 merlin kernel: ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
Nov 27 05:27:33 merlin kernel: ata1.00: ATA-7: WDC WD1600BEVS-07RST0, 04.01G04, max UDMA/133
Nov 27 05:27:33 merlin kernel: ata1.00: 312581808 sectors, multi 16: LBA48 NCQ (depth 31/32)
Nov 27 05:27:33 merlin kernel: ata1.00: configured for UDMA/133
Nov 27 05:27:33 merlin kernel: ata2: SATA link down (SStatus 0 SControl 300)
Nov 27 05:27:33 merlin kernel: ata3: SATA link down (SStatus 0 SControl 300)
Nov 27 05:27:33 merlin kernel: scsi 0:0:0:0: Direct-Access     ATA      WDC WD1600BEVS-0 04.0 PQ: 0 ANSI: 5
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] 312581808 512-byte hardware sectors (160042 MB)
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Write Protect is off
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] 312581808 512-byte hardware sectors (160042 MB)
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Write Protect is off
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Nov 27 05:27:33 merlin kernel:  sda: sda1 sda2 sda3
Nov 27 05:27:33 merlin kernel: sd 0:0:0:0: [sda] Attached SCSI disk
Nov 27 05:27:33 merlin kernel: PNP: PS/2 Controller [PNP0303:KBC,PNP0f13:PS2M] at 0x60,0x64 irq 1,12
Nov 27 05:27:33 merlin kernel: i8042.c: Detected active multiplexing controller, rev 1.1.
Nov 27 05:27:33 merlin kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
Nov 27 05:27:33 merlin kernel: serio: i8042 AUX0 port at 0x60,0x64 irq 12
Nov 27 05:27:33 merlin kernel: serio: i8042 AUX1 port at 0x60,0x64 irq 12
Nov 27 05:27:33 merlin kernel: serio: i8042 AUX2 port at 0x60,0x64 irq 12
Nov 27 05:27:33 merlin kernel: serio: i8042 AUX3 port at 0x60,0x64 irq 12
Nov 27 05:27:33 merlin kernel: mice: PS/2 mouse device common for all mice
Nov 27 05:27:33 merlin kernel: cpuidle: using governor ladder
Nov 27 05:27:33 merlin kernel: cpuidle: using governor menu
Nov 27 05:27:33 merlin kernel: TCP cubic registered
Nov 27 05:27:33 merlin kernel: NET: Registered protocol family 1
Nov 27 05:27:33 merlin kernel: Using IPI No-Shortcut mode
Nov 27 05:27:33 merlin kernel: input: AT Translated Set 2 keyboard as /class/input/input0
Nov 27 05:27:33 merlin kernel: kjournald starting.  Commit interval 5 seconds
Nov 27 05:27:33 merlin kernel: EXT3-fs: mounted filesystem with ordered data mode.
Nov 27 05:27:33 merlin kernel: VFS: Mounted root (ext3 filesystem) readonly.
Nov 27 05:27:33 merlin kernel: Freeing unused kernel memory: 200k freed
Nov 27 05:27:33 merlin kernel: Intel(R) PRO/1000 Network Driver - version 7.3.20-k2
Nov 27 05:27:33 merlin kernel: Copyright (c) 1999-2006 Intel Corporation.
Nov 27 05:27:33 merlin kernel: ACPI: PCI Interrupt 0000:00:19.0[A] -> GSI 16 (level, low) -> IRQ 16
Nov 27 05:27:33 merlin kernel: PCI: Setting latency timer of device 0000:00:19.0 to 64
Nov 27 05:27:33 merlin kernel: e1000: 0000:00:19.0: e1000_probe: (PCI Express:2.5Gb/s:Width x1) 00:17:42:72:db:4d
Nov 27 05:27:33 merlin kernel: parport_pc 00:0b: reported by Plug and Play ACPI
Nov 27 05:27:33 merlin kernel: parport0: PC-style at 0x378 (0x778), irq 7, dma 1 [PCSPP,TRISTATE,COMPAT,ECP,DMA]
Nov 27 05:27:33 merlin kernel: Serial: 8250/16550 driver $Revision: 1.90 $ 1 ports, IRQ sharing enabled
Nov 27 05:27:33 merlin kernel: e1000: eth0: e1000_probe: Intel(R) PRO/1000 Network Connection
Nov 27 05:27:33 merlin kernel: usbcore: registered new interface driver usbfs
Nov 27 05:27:33 merlin kernel: usbcore: registered new interface driver hub
Nov 27 05:27:33 merlin kernel: usbcore: registered new device driver usb
Nov 27 05:27:33 merlin kernel: Yenta: CardBus bridge found at 0000:04:03.0 [10cf:143d]
Nov 27 05:27:33 merlin kernel: Yenta O2: res at 0x94/0xD4: 00/ea
Nov 27 05:27:33 merlin kernel: Yenta O2: enabling read prefetch/write burst
Nov 27 05:27:33 merlin kernel: serial8250: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Nov 27 05:27:33 merlin kernel: ACPI: AC Adapter [AC] (on-line)
Nov 27 05:27:33 merlin kernel: Yenta: ISA IRQ mask 0x0c38, PCI irq 16
Nov 27 05:27:33 merlin kernel: Socket status: 30000006
Nov 27 05:27:33 merlin kernel: pcmcia: parent PCI bridge Memory window: 0xfe300000 - 0xfe3fffff
Nov 27 05:27:33 merlin kernel: Yenta: CardBus bridge found at 0000:04:03.1 [10cf:143d]
Nov 27 05:27:33 merlin kernel: Yenta: ISA IRQ mask 0x0c38, PCI irq 16
Nov 27 05:27:33 merlin kernel: Socket status: 30000410
Nov 27 05:27:33 merlin kernel: pcmcia: parent PCI bridge Memory window: 0xfe300000 - 0xfe3fffff
Nov 27 05:27:33 merlin kernel: ACPI: SSDT CF6DFDD2, 02BC (r1 FUJ    FJNB1CF   1080000 FUJ       100)
Nov 27 05:27:33 merlin kernel: Parsing all Control Methods:
Nov 27 05:27:33 merlin kernel: Table [SSDT](id 0025) - 6 Objects with 0 Devices 3 Methods 0 Regions
Nov 27 05:27:33 merlin kernel: ACPI: SSDT CF6E02D2, 046E (r1 FUJ    FJNB1CF   1080000 FUJ       100)
Nov 27 05:27:33 merlin kernel: Parsing all Control Methods:
Nov 27 05:27:33 merlin kernel: Table [SSDT](id 0026) - 1 Objects with 0 Devices 1 Methods 0 Regions
Nov 27 05:27:33 merlin kernel: Monitor-Mwait will be used to enter C-1 state
Nov 27 05:27:33 merlin kernel: Monitor-Mwait will be used to enter C-2 state
Nov 27 05:27:33 merlin kernel: Monitor-Mwait will be used to enter C-3 state
Nov 27 05:27:33 merlin kernel: ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3])
Nov 27 05:27:33 merlin kernel: ACPI: SSDT CF6E021A, 00B8 (r1 FUJ    FJNB1CF   1080000 FUJ       100)
Nov 27 05:27:33 merlin kernel: Parsing all Control Methods:
Nov 27 05:27:33 merlin kernel: Table [SSDT](id 002A) - 4 Objects with 0 Devices 3 Methods 0 Regions
Nov 27 05:27:33 merlin kernel: ACPI: SSDT CF6E0740, 0047 (r1 FUJ    FJNB1CF   1080000 FUJ       100)
Nov 27 05:27:33 merlin kernel: Parsing all Control Methods:
Nov 27 05:27:33 merlin kernel: Table [SSDT](id 002B) - 1 Objects with 0 Devices 1 Methods 0 Regions
Nov 27 05:27:33 merlin kernel: ACPI: CPU1 (power states: C1[C1] C2[C2] C3[C3])
Nov 27 05:27:33 merlin kernel: Marking TSC unstable due to: TSC halts in idle.
Nov 27 05:27:33 merlin kernel: Time: hpet clocksource has been installed.
Nov 27 05:27:34 merlin kernel: input: Power Button (FF) as /class/input/input1
Nov 27 05:27:34 merlin kernel: ACPI: Power Button (FF) [PWRF]
Nov 27 05:27:34 merlin kernel: input: Lid Switch as /class/input/input2
Nov 27 05:27:34 merlin kernel: ACPI: Lid Switch [LID]
Nov 27 05:27:34 merlin kernel: input: Power Button (CM) as /class/input/input3
Nov 27 05:27:34 merlin kernel: input: PC Speaker as /class/input/input4
Nov 27 05:27:34 merlin kernel: ACPI: Power Button (CM) [PWRB]
Nov 27 05:27:34 merlin kernel: input: Sleep Button (CM) as /class/input/input5
Nov 27 05:27:34 merlin kernel: USB Universal Host Controller Interface driver v3.0
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1a.0[A] -> GSI 22 (level, low) -> IRQ 20
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1a.0 to 64
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1a.0: UHCI Host Controller
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus number 1
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1a.0: irq 20, io base 0x00001840
Nov 27 05:27:34 merlin kernel: usb usb1: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: hub 1-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel: ACPI: Sleep Button (CM) [SLPB]
Nov 27 05:27:34 merlin kernel: hub 1-0:1.0: 2 ports detected
Nov 27 05:27:34 merlin kernel: ACPI: EC: non-query interrupt received, switching to interrupt mode
Nov 27 05:27:34 merlin kernel: 00:09: ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
Nov 27 05:27:34 merlin kernel: ACPI: Battery Slot [CMB1] (battery present)
Nov 27 05:27:34 merlin kernel: ACPI: Battery Slot [CMB2] (battery absent)
Nov 27 05:27:34 merlin kernel: input: Video Bus as /class/input/input6
Nov 27 05:27:34 merlin kernel: ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
Nov 27 05:27:34 merlin kernel: sdhci: Secure Digital Host Controller Interface driver
Nov 27 05:27:34 merlin kernel: sdhci: Copyright(c) Pierre Ossman
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1a.1[A] -> GSI 22 (level, low) -> IRQ 20
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1a.1 to 64
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1a.1: UHCI Host Controller
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus number 2
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1a.1: irq 20, io base 0x00001860
Nov 27 05:27:34 merlin kernel: usb usb2: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: hub 2-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel: hub 2-0:1.0: 2 ports detected
Nov 27 05:27:34 merlin kernel: hda: ATAPI 24X DVD-ROM DVD-R-RAM CD-R/RW drive, 2048kB Cache, UDMA(33)
Nov 27 05:27:34 merlin kernel: Uniform CD-ROM driver Revision: 3.20
Nov 27 05:27:34 merlin kernel: ACPI: Thermal Zone [TZ00] (27 C)
Nov 27 05:27:34 merlin kernel: ACPI: Thermal Zone [TZ01] (27 C)
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 22 (level, low) -> IRQ 20
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1d.0 to 64
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.0: UHCI Host Controller
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 3
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.0: irq 20, io base 0x00001880
Nov 27 05:27:34 merlin kernel: pccard: PCMCIA card inserted into slot 1
Nov 27 05:27:34 merlin kernel: usb usb3: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: hub 3-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel: hub 3-0:1.0: 2 ports detected
Nov 27 05:27:34 merlin kernel: iwl4965: Intel(R) Wireless WiFi Link 4965AGN driver for Linux, 1.1.17ks
Nov 27 05:27:34 merlin kernel: iwl4965: Copyright(c) 2003-2007 Intel Corporation
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1d.1[A] -> GSI 22 (level, low) -> IRQ 20
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1d.1 to 64
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.1: UHCI Host Controller
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus number 4
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.1: irq 20, io base 0x000018a0
Nov 27 05:27:34 merlin kernel: usb usb4: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: hub 4-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel: hub 4-0:1.0: 2 ports detected
Nov 27 05:27:34 merlin kernel: Synaptics Touchpad, model: 1, fw: 6.2, id: 0x1a0b1, caps: 0xa04793/0x302000
Nov 27 05:27:34 merlin kernel: serio: Synaptics pass-through port at isa0060/serio4/input0
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1d.2[A] -> GSI 22 (level, low) -> IRQ 20
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1d.2 to 64
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.2: UHCI Host Controller
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus number 5
Nov 27 05:27:34 merlin kernel: uhci_hcd 0000:00:1d.2: irq 20, io base 0x000018c0
Nov 27 05:27:34 merlin kernel: usb usb5: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: hub 5-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel: hub 5-0:1.0: 2 ports detected
Nov 27 05:27:34 merlin kernel: input: SynPS/2 Synaptics TouchPad as /class/input/input7
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:04:03.4[A] -> GSI 16 (level, low) -> IRQ 16
Nov 27 05:27:34 merlin kernel: firewire_ohci: Added fw-ohci device 0000:04:03.4, OHCI version 1.10
Nov 27 05:27:34 merlin kernel: sdhci: SDHCI controller found at 0000:04:03.2 [1217:7120] (rev 2)
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:04:03.2[A] -> GSI 16 (level, low) -> IRQ 16
Nov 27 05:27:34 merlin kernel: sdhci:slot0: Unknown controller version (2). You may experience problems.
Nov 27 05:27:34 merlin kernel: mmc0: SDHCI at 0xfe300000 irq 16 PIO
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:03:00.0[A] -> GSI 19 (level, low) -> IRQ 18
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:03:00.0 to 64
Nov 27 05:27:34 merlin kernel: iwl4965: Detected Intel Wireless WiFi Link 4965AGN
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1f.3[B] -> GSI 21 (level, low) -> IRQ 21
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1a.7[B] -> GSI 23 (level, low) -> IRQ 22
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1a.7 to 64
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1a.7: EHCI Host Controller
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus number 6
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1a.7: debug port 1
Nov 27 05:27:34 merlin kernel: PCI: cache line size of 32 is not supported by device 0000:00:1a.7
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1a.7: irq 22, io mem 0xfe625800
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
Nov 27 05:27:34 merlin kernel: usb usb6: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0x100-0x3af: excluding 0x2e8-0x2ef
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0x3e0-0x4ff: excluding 0x4d0-0x4d7
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0x820-0x8ff: clean.
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0xc00-0xcf7: clean.
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0xa00-0xaff: clean.
Nov 27 05:27:34 merlin kernel: cs: memory probe 0xfe300000-0xfe3fffff:<6>hub 6-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel:  excluding 0xfe300000-0xfe30ffff<6>hub 6-0:1.0: 4 ports detected
Nov 27 05:27:34 merlin kernel: 
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0x100-0x3af: excluding 0x2e8-0x2ef
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0x3e0-0x4ff:<5>pcmcia: registering new device pcmcia1.0
Nov 27 05:27:34 merlin kernel:  excluding 0x4d0-0x4d7
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0x820-0x8ff: clean.
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0xc00-0xcf7: clean.
Nov 27 05:27:34 merlin kernel: cs: IO port probe 0xa00-0xaff: clean.
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1d.7[B] -> GSI 23 (level, low) -> IRQ 22
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1d.7 to 64
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1d.7: EHCI Host Controller
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 7
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1d.7: debug port 1
Nov 27 05:27:34 merlin kernel: PCI: cache line size of 32 is not supported by device 0000:00:1d.7
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1d.7: irq 22, io mem 0xfe625c00
Nov 27 05:27:34 merlin kernel: ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00, driver 10 Dec 2004
Nov 27 05:27:34 merlin kernel: usb usb7: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: hub 7-0:1.0: USB hub found
Nov 27 05:27:34 merlin kernel: hub 7-0:1.0: 6 ports detected
Nov 27 05:27:34 merlin kernel: iwl4965: Tunable channels: 13 802.11bg, 19 802.11a channels
Nov 27 05:27:34 merlin kernel: phy0: Selected rate control algorithm 'iwl-4965-rs'
Nov 27 05:27:34 merlin kernel: firewire_core: created new fw device fw0 (0 config rom retries, S400)
Nov 27 05:27:34 merlin kernel: ACPI: PCI Interrupt 0000:00:1b.0[A] -> GSI 21 (level, low) -> IRQ 21
Nov 27 05:27:34 merlin kernel: PCI: Setting latency timer of device 0000:00:1b.0 to 64
Nov 27 05:27:34 merlin kernel: hda_codec: Unknown model for ALC262, trying auto-probe from BIOS...
Nov 27 05:27:34 merlin kernel: Clocksource tsc unstable (delta = -68239676 ns)
Nov 27 05:27:34 merlin kernel: usb 1-2: new full speed USB device using uhci_hcd and address 2
Nov 27 05:27:34 merlin kernel: usb 1-2: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: Adding 4000176k swap on /dev/scsi/host0/bus0/target0/lun0/part2.  Priority:-1 extents:1 across:4000176k
Nov 27 05:27:34 merlin kernel: Bluetooth: Core ver 2.11
Nov 27 05:27:34 merlin kernel: NET: Registered protocol family 31
Nov 27 05:27:34 merlin kernel: Bluetooth: HCI device and connection manager initialized
Nov 27 05:27:34 merlin kernel: Bluetooth: HCI socket layer initialized
Nov 27 05:27:34 merlin kernel: Bluetooth: HCI USB driver ver 2.9
Nov 27 05:27:34 merlin kernel: usb 2-1: new full speed USB device using uhci_hcd and address 2
Nov 27 05:27:34 merlin kernel: EXT3 FS on sda3, internal journal
Nov 27 05:27:34 merlin kernel: usb 2-1: configuration #1 chosen from 1 choice
Nov 27 05:27:34 merlin kernel: usbcore: registered new interface driver hci_usb
Nov 27 05:27:34 merlin kernel: usbcore: registered new interface driver usbserial
Nov 27 05:27:34 merlin kernel: drivers/usb/serial/usb-serial.c: USB Serial support registered for generic
Nov 27 05:27:34 merlin kernel: usbcore: registered new interface driver usbserial_generic
Nov 27 05:27:34 merlin kernel: drivers/usb/serial/usb-serial.c: USB Serial Driver core
Nov 27 05:27:34 merlin kernel: drivers/usb/serial/usb-serial.c: USB Serial support registered for Sierra USB modem (1 port)
Nov 27 05:27:34 merlin kernel: drivers/usb/serial/usb-serial.c: USB Serial support registered for Sierra USB modem (3 port)
Nov 27 05:27:35 merlin kernel: sierra 2-1:1.0: Sierra USB modem (3 port) converter detected
Nov 27 05:27:35 merlin kernel: usb 2-1: Sierra USB modem (3 port) converter now attached to ttyUSB0
Nov 27 05:27:35 merlin kernel: usb 2-1: Sierra USB modem (3 port) converter now attached to ttyUSB1
Nov 27 05:27:35 merlin kernel: usb 2-1: Sierra USB modem (3 port) converter now attached to ttyUSB2
Nov 27 05:27:35 merlin kernel: usbcore: registered new interface driver sierra
Nov 27 05:27:35 merlin kernel: drivers/usb/serial/sierra.c: USB Driver for Sierra Wireless USB modems: v.1.2.5b
Nov 27 05:27:35 merlin kernel: Real Time Clock Driver v1.12ac
Nov 27 05:27:35 merlin kernel: input: PS/2 Generic Mouse as /class/input/input8
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_init
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_early_init
Nov 27 05:29:59 merlin kernel: cpufreq-core: trying to register driver acpi-cpufreq
Nov 27 05:29:59 merlin kernel: cpufreq-core: adding CPU 0
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_cpu_init
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: HARDWARE addr space
Nov 27 05:29:59 merlin kernel: freq-table: table entry 0: 2401000 kHz, 0 index
Nov 27 05:29:59 merlin kernel: freq-table: table entry 1: 2400000 kHz, 1 index
Nov 27 05:29:59 merlin kernel: freq-table: table entry 2: 2000000 kHz, 2 index
Nov 27 05:29:59 merlin kernel: freq-table: table entry 3: 1600000 kHz, 3 index
Nov 27 05:29:59 merlin kernel: freq-table: table entry 4: 1200000 kHz, 4 index
Nov 27 05:29:59 merlin kernel: freq-table: table entry 5: 800000 kHz, 5 index
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: get_cur_val = 103943207
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: cur freq = 2400000
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: CPU0 - ACPI performance management activated.
Nov 27 05:29:59 merlin kernel: acpi-cpufreq:      *P0: 2401 MHz, 35000 mW, 10 uS
Nov 27 05:29:59 merlin kernel: acpi-cpufreq:       P1: 2400 MHz, 35000 mW, 10 uS
Nov 27 05:29:59 merlin kernel: acpi-cpufreq:       P2: 2000 MHz, 28000 mW, 10 uS
Nov 27 05:29:59 merlin kernel: acpi-cpufreq:       P3: 1600 MHz, 22000 mW, 10 uS
Nov 27 05:29:59 merlin kernel: acpi-cpufreq:       P4: 1200 MHz, 16000 mW, 10 uS
Nov 27 05:29:59 merlin kernel: acpi-cpufreq:       P5: 800 MHz, 14000 mW, 10 uS
Nov 27 05:29:59 merlin kernel: freq-table: setting show_table for cpu 0 to f7ffa6c0
Nov 27 05:29:59 merlin kernel: cpufreq-core: CPU 1 already managed, adding link
Nov 27 05:29:59 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:29:59 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:29:59 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:29:59 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:29:59 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:29:59 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 2401000 kHz
Nov 27 05:29:59 merlin kernel: cpufreq-core: governor switch
Nov 27 05:29:59 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 1
Nov 27 05:29:59 merlin kernel: performance: setting to 2401000 kHz because of event 1
Nov 27 05:29:59 merlin kernel: cpufreq-core: target for CPU 0: 2401000 kHz, relation 1
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2401000 (0)
Nov 27 05:29:59 merlin kernel: freq-table: request for target 2401000 kHz (relation: 1) for cpu 0
Nov 27 05:29:59 merlin kernel: freq-table: target is 0 (2401000 kHz, 0)
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: Called after resume, resetting to P0
Nov 27 05:29:59 merlin kernel: cpufreq-core: notification 0 of frequency transition to 2401000 kHz
Nov 27 05:29:59 merlin kernel: cpufreq-core: notification 0 of frequency transition to 2401000 kHz
Nov 27 05:29:59 merlin kernel: cpufreq-core: notification 1 of frequency transition to 2401000 kHz
Nov 27 05:29:59 merlin kernel: cpufreq-core: notification 1 of frequency transition to 2401000 kHz
Nov 27 05:29:59 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:29:59 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:29:59 merlin kernel: performance: setting to 2401000 kHz because of event 3
Nov 27 05:29:59 merlin kernel: cpufreq-core: target for CPU 0: 2401000 kHz, relation 1
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2401000 (0)
Nov 27 05:29:59 merlin kernel: freq-table: request for target 2401000 kHz (relation: 1) for cpu 0
Nov 27 05:29:59 merlin kernel: freq-table: target is 0 (2401000 kHz, 0)
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: Already at target state (P0)
Nov 27 05:29:59 merlin kernel: cpufreq-core: initialization complete
Nov 27 05:29:59 merlin kernel: cpufreq-core: adding CPU 1
Nov 27 05:29:59 merlin kernel: cpufreq-core: driver acpi-cpufreq up and running
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: get_cur_val = 103943207
Nov 27 05:29:59 merlin kernel: acpi-cpufreq: cur freq = 2400000
Nov 27 05:31:52 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:31:52 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:31:52 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:52 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:52 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:31:52 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:52 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:52 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 2401000 kHz
Nov 27 05:31:52 merlin kernel: cpufreq-core: governor switch
Nov 27 05:31:52 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 2
Nov 27 05:31:52 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 1
Nov 27 05:31:52 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:31:52 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:31:52 merlin kernel: printk: 3 messages suppressed.
Nov 27 05:31:52 merlin kernel: acpi-cpufreq: cpu 0: performance percent 104
Nov 27 05:31:52 merlin kernel: cpufreq-core: target for CPU 0: 356720 kHz, relation 0
Nov 27 05:31:52 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 356720 (0)
Nov 27 05:31:52 merlin kernel: freq-table: request for target 356720 kHz (relation: 0) for cpu 0
Nov 27 05:31:52 merlin kernel: freq-table: target is 5 (800000 kHz, 5)
Nov 27 05:31:52 merlin kernel: cpufreq-core: notification 0 of frequency transition to 800000 kHz
Nov 27 05:31:52 merlin kernel: cpufreq-core: notification 0 of frequency transition to 800000 kHz
Nov 27 05:31:52 merlin kernel: cpufreq-core: notification 1 of frequency transition to 800000 kHz
Nov 27 05:31:52 merlin kernel: cpufreq-core: notification 1 of frequency transition to 800000 kHz
Nov 27 05:31:55 merlin kernel: cpufreq-core: updating policy for CPU 0
Nov 27 05:31:55 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:31:55 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:31:55 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:31:55 merlin kernel: freq-table: request for verification of policy (800000 - 2400000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: freq-table: verification lead to (800000 - 2400000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 2400000 kHz
Nov 27 05:31:55 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:31:55 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:31:55 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:31:55 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:31:55 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:31:55 merlin kernel: freq-table: request for verification of policy (800000 - 2400000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: freq-table: verification lead to (800000 - 2400000 kHz) for cpu 0
Nov 27 05:31:55 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 2400000 kHz
Nov 27 05:31:55 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:31:55 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:32:08 merlin kernel: printk: 8 messages suppressed.
Nov 27 05:32:08 merlin kernel: cpufreq-core: target for CPU 0: 2400000 kHz, relation 1
Nov 27 05:32:08 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2400000 (0)
Nov 27 05:32:08 merlin kernel: freq-table: request for target 2400000 kHz (relation: 1) for cpu 0
Nov 27 05:32:14 merlin kernel: printk: 14 messages suppressed.
Nov 27 05:32:14 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:32:20 merlin kernel: printk: 5 messages suppressed.
Nov 27 05:32:20 merlin kernel: cpufreq-core: target for CPU 0: 2400000 kHz, relation 1
Nov 27 05:32:23 merlin kernel: printk: 16 messages suppressed.
Nov 27 05:32:23 merlin kernel: cpufreq-core: target for CPU 0: 2400000 kHz, relation 1
Nov 27 05:32:27 merlin kernel: printk: 101 messages suppressed.
Nov 27 05:32:27 merlin kernel: cpufreq-core: target for CPU 0: 2400000 kHz, relation 1
Nov 27 05:32:35 merlin kernel: printk: 33 messages suppressed.
Nov 27 05:32:35 merlin kernel: cpufreq-core: updating policy for CPU 0
Nov 27 05:32:35 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:32:35 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:32:35 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:32:35 merlin kernel: freq-table: request for verification of policy (800000 - 2000000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: freq-table: verification lead to (800000 - 2000000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 2000000 kHz
Nov 27 05:32:35 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:32:35 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:32:35 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:32:35 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:32:35 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:32:35 merlin kernel: freq-table: request for verification of policy (800000 - 2000000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: freq-table: verification lead to (800000 - 2000000 kHz) for cpu 0
Nov 27 05:32:35 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 2000000 kHz
Nov 27 05:32:35 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:32:35 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:32:41 merlin kernel: printk: 8 messages suppressed.
Nov 27 05:32:41 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:33:18 merlin kernel: printk: 16 messages suppressed.
Nov 27 05:33:18 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:33:18 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2000000 (0)
Nov 27 05:33:18 merlin kernel: freq-table: request for target 2000000 kHz (relation: 1) for cpu 0
Nov 27 05:33:18 merlin kernel: freq-table: target is 2 (2000000 kHz, 2)
Nov 27 05:33:18 merlin kernel: cpufreq-core: notification 0 of frequency transition to 2000000 kHz
Nov 27 05:33:18 merlin kernel: cpufreq-core: notification 0 of frequency transition to 2000000 kHz
Nov 27 05:33:18 merlin kernel: cpufreq-core: notification 1 of frequency transition to 2000000 kHz
Nov 27 05:33:18 merlin kernel: cpufreq-core: notification 1 of frequency transition to 2000000 kHz
Nov 27 05:33:28 merlin kernel: printk: 9 messages suppressed.
Nov 27 05:33:28 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:33:28 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2000000 (0)
Nov 27 05:33:34 merlin kernel: printk: 92 messages suppressed.
Nov 27 05:33:34 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:33:41 merlin kernel: printk: 16 messages suppressed.
Nov 27 05:33:41 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:33:43 merlin kernel: printk: 5 messages suppressed.
Nov 27 05:33:43 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:33:55 merlin kernel: printk: 76 messages suppressed.
Nov 27 05:33:55 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:33:55 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2000000 (0)
Nov 27 05:33:57 merlin kernel: printk: 32 messages suppressed.
Nov 27 05:33:57 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:34:03 merlin kernel: printk: 101 messages suppressed.
Nov 27 05:34:03 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:34:07 merlin kernel: printk: 16 messages suppressed.
Nov 27 05:34:07 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:34:14 merlin kernel: printk: 84 messages suppressed.
Nov 27 05:34:14 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:34:27 merlin kernel: printk: 16 messages suppressed.
Nov 27 05:34:27 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:34:27 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2000000 (0)
Nov 27 05:34:27 merlin kernel: freq-table: request for target 2000000 kHz (relation: 1) for cpu 0
Nov 27 05:35:00 merlin kernel: printk: 31 messages suppressed.
Nov 27 05:35:00 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:35:00 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 2000000 (0)
Nov 27 05:35:00 merlin kernel: freq-table: request for target 2000000 kHz (relation: 1) for cpu 0
Nov 27 05:35:00 merlin kernel: freq-table: target is 2 (2000000 kHz, 2)
Nov 27 05:35:00 merlin kernel: cpufreq-core: notification 0 of frequency transition to 2000000 kHz
Nov 27 05:35:00 merlin kernel: cpufreq-core: notification 0 of frequency transition to 2000000 kHz
Nov 27 05:35:04 merlin kernel: printk: 11 messages suppressed.
Nov 27 05:35:04 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:35:11 merlin kernel: printk: 33 messages suppressed.
Nov 27 05:35:11 merlin kernel: cpufreq-core: target for CPU 0: 2000000 kHz, relation 1
Nov 27 05:35:16 merlin kernel: printk: 7 messages suppressed.
Nov 27 05:35:16 merlin kernel: cpufreq-core: updating policy for CPU 0
Nov 27 05:35:16 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:35:16 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:16 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:16 merlin kernel: freq-table: request for verification of policy (800000 - 1600000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: freq-table: verification lead to (800000 - 1600000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 1600000 kHz
Nov 27 05:35:16 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:35:16 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:35:16 merlin kernel: cpufreq-core: target for CPU 0: 1600000 kHz, relation 1
Nov 27 05:35:16 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 1600000 (0)
Nov 27 05:35:16 merlin kernel: freq-table: request for target 1600000 kHz (relation: 1) for cpu 0
Nov 27 05:35:16 merlin kernel: freq-table: target is 3 (1600000 kHz, 3)
Nov 27 05:35:16 merlin kernel: cpufreq-core: notification 0 of frequency transition to 1600000 kHz
Nov 27 05:35:16 merlin kernel: cpufreq-core: notification 0 of frequency transition to 1600000 kHz
Nov 27 05:35:16 merlin kernel: cpufreq-core: notification 1 of frequency transition to 1600000 kHz
Nov 27 05:35:16 merlin kernel: cpufreq-core: notification 1 of frequency transition to 1600000 kHz
Nov 27 05:35:16 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:35:16 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:16 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:16 merlin kernel: freq-table: request for verification of policy (800000 - 1600000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: freq-table: verification lead to (800000 - 1600000 kHz) for cpu 0
Nov 27 05:35:16 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 1600000 kHz
Nov 27 05:35:16 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:35:16 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:35:36 merlin kernel: printk: 8 messages suppressed.
Nov 27 05:35:36 merlin kernel: cpufreq-core: updating policy for CPU 0
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: get_cur_val = 100665373
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: cur freq = 1600000
Nov 27 05:35:36 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:36 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:36 merlin kernel: freq-table: request for verification of policy (800000 - 1200000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: freq-table: verification lead to (800000 - 1200000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 1200000 kHz
Nov 27 05:35:36 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:35:36 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:35:36 merlin kernel: cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 1200000 (0)
Nov 27 05:35:36 merlin kernel: freq-table: request for target 1200000 kHz (relation: 1) for cpu 0
Nov 27 05:35:36 merlin kernel: freq-table: target is 4 (1200000 kHz, 4)
Nov 27 05:35:36 merlin kernel: cpufreq-core: notification 0 of frequency transition to 1200000 kHz
Nov 27 05:35:36 merlin kernel: cpufreq-core: notification 0 of frequency transition to 1200000 kHz
Nov 27 05:35:36 merlin kernel: cpufreq-core: notification 1 of frequency transition to 1200000 kHz
Nov 27 05:35:36 merlin kernel: cpufreq-core: notification 1 of frequency transition to 1200000 kHz
Nov 27 05:35:36 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:36 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:36 merlin kernel: freq-table: request for verification of policy (800000 - 1200000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: freq-table: verification lead to (800000 - 1200000 kHz) for cpu 0
Nov 27 05:35:36 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 1200000 kHz
Nov 27 05:35:36 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:35:36 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:35:46 merlin kernel: printk: 5 messages suppressed.
Nov 27 05:35:46 merlin kernel: cpufreq-core: updating policy for CPU 0
Nov 27 05:35:46 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:35:46 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:35:46 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:46 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:46 merlin kernel: freq-table: request for verification of policy (800000 - 800000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: freq-table: verification lead to (800000 - 800000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 800000 kHz
Nov 27 05:35:46 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:35:46 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:35:46 merlin kernel: cpufreq-core: target for CPU 0: 800000 kHz, relation 1
Nov 27 05:35:46 merlin kernel: acpi-cpufreq: acpi_cpufreq_target 800000 (0)
Nov 27 05:35:46 merlin kernel: freq-table: request for target 800000 kHz (relation: 1) for cpu 0
Nov 27 05:35:46 merlin kernel: freq-table: target is 5 (800000 kHz, 5)
Nov 27 05:35:46 merlin kernel: cpufreq-core: notification 0 of frequency transition to 800000 kHz
Nov 27 05:35:46 merlin kernel: cpufreq-core: notification 0 of frequency transition to 800000 kHz
Nov 27 05:35:46 merlin kernel: cpufreq-core: notification 1 of frequency transition to 800000 kHz
Nov 27 05:35:46 merlin kernel: cpufreq-core: notification 1 of frequency transition to 800000 kHz
Nov 27 05:35:46 merlin kernel: cpufreq-core: setting new policy for CPU 0: 800000 - 2401000 kHz
Nov 27 05:35:46 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:46 merlin kernel: freq-table: request for verification of policy (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: freq-table: verification lead to (800000 - 2401000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: acpi-cpufreq: acpi_cpufreq_verify
Nov 27 05:35:46 merlin kernel: freq-table: request for verification of policy (800000 - 800000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: freq-table: verification lead to (800000 - 800000 kHz) for cpu 0
Nov 27 05:35:46 merlin kernel: cpufreq-core: new min and max freqs are 800000 - 800000 kHz
Nov 27 05:35:46 merlin kernel: cpufreq-core: governor: change or update limits
Nov 27 05:35:46 merlin kernel: cpufreq-core: __cpufreq_governor for CPU 0, event 3
Nov 27 05:35:53 merlin kernel: printk: 7 messages suppressed.
Nov 27 05:35:53 merlin kernel: acpi-cpufreq: get_cur_freq_on_cpu (0)
Nov 27 05:35:53 merlin kernel: acpi-cpufreq: get_cur_val = 100698127

--------------030205090902010005090301
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------030205090902010005090301--

