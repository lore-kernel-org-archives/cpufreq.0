From: =?iso-8859-1?q?mark=20newman?= <emergant2000@yahoo.co.uk>
Subject: Fwd: Re: Manual PST settings for "unrecognized CPUs"
Date: Sun, 22 Aug 2004 11:02:11 +0100 (BST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040822100211.42415.qmail@web86906.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Sorry meant to send this to the list.

Mark



 --- mark newman <emergant2000@yahoo.co.uk> wrote: 
> Date: Sun, 22 Aug 2004 09:50:32 +0100 (BST)
> From: mark newman <emergant2000@yahoo.co.uk>
> Subject: Re: Manual PST settings for "unrecognized
> CPUs"
> To: GoatZilla <goatzilla@gmail.com>
> 
> Well,I dont have all the answers.  See my previous
> message :(.  I get the no such device error if I
> dont
> specift FID's etc on the insmod command line. 
> Without
> these options I think you get the normal behaviour. 
> It looks for a valid bios?
> 
> Mark   
> 
> 
> 
> ---
> GIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIoatZilla
> <goatzilla@gmail.com> wrote: 
> > OK, I just installed Linux on the machine and
> > patched 2.6.8
> > successfully, but I'm getting a a "No such device"
> > because the
> > powernow_decode_bios routine never finds the "PSB
> > Header".  I have no
> > idea what a PSB header even is.
> > 
> > Do I need to fake the PSB header information as
> > well?  Or is there a
> > simpler way around this?
> > 
> > 
> > I also attached the dump of x86info.  I'm not sure
> > why it's telling me
> > FID changes won't work; it's looking at some FIDC
> > bit in an MSR... 
> > This wouldn't affect cpufreq would it?
> > > Linux version 2.6.8 (root@broccoli) (gcc version
> > 3.3.4 (Debian 1:3.3.4-6sarge1)) #1 Sat Aug 21
> > 19:37:58 CDT 2004
> > BIOS-provided physical RAM map:
> >  BIOS-e820: 0000000000000000 - 00000000000a0000
> > (usable)
> >  BIOS-e820: 00000000000f0000 - 0000000000100000
> > (reserved)
> >  BIOS-e820: 0000000000100000 - 0000000007ff0000
> > (usable)
> >  BIOS-e820: 0000000007ff0000 - 0000000007ff3000
> > (ACPI NVS)
> >  BIOS-e820: 0000000007ff3000 - 0000000008000000
> > (ACPI data)
> >  BIOS-e820: 00000000ffff0000 - 0000000100000000
> > (reserved)
> > 127MB LOWMEM available.
> > On node 0 totalpages: 32752
> >   DMA zone: 4096 pages, LIFO batch:1
> >   Normal zone: 28656 pages, LIFO batch:6
> >   HighMem zone: 0 pages, LIFO batch:1
> > DMI 2.2 present.
> > ACPI: RSDP (v000 VIA694                           
>  
> >       ) @ 0x000f6a20
> > ACPI: RSDT (v001 VIA694 AWRDACPI 0x42302e31 AWRD
> > 0x00000000) @ 0x07ff3000
> > ACPI: FADT (v001 VIA694 AWRDACPI 0x42302e31 AWRD
> > 0x00000000) @ 0x07ff3040
> > ACPI: DSDT (v001 VIA694 AWRDACPI 0x00001000 MSFT
> > 0x0100000e) @ 0x00000000
> > ACPI: PM-Timer IO Port: 0x4008
> > Built 1 zonelists
> > Kernel command line: root=/dev/hda2 ro 
> > Local APIC disabled by BIOS -- reenabling.
> > Found and enabled local APIC!
> > Initializing CPU#0
> > PID hash table entries: 512 (order 9: 4096 bytes)
> > Detected 1347.875 MHz processor.
> > Using pmtmr for high-res timesource
> > Console: colour VGA+ 80x25
> > Dentry cache hash table entries: 32768 (order: 5,
> > 131072 bytes)
> > Inode-cache hash table entries: 16384 (order: 4,
> > 65536 bytes)
> > Memory: 122532k/131008k available (1321k kernel
> > code, 7932k reserved, 725k data, 204k init, 0k
> > highmem)
> > Checking if this processor honours the WP bit even
> > in supervisor mode... Ok.
> > Calibrating delay loop... 2670.59 BogoMIPS
> > Security Scaffold v1.0.0 initialized
> > Mount-cache hash table entries: 512 (order: 0,
> 4096
> > bytes)
> > CPU: After generic identify, caps: 0383fbff
> c1c3fbff
> > 00000000 00000000
> > CPU: After vendor identify, caps:  0383fbff
> c1c3fbff
> > 00000000 00000000
> > CPU: CLK_CTL MSR was 60031223. Reprogramming to
> > 20031223
> > CPU: L1 I Cache: 64K (64 bytes/line), D cache 64K
> > (64 bytes/line)
> > CPU: L2 Cache: 64K (64 bytes/line)
> > CPU: After all inits, caps:        0383fbff
> c1c3fbff
> > 00000000 00000020
> > CPU: AMD Unknown CPU Typ stepping 01
> > Enabling fast FPU save and restore... done.
> > Enabling unmasked SIMD FPU exception support...
> > done.
> > Checking 'hlt' instruction... OK.
> > enabled ExtINT on CPU#0
> > ESR value before enabling vector: 00000000
> > ESR value after enabling vector: 00000000
> > Using local APIC timer interrupts.
> > calibrating APIC timer ...
> > ..... CPU clock speed is 1347.0528 MHz.
> > ..... host bus clock speed is 199.0633 MHz.
> > checking if image is initramfs...it isn't (ungzip
> > failed); looks like an initrd
> > Freeing initrd memory: 4232k freed
> > NET: Registered protocol family 16
> > EISA bus registered
> > PCI: PCI BIOS revision 2.10 entry at 0xfb3e0, last
> > bus=1
> > PCI: Using configuration type 1
> > mtrr: v2.0 (20020519)
> > ACPI: Subsystem revision 20040326
> > ACPI: IRQ9 SCI: Level Trigger.
> > spurious 8259A interrupt: IRQ7.
> > ACPI: Interpreter enabled
> > ACPI: Using PIC for interrupt routing
> > ACPI: PCI Root Bridge [PCI0] (00:00)
> > PCI: Probing PCI hardware (bus 00)
> > ACPI: PCI Interrupt Routing Table
> [\_SB_.PCI0._PRT]
> > ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 7
> 10
> > *11 12 14 15)
> > ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 *5 6 7
> > 10 11 12 14 15)
> > ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 7
> > *10 11 12 14 15)
> > ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 7
> 10
> > 11 *12 14 15)
> > Linux Plug and Play Support v0.97 (c) Adam Belay
> > PnPBIOS: Scanning system for PnP BIOS support...
> > PnPBIOS: Found PnP BIOS installation structure at
> > 0xc00fbef0
> > PnPBIOS: PnP BIOS version 1.0, entry
> 0xf0000:0xbf20,
> > dseg 0xf0000
> > PnPBIOS: 13 nodes reported by PnP BIOS; 13
> recorded
> > by driver
> > PCI: Using ACPI for IRQ routing
> > ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
> > ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 11
> > (level, low) -> IRQ 11
> > ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 5
> > ACPI: PCI interrupt 0000:00:10.1[B] -> GSI 5
> (level,
> > low) -> IRQ 5
> > ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 10
> > ACPI: PCI interrupt 0000:00:10.2[C] -> GSI 10
> > (level, low) -> IRQ 10
> > ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 12
> > ACPI: PCI interrupt 0000:00:10.3[D] -> GSI 12
> > (level, low) -> IRQ 12
> > ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 11
> > (level, low) -> IRQ 11
> > ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 10
> > (level, low) -> IRQ 10
> > ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 11
> > (level, low) -> IRQ 11
> > ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 11
> > (level, low) -> IRQ 11
> > VFS: Disk quotas dquot_6.5.1
> > Dquot-cache hash table entries: 1024 (order 0,
> 4096
> > bytes)
> > devfs: 2004-01-31 Richard Gooch
> > (rgooch@atnf.csiro.au)
> > devfs: boot_options: 0x0
> > Initializing Cryptographic API
> > isapnp: Scanning for PnP cards...
> > isapnp: No Plug & Play device found
> > Serial: 8250/16550 driver $Revision: 1.90 $ 54
> > ports, IRQ sharing enabled
> > ttyS0 at I/O 0x3f8 (irq = 4) is a 16550A
> > RAMDISK driver initialized: 16 RAM disks of 8192K
> > size 1024 blocksize
> > serio: i8042 AUX port at 0x60,0x64 irq 12
> > serio: i8042 KBD port at 0x60,0x64 irq 1
> > input: AT Translated Set 2 keyboard on
> > isa0060/serio0
> > EISA: Probing bus 0 at eisa0
> > NET: Registered protocol family 2
> > IP: routing cache hash table of 512 buckets,
> 4Kbytes
> > TCP: Hash tables configured (established 8192 bind
> > 16384)
> > NET: Registered protocol family 8
> > NET: Registered protocol family 20
> > ACPI: (supports S0 S1 S4 S5)
> > RAMDISK: cramfs filesystem found at block 0
> > RAMDISK: Loading 4232 blocks [1 disk] into ram
> > disk...
> >
>
|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|/-\|done.
> > VFS: Mounted root (cramfs filesystem) readonly.
> > Freeing unused kernel memory: 204k freed
> > NET: Registered protocol family 1
> > Uniform Multi-Platform E-IDE driver Revision:
> > 7.00alpha2
> > ide: Assuming 33MHz system bus speed for PIO
> modes;
> > override with idebus=xx
> > VP_IDE: IDE controller at PCI slot 0000:00:11.1
> > ACPI: PCI interrupt 0000:00:11.1[A] -> GSI 11
> > (level, low) -> IRQ 11
> > VP_IDE: chipset revision 6
> > VP_IDE: not 100% native mode: will probe irqs
> later
> > VP_IDE: VIA vt8235 (rev 00) IDE UDMA133 controller
> > on pci0000:00:11.1
> >     ide0: BM-DMA at 0xdc00-0xdc07, BIOS settings:
> > hda:DMA, hdb:DMA
> >     ide1: BM-DMA at 0xdc08-0xdc0f, BIOS settings:
> > hdc:pio, hdd:pio
> > hda: Maxtor 6Y250P0, ATA DISK drive
> > hdb: HL-DT-STDVD-ROM GDR8161B, ATAPI CD/DVD-ROM
> > drive
> > Using anticipatory io scheduler
> > ide0 at 0x1f0-0x1f7,0x3f6 on irq 14
> > hda: max request size: 1024KiB
> > hda: 490234752 sectors (251000 MB) w/7936KiB
> Cache,
> > CHS=30515/255/63, UDMA(133)
> >  /dev/ide/host0/bus0/target0/lun0: p1 p2 p3
> > kjournald starting.  Commit interval 5 seconds
> > EXT3-fs: mounted filesystem with ordered data
> mode.
> > Adding 257028k swap on /dev/hda3.  Priority:-1
> > extents:1
> > EXT3 FS on hda2, internal journal
> > Real Time Clock Driver v1.12
> > hdb: ATAPI 48X DVD-ROM drive, 256kB Cache,
> UDMA(33)
> > Uniform CD-ROM driver Revision: 3.20
> > irda_init()
> > NET: Registered protocol family 23
> > via-rhine.c:v1.10-LK1.1.20-2.6 May-23-2004 Written
> > by Donald Becker
> > ACPI: PCI interrupt 0000:00:12.0[A] -> GSI 11
> > (level, low) -> IRQ 11
> > 
> === message truncated ===> x86info v1.12b.  Dave
> Jones
> 2001-2003
> > Feedback to <davej@redhat.com>.
> > 
> > Found 1 CPU
> >
>
--------------------------------------------------------------------------
> > eax in: 0x00000000, eax = 00000001 ebx = 68747541
> > ecx = 444d4163 edx = 69746e65
> > eax in: 0x00000001, eax = 00000681 ebx = 00000000
> > ecx = 00000000 edx = 0383fbff
> > 
> > eax in: 0x80000000, eax = 80000008 ebx = 68747541
> > ecx = 444d4163 edx = 69746e65
> > eax in: 0x80000001, eax = 00000781 ebx = 00000000
> > ecx = 00000000 edx = c1c3fbff
> > eax in: 0x80000002, eax = 6e6b6e55 ebx = 206e776f
> > ecx = 20555043 edx = 00707954
> > eax in: 0x80000003, eax = 00000000 ebx = 00000000
> > ecx = 00000000 edx = 00000000
> > eax in: 0x80000004, eax = 00000000 ebx = 00000000
> > ecx = 00000000 edx = 00000000
> > eax in: 0x80000005, eax = 0408ff08 ebx = ff20ff10
> > ecx = 40020140 edx = 40020140
> > eax in: 0x80000006, eax = 00000000 ebx = 41004100
> > ecx = 00408140 edx = 00000000
> > eax in: 0x80000007, eax = 00000000 ebx = 00000000
> > ecx = 00000000 edx = 00000007
> > eax in: 0x80000008, eax = 00002022 ebx = 00000000
> > ecx = 00000000 edx = 00000000
> > 
> > Family: 6 Model: 8 Stepping: 1
> > CPU Model : Mobile Duron  (Thoroughbred)[B0]
> > Feature flags:
> > 	Onboard FPU
> > 	Virtual Mode Extensions
> > 	Debugging Extensions
> > 	Page Size Extensions
> > 	Time Stamp Counter
> > 	Model-Specific Registers
> > 	Physical Address Extensions
> > 	Machine Check Architecture
> > 	CMPXCHG8 instruction
> > 	Onboard APIC
> > 	SYSENTER/SYSEXIT
> > 	Memory Type Range Registers
> > 	Page Global Enable
> > 	Machine Check Architecture
> > 	CMOV instruction
> > 	Page Attribute Table
> > 	36-bit PSEs
> > 	MMX support
> > 	FXSAVE and FXRESTORE instructions
> > 	SSE support
> > 
> > Extended feature flags:
> >  syscall mmxext 3dnowext 3dnow
> > MSR: 0x0000002a=0x00000000 : 00000000 00000000
> > 00000000 00000000
> > MSR: 0xc0000080=0x00000000 : 00000000 00000000
> > 00000000 00000000
> > MSR: 0xc0010010=0x00140604 : 00000000 00010100
> > 00000110 00000100
> > MSR: 0xc0010015=0x050b1008 : 00000101 00001011
> > 00010000 00001000
> > MSR: 0xc001001b=0x20031223 : 00100000 00000011
> > 00010010 00100011
> > 
> > Number of reporting banks : 4
> > 
> > MCG_CTL:
> >  Data cache check disabled
> >  Instruction cache check disabled
> >  Bus unit check disabled
> >  Load/Store unit check disabled
> > 
> >            31       23       15       7 
> > Bank: 0 (0x400)
> > MC0CTL:    00000000 00000000 00000000 00000000
> > MC0STATUS: 00000000 00000000 00000000 00000000
> > MC0ADDR:   00000000 00000000 00000000 00000000
> > MC0MISC:   00000000 00000000 00000000 00000000
> > 
> > Bank: 1 (0x404)
> > MC1CTL:    00000000 00000000 00000000 00000000
> > MC1STATUS: 00000000 00000000 00101010 00111010
> > MC1ADDR:   00000000 00000000 00101010 00111010
> > MC1MISC:   00000000 00000000 00000000 00000000
> > 
> > Bank: 2 (0x408)
> > MC2CTL:    00000000 00000000 00000000 00000000
> > MC2STATUS: 00000000 00000010 00000001 00000010
> > MC2ADDR:   10111101 00000000 00000000 00001111
> > MC2MISC:   10111101 00000000 00000000 00001111
> > 
> > Bank: 3 (0x40c)
> > MC3CTL:    00000000 00000000 00000000 00000000
> > MC3STATUS: 00000000 00000000 00001000 01000011
> > MC3ADDR:   11111111 11111111 11110111 11111111
> > MC3MISC:   00000000 00000000 00000000 00000000
> > 
> > Instruction TLB: Fully associative. 16 entries.
> > Data TLB: Fully associative. 32 entries.
> > L1 Data cache:
> > 	Size: 64Kb	2-way associative. 
> > 	lines per tag=1	line size=64 bytes.
> > L1 Instruction cache:
> > 	Size: 64Kb	2-way associative. 
> > 	lines per tag=1	line size=64 bytes.
> > L2 (on CPU) cache:
> > 	Size: 64Kb	8-way associative. 
> > 	lines per tag=1	line size=64 bytes.
> > 
> > PowerNOW! Technology information
> > Available features:
> > 	Temperature sensing diode present.
> > 	Bus divisor control
> > 	Voltage ID control
> > 
> > MSR: 0xc0010041=0x0000000000000000 : 00000000
> > 00000000 00000000 00000000
> >            00000000 00000000 00000000 00000000
> > MSR: 0xc0010042=0x0000000000111515 : 00000000
> > 00000000 00000000 00000000
> >            00000000 00010001 00010101 00010101
> > 
> > FID changes won't happen
> > VID changes won't happen
> > Voltage ID codes: Maximum=2.000V Startup=2.000V
> > Currently=2.000V
> > Frequency ID codes: Maximum=19.0x Startup=13.5x
> > Currently=13.5x
> > Decoding BIOS PST tables (maxfid=11, startvid=0)
> > Connector type: Socket A (462 Pin PGA)
> > 
> > 
> > MTRR registers:
> > MTRRcap (0xfe): 0x0000000000000508
> > MTRRphysBase0 (0x200): 0x0000000000000006
> > MTRRphysMask0 (0x201): 0x0000000ff8000800
> > MTRRphysBase1 (0x202): 0x00000000d0000001
> > MTRRphysMask1 (0x203): 0x0000000ff8000800
> > MTRRphysBase2 (0x204): 0x00000000d0000001
> > MTRRphysMask2 (0x205): 0x0000000ff8000800
> > MTRRphysBase3 (0x206): 0x0000000000000000
> > MTRRphysMask3 (0x207): 0x0000000000000000
> > MTRRphysBase4 (0x208): 0x0000000000000000
> > MTRRphysMask4 (0x209): 0x0000000000000000
> > MTRRphysBase5 (0x20a): 0x0000000000000000
> > MTRRphysMask5 (0x20b): 0x0000000000000000
> > MTRRphysBase6 (0x20c): 0x0000000000000000
> > MTRRphysMask6 (0x20d): 0x0000000000000000
> > MTRRphysBase7 (0x20e): 0x0000000000000000
> > MTRRphysMask7 (0x20f): 0x0000000000000000
> > MTRRfix64K_00000 (0x250): 0x0606060606060606
> > MTRRfix16K_80000 (0x258): 0x0606060606060606
> > MTRRfix16K_A0000 (0x259): 0x0000000000000000
> > MTRRfix4K_C8000 (0x269): 0x0000000000000000
> > MTRRfix4K_D0000 0x26a: 0x0000000000000000
> > MTRRfix4K_D8000 0x26b: 0x0000000000000000
> > MTRRfix4K_E0000 0x26c: 0x0000000000000000
> > MTRRfix4K_E8000 0x26d: 0x0000000000000000
> > MTRRfix4K_F0000 0x26e: 0x0000000000000000
> > MTRRfix4K_F8000 0x26f: 0x0000000000000000
> > MTRRdefType (0x2ff): 0x0000000000000c00
> > 
> > 
> > 1.3Ghz processor (estimate).
> > 
> > > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@www.linux.org.uk
> > http://www.linux.org.uk/mailman/listinfo/cpufreq
> >  
> 
> 
> 	
> 	
> 		
>
___________________________________________________________ALL-NEW
> Yahoo! Messenger - all new features - even more fun!
>  http://uk.messenger.yahoo.com
>  


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com
