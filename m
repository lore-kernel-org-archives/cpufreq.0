From: "Shinichi Kudo" <randomshinichi4869@gmail.com>
Subject: VIA C3 Crashes with CPU Freq Scaling (longhaul)
Date: Sat, 4 Mar 2006 03:30:39 +0800
Message-ID: <8be2e100603031130rb3cce9n42a77075dcb4c1eb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_7806_15275935.1141414239648"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

------=_Part_7806_15275935.1141414239648
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello, I don't know whether to send this to the mailing list or where
you send patches or something. I'm not subscribed to this mailing
list, so I sure hope that when you reply, please make sure my email is
included.
Anyway, this is my laptop's hardware
VIA C3 C5C 933MHz, VIA PN266-VT8235, ProSavage DDR (yes I ran cpuburn
and memtest86+, they all passed)
With the custom kernels I built, they would always crash after about
two hours. I spent lots of time tweaking the kernel, making monolithic
builds, modularized builds, leaving this/that out... but it always
crashed. I thought it was a direct rendering issue for a year, and
tried to solve that, but once I used the Ubuntu kernel, I knew at once
that instability had nothing to do with direct rendering, for 3D
worked fine for days in a row.
So eventually I narrowed it down to this: it doesn't matter what
frequency governor you have, as long as you have the longhaul module
modprobed, or compiled straight into the kernel, your VIA based CPU
will hang. Hard.
Details can be found here: http://tinyurl.com/k7wlw
As you can see from the thread, this hanging issue (pun intended) has
its origins in kernel 2.4, and is distribution independent and extends
across all C3 CPUs. I can verify that it is distro independent (Gentoo
to Ubuntu all had same probs) and 2.6.11 to 2.6.14 always had
stability issues. I didn't see any traces of a longhaul.ko change in
the changelog for 2.6.15.

CRASH/HANG description
Personally, what I saw was this: I would start my computer. and use it
normally, X and a couple progs, or sometimes no X. It crashed without
X too, in Gentoo.
On my Ubuntu install, it usually doesn't crash until about 2 hours
into uptime. Then I would do something that required a frequency
change, like scrolling down in Firefox or running OpenOffice or even
just moving the mouse around to click on a hyperlink. The mouse
pointer would just stop there, pinging the laptop over the network
does not get a reply, and the brightness of the screen (which I can
adjust even in the BIOS) cannot be changed. Of course, Caps Lock and
Scroll Lock and Num Lock don't light up at this point. If I boot into
a kernel without CPU Frequency scaling support FOR MY PROCESSOR, it
doesn't ever crash.

I posted this on Linuxquestions.org. But they've all gone in the wrong
direction. I firmly believe something is wrong in the longhaul code
and it needs a serious overhaul, especially since this crash dates
from kernel 2.4.
If you need any more information, please ask, although I may not be
able to get it - after all, the computer is so shell-shocked by the
hang that it doesn't even have the senses to generate any sort of
Kernel Panic message.

Randomshinichi

--
....pi......pi......kaaaaaaa....
AMD Throughbred-A 1533MHz, 768MB PC2100 RAM, Maxtor 6EL040,
NV25 Ti4200 128MB

------=_Part_7806_15275935.1141414239648
Content-Type: application/octet-stream; name=lspci
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_ekcvx7mx
Content-Disposition: attachment; filename="lspci"

0000:00:00.0 Host bridge: VIA Technologies, Inc. P/KN266 Host Bridge
	Subsystem: VIA Technologies, Inc. P/KN266 Host Bridge
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B-
	Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ >SERR- <PERR-
	Latency: 8
	Region 0: Memory at ea000000 (32-bit, prefetchable) [size=32M]
	Capabilities: [a0] AGP version 2.0
		Status: RQ=32 Iso- ArqSz=0 Cal=0 SBA+ ITACoh- GART64- HTrans- 64bit- FW- AGP3- Rate=x1,x2,x4
		Command: RQ=1 ArqSz=0 Cal=0 SBA- AGP+ GART64- 64bit- FW- Rate=x4
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:01.0 PCI bridge: VIA Technologies, Inc. VT8633 [Apollo Pro266 AGP] (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B-
	Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ >SERR- <PERR+
	Latency: 0
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: 0000f000-00000fff
	Memory behind bridge: e8100000-e81fffff
	Prefetchable memory behind bridge: f0000000-f7ffffff
	BridgeCtl: Parity- SERR- NoISA+ VGA+ MAbort- >Reset- FastB2B-
	Capabilities: [80] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:08.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8139/8139C/8139C+ (rev 10)
	Subsystem: Realtek Semiconductor Co., Ltd. RT8139
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR+ FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 64 (8000ns min, 16000ns max)
	Interrupt: pin A routed to IRQ 9
	Region 0: I/O ports at 1000 [size=256]
	Region 1: Memory at e8000000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [50] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:0a.0 CardBus bridge: Texas Instruments PCI1410 PC card Cardbus Controller (rev 02)
	Subsystem: Unknown device 17c4:7230
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 168, Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at 14000000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=00, secondary=02, subordinate=05, sec-latency=176
	Memory window 0: 10000000-11fff000 (prefetchable)
	Memory window 1: 12000000-13fff000
	I/O window 0: 00002000-000020ff
	I/O window 1: 00002400-000024ff
	BridgeCtl: Parity- SERR- ISA- VGA- MAbort- >Reset+ 16bInt+ PostWrite+
	16-bit legacy interface ports at 0001

0000:00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 80) (prog-if 00 [UHCI])
	Subsystem: Unknown device 17c4:0230
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 64, Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin A routed to IRQ 9
	Region 4: I/O ports at 1c00 [size=32]
	Capabilities: [80] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME+

0000:00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 80) (prog-if 00 [UHCI])
	Subsystem: Unknown device 17c4:0230
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 64, Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin B routed to IRQ 9
	Region 4: I/O ports at 1c20 [size=32]
	Capabilities: [80] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82) (prog-if 20 [EHCI])
	Subsystem: Unknown device 17c4:0230
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 64, Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin D routed to IRQ 9
	Region 0: Memory at e8000400 (32-bit, non-prefetchable) [size=256]
	Capabilities: [80] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
	Subsystem: Unknown device 17c4:0230
	Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr- Stepping+ SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 0
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:11.1 IDE interface: VIA Technologies, Inc. VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 06) (prog-if 8a [Master SecP PriP])
	Subsystem: Unknown device 17c4:0230
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 64
	Interrupt: pin A routed to IRQ 11
	Region 4: I/O ports at 1c40 [size=16]
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:11.5 Multimedia audio controller: VIA Technologies, Inc. VT8233/A/8235/8237 AC97 Audio Controller (rev 50)
	Subsystem: Unknown device 17c4:0230
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Interrupt: pin C routed to IRQ 9
	Region 0: I/O ports at 1400 [size=256]
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:00:11.6 Communication controller: VIA Technologies, Inc. AC'97 Modem Controller (rev 80)
	Subsystem: Unknown device 17c4:2230
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Interrupt: pin C routed to IRQ 9
	Region 0: I/O ports at 1800 [size=256]
	Capabilities: [d0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-

0000:01:00.0 VGA compatible controller: S3 Inc. VT8375 [ProSavage8 KM266/KL266] (prog-if 00 [VGA])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B-
	Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR-
	Latency: 64 (1000ns min, 63750ns max), Cache Line Size: 0x08 (32 bytes)
	Interrupt: pin A routed to IRQ 11
	Region 0: Memory at e8100000 (32-bit, non-prefetchable) [size=512K]
	Region 1: Memory at f0000000 (32-bit, prefetchable) [size=128M]
	Expansion ROM at e8180000 [disabled] [size=64K]
	Capabilities: [dc] Power Management version 2
		Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [80] AGP version 2.0
		Status: RQ=32 Iso- ArqSz=0 Cal=0 SBA- ITACoh- GART64- HTrans- 64bit- FW- AGP3- Rate=x4
		Command: RQ=32 ArqSz=0 Cal=0 SBA- AGP+ GART64- 64bit- FW- Rate=x4


















------=_Part_7806_15275935.1141414239648
Content-Type: application/octet-stream; name=ver_linux
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_ekcwevjq
Content-Disposition: attachment; filename="ver_linux"

If some fields are empty or look unusual you may have an old version.
Compare to the current minimal requirements in Documentation/Changes.
 
Linux athena-asamiya 2.6.15.1-ubuntu1athenacustom-DRI #22 PREEMPT Thu Mar 2 22:04:06 MYT 2006 i686 GNU/Linux
 
Gnu C                  4.0.3
Gnu make               3.81beta4
binutils               2.16.91
util-linux             2.12r
mount                  2.12r
module-init-tools      3.2.2
e2fsprogs              1.38
jfsutils               1.1.8
reiserfsprogs          3.6.19
reiser4progs           1.0.5
xfsprogs               2.7.7
pcmcia-cs              3.2.8
PPP                    2.4.4b1
Linux C Library        2.3.6
Dynamic linker (ldd)   2.3.6
Procps                 3.2.6
Net-tools              1.60
Console-tools          0.2.3
Sh-utils               5.93
udev                   079
Modules Loaded         usbhid ipv6 savage drm video thermal processor fan button battery ac snd_seq_oss snd_seq_midi snd_seq_midi_event snd_seq snd_via82xx_modem snd_via82xx snd_ac97_codec snd_ac97_bus snd_mpu401_uart snd_pcm_oss snd_mixer_oss pcmcia firmware_class snd_rawmidi snd_seq_device snd_pcm snd_timer snd i2c_viapro uhci_hcd ehci_hcd rtc snd_page_alloc usbcore 8139too mii yenta_socket rsrc_nonstatic pcmcia_core i2c_prosavage i2c_algo_bit i2c_core psmouse soundcore via_agp agpgart evdev unix





------=_Part_7806_15275935.1141414239648
Content-Type: application/octet-stream; name=cpuinfo
Content-Transfer-Encoding: 7bit
X-Attachment-Id: f_ekcwfqz0
Content-Disposition: attachment; filename="cpuinfo"

processor	: 0
vendor_id	: CentaurHauls
cpu family	: 6
model		: 7
model name	: VIA Ezra
stepping	: 10
cpu MHz		: 933.545
cache size	: 64 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 1
wp		: yes
flags		: fpu de tsc msr cx8 mtrr pge mmx 3dnow
bogomips	: 1868.19





------=_Part_7806_15275935.1141414239648
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_7806_15275935.1141414239648--

