From: Colin Marquardt <colin@marquardt-home.de>
Subject: 2.6.3-rc3: "powernow-k8: fid 0 invalid : 0x0"
Date: Tue, 24 Feb 2004 00:16:56 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <msgidspam.87u11h1j4n.fsf@schnee.marquardt-home.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

I am trying to get powernowd running on my Athlon 64 3200+ on a
Shuttle SN85G4 (the motherboard in that barebone system is called
FN85 FWIW) which uses an nForce 3 chipset.

I am running 2.6.3-rc3 (built on Debian unstable) at the moment, and
I built powernow-k8 as a module. When modprobing it, I get:

powernow-k8: Found AMD64 processor supporting PowerNow (version 1.00.08a)
powernow-k8: voltage stable in 100 usec, ramp voltage offset: 2, isochronous relief time: 3, maximum voltage step: 0
powernow-k8: pll lock time: 0x2, maxfid 0xc (2000 MHz), maxvid 0x0
powernow-k8: fid 0 invalid : 0x0

Everything under /sys/devices/system/cpu/cpu0/ is empty.

The relevant part of my .config is:

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_PROC_INTF=m
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_24_API is not set
CONFIG_CPU_FREQ_TABLE=y

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=m
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
CONFIG_X86_POWERNOW_K6=m
CONFIG_X86_POWERNOW_K7=m
CONFIG_X86_POWERNOW_K8=m
CONFIG_X86_GX_SUSPMOD=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_ICH=m
CONFIG_X86_SPEEDSTEP_SMI=m
CONFIG_X86_P4_CLOCKMOD=m
CONFIG_X86_SPEEDSTEP_LIB=m
CONFIG_X86_LONGRUN=m
CONFIG_X86_LONGHAUL=m


FWIW, here is the lspci output:


00:00.0 Host bridge: nVidia Corporation nForce3 Host Bridge (rev a4)
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0
	Memory at e0000000 (32-bit, prefetchable) [size=64M]
	Capabilities: [44] #08 [0180]
	Capabilities: [c0] AGP version 3.0

00:01.0 ISA bridge: nVidia Corporation nForce3 LPC Bridge (rev a6)
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0

00:01.1 SMBus: nVidia Corporation nForce3 SMBus (rev a4)
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: 66Mhz, fast devsel, IRQ 10
	I/O ports at 4c00 [size=64]
	I/O ports at 4c40 [size=64]
	Capabilities: [44] Power Management version 2

00:02.0 USB Controller: nVidia Corporation nForce3 USB 1.1 (rev a5) (prog-if 10 [OHCI])
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0, IRQ 5
	Memory at e6003000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [44] Power Management version 2

00:02.1 USB Controller: nVidia Corporation nForce3 USB 1.1 (rev a5) (prog-if 10 [OHCI])
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0, IRQ 5
	Memory at e6004000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [44] Power Management version 2

00:02.2 USB Controller: nVidia Corporation nForce3 USB 2.0 (rev a2) (prog-if 20 [EHCI])
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0, IRQ 5
	Memory at e6005000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [44] #0a [2080]
	Capabilities: [80] Power Management version 2

00:05.0 Ethernet controller: nVidia Corporation nForce3 Ethernet (rev a5)
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0, IRQ 10
	Memory at e6000000 (32-bit, non-prefetchable) [size=4K]
	I/O ports at d000 [size=8]
	Capabilities: [44] Power Management version 2

00:06.0 Multimedia audio controller: nVidia Corporation nForce3 Audio (rev a2)
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0, IRQ 11
	I/O ports at d400 [size=256]
	I/O ports at d800 [size=128]
	Memory at e6001000 (32-bit, non-prefetchable) [size=4K]
	Capabilities: [44] Power Management version 2

00:08.0 IDE interface: nVidia Corporation nForce3 IDE (rev a5) (prog-if 8a [Master SecP PriP])
	Subsystem: Holco Enterprise Co, Ltd/Shuttle Computer: Unknown device a550
	Flags: bus master, 66Mhz, fast devsel, latency 0
	I/O ports at f000 [size=16]
	Capabilities: [44] Power Management version 2

00:0a.0 PCI bridge: nVidia Corporation nForce3 PCI Bridge (rev a2) (prog-if 00 [Normal decode])
	Flags: bus master, 66Mhz, fast devsel, latency 0
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=128
	I/O behind bridge: 0000a000-0000bfff
	Memory behind bridge: a0000000-bfffffff

00:0b.0 PCI bridge: nVidia Corporation nForce3 AGP Bridge (rev a4) (prog-if 00 [Normal decode])
	Flags: bus master, 66Mhz, medium devsel, latency 16
	Bus: primary=00, secondary=02, subordinate=02, sec-latency=10
	I/O behind bridge: 0000c000-0000cfff
	Memory behind bridge: e4000000-e5ffffff
	Prefetchable memory behind bridge: c0000000-dfffffff

00:18.0 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel
	Capabilities: [80] #08 [2101]

00:18.1 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel

00:18.2 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel

00:18.3 Host bridge: Advanced Micro Devices [AMD] K8 NorthBridge
	Flags: fast devsel

01:05.0 Network controller: AIRONET Wireless Communications PC4800 (rev 01)
	Flags: medium devsel, IRQ 5
	Memory at b0000000 (32-bit, non-prefetchable) [size=128]
	I/O ports at a000 [size=128]
	I/O ports at a400 [size=64]

01:06.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host Controller (rev 80) (prog-if 10 [OHCI])
	Subsystem: VIA Technologies, Inc. IEEE 1394 Host Controller
	Flags: bus master, medium devsel, latency 32, IRQ 10
	Memory at b0001000 (32-bit, non-prefetchable) [size=2K]
	I/O ports at a800 [size=128]
	Capabilities: [50] Power Management version 2

01:07.0 RAID bus controller: CMD Technology Inc: Unknown device 3512 (rev 01)
	Subsystem: CMD Technology Inc: Unknown device 6512
	Flags: bus master, 66Mhz, medium devsel, latency 32, IRQ 11
	I/O ports at ac00 [size=8]
	I/O ports at b000 [size=4]
	I/O ports at b400 [size=8]
	I/O ports at b800 [size=4]
	I/O ports at bc00 [size=16]
	Memory at b0002000 (32-bit, non-prefetchable) [size=512]
	Expansion ROM at <unassigned> [disabled] [size=512K]
	Capabilities: [60] Power Management version 2

02:00.0 VGA compatible controller: ATI Technologies Inc: Unknown device 4150 (prog-if 00 [VGA])
	Subsystem: PC Partner Limited: Unknown device 7c20
	Flags: bus master, 66Mhz, medium devsel, latency 255, IRQ 9
	Memory at c0000000 (32-bit, prefetchable) [size=256M]
	I/O ports at c000 [size=256]
	Memory at e5000000 (32-bit, non-prefetchable) [size=64K]
	Expansion ROM at <unassigned> [disabled] [size=128K]
	Capabilities: [58] AGP version 3.0
	Capabilities: [50] Power Management version 2

02:00.1 Display controller: ATI Technologies Inc: Unknown device 4170
	Subsystem: PC Partner Limited: Unknown device 7c21
	Flags: 66Mhz, medium devsel
	Memory at d0000000 (32-bit, prefetchable) [disabled] [size=256M]
	Memory at e5010000 (32-bit, non-prefetchable) [disabled] [size=64K]
	Capabilities: [50] Power Management version 2


Does anybody have suggestions for me to try? Should I try a newer
kernel?

Thanks in advance,
  Colin
