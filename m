From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq on Coppermine
Date: Fri, 18 Nov 2005 16:41:49 +0100
Message-ID: <20051118154149.GA2104@poupinou.org>
References: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <460afdfa0511171405i6df97535n807210617eb3ac0e@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luca <luca.foppiano@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Nov 17, 2005 at 11:05:25PM +0100, Luca wrote:
> hi, I try to use cpu scaling on a Laptop with a coppermine 700Mhz.
> /proc/cpuinfo:
> 
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 8
> model name      : Pentium III (Coppermine)
> stepping        : 6
> cpu MHz         : 549.791
> cache size      : 256 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov pat p
> se36 mmx fxsr sse
> bogomips        : 1099.88
> 
> lspci -vvv :
> 
> 0000:00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX -
> 82443BX/ZX/DX Host bridge (rev 03)
>        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR+ FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort+ >SERR- <PERR-
>        Latency: 64
>        Region 0: Memory at f8000000 (32-bit, prefetchable) [size=64M]
>        Capabilities: <available only to root>
> 
> 0000:00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX
> AGP bridge (rev 03) (prog-if 00 [Normal decode])
>        Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV+ VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 128
>        Bus: primary=00, secondary=01, subordinate=01, sec-latency=64
>        I/O behind bridge: 00002000-00002fff
>        Memory behind bridge: fc100000-fdffffff
>        Prefetchable memory behind bridge: 28000000-280fffff
>        BridgeCtl: Parity- SERR- NoISA+ VGA+ MAbort- >Reset- FastB2B+
> 
> 0000:00:04.0 Multimedia audio controller: ESS Technology ES1988
> Allegro-1 (rev 12)
>        Subsystem: NEC Corporation: Unknown device 80f1
>        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 64 (500ns min, 6000ns max)
>        Interrupt: pin A routed to IRQ 5
>        Region 0: I/O ports at 1400 [size=256]
>        Capabilities: <available only to root>
> 
> 0000:00:06.0 Ethernet controller: 3Com Corporation 3c556B CardBus
> [Tornado] (rev 20)
>        Subsystem: 3Com Corporation 10/100 Mini PCI Ethernet Adapter
>        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 80 (2500ns min, 2500ns max), Cache Line Size: 0x08 (32 bytes)
>        Interrupt: pin A routed to IRQ 10
>        Region 0: I/O ports at 1800 [size=256]
>        Region 1: Memory at fc000400 (32-bit, non-prefetchable) [size=128]
>        Region 2: Memory at fc000000 (32-bit, non-prefetchable) [size=128]
>        Expansion ROM at 28100000 [disabled] [size=128K]
>        Capabilities: <available only to root>
> 
> 0000:00:06.1 Communication controller: 3Com Corporation Mini PCI 56k
> Winmodem (rev 20)
>        Subsystem: 3Com Corporation Mini PCI 56K Modem
>        Control: I/O- Mem- BusMaster- SpecCycle- MemWINV+ VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Interrupt: pin A routed to IRQ 10
>        Region 0: I/O ports at 1c00 [disabled] [size=256]
>        Region 1: Memory at fc000c00 (32-bit, non-prefetchable)
> [disabled] [size=256]
>        Region 2: Memory at fc000800 (32-bit, non-prefetchable)
> [disabled] [size=128]
>        Capabilities: <available only to root>
> 
> 0000:00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 02)
>        Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 0
> 
> 0000:00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE
> (rev 01) (prog-if 80 [Master])
>        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 64
>        Region 4: I/O ports at 1080 [size=16]
> 
> 0000:00:07.2 USB Controller: Intel Corporation 82371AB/EB/MB PIIX4 USB
> (rev 01) (prog-if 00 [UHCI])
>        Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 64
>        Interrupt: pin D routed to IRQ 5
>        Region 4: I/O ports at 1060 [size=32]
> 
> 0000:00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
>        Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Interrupt: pin ? routed to IRQ 9
> 
> 0000:00:0c.0 CardBus bridge: Texas Instruments PCI1420
>        Subsystem: NEC Corporation Versa Note VXi
>        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 168, Cache Line Size: 0x20 (128 bytes)
>        Interrupt: pin A routed to IRQ 10
>        Region 0: Memory at 28120000 (32-bit, non-prefetchable) [size=4K]
>        Bus: primary=00, secondary=02, subordinate=05, sec-latency=176
>        Memory window 0: 20000000-21fff000 (prefetchable)
>        Memory window 1: 22000000-23fff000
>        I/O window 0: 00003000-000030ff
>        I/O window 1: 00003400-000034ff
>        BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset+ 16bInt+ PostWrite+
>        16-bit legacy interface ports at 0001
> 
> 0000:00:0c.1 CardBus bridge: Texas Instruments PCI1420
>        Subsystem: NEC Corporation Versa Note VXi
>        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 168, Cache Line Size: 0x20 (128 bytes)
>        Interrupt: pin A routed to IRQ 10
>        Region 0: Memory at 28121000 (32-bit, non-prefetchable) [size=4K]
>        Bus: primary=00, secondary=06, subordinate=09, sec-latency=176
>        Memory window 0: 24000000-25fff000 (prefetchable)
>        Memory window 1: 26000000-27fff000
>        I/O window 0: 00003800-000038ff
>        I/O window 1: 00003c00-00003cff
>        BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset+ 16bInt+ PostWrite+
>        16-bit legacy interface ports at 0001
> 
> 0000:00:0d.0 FireWire (IEEE 1394): NEC Corporation IEEE 1394 Host
> Controller (rev 01) (prog-if 10 [OHCI])
>        Subsystem: NEC Corporation: Unknown device 80fa
>        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr-
> Stepping- SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 64, Cache Line Size: 0x08 (32 bytes)
>        Interrupt: pin A routed to IRQ 10
>        Region 0: Memory at fc001000 (32-bit, non-prefetchable) [size=4K]
>        Capabilities: <available only to root>
> 
> 0000:01:00.0 VGA compatible controller: ATI Technologies Inc Rage
> Mobility P/M AGP 2x (rev 64) (prog-if 00 [VGA])
>        Subsystem: NEC Corporation: Unknown device 80b7
>        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
> Stepping+ SERR- FastB2B-
>        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
> <TAbort- <MAbort- >SERR- <PERR-
>        Latency: 66 (2000ns min), Cache Line Size: 0x08 (32 bytes)
>        Interrupt: pin A routed to IRQ 5
>        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
>        Region 1: I/O ports at 2000 [size=256]
>        Region 2: Memory at fc100000 (32-bit, non-prefetchable) [size=4K]
>        Expansion ROM at 28000000 [disabled] [size=128K]
>        Capabilities: <available only to root>
> 
> I use an utility named speedstep-detect found here
> http://www.poupinou.org/cpufreq/
> and the result is:
> 
> dmi_scan: return:
> DMI 2.3 present.
> 49 structures occupying 2000 bytes.
> DMI table at 0x000E7010.
> BIOS Vendor: NEC
> BIOS Version: NOTE BIOS Version /175A2700
> BIOS Release: 03/06/2001
> System Vendor: NEC
> Product Name:
> Version:
> Board Vendor: NEC
> Board Name:
> Board Version:
> Trying Intel's int15 GSIC:
> BIOS support GSIC call:
>        signature: GSIC
>        command port = 0x00b2
>        command =      0x0080
>        event port =   0x000000b3
>        flags =        0x07d00001
> probing chipsets: Found PIIX4
>  pmbase at 0x1000
> Dumping PM IO register for this southbridge:
> PMCNTRL (0x1004): 0x1401
> (0x1006):         0x0000
> GPEN (0x100e):    0x0600
> PCNTRL (0x1010):  0x00001202
> (0x1016):         0x0000
> DEVSTS (0x101c):  0x00000000
> GLBLEN (0x1020):  0x0400
> (0x1022):         0x00000000
> GLBCTL (0x1028):  0x02013c05
> DEVCTL (0x102c):  0x01000000
> GPIs: (0x1030):   0x37e863
> (0x1033):         0x00
> GPOs: (0x1034):   0x37fffefe
> (0x1038):         0x63 0xe8 0x37 0x00 0xfe 0xfe 0xff 0x37
> 
> 
> You need to boot on AC and battery and see if GPOs change.
> Then, see if one bit change in between, you have then to note the number
> of this bit.  This will be the gpo_hilo= number kernel option for
> enabling the speedstep-piix4 module under Linux.
>                                      ..28..24..20..16..12...8...4...0
>        GPOs: (0x1034):   0x37fffefe  00110111111111111111111011111110
> 
> if I power on the pc only with battery GPOs change in
> 
> GPOs: (0x1034):   0x37fffeff
> (0x1038):         0x63 0xe8 0x37 0x00 0xff 0xfe 0xff 0x37
> 
> I try to use speedstep_smi with some option for example
> modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> 
> but the result is
> 
> pj@cristal:~$ sudo modprobe speedstep-smi
> FATAL: Error inserting speedstep_smi
> (/lib/modules/2.6.14-p3laptop/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko):
> No such device
> 
> 
> what I do?Is not supported?what option I can try to use?
> tell me if need some information.
> this laptop is a packard bell...
> help me
> 

You could eventually try with
ftp://ftp.poupinou.org/dont_use/old/speedstep_bx.tar.gz

I don't think it will work with a 2.6 kernel though, but just for
testing purpose...

You have to explicitely replace line 42:
/* #define I_WANT_SPEEDSTEP */
with
#define I_WANT_SPEEDSTEP

If that work, I will see if I found time to update cpufreq driver then.

BTW, be sure to read carrefully
http://www.poupinou.org/cpufreq/speedstep-piix4.html

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
