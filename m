From: Sebastian =?iso-8859-1?q?K=FCgler?= <lists@vizzzion.org>
Subject: frequency switching quirks with powernow-k8
Date: Mon, 03 Jan 2005 18:52:19 +0100
Message-ID: <200501031852.19316.lists@vizzzion.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed; boundary="Boundary-00=_TZY2BCo9eBsYIkX"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk

--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am trying to use 2.6.10's cpufreq on my AMD64 3200+ (S939), Asus A8V deluxe 
motherboard, Nvidia 6800GL. The first couple of hours it seems to work just 
fine, but after some time (~2h), I am getting the following errors repeatedly 
in  dmesg (about 2 lines / 12 sec). 

ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
ignoring illegal change in lo freq table-2 to 0x2
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
powernow-k8: vid trans failed, vid 0x3, curr 0x4
powernow-k8: transition frequency failed
ignoring illegal change in lo freq table-2 to 0x2


It seems that the machine can't switch frequency anymore and it starts to 
behave somehow a little sluggish. In some case, it's not any more possible to 
switch frequency manually. (echo scaling_governor or alike). I have tried  
both, powernowd and the ondemand governor, both result in the same problem. 
Attached is the output of dmesg, cat /proc/acpi/processor/CPU1/*, lspci -v   
and /sys/devices/system/cpu/cpu0/cpufreq/* and of course my .config. If you'd 
like to see more information, please let me know.

I tried to 2.6.10-mm1 today, but nvidia.ko wouldn't compile without it. (In 
case you think nvidia.ko has some influence on these issues, or the problem 
should be fixed in -mm1 I can remove nvidia.ko for testing, just let me know 
in that case.) I'm also prepared to  try testpatches, but couldn't find (and 
not being a kernel guru prepare myself) some ...

Thanks for caring,

sebas
-- 
http://vizZzion.org
======================
Anything cut to length will be too short.


--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: text/x-log;
  charset="us-ascii";
  name="CPU1.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="CPU1.log"

processor id:            0
acpi id:                 1
bus mastering control:   no
power management:        no
throttling control:      no
limit interface:         no
<not supported>
active state:            C1
default state:           C1
max_cstate:              C3
bus master activity:     00000000
states:
   *C1:                  promotion[--] demotion[--] latency[000] usage[00000000]
    C2:                  <not supported>
    C3:                  <not supported>
<not supported>

--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: application/x-bzip2;
  name="dmesg.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="dmesg.bz2"

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
A5R/eYb+D+RzP/xdyRThQkMd6aY0

--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: text/x-log;
  charset="us-ascii";
  name="lspci.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="lspci.log"

0000:00:00.0 Host bridge: VIA Technologies, Inc.: Unknown device 0282
	Subsystem: Asustek Computer, Inc.: Unknown device 80a3
	Flags: bus master, 66MHz, medium devsel, latency 64
	Memory at e0000000 (32-bit, prefetchable) [size=128M]
	Capabilities: [80] AGP version 3.0
	Capabilities: [50] Power Management version 2
	Capabilities: [60] #08 [0060]
	Capabilities: [58] #08 [8001]

0000:00:00.1 Host bridge: VIA Technologies, Inc.: Unknown device 1282
	Flags: bus master, medium devsel, latency 0

0000:00:00.2 Host bridge: VIA Technologies, Inc.: Unknown device 2282
	Flags: bus master, medium devsel, latency 0

0000:00:00.3 Host bridge: VIA Technologies, Inc.: Unknown device 3282
	Flags: bus master, medium devsel, latency 0

0000:00:00.4 Host bridge: VIA Technologies, Inc.: Unknown device 4282
	Flags: bus master, medium devsel, latency 0

0000:00:00.7 Host bridge: VIA Technologies, Inc.: Unknown device 7282
	Flags: bus master, medium devsel, latency 0

0000:00:01.0 PCI bridge: VIA Technologies, Inc. VT8237 PCI bridge [K8T800 South] (prog-if 00 [Normal decode])
	Flags: bus master, 66MHz, medium devsel, latency 0
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	Memory behind bridge: f9f00000-fbffffff
	Prefetchable memory behind bridge: f0000000-f8ffffff
	Capabilities: [80] Power Management version 2

0000:00:07.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host Controller (rev 80) (prog-if 10 [OHCI])
	Subsystem: Asustek Computer, Inc.: Unknown device 808a
	Flags: bus master, medium devsel, latency 64, IRQ 185
	Memory at f9a00000 (32-bit, non-prefetchable) [size=2K]
	I/O ports at a000 [size=128]
	Capabilities: [50] Power Management version 2

0000:00:09.0 Multimedia audio controller: Creative Labs SB Live! EMU10k1 (rev 07)
	Subsystem: Creative Labs SBLive! Player 5.1
	Flags: bus master, medium devsel, latency 64, IRQ 185
	I/O ports at a400 [size=32]
	Capabilities: [dc] Power Management version 1

0000:00:09.1 Input device controller: Creative Labs SB Live! MIDI/Game Port (rev 07)
	Subsystem: Creative Labs Gameport Joystick
	Flags: bus master, medium devsel, latency 64
	I/O ports at a800 [size=8]
	Capabilities: [dc] Power Management version 1

0000:00:0a.0 Ethernet controller: Marvell Technology Group Ltd. Yukon Gigabit Ethernet 10/100/1000Base-T Adapter (rev 13)
	Subsystem: Asustek Computer, Inc.: Unknown device 811a
	Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 169
	Memory at f9c00000 (32-bit, non-prefetchable) [size=16K]
	I/O ports at b000 [size=256]
	Expansion ROM at f9b00000 [disabled] [size=128K]
	Capabilities: [48] Power Management version 2
	Capabilities: [50] Vital Product Data

0000:00:0d.0 Multimedia video controller: Brooktree Corporation Bt878 Video Capture (rev 11)
	Subsystem: Avermedia Technologies Inc: Unknown device 0003
	Flags: bus master, medium devsel, latency 64, IRQ 201
	Memory at efe00000 (32-bit, prefetchable) [size=4K]
	Capabilities: [44] Vital Product Data
	Capabilities: [4c] Power Management version 2

0000:00:0d.1 Multimedia controller: Brooktree Corporation Bt878 Audio Capture (rev 11)
	Subsystem: Avermedia Technologies Inc: Unknown device 0003
	Flags: bus master, medium devsel, latency 64, IRQ 201
	Memory at eff00000 (32-bit, prefetchable) [size=4K]
	Capabilities: [44] Vital Product Data
	Capabilities: [4c] Power Management version 2

0000:00:0e.0 Multimedia audio controller: Creative Labs SB Audigy LS
	Subsystem: Creative Labs: Unknown device 1006
	Flags: bus master, medium devsel, latency 64, IRQ 5
	I/O ports at b400 [size=32]
	Capabilities: [dc] Power Management version 2

0000:00:0f.0 RAID bus controller: VIA Technologies, Inc. VIA VT6420 SATA RAID Controller (rev 80)
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 64, IRQ 177
	I/O ports at d400 [size=8]
	I/O ports at d000 [size=4]
	I/O ports at c800 [size=8]
	I/O ports at c400 [size=4]
	I/O ports at c000 [size=16]
	I/O ports at b800 [size=256]
	Capabilities: [c0] Power Management version 2

0000:00:0f.1 IDE interface: VIA Technologies, Inc. VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE (rev 06) (prog-if 8a [Master SecP PriP])
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 32, IRQ 177
	I/O ports at fc00 [size=16]
	Capabilities: [c0] Power Management version 2

0000:00:10.0 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 81) (prog-if 00 [UHCI])
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 64, IRQ 193
	I/O ports at d800 [size=32]
	Capabilities: [80] Power Management version 2

0000:00:10.1 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 81) (prog-if 00 [UHCI])
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 64, IRQ 193
	I/O ports at e000 [size=32]
	Capabilities: [80] Power Management version 2

0000:00:10.2 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 81) (prog-if 00 [UHCI])
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 64, IRQ 193
	I/O ports at e400 [size=32]
	Capabilities: [80] Power Management version 2

0000:00:10.3 USB Controller: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1 Controller (rev 81) (prog-if 00 [UHCI])
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 64, IRQ 193
	I/O ports at e800 [size=32]
	Capabilities: [80] Power Management version 2

0000:00:10.4 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 86) (prog-if 20 [EHCI])
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, medium devsel, latency 64, IRQ 193
	Memory at f9e00000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [80] Power Management version 2

0000:00:11.0 ISA bridge: VIA Technologies, Inc. VT8237 ISA bridge [K8T800 South]
	Subsystem: Asustek Computer, Inc. A7V600 motherboard
	Flags: bus master, stepping, medium devsel, latency 0
	Capabilities: [c0] Power Management version 2

0000:00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel
	Capabilities: [80] #08 [2101]

0000:00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel

0000:00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel

0000:00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel

0000:01:00.0 VGA compatible controller: nVidia Corporation: Unknown device 0042 (rev a1) (prog-if 00 [VGA])
	Subsystem: Asustek Computer, Inc.: Unknown device 819f
	Flags: bus master, 66MHz, medium devsel, latency 248, IRQ 185
	Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
	Memory at f0000000 (32-bit, prefetchable) [size=128M]
	Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
	Expansion ROM at f9f00000 [disabled] [size=128K]
	Capabilities: [60] Power Management version 2
	Capabilities: [44] AGP version 3.0


--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: application/x-tbz;
  name="cpufreq.tar.bz2"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="cpufreq.tar.bz2"

QlpoOTFBWSZTWaYzbtMABAz/k/uQAOBAAv/LOFiAQP/v/8AEAAgABAAvGEACfZNYYwCSQVP1Jpo9
pQaeiABobU0NBk9TIaNqCRIEZSQZGTI2UY0TT0EyaA00AHNMTARpgRhGAAAAJhGAiimqn+iJp6U9
ip+UI0eoAGmIGgAHqfHsBD0T2R9fh0eyPkNSuZoL3oY2qHBXIAgBs8aEITaElQYkGrh9WnVegWlM
lPVSUp4SBqbQpSSAk5pBwFa0FlnDnVxOYIukg0qEIrICMm/XjzNYIqzEihVQ7lMlCiBPNJS2PtOi
RCwELFyBqOPGcdqyCr25v0wN5hCSTR7wxY8XbXCJjauuWTJgpbbpZkzOSCtXohkEKQCRAlFCN8Bh
DQsKGnqXMapBSRLdIYksnkw3t+NmJ5cDKxVXKjzmkEZJ3pQEVvarmAUxTFpyokFRpjQ07JBZA7lt
GZqvh2GljD2iARPCUUSCQ4iFfRgEbU9CbJO10gjNUXyxEkg7jT9YWzWPob1zZSIhwQ+biQWDs/jp
MqWUNAj1SCyazkYqdhGCVD2o/tTGqrXaa42tbDYf9X1u00OMBNBBkD4twXzhkPN+p3IgtqEKXExo
LlsS9dnQoQFdSBnpDEi8bkjjbXapq/uw3ngLndAQ1yQvGgW7oImkIXIUFq7ngchmtAQwyrFwIeEm
80Mc+rMOOdFTAR4iMFC4ydV4jgV2XS9Yh4xCyw1xjxZBMLWyhT/WKFoIbFC5vvI/WIpssJ3cFC15
Nay7UV/4u5IpwoSFMZt2mA==

--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: application/x-gzip;
  name="config.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="config.gz"

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
C+WuJf8FMMXssXSkAAA=

--Boundary-00=_TZY2BCo9eBsYIkX
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_TZY2BCo9eBsYIkX--

