From: Hendrik Fehr <hendrik.fehr@mailbox.tu-dresden.de>
Subject: PROBLEM: scaling_max_freq lower and lower with
	X86_SPEEDSTEP_CENTRINO_ACPI not set
Date: Fri, 25 Apr 2008 02:28:31 +0200
Message-ID: <200804250228.31566.hendrik.fehr@mailbox.tu-dresden.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

Variation on the theme REPORTING-BUGS
(please answer directly i am not in cpufreq@lists.linux.org.uk)

[1.] One line summary of the problem:
scaling_max_freq lower and lower with X86_SPEEDSTEP_CENTRINO_ACPI not set

[2.] Full description of the problem/report:
Core 2 Duo T7700 supports the following frequencies:
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
2401000 2400000 2000000 1600000 1200000 800000
1) When i boot with a kernel >=2.6.22 the number in
/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
reduces itself every two or three minutes until it is at 800000 and stays 
there.
The temperature of both cores (reported by lm_sensors' coretemp module)
stays between 49 and 55 degrees of Celsius. Audible fan operation happens,
until the temperature is 49. All the time scaling_max_freq is at 800000 and 
the
governor (ondemand or performance) respects that.
Setting a greater value for scaling_max_freq (by cpufreq-set -u <freq>) or
by echo 2400000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
succeeds but 800000 (or whatever the lower freq is) will be printed when read.
From my point of view this is unwanted behaviour, because i can not have the
full CPU power although there is a sufficient temperature margin.
(There is no X86_SPEEDSTEP_CENTRINO_ACPI option on >=2.6.23)

2) When i boot with a kernel =2.6.22 that has X86_SPEEDSTEP_CENTRINO_ACPI=y 
set,
cpufreq behaves like i think is right: The supported range of frequencies can
be used by the governor and scaling_max_freq can be set. It does not 
reduce itself.

3) When i boot with a kernel =2.6.22 that has X86_SPEEDSTEP_CENTRINO_ACPI not 
set, it behaves like >2.6.22 like the 1) case.

Even stranger:
X86_SPEEDSTEP_CENTRINO_ACPI=y depends on X86_SPEEDSTEP_CENTRINO=y (i think)
however in all three cases it uses
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
acpi-cpufreq
as scaling driver (of course i have CONFIG_X86_ACPI_CPUFREQ=y too).

With git-bisect i found out that commit
68485695e5a84399da7b48b208ac42623fe22963
[CPUFREQ] the overdue removal of X86_SPEEDSTEP_CENTRINO_ACPI
introduces this behaviour.
Of course unsetting of X86_SPEEDSTEP_CENTRINO_ACPI
on 2.6.22 or 2.6.22.19 (which are all prior to the said commit) shows the
same unwanted behaviour. All the time acpi-cpufreq will be used as driver.

[3.] Keywords (i.e., modules, networking, kernel):
acpi_cpufreq, X86_SPEEDSTEP_CENTRINO_ACPI

[4.] Kernel version (from /proc/version):
Kernel that has the problem:
cat /proc/version 
Linux version 2.6.22ilg-g68485695 (hefe@salamander) (gcc version 4.1.2 (Gentoo 
4.1.2 p1.0.2)) #12 SMP PREEMPT Wed Apr 23 16:13:29 CEST 2008
it uses
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver 
acpi-cpufreq
as scaling driver. (the ilg in the version string is set by my .config file)

Kernel that does not have the problem:
cat /proc/version 
Linux version 2.6.22ilg-g905497c4 (hefe@salamander) (gcc version 4.1.2 (Gentoo 
4.1.2 p1.0.2)) #13 SMP PREEMPT Wed Apr 23 16:20:47 CEST 2008
it uses
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
acpi-cpufreq
as scling driver.

[7.] Environment
[7.1.] Software (add the output of the ver_linux script here)
scripts/ver_linux 
If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
 
 Linux salamander 2.6.22ilg-g905497c4 #13 SMP PREEMPT Wed Apr 23 16:20:47 CEST 
2008 i686 Intel(R) Core(TM)2 Duo CPU T7700 @ 2.40GHz GenuineIntel GNU/Linux
  
  Gnu C                  4.1.2
  Gnu make               3.81
  binutils               Binutils
  util-linux             2.13.1
  mount                  2.13.1
  module-init-tools      3.4
  e2fsprogs              1.40.6
  reiserfsprogs          3.6.19
  pcmciautils            014
  pcmcia-cs              3.2.8
  PPP                    2.4.4
  Linux C Library        2.6.1
  Dynamic linker (ldd)   2.6.1
  Procps                 3.2.7
  Net-tools              1.60
  Kbd                    1.13
  Sh-utils               6.10
  udev                   119
  wireless-tools         29
  Modules Loaded         nf_conntrack_ipv4 xt_conntrack nf_conntrack 
iptable_filter ip_tables x_tables reiserfs pcmcia snd_hda_intel snd_pcm 
snd_timer snd ehci_hcd soundcore uhci_hcd sdhci mmc_core usbcore 
snd_page_alloc parport_pc parport yenta_socket rsrc_nonstatic pcmcia_core

[7.2.] Processor information (from /proc/cpuinfo):
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 15
model name	: Intel(R) Core(TM)2 Duo CPU     T7700  @ 2.40GHz
stepping	: 11
cpu MHz		: 800.000
cache size	: 4096 KB
physical id	: 0
siblings	: 2
core id		: 0
cpu cores	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc 
arch_perfmon pebs bts pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm 
ida
bogomips	: 4791.56
clflush size	: 64

processor	: 1
vendor_id	: GenuineIntel
cpu family	: 6
model		: 15
model name	: Intel(R) Core(TM)2 Duo CPU     T7700  @ 2.40GHz
stepping	: 11
cpu MHz		: 800.000
cache size	: 4096 KB
physical id	: 0
siblings	: 2
core id		: 1
cpu cores	: 2
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 10
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat 
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe nx lm constant_tsc 
arch_perfmon pebs bts pni monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr lahf_lm 
ida
bogomips	: 4787.86
clflush size	: 64

[7.3.] Module information (from /proc/modules):
nf_conntrack_ipv4 12296 1 - Live 0xf8a57000
xt_conntrack 2304 1 - Live 0xf8a4f000
nf_conntrack 48648 2 nf_conntrack_ipv4,xt_conntrack, Live 0xf90a3000
iptable_filter 2240 1 - Live 0xf8a45000
ip_tables 10188 1 iptable_filter, Live 0xf8a4b000
x_tables 11716 2 xt_conntrack,ip_tables, Live 0xf8a47000
reiserfs 209088 2 - Live 0xf8a9f000
pcmcia 32876 0 - Live 0xf8976000
snd_hda_intel 245400 1 - Live 0xf8a62000
sdhci 14668 0 - Live 0xf8966000
mmc_core 24452 1 sdhci, Live 0xf895f000
snd_pcm 68804 1 snd_hda_intel, Live 0xf8a01000
uhci_hcd 21968 0 - Live 0xf8958000
ehci_hcd 31052 0 - Live 0xf894f000
parport_pc 31588 0 - Live 0xf890e000
snd_timer 18884 1 snd_pcm, Live 0xf8908000
snd 43812 5 snd_hda_intel,snd_pcm,snd_timer, Live 0xf8917000
yenta_socket 23052 4 - Live 0xf8901000
parport 33288 1 parport_pc, Live 0xf8876000
rsrc_nonstatic 10816 1 yenta_socket, Live 0xf8855000
soundcore 6112 1 snd, Live 0xf885c000
snd_page_alloc 7432 2 snd_hda_intel,snd_pcm, Live 0xf8859000
usbcore 121412 3 uhci_hcd,ehci_hcd, Live 0xf8926000
pcmcia_core 32984 3 pcmcia,yenta_socket,rsrc_nonstatic, Live 0xf8860000

[7.4.] Loaded driver and hardware information (/proc/ioports, /proc/iomem)
0000-001f : dma1
0020-0021 : pic1
0040-0043 : timer0
0050-0053 : timer1
0060-006f : keyboard
0070-0077 : rtc
0080-008f : dma page reg
00a0-00a1 : pic2
00c0-00df : dma2
00f0-00ff : fpu
0170-0177 : 0000:00:1f.1
01f0-01f7 : 0000:00:1f.1
0376-0376 : 0000:00:1f.1
0378-037a : parport0
037b-037f : parport0
03c0-03df : vga+
03f6-03f6 : 0000:00:1f.1
03f8-03ff : serial
0cf8-0cff : PCI conf1
1000-1003 : ACPI PM1a_EVT_BLK
1004-1005 : ACPI PM1a_CNT_BLK
1008-100b : ACPI PM_TMR
1010-1015 : ACPI CPU throttle
1020-1020 : ACPI PM2_CNT_BLK
1028-102f : ACPI GPE0_BLK
1800-1807 : 0000:00:02.0
1810-181f : 0000:00:1f.1
1820-183f : 0000:00:1a.0
  1820-183f : uhci_hcd
1840-185f : 0000:00:1a.1
  1840-185f : uhci_hcd
1860-187f : 0000:00:1d.0
  1860-187f : uhci_hcd
1880-189f : 0000:00:1d.1
  1880-189f : uhci_hcd
18a0-18bf : 0000:00:1d.2
  18a0-18bf : uhci_hcd
18d0-18d3 : 0000:00:1f.2
18d4-18d7 : 0000:00:1f.2
18d8-18df : 0000:00:1f.2
18e0-18ff : 0000:00:1f.2
1c00-1c07 : 0000:00:1f.2
1c20-1c3f : 0000:00:1f.3
2000-2fff : PCI Bus #04
  2000-20ff : 0000:04:00.0
    2000-20ff : sky2
3000-3fff : PCI Bus #1c
  3000-30ff : PCI CardBus #1d
  3400-34ff : PCI CardBus #1d
  3800-38ff : PCI CardBus #21
  3c00-3cff : PCI CardBus #21


00000000-0009dfff : System RAM
0009e000-0009ffff : reserved
000a0000-000bffff : Video RAM area
000c0000-000c7fff : Video ROM
000f0000-000fffff : System ROM
00100000-7f6cffff : System RAM
  00100000-0034bd90 : Kernel code
  0034bd91-00411303 : Kernel data
7f6d0000-7f6defff : ACPI Tables
7f6df000-7f6e2fff : ACPI Non-volatile Storage
7f6e3000-7fffffff : reserved
88000000-8fffffff : PCI Bus #1c
  88000000-8bffffff : PCI CardBus #1d
  8c000000-8fffffff : PCI CardBus #21
90000000-900fffff : PCI Bus #04
  90000000-9001ffff : 0000:04:00.0
90100000-901000ff : 0000:00:1f.3
94000000-97ffffff : PCI CardBus #1d
98000000-9bffffff : PCI CardBus #21
e0000000-efffffff : 0000:00:02.0
f8000000-fbffffff : reserved
fe000000-fe0fffff : 0000:00:02.0
fe100000-fe1fffff : 0000:00:02.1
fe200000-fe2fffff : PCI Bus #04
  fe200000-fe203fff : 0000:04:00.0
    fe200000-fe203fff : sky2
fe300000-fe3fffff : PCI Bus #14
  fe300000-fe301fff : 0000:14:00.0
fe400000-fe4fffff : PCI Bus #1c
  fe400000-fe400fff : 0000:1c:03.3
  fe401000-fe4010ff : 0000:1c:03.2
    fe401000-fe4010ff : sdhci:slot0
  fe402000-fe402fff : 0000:1c:03.0
    fe402000-fe402fff : yenta_socket
  fe403000-fe403fff : 0000:1c:03.1
    fe403000-fe403fff : yenta_socket
  fe410000-fe410fff : pcmcia_socket1
fe700000-fe703fff : 0000:00:1b.0
  fe700000-fe703fff : ICH HD audio
fe704000-fe7047ff : 0000:00:1f.2
  fe704000-fe7047ff : ahci
fe704800-fe704bff : 0000:00:1a.7
  fe704800-fe704bff : ehci_hcd
fe704c00-fe704fff : 0000:00:1d.7
  fe704c00-fe704fff : ehci_hcd
fec00000-fec0ffff : reserved
fed00000-fed003ff : reserved
fed14000-fed19fff : reserved
fed1c000-fed8ffff : reserved
fee00000-fee00fff : reserved
ff000000-ffffffff : reserved

[7.5.] PCI information ('lspci -vvv' as root)
00:00.0 Host bridge: Intel Corporation Mobile Memory Controller Hub (rev 03)
	Subsystem: Fujitsu Limited. Unknown device 13f2
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort+ >SERR- <PERR- INTx-
	Latency: 0
	Capabilities: [e0] Vendor Specific Information <?>
	Kernel driver in use: agpgart-intel

00:02.0 VGA compatible controller: Intel Corporation Mobile Integrated 
Graphics Controller (rev 03) (prog-if 00 [VGA controller])
	Subsystem: Fujitsu Limited. Unknown device 13f5
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at fe000000 (64-bit, non-prefetchable) [size=1M]
	Region 2: Memory at e0000000 (64-bit, prefetchable) [size=256M]
	Region 4: I/O ports at 1800 [size=8]
	Capabilities: [90] Message Signalled Interrupts: Mask- 64bit- Queue=0/0 
Enable-
		Address: 00000000  Data: 0000
	Capabilities: [d0] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
		Bridge: PM- B3+

00:02.1 Display controller: Intel Corporation Mobile Integrated Graphics 
Controller (rev 03)
	Subsystem: Fujitsu Limited. Unknown device 13f5
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Region 0: Memory at fe100000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: [d0] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
		Bridge: PM- B3+

00:1a.0 USB Controller: Intel Corporation 82801H (ICH8 Family) USB UHCI 
Contoller #4 (rev 03) (prog-if 00 [UHCI])
	Subsystem: Fujitsu Limited. Unknown device 1414
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 21
	Region 4: I/O ports at 1820 [size=32]
	Kernel driver in use: uhci_hcd
	Kernel modules: uhci-hcd

00:1a.1 USB Controller: Intel Corporation 82801H (ICH8 Family) USB UHCI 
Controller #5 (rev 03) (prog-if 00 [UHCI])
	Subsystem: Fujitsu Limited. Unknown device 1414
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 21
	Region 4: I/O ports at 1840 [size=32]
	Kernel driver in use: uhci_hcd
	Kernel modules: uhci-hcd

00:1a.7 USB Controller: Intel Corporation 82801H (ICH8 Family) USB2 EHCI 
Controller #2 (rev 03) (prog-if 20 [EHCI])
	Subsystem: Fujitsu Limited. Unknown device 1415
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin B routed to IRQ 20
	Region 0: Memory at fe704800 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Kernel driver in use: ehci_hcd
	Kernel modules: ehci-hcd

00:1b.0 Audio device: Intel Corporation 82801H (ICH8 Family) HD Audio 
Controller (rev 03)
	Subsystem: Fujitsu Limited. Unknown device 142d
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 22
	Region 0: Memory at fe700000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [60] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0 
Enable-
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v1) Root Complex Integrated Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <64ns, L1 <1us
			ExtTag- RBE- FLReset-
		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed unknown, Width x0, ASPM unknown, Latency L0 <64ns, L1 
<1us
			ClockPM- Suprise- LLActRep- BwNot-
		LnkCtl:	ASPM Disabled; Disabled- Retrain- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed unknown, Width x0, TrErr- Train- SlotClk- DLActive- BWMgmt- 
ABWMgmt-
	Capabilities: [100] Virtual Channel <?>
	Capabilities: [130] Root Complex Link <?>
	Kernel driver in use: HDA Intel
	Kernel modules: snd-hda-intel

00:1c.0 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Express Port 1 
(rev 03) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Bus: primary=00, secondary=04, subordinate=07, sec-latency=0
	I/O behind bridge: 00002000-00002fff
	Memory behind bridge: fe200000-fe2fffff
	Prefetchable memory behind bridge: 0000000090000000-00000000900fffff
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR- NoISA+ VGA- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v1) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 
unlimited
			ExtTag- RBE+ FLReset-
		DevCtl:	Report errors: Correctable+ Non-Fatal+ Fatal+ Unsupported+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr+ UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
		LnkCap:	Port #1, Speed 2.5GT/s, Width x1, ASPM L0s L1, Latency L0 <256ns, L1 
<4us
			ClockPM- Suprise- LLActRep+ BwNot-
		LnkCtl:	ASPM L0s Enabled; RCB 64 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+ BWMgmt- 
ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surpise+
			Slot #  2, PowerLimit 6.500000; Interlock- NoCompl-
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootCap: CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
	Capabilities: [80] Message Signalled Interrupts: Mask- 64bit- Queue=0/0 
Enable+
		Address: fee0300c  Data: 41c1
	Capabilities: [90] Subsystem: Fujitsu Limited. Unknown device 1416
	Capabilities: [a0] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100] Virtual Channel <?>
	Capabilities: [180] Root Complex Link <?>
	Kernel driver in use: pcieport-driver

00:1c.1 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Express Port 2 
(rev 03) (prog-if 00 [Normal decode])
	Control: I/O- Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Bus: primary=00, secondary=08, subordinate=0f, sec-latency=0
	I/O behind bridge: 0000f000-00000fff
	Memory behind bridge: fff00000-000fffff
	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR- NoISA+ VGA- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v1) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 
unlimited
			ExtTag- RBE+ FLReset-
		DevCtl:	Report errors: Correctable+ Non-Fatal+ Fatal+ Unsupported+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
		LnkCap:	Port #2, Speed 2.5GT/s, Width x1, ASPM L0s L1, Latency L0 <1us, L1 
<4us
			ClockPM- Suprise- LLActRep+ BwNot-
		LnkCtl:	ASPM Disabled; RCB 64 bytes Disabled- Retrain- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x0, TrErr- Train- SlotClk+ DLActive- BWMgmt- 
ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surpise+
			Slot #  3, PowerLimit 6.500000; Interlock- NoCompl-
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootCap: CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
	Capabilities: [80] Message Signalled Interrupts: Mask- 64bit- Queue=0/0 
Enable+
		Address: fee0300c  Data: 41c9
	Capabilities: [90] Subsystem: Fujitsu Limited. Unknown device 1416
	Capabilities: [a0] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100] Virtual Channel <?>
	Capabilities: [180] Root Complex Link <?>
	Kernel driver in use: pcieport-driver

00:1c.3 PCI bridge: Intel Corporation 82801H (ICH8 Family) PCI Express Port 4 
(rev 03) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Bus: primary=00, secondary=14, subordinate=17, sec-latency=0
	I/O behind bridge: 0000f000-00000fff
	Memory behind bridge: fe300000-fe3fffff
	Prefetchable memory behind bridge: 00000000fff00000-00000000000fffff
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort+ <SERR+ <PERR-
	BridgeCtl: Parity- SERR- NoISA+ VGA- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [40] Express (v1) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 
unlimited
			ExtTag- RBE+ FLReset-
		DevCtl:	Report errors: Correctable+ Non-Fatal+ Fatal+ Unsupported+
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr+ TransPend-
		LnkCap:	Port #4, Speed 2.5GT/s, Width x1, ASPM L0s L1, Latency L0 <256ns, L1 
<4us
			ClockPM- Suprise- LLActRep+ BwNot-
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive+ BWMgmt- 
ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surpise+
			Slot #  5, PowerLimit 6.500000; Interlock- NoCompl-
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet+ CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible-
		RootCap: CRSVisible-
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
	Capabilities: [80] Message Signalled Interrupts: Mask- 64bit- Queue=0/0 
Enable+
		Address: fee0300c  Data: 41d1
	Capabilities: [90] Subsystem: Fujitsu Limited. Unknown device 1416
	Capabilities: [a0] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [100] Virtual Channel <?>
	Capabilities: [180] Root Complex Link <?>
	Kernel driver in use: pcieport-driver

00:1d.0 USB Controller: Intel Corporation 82801H (ICH8 Family) USB UHCI 
Controller #1 (rev 03) (prog-if 00 [UHCI])
	Subsystem: Fujitsu Limited. Unknown device 1414
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 21
	Region 4: I/O ports at 1860 [size=32]
	Kernel driver in use: uhci_hcd
	Kernel modules: uhci-hcd

00:1d.1 USB Controller: Intel Corporation 82801H (ICH8 Family) USB UHCI 
Controller #2 (rev 03) (prog-if 00 [UHCI])
	Subsystem: Fujitsu Limited. Unknown device 1414
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 21
	Region 4: I/O ports at 1880 [size=32]
	Kernel driver in use: uhci_hcd
	Kernel modules: uhci-hcd

00:1d.2 USB Controller: Intel Corporation 82801H (ICH8 Family) USB UHCI 
Controller #3 (rev 03) (prog-if 00 [UHCI])
	Subsystem: Fujitsu Limited. Unknown device 1414
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 21
	Region 4: I/O ports at 18a0 [size=32]
	Kernel driver in use: uhci_hcd
	Kernel modules: uhci-hcd

00:1d.7 USB Controller: Intel Corporation 82801H (ICH8 Family) USB2 EHCI 
Controller #1 (rev 03) (prog-if 20 [EHCI])
	Subsystem: Fujitsu Limited. Unknown device 1415
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin B routed to IRQ 20
	Region 0: Memory at fe704c00 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=375mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Debug port: BAR=1 offset=00a0
	Kernel driver in use: ehci_hcd
	Kernel modules: ehci-hcd

00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev f3) 
(prog-if 01 [Subtractive decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Bus: primary=00, secondary=1c, subordinate=24, sec-latency=32
	I/O behind bridge: 00003000-00003fff
	Memory behind bridge: fe400000-fe4fffff
	Prefetchable memory behind bridge: 0000000088000000-000000008fffffff
	Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR- NoISA+ VGA- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Subsystem: Fujitsu Limited. Unknown device 140c

00:1f.0 ISA bridge: Intel Corporation Mobile LPC Interface Controller (rev 03)
	Subsystem: Fujitsu Limited. Unknown device 140e
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Capabilities: [e0] Vendor Specific Information <?>

00:1f.1 IDE interface: Intel Corporation Mobile IDE Controller (rev 03) 
(prog-if 8a [Master SecP PriP])
	Subsystem: Fujitsu Limited. Unknown device 140f
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 255
	Region 0: I/O ports at 01f0 [size=8]
	Region 1: I/O ports at 03f4 [size=1]
	Region 2: I/O ports at 0170 [size=8]
	Region 3: I/O ports at 0374 [size=1]
	Region 4: I/O ports at 1810 [size=16]

00:1f.2 SATA controller: Intel Corporation Mobile SATA AHCI Controller (rev 
03) (prog-if 01 [AHCI 1.0])
	Subsystem: Fujitsu Limited. Unknown device 1411
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin A routed to IRQ 219
	Region 0: I/O ports at 1c00 [size=8]
	Region 1: I/O ports at 18d4 [size=4]
	Region 2: I/O ports at 18d8 [size=8]
	Region 3: I/O ports at 18d0 [size=4]
	Region 4: I/O ports at 18e0 [size=32]
	Region 5: Memory at fe704000 (32-bit, non-prefetchable) [size=2K]
	Capabilities: [80] Message Signalled Interrupts: Mask- 64bit- Queue=0/2 
Enable+
		Address: fee0200c  Data: 00e9
	Capabilities: [70] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot+,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [a8] SATA HBA <?>
	Kernel driver in use: ahci

00:1f.3 SMBus: Intel Corporation 82801H (ICH8 Family) SMBus Controller (rev 
03)
	Subsystem: Fujitsu Limited. Unknown device 1413
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Interrupt: pin B routed to IRQ 11
	Region 0: Memory at 90100000 (32-bit, non-prefetchable) [size=256]
	Region 4: I/O ports at 1c20 [size=32]

04:00.0 Ethernet controller: Marvell Technology Group Ltd. 88E8055 PCI-E 
Gigabit Ethernet Controller (rev 14)
	Subsystem: Fujitsu Limited. Unknown device 139a
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 220
	Region 0: Memory at fe200000 (64-bit, non-prefetchable) [size=16K]
	Region 2: I/O ports at 2000 [size=256]
	[virtual] Expansion ROM at 90000000 [disabled] [size=128K]
	Capabilities: [48] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] Vital Product Data <?>
	Capabilities: [5c] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0 
Enable+
		Address: 00000000fee0200c  Data: 41d9
	Capabilities: [e0] Express (v1) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s unlimited, L1 
unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
			RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ UncorrErr+ FatalErr- UnsuppReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Latency L0 <256ns, L1 
unlimited
			ClockPM+ Suprise- LLActRep- BwNot-
		LnkCtl:	ASPM L0s Enabled; RCB 128 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- 
ABWMgmt-
	Capabilities: [100] Advanced Error Reporting <?>
	Kernel driver in use: sky2

14:00.0 Network controller: Intel Corporation Unknown device 4229 (rev 61)
	Subsystem: Intel Corporation Unknown device 1101
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- 
<MAbort- >SERR+ <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at fe300000 (64-bit, non-prefetchable) [size=8K]
	Capabilities: [c8] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [d0] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0 
Enable-
		Address: 0000000000000000  Data: 0000
	Capabilities: [e0] Express (v1) Endpoint, MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 unlimited
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	Report errors: Correctable- Non-Fatal- Fatal- Unsupported-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr+ UncorrErr+ FatalErr- UnsuppReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Latency L0 <128ns, L1 
<64us
			ClockPM+ Suprise- LLActRep- BwNot-
		LnkCtl:	ASPM L1 Enabled; RCB 64 bytes Disabled- Retrain- CommClk+
			ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s, Width x1, TrErr- Train- SlotClk+ DLActive- BWMgmt- 
ABWMgmt-
	Capabilities: [100] Advanced Error Reporting <?>
	Capabilities: [140] Device Serial Number 27-18-ce-ff-ff-e8-13-00

1c:03.0 CardBus bridge: O2 Micro, Inc. Unknown device 7136 (rev 01)
	Subsystem: Fujitsu Limited. Unknown device 143d
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping+ 
SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=slow >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 168
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at fe402000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=1c, secondary=1d, subordinate=20, sec-latency=176
	Memory window 0: 88000000-8bfff000 (prefetchable)
	Memory window 1: 94000000-97fff000
	I/O window 0: 00003000-000030ff
	I/O window 1: 00003400-000034ff
	BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset+ 16bInt+ PostWrite+
	16-bit legacy interface ports at 0001
	Kernel driver in use: yenta_cardbus
	Kernel modules: yenta_socket

1c:03.1 CardBus bridge: O2 Micro, Inc. Unknown device 7136 (rev 01)
	Subsystem: Fujitsu Limited. Unknown device 143d
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping+ 
SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=slow >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 168
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at fe403000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=1c, secondary=21, subordinate=24, sec-latency=176
	Memory window 0: 8c000000-8ffff000 (prefetchable)
	Memory window 1: 98000000-9bfff000
	I/O window 0: 00003800-000038ff
	I/O window 1: 00003c00-00003cff
	BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset- 16bInt+ PostWrite+
	16-bit legacy interface ports at 0001
	Kernel driver in use: yenta_cardbus
	Kernel modules: yenta_socket

1c:03.2 SD Host controller: O2 Micro, Inc. Integrated MMC/SD Controller (rev 
02) (prog-if 01)
	Subsystem: Fujitsu Limited. Unknown device 143d
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=slow >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 16
	Region 0: Memory at fe401000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [a0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: sdhci
	Kernel modules: sdhci

1c:03.3 Mass storage controller: O2 Micro, Inc. Integrated MS/xD Controller 
(rev 01)
	Subsystem: Fujitsu Limited. Unknown device 143d
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- 
SERR+ FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=slow >TAbort- <TAbort- 
<MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at fe400000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [a0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

[7.6.] SCSI information (from /proc/scsi/scsi)
Attached devices:
Host: scsi0 Channel: 00 Id: 00 Lun: 00
  Vendor: ATA      Model: WDC WD1600BEVS-0 Rev: 04.0
    Type:   Direct-Access                    ANSI  SCSI revision: 05

[7.7] Other information that might be relevant to the problem
My own thoughts:
The behaviour seems as if whoever decreases scaling_max_freq does not see the
condition to increase it.

On all the mentioned kernel versions there are two thermal zones reported.
However they stay at 27 degrees of celsius all the time:
# ls /proc/acpi/thermal_zone/
TZ00  TZ01
# cd /proc/acpi/thermal_zone
# cat TZ0[0-1]/temperature 
temperature:             27 C
temperature:             27 C
# uptime
01:44:57 up 20 min,  3 users,  load average: 0.41, 0.15, 0.09

The DSDT of this laptop has some flaws:

# iasl -dc <the DSDT of my laptop>
lifebook_e8310_dsdt.dsl  4678:                     Method (SBLL, 1, 
NotSerialized)
Warning  1086 -          Not all control paths return a value ^  (SBLL)

lifebook_e8310_dsdt.dsl  8093:                     Acquire (MTBT, 0x1000)
Warning  1103 -                   Possible operator timeout is ignored ^

lifebook_e8310_dsdt.dsl  8362:                     Acquire (MTBT, 0x1000)
Warning  1103 -                   Possible operator timeout is ignored ^

disassembly of /proc/acpi/fadt
/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20060912
 *
 * Disassembly of fadt, Fri Apr 25 01:50:32 2008
 *
 * ACPI Data Table [FACP]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 000  4]                    Signature : "FACP"
[004h 004  4]                 Table Length : 000000F4
[008h 008  1]                     Revision : 03
[009h 009  1]                     Checksum : 7B
[00Ah 010  6]                       Oem ID : "FSC   "
[010h 016  8]                 Oem Table ID : "PC      "
[018h 024  4]                 Oem Revision : 01100000
[01Ch 028  4]              Asl Compiler ID : "FUJ "
[020h 032  4]        Asl Compiler Revision : 00000100

[024h 036  4]                 FACS Address : 7F6E2FC0
[028h 040  4]                 DSDT Address : 7F6D497B
[02Ch 044  1]                        Model : 00
[02Dh 045  1]                   PM Profile : 02
[02Eh 046  2]                SCI Interrupt : 0009
[030h 048  4]             SMI Command Port : 000000B2
[034h 052  1]            ACPI Enable Value : F0
[035h 053  1]           ACPI Disable Value : F1
[036h 054  1]               S4BIOS Command : 00
[037h 055  1]              P-State Control : 80
[038h 056  4]     PM1A Event Block Address : 00001000
[03Ch 060  4]     PM1B Event Block Address : 00000000
[040h 064  4]   PM1A Control Block Address : 00001004
[044h 068  4]   PM1B Control Block Address : 00000000
[048h 072  4]    PM2 Control Block Address : 00001020
[04Ch 076  4]       PM Timer Block Address : 00001008
[050h 080  4]           GPE0 Block Address : 00001028
[054h 084  4]           GPE1 Block Address : 00000000
[058h 088  1]       PM1 Event Block Length : 04
[059h 089  1]     PM1 Control Block Length : 02
[05Ah 090  1]     PM2 Control Block Length : 01
[05Bh 091  1]        PM Timer Block Length : 04
[05Ch 092  1]            GPE0 Block Length : 08
[05Dh 093  1]            GPE1 Block Length : 00
[05Eh 094  1]             GPE1 Base Offset : 00
[05Fh 095  1]                 _CST Support : 00
[060h 096  2]                   C2 Latency : 0001
[062h 098  2]                   C3 Latency : 0039
[064h 100  2]               CPU Cache Size : 0000
[066h 102  2]           Cache Flush Stride : 0000
[068h 104  1]            Duty Cycle Offset : 00
[069h 105  1]             Duty Cycle Width : 00
[06Ah 106  1]          RTC Day Alarm Index : 0D
[06Bh 107  1]        RTC Month Alarm Index : 00
[06Ch 108  1]            RTC Century Index : 32
[06Dh 109  2]      Boot Architecture Flags : 0000
[06Fh 111  1]                     Reserved : 00
[070h 112  4]        Flags (decoded below) : 000082A5
                     WBINVD is operational : 1
                WBINVD does not invalidate : 0
                       All CPUs support C1 : 1
                     C2 works on MP system : 0
                   Power button is generic : 0
                   Sleep button is generic : 1
                      RTC wakeup not fixed : 0
                RTC wakeup/S4 not possible : 1
                           32-bit PM Timer : 0
                         Docking Supported : 1
                  Reset Register Supported : 0
                               Sealed Case : 0
                       Headless - No Video : 0
                Native instr after SLP_TYP : 0
                      PCIEXP_WAK Supported : 0
                        Use Platform Timer : 1
                    RTC_STS valid after S4 : 0
                   Remote Power-on capable : 0
                        APIC Cluster Model : 0
                   APIC Physical Dest Mode : 0
                            Reset Register : <Generic Address Structure>
[074h 116  1]                     Space ID : 00 (SystemMemory)
[075h 117  1]                    Bit Width : 00
[076h 118  1]                   Bit Offset : 00
[077h 119  1]                 Access Width : 00
[078h 120  8]                      Address : 0000000000000000
[080h 128  1]         Value to cause reset : 00
[081h 129  3]                     Reserved : 000000
[084h 132  8]                 FACS Address : 000000007F6E2FC0
[08Ch 140  8]                 DSDT Address : 000000007F6D497B
                          PM1A Event Block : <Generic Address Structure>
[094h 148  1]                     Space ID : 01 (SystemIO)
[095h 149  1]                    Bit Width : 20
[096h 150  1]                   Bit Offset : 00
[097h 151  1]                 Access Width : 00
[098h 152  8]                      Address : 0000000000001000
                          PM1B Event Block : <Generic Address Structure>
[0A0h 160  1]                     Space ID : 00 (SystemMemory)
[0A1h 161  1]                    Bit Width : 00
[0A2h 162  1]                   Bit Offset : 00
[0A3h 163  1]                 Access Width : 00
[0A4h 164  8]                      Address : 0000000000000000
                        PM1A Control Block : <Generic Address Structure>
[0ACh 172  1]                     Space ID : 01 (SystemIO)
[0ADh 173  1]                    Bit Width : 10
[0AEh 174  1]                   Bit Offset : 00
[0AFh 175  1]                 Access Width : 00
[0B0h 176  8]                      Address : 0000000000001004
                        PM1B Control Block : <Generic Address Structure>
[0B8h 184  1]                     Space ID : 00 (SystemMemory)
[0B9h 185  1]                    Bit Width : 00
[0BAh 186  1]                   Bit Offset : 00
[0BBh 187  1]                 Access Width : 00
[0BCh 188  8]                      Address : 0000000000000000
                         PM2 Control Block : <Generic Address Structure>
[0C4h 196  1]                     Space ID : 01 (SystemIO)
[0C5h 197  1]                    Bit Width : 08
[0C6h 198  1]                   Bit Offset : 00
[0C7h 199  1]                 Access Width : 00
[0C8h 200  8]                      Address : 0000000000001020
                            PM Timer Block : <Generic Address Structure>
[0D0h 208  1]                     Space ID : 01 (SystemIO)
[0D1h 209  1]                    Bit Width : 20
[0D2h 210  1]                   Bit Offset : 00
[0D3h 211  1]                 Access Width : 00
[0D4h 212  8]                      Address : 0000000000001008
                                GPE0 Block : <Generic Address Structure>
[0DCh 220  1]                     Space ID : 01 (SystemIO)
[0DDh 221  1]                    Bit Width : 40
[0DEh 222  1]                   Bit Offset : 00
[0DFh 223  1]                 Access Width : 00
[0E0h 224  8]                      Address : 0000000000001028
                                GPE1 Block : <Generic Address Structure>
[0E8h 232  1]                     Space ID : 00 (SystemMemory)
[0E9h 233  1]                    Bit Width : 00
[0EAh 234  1]                   Bit Offset : 00
[0EBh 235  1]                 Access Width : 00
[0ECh 236  8]                      Address : 0000000000000000

Raw Table Data

  0000: 46 41 43 50 F4 00 00 00 03 7B 46 53 43 20 20 20  FACP.....{FSC   
  0010: 50 43 20 20 20 20 20 20 00 00 10 01 46 55 4A 20  PC      ....FUJ 
  0020: 00 01 00 00 C0 2F 6E 7F 7B 49 6D 7F 00 02 09 00  ...../n.{Im.....
  0030: B2 00 00 00 F0 F1 00 80 00 10 00 00 00 00 00 00  ................
  0040: 04 10 00 00 00 00 00 00 20 10 00 00 08 10 00 00  ........ .......
  0050: 28 10 00 00 00 00 00 00 04 02 01 04 08 00 00 00  (...............
  0060: 01 00 39 00 00 00 00 00 00 00 0D 00 32 00 00 00  ..9.........2...
  0070: A5 82 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  0080: 00 00 00 00 C0 2F 6E 7F 00 00 00 00 7B 49 6D 7F  ...../n.....{Im.
  0090: 00 00 00 00 01 20 00 00 00 10 00 00 00 00 00 00  ..... ..........
  00A0: 00 00 00 00 00 00 00 00 00 00 00 00 01 10 00 00  ................
  00B0: 04 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  00C0: 00 00 00 00 01 08 00 00 20 10 00 00 00 00 00 00  ........ .......
  00D0: 01 20 00 00 08 10 00 00 00 00 00 00 01 40 00 00  . ...........@..
  00E0: 28 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00  (...............
  00F0: 00 00 00 00                                      ....
