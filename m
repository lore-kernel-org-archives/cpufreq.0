From: Marcus Grando <marcus@corp.grupos.com.br>
Subject: Re: p4_clockmod or speedstep_ich | acpi?
Date: Wed, 28 Jan 2004 21:06:27 -0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <40184073.4070100@corp.grupos.com.br>
References: <4011EC55.5030304@sbh.eng.br> <20040124060321.GP25416@poupinou.org>
	<4015CFE8.1030002@corp.grupos.com.br>
	<20040128224106.GA5987@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050706050301090604090806"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040128224106.GA5987@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------050706050301090604090806
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Now it's work.

I Attach my new dmesg.

Regards

Dominik Brodowski wrote:
> On Tue, Jan 27, 2004 at 12:41:44AM -0200, Marcus Grando wrote:
> 
>>Hi,
>>
>>But why my kernel show this messages, if celeron not support speedstep-ich?
>>
>>cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
>>cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
>>cpufreq: modules offers voltage scaling in addition of frequency 
>>scaling. You
>>cpufreq: should use either one instead of p4-clockmod, if possible.
>>
>>Regards
>>
>>Ducrot Bruno wrote:
>>
>>>On Sat, Jan 24, 2004 at 01:53:57AM -0200, Marcus Grando wrote:
>>>
>>>
>>>>Hi,
>>>>
>>>>I have a toshiba satellite a10 127, and use p4 clockmod in cpufreq. I 
>>>>look this kernel messages:
>>>>
>>>>cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
>>>>cpufreq: Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq
>>>>cpufreq: modules offers voltage scaling in addition of frequency 
>>>>scaling. You
>>>>cpufreq: should use either one instead of p4-clockmod, if possible.
>>>>
>>>
>>>
>>>...
>>>
>>>
>>>>CPU:     After generic identify, caps: bfebf9ff 00000000 00000000 00000000
>>>>CPU:     After vendor identify, caps: bfebf9ff 00000000 00000000 00000000
>>>>CPU: Trace cache: 12K uops, L1 D cache: 8K
>>>>CPU: L2 cache: 256K
>>>>CPU:     After all inits, caps: bfebf9ff 00000000 00000000 00000080
>>>>CPU: Intel Mobile Intel(R) Celeron(R) CPU 2.00GHz stepping 09
>>>
>>>                            ^^^^^^^
>>>		  A celeron is not speedstep capable.
>>>
> 
> 
> Could you try out this patch, please?
> 
> 	Dominik
> 
> 
> ------------------------------------------------------------------------
> 
> diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
> --- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-01-16 20:30:36.000000000 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-01-28 23:32:49.637733272 +0100
> @@ -184,17 +184,55 @@
>  		if (c->x86_model != 2)
>  			return 0;
>  
> -		if ((c->x86_mask != 4) && /* B-stepping [M-P4-M] */
> -			(c->x86_mask != 7) && /* C-stepping [M-P4-M] */
> -			(c->x86_mask != 9))   /* D-stepping [M-P4-M or M-P4/533] */
> -			return 0;
> -
>  		ebx = cpuid_ebx(0x00000001);
>  		ebx &= 0x000000FF;
> -		if ((ebx != 0x0e) && (ebx != 0x0f))
> -			return 0;
>  
> -		return SPEEDSTEP_PROCESSOR_P4M;
> +		dprintk(KERN_INFO "ebx value is %x, x86_mask is %x\n", ebx, c->86_mask);
> +
> +		switch (c->x86_mask) {
> +		case 4: 
> +			/*
> +			 * B-stepping [M-P4-M] 
> +			 * sample has ebx = 0x0f, production has 0x0e.
> +			 */
> +			if ((ebx == 0x0e) || (ebx == 0x0f))
> +				return SPEEDSTEP_PROCESSOR_P4M;
> +			break;
> +		case 7: 
> +			/*
> +			 * C-stepping [M-P4-M]
> +			 * needs to have ebx=0x0e, else it's a celeron:
> +			 * cf. 25130917.pdf / page 7, footnote 5 even
> +			 * though 25072120.pdf / page 7 doesn't say
> +			 * samples are only of B-stepping...
> +			 */
> +			if (ebx == 0x0e)
> +				return SPEEDSTEP_PROCESSOR_P4M;
> +			break;
> +		case 9:
> +			/*
> +			 * D-stepping [M-P4-M or M-P4/533]
> +			 *
> +			 * this is totally strange: CPUID 0x0F29 is
> +			 * used by M-P4-M, M-P4/533 and(!) Celeron CPUs.
> +			 * The latter need to be sorted out as they don't
> +			 * support speedstep.
> +			 * Celerons with CPUID 0x0F29 may have either
> +			 * ebx=0x8 or 0xf -- 25130917.pdf doesn't say anything
> +			 * specific.
> +			 * M-P4-Ms may have either ebx=0xe or 0xf [see above]
> +			 * M-P4/533 have either ebx=0xe or 0xf. [25317607.pdf]
> +			 * So, how to distinguish all those processors with
> +			 * ebx=0xf? I don't know. Sort them out, and wait
> +			 * whether someone complains.
> +			 */
> +			if (ebx == 0x0e)
> +				return SPEEDSTEP_PROCESSOR_P4M;
> +			break;
> +		default:
> +			break;
> +		}
> +		return 0;
>  	}
>  
>  	switch (c->x86_model) {

-- 
Marcus Grando
Grupos Internet S/A
marcus(at)corp.grupos.com.br

--------------050706050301090604090806
Content-Type: text/plain;
 name="dmesg.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="dmesg.txt"

Linux version 2.6.2-bk2 (root@marcusg.house) (gcc version 3.3.2 20031022 (Red Hat Linux 3.3.2-1)) #4 Wed Jan 28 21:00:42 BRST 2004
BIOS-provided physical RAM map:
 BIOS-e820: 0000000000000000 - 000000000009fc00 (usable)
 BIOS-e820: 000000000009fc00 - 00000000000a0000 (reserved)
 BIOS-e820: 00000000000e0000 - 00000000000eee00 (reserved)
 BIOS-e820: 00000000000eee00 - 00000000000ef000 (ACPI NVS)
 BIOS-e820: 00000000000ef000 - 0000000000100000 (reserved)
 BIOS-e820: 0000000000100000 - 000000000ef40000 (usable)
 BIOS-e820: 000000000ef40000 - 000000000ef50000 (ACPI data)
 BIOS-e820: 000000000ef50000 - 000000000f000000 (reserved)
 BIOS-e820: 00000000fec10000 - 00000000fec20000 (reserved)
 BIOS-e820: 00000000feda0000 - 00000000fedc0000 (reserved)
 BIOS-e820: 00000000ffb80000 - 00000000ffc00000 (reserved)
 BIOS-e820: 00000000fff00000 - 0000000100000000 (reserved)
239MB LOWMEM available.
On node 0 totalpages: 61248
  DMA zone: 4096 pages, LIFO batch:1
  Normal zone: 57152 pages, LIFO batch:13
  HighMem zone: 0 pages, LIFO batch:1
DMI 2.3 present.
ACPI: RSDP (v000 TOSHIB                                    ) @ 0x000f0180
ACPI: RSDT (v001 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x0ef40000
ACPI: FADT (v002 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x0ef40058
ACPI: DBGP (v001 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x0ef400dc
ACPI: BOOT (v001 TOSHIB 750      0x00970814 TASM 0x04010000) @ 0x0ef40030
ACPI: DSDT (v001 TOSHIB AFCF7    0x20030326 MSFT 0x0100000e) @ 0x00000000
Building zonelist for node : 0
Kernel command line: ro root=/dev/hda3 norhgb nomodules
Initializing CPU#0
PID hash table entries: 1024 (order 10: 8192 bytes)
Detected 1995.509 MHz processor.
Using tsc for high-res timesource
Console: colour VGA+ 80x25
Memory: 238236k/244992k available (2432k kernel code, 6080k reserved, 873k data, 140k init, 0k highmem)
Checking if this processor honours the WP bit even in supervisor mode... Ok.
Calibrating delay loop... 3891.20 BogoMIPS
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU:     After generic identify, caps: bfebf9ff 00000000 00000000 00000000
CPU:     After vendor identify, caps: bfebf9ff 00000000 00000000 00000000
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 256K
CPU:     After all inits, caps: bfebf9ff 00000000 00000000 00000080
CPU: Intel Mobile Intel(R) Celeron(R) CPU 2.00GHz stepping 09
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
PCI: PCI BIOS revision 2.10 entry at 0xfd317, last bus=3
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20040116
ACPI: IRQ9 SCI: Level Trigger.
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Interrupt Link [LNKA] (IRQs *10)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 *11)
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
PCI: Ignoring BAR0-3 of IDE controller 0000:00:1f.1
Transparent bridge - 0000:00:1e.0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIB._PRT]
ACPI: Power Resource [PFAN] (off)
Toshiba System Managment Mode driver v1.11 26/9/2001
SCSI subsystem initialized
Linux Kernel Card Services
  options:  [pci] [cardbus] [pm]
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 10
ACPI: PCI Interrupt Link [LNKH] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKE] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
PCI: Using ACPI for IRQ routing
PCI: if you experience problems, try using option 'pci=noacpi' or even 'acpi=off'
SBF: Simple Boot Flag extension found and enabled.
SBF: Setting boot flags 0x1
ikconfig 0.7 with /proc/config*
udf: registering filesystem
ACPI: AC Adapter [ADP1] (off-line)
ACPI: Battery Slot [BAT1] (battery present)
ACPI: Power Button (FF) [PWRF]
ACPI: Lid Switch [LID]
ACPI: Fan [FAN] (off)
ACPI: Processor [CPU0] (supports C1 C2 C3)
ACPI: Thermal Zone [THRM] (65 C)
Toshiba Laptop ACPI Extras version 0.16
pty: 256 Unix98 ptys configured
lp: driver loaded but no devices found
Linux agpgart interface v0.100 (c) Dave Jones
agpgart: Detected an Intel 855 Chipset.
agpgart: Maximum main memory to use for agp memory: 189M
agpgart: Detected 16252K stolen memory.
agpgart: AGP aperture is 128M @ 0xd8000000
[drm] Initialized i830 1.3.2 20021108 on minor 0
Serial: 8250/16550 driver $Revision: 1.90 $ 8 ports, IRQ sharing disabled
PCI: Enabling device 0000:00:1f.6 (0000 -> 0001)
Using anticipatory io scheduler
Floppy drive(s): fd0 is 1.44M
floppy0: no floppy controllers found
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
nbd: registered device at major 43
Intel(R) PRO/100 Network Driver - version 2.3.30-k1
Copyright (c) 2003 Intel Corporation

e100: selftest OK.
e100: eth0: Intel(R) PRO/100 Network Connection
  Hardware receive checksums enabled

PPP generic driver version 2.4.2
PPP Deflate Compression module registered
PPP BSD Compression module registered
NET: Registered protocol family 24
orinoco.c 0.13e (David Gibson <hermes@gibson.dropbear.id.au> and others)
orinoco_cs.c 0.13e (David Gibson <hermes@gibson.dropbear.id.au> and others)
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 33MHz system bus speed for PIO modes; override with idebus=xx
ICH4: IDE controller at PCI slot 0000:00:1f.1
ICH4: chipset revision 3
ICH4: not 100% native mode: will probe irqs later
    ide0: BM-DMA at 0xbfa0-0xbfa7, BIOS settings: hda:DMA, hdb:pio
    ide1: BM-DMA at 0xbfa8-0xbfaf, BIOS settings: hdc:DMA, hdd:pio
hda: TOSHIBA MK3021GAS, ATA DISK drive
ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
hdc: TOSHIBA DVD-ROM SD-R2412, ATAPI CD/DVD-ROM drive
ide1 at 0x170-0x177,0x376 on irq 15
hda: max request size: 128KiB
hda: 58605120 sectors (30005 MB), CHS=58140/16/63, UDMA(100)
 hda: hda1 hda2 hda3 hda4
hdc: ATAPI 24X DVD-ROM CD-R/RW drive, 2048kB Cache, UDMA(33)
Uniform CD-ROM driver Revision: 3.20
PCI: Enabling device 0000:01:0b.0 (0000 -> 0002)
Yenta: CardBus bridge found at 0000:01:0b.0 [1179:0001]
Yenta: ISA IRQ mask 0x00b8, PCI irq 11
Socket status: 30000007
PCI: Enabling device 0000:00:1d.7 (0000 -> 0002)
ehci_hcd 0000:00:1d.7: EHCI Host Controller
PCI: Setting latency timer of device 0000:00:1d.7 to 64
ehci_hcd 0000:00:1d.7: irq 11, pci mem cf890000
ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus number 1
PCI: cache line size of 128 is not supported by device 0000:00:1d.7
ehci_hcd 0000:00:1d.7: USB 2.0 enabled, EHCI 1.00, driver 2003-Dec-29
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 6 ports detected
ohci_hcd: 2003 Oct 13 USB 1.1 'Open' Host Controller (OHCI) Driver (PCI)
ohci_hcd: block sizes: ed 64 td 64
drivers/usb/host/uhci-hcd.c: USB Universal Host Controller Interface driver v2.1
uhci_hcd 0000:00:1d.0: UHCI Host Controller
PCI: Setting latency timer of device 0000:00:1d.0 to 64
uhci_hcd 0000:00:1d.0: irq 10, io base 0000cfe0
uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus number 2
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 2 ports detected
drivers/usb/core/usb.c: registered new driver usblp
drivers/usb/class/usblp.c: v0.13: USB Printer Device Class driver
Initializing USB Mass Storage driver...
drivers/usb/core/usb.c: registered new driver usb-storage
USB Mass Storage support registered.
drivers/usb/core/usb.c: registered new driver hid
drivers/usb/input/hid-core.c: v2.0:USB HID core driver
drivers/usb/core/usb.c: registered new driver usbserial
drivers/usb/serial/usb-serial.c: USB Serial Driver core v2.0
drivers/usb/serial/usb-serial.c: USB Serial support registered for PocketPC PDA
drivers/usb/serial/ipaq.c: USB PocketPC PDA driver v0.5
drivers/usb/core/usb.c: registered new driver ipaq
mice: PS/2 mouse device common for all mice
serio: i8042 AUX port at 0x60,0x64 irq 12
input: PS/2 Generic Mouse on isa0060/serio1
serio: i8042 KBD port at 0x60,0x64 irq 1
input: AT Translated Set 2 keyboard on isa0060/serio0
Advanced Linux Sound Architecture Driver Version 0.9.7 (Thu Sep 25 19:16:36 2003 UTC).
PCI: Enabling device 0000:00:1f.5 (0000 -> 0003)
PCI: Setting latency timer of device 0000:00:1f.5 to 64
intel8x0: clocking to 48000
ALSA device list:
  #0: Intel 82801DB-ICH4 at 0x18080800, irq 11
NET: Registered protocol family 2
IP: routing cache hash table of 2048 buckets, 16Kbytes
TCP: Hash tables configured (established 16384 bind 32768)
ip_conntrack version 2.1 (1914 buckets, 15312 max) - 300 bytes per conntrack
ip_tables: (C) 2000-2002 Netfilter core team
ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.  http://snowman.net/projects/ipt_recent/
arp_tables: (C) 2002 David S. Miller
NET: Registered protocol family 1
NET: Registered protocol family 17
cpufreq: P4/Xeon(TM) CPU On-Demand Clock Modulation available
PM: Reading pmdisk image.
PM: Resume from disk failed.
ACPI: (supports S0 S3 S4 S5)
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mounted root (ext3 filesystem) readonly.
Freeing unused kernel memory: 140k freed
EXT3 FS on hda3, internal journal
Adding 522104k swap on /dev/hda4.  Priority:-1 extents:1
mtrr: base(0xd8000000) is not aligned on a size(0x180000) boundary
atkbd.c: Unknown key released (translated set 2, code 0x7a on isa0060/serio0).
atkbd.c: This is an XFree86 bug. It shouldn't access hardware directly.
atkbd.c: Unknown key released (translated set 2, code 0x7a on isa0060/serio0).
atkbd.c: This is an XFree86 bug. It shouldn't access hardware directly.

--------------050706050301090604090806
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------050706050301090604090806--

