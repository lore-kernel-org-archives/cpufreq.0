From: Ivan Kanis <ivank@juliva.com>
Subject: Re: Pentium IIIM not recognised
Date: Tue, 16 Sep 2003 12:09:13 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <16230.57673.292946.375545@gargle.gargle.HOWL>
References: <16230.17445.337511.852664@gargle.gargle.HOWL>
	<20030916091302.GO11391@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20030916091302.GO11391@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk


    Ducrot> could you post lspci -v please?

Bien sur!

00:00.0 Host bridge: Intel Corp. 82815 815 Chipset Host Bridge and Memory Controller Hub (rev 04)
	Flags: bus master, fast devsel, latency 0
	Memory at e8000000 (32-bit, prefetchable) [size=64M]
	Capabilities: <available only to root>

00:01.0 PCI bridge: Intel Corp.: Unknown device 1131 (rev 04) (prog-if 00 [Normal decode])
	Flags: bus master, 66Mhz, fast devsel, latency 32
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=32
	I/O behind bridge: 0000c000-0000cfff
	Memory behind bridge: fc000000-fdffffff
	Prefetchable memory behind bridge: e0000000-e7ffffff

00:1e.0 PCI bridge: Intel Corp. 82820 820 (Camino 2) Chipset PCI (-M) (rev 03) (prog-if 00 [Normal decode])
	Flags: bus master, fast devsel, latency 0
	Bus: primary=00, secondary=02, subordinate=10, sec-latency=32
	I/O behind bridge: 0000d000-0000ffff
	Memory behind bridge: f2000000-fbffffff

00:1f.0 ISA bridge: Intel Corp. 82820 820 (Camino 2) Chipset ISA Bridge (ICH2-M) (rev 03)
	Flags: bus master, medium devsel, latency 0

00:1f.1 IDE interface: Intel Corp. 82820 820 (Camino 2) Chipset IDE U100 (-M) (rev 03) (prog-if 80 [Master])
	Subsystem: Intel Corp.: Unknown device 4541
	Flags: bus master, medium devsel, latency 0
	I/O ports at bfa0 [size=16]

00:1f.2 USB Controller: Intel Corp. 82820 820 (Camino 2) Chipset USB (Hub A) (rev 03) (prog-if 00 [UHCI])
	Subsystem: Intel Corp.: Unknown device 4541
	Flags: bus master, medium devsel, latency 0, IRQ 10
	I/O ports at bce0 [size=32]

01:00.0 VGA compatible controller: ATI Technologies Inc: Unknown device 4c66 (rev 01) (prog-if 00 [VGA])
	Subsystem: Dell Computer Corporation: Unknown device 00e6
	Flags: bus master, VGA palette snoop, stepping, 66Mhz, medium devsel, latency 32, IRQ 11
	Memory at e0000000 (32-bit, prefetchable) [size=128M]
	I/O ports at cc00 [size=256]
	Memory at fcff0000 (32-bit, non-prefetchable) [size=64K]
	Expansion ROM at 80000000 [disabled] [size=128K]
	Capabilities: <available only to root>

02:03.0 Multimedia audio controller: ESS Technology ES1983S Maestro-3i PCI Audio Accelerator (rev 10)
	Subsystem: Dell Computer Corporation: Unknown device 00e6
	Flags: bus master, medium devsel, latency 32, IRQ 5
	I/O ports at dc00 [size=256]
	Memory at f6ffe000 (32-bit, non-prefetchable) [size=8K]
	Capabilities: <available only to root>

02:06.0 PCI bridge: Action Tec Electronics Inc: Unknown device 0100 (rev 11) (prog-if 00 [Normal decode])
	Flags: bus master, medium devsel, latency 32
	Bus: primary=02, secondary=08, subordinate=08, sec-latency=32
	I/O behind bridge: 0000e000-0000efff
	Memory behind bridge: f8000000-f9ffffff
	Capabilities: <available only to root>

02:0f.0 CardBus bridge: Texas Instruments PCI4451 PC card Cardbus Controller
	Subsystem: Dell Computer Corporation: Unknown device 00e6
	Flags: bus master, medium devsel, latency 168, IRQ 10
	Memory at 10000000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=02, secondary=09, subordinate=0c, sec-latency=176
	Memory window 0: 10400000-107ff000 (prefetchable)
	Memory window 1: 10800000-10bff000
	I/O window 0: 00004000-000040ff
	I/O window 1: 00004400-000044ff
	16-bit legacy interface ports at 0001

02:0f.1 CardBus bridge: Texas Instruments PCI4451 PC card Cardbus Controller
	Subsystem: Dell Computer Corporation: Unknown device 00e6
	Flags: bus master, medium devsel, latency 168, IRQ 10
	Memory at 10001000 (32-bit, non-prefetchable) [size=4K]
	Bus: primary=02, secondary=0d, subordinate=10, sec-latency=176
	Memory window 0: 10c00000-10fff000 (prefetchable)
	Memory window 1: 11000000-113ff000
	I/O window 0: 00004800-000048ff
	I/O window 1: 00004c00-00004cff
	16-bit legacy interface ports at 0001

02:0f.2 FireWire (IEEE 1394): Texas Instruments: Unknown device 8027 (prog-if 10 [OHCI])
	Subsystem: Dell Computer Corporation: Unknown device 00e6
	Flags: bus master, medium devsel, latency 32, IRQ 10
	Memory at f6ffd800 (32-bit, non-prefetchable) [size=2K]
	Memory at f6ff8000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: <available only to root>

08:04.0 Ethernet controller: Intel Corp. 82557 [Ethernet Pro 100] (rev 08)
	Subsystem: Action Tec Electronics Inc: Unknown device 1100
	Flags: bus master, medium devsel, latency 32, IRQ 10
	Memory at f8fff000 (32-bit, non-prefetchable) [size=4K]
	I/O ports at ecc0 [size=64]
	Memory at f8e00000 (32-bit, non-prefetchable) [size=1M]
	Expansion ROM at f9000000 [disabled] [size=1M]
	Capabilities: <available only to root>

08:08.0 Communication controller: Lucent Microelectronics WinModem 56k (rev 01)
	Subsystem: Action Tec Electronics Inc: Unknown device 2400
	Flags: bus master, medium devsel, latency 0, IRQ 10
	Memory at f8ffec00 (32-bit, non-prefetchable) [size=256]
	I/O ports at ecb8 [size=8]
	I/O ports at e800 [size=256]
	Capabilities: <available only to root>

09:00.0 Ethernet controller: Xircom Cardbus Ethernet 10/100 (rev 03)
	Subsystem: Xircom Cardbus Ethernet 10/100
	Flags: medium devsel, IRQ 10
	I/O ports at 4000 [size=128]
	Memory at 10800000 (32-bit, non-prefetchable) [size=2K]
	Memory at 10800800 (32-bit, non-prefetchable) [size=2K]
	Expansion ROM at 10400000 [size=16K]
	Capabilities: <available only to root>

09:00.1 Serial controller: Xircom Cardbus Ethernet + 56k Modem (rev 03) (prog-if 02 [16550])
	Subsystem: Xircom CBEM56G-100 Ethernet + 56k Modem
	Flags: medium devsel, IRQ 10
	I/O ports at 4080 [size=8]
	Memory at 10801000 (32-bit, non-prefetchable) [size=2K]
	Memory at 10801800 (32-bit, non-prefetchable) [size=2K]
	Expansion ROM at 10404000 [size=16K]
	Capabilities: <available only to root>
