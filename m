From: Robert Schwebel <robert@schwebel.de>
Subject: Re: Dell Inspiron 8200
Date: Sat, 15 Nov 2003 15:59:44 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031115145944.GE24323@pengutronix.de>
References: <20031107145510.GH2750@pengutronix.de>
	<3FAE1F07.5020305@gotiao.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3FAE1F07.5020305@gotiao.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
Cc: cpufreq@www.linux.org.uk

On Sun, Nov 09, 2003 at 10:03:35PM +1100, Viktor Radnai wrote:
> I had that problem before with my Dell Inspiron 4150. I was using an=20
> older (late 2.5 iirc) kernel. I've found that the ACPI frequency scaling =

> driver was crashing on startup and my 2GHz Pentium 4M was running at=20
> 700MHz (which could be a BIOS default for saving power, maybe?).
>=20
> In any case, it would be useful if you could tell us what cpufreq=20
> related settings you configured in your kernel, and any related output=20
> from dmesg. It's no point speculating without more information.

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=3Dm
CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=3Dy
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
CONFIG_X86_SPEEDSTEP_ICH=3Dm
# CONFIG_X86_SPEEDSTEP_SMI is not set
CONFIG_X86_SPEEDSTEP_LIB=3Dm
CONFIG_X86_P4_CLOCKMOD=3Dm
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set

----------8<----------

Linux version 2.6.0-test9 (root@europa) (gcc version 3.3.2 (Debian)) #3 Fri=
 Nov 7 13:16:49 CET 2003
[...]
DMI 2.3 present.
Dell Inspiron with broken BIOS detected. Refusing to enable the local APIC.
ACPI: RSDP (v000 DELL                                      ) @ 0x000fde50
ACPI: RSDT (v001 DELL    CPi R   0x27d20811 ASL  0x00000061) @ 0x000fde64
ACPI: FADT (v001 DELL    CPi R   0x27d20811 ASL  0x00000061) @ 0x000fde90
ACPI: DSDT (v001 INT430 SYSFexxx 0x00001001 MSFT 0x0100000e) @ 0x00000000
Building zonelist for node : 0
Kernel command line: BOOT_IMAGE=3D2.6.0-test9 ro root=3D302 video=3Dvesa:791
Initializing CPU#0
PID hash table entries: 1024 (order 10: 8192 bytes)
Detected 1198.979 MHz processor.
[...]
Calibrating delay loop... 2351.10 BogoMIPS
Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
CPU:     After generic identify, caps: 3febf9ff 00000000 00000000 00000000
CPU:     After vendor identify, caps: 3febf9ff 00000000 00000000 00000000
CPU: Trace cache: 12K uops, L1 D cache: 8K
CPU: L2 cache: 512K
CPU:     After all inits, caps: 3febf9ff 00000000 00000000 00000080
Intel machine check architecture supported.
Intel machine check reporting enabled on CPU#0.
CPU#0: Intel P4/Xeon Extended MCE MSRs (12) available
CPU#0: Thermal monitoring enabled
CPU: Intel(R) Pentium(R) 4 Mobile CPU 1.70GHz stepping 04
Enabling fast FPU save and restore... done.
Enabling unmasked SIMD FPU exception support... done.
Checking 'hlt' instruction... OK.
POSIX conformance testing by UNIFIX
NET: Registered protocol family 16
PCI: PCI BIOS revision 2.10 entry at 0xfbfee, last bus=3D2
PCI: Using configuration type 1
mtrr: v2.0 (20020519)
ACPI: Subsystem revision 20031002
ACPI: IRQ 9 was Edge Triggered, setting to Level Triggerd
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
Transparent bridge - 0000:00:1e.0
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7)
ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 5 7 9 10 *11)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
ACPI: Power Resource [PADA] (on)
Linux Plug and Play Support v0.97 (c) Adam Belay
drivers/usb/core/usb.c: registered new driver usbfs
drivers/usb/core/usb.c: registered new driver hub
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 11
ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
PCI: Using ACPI for IRQ routing
PCI: if you experience problems, try using option 'pci=3Dnoacpi' or even 'a=
cpi=3Doff'
vesafb: framebuffer at 0xe0000000, mapped to 0xd0807000, size 16384k
vesafb: mode is 1024x768x16, linelength=3D2048, pages=3D1
vesafb: protected mode interface info at c000:f120
vesafb: scrolling: redraw
vesafb: directcolor: size=3D0:5:6:5, shift=3D0:11:5:0
fb0: VESA VGA frame buffer device
Machine check exception polling timer started.
ikconfig 0.7 with /proc/config*
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Initializing Cryptographic API
ACPI: AC Adapter [AC] (off-line)
ACPI: Battery Slot [BAT0] (battery present)
ACPI: Battery Slot [BAT1] (battery present)
ACPI: Lid Switch [LID]
ACPI: Power Button (CM) [PBTN]
ACPI: Sleep Button (CM) [SBTN]
ACPI: Processor [CPU0] (supports C1 C2, 8 throttling states)
ACPI: Thermal Zone [THM] (25 C)
[...]
PCI: Setting latency timer of device 0000:00:1f.5 to 64
intel8x0: clocking to 48000
drivers/usb/host/uhci-hcd.c: bf80: suspend_hc
drivers/usb/host/uhci-hcd.c: bf20: suspend_hc
mtrr: 0xe0000000,0x2000000 overlaps existing 0xe0000000,0x1000000
spurious 8259A interrupt: IRQ7.
    ACPI-0277: *** Error: Looking up [BST1] in namespace, AE_ALREADY_EXISTS
    ACPI-1120: *** Error: Method execution failed [\_SB_.BAT1._BST] (Node c=
ffd0a60), AE_ALREADY_EXISTS
[...]

Robert
--=20
 Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de
 Pengutronix - Linux Solutions for Science and Industry
   Handelsregister:  Amtsgericht Hildesheim, HRA 2686
     Hornemannstra=DFe 12,  31137 Hildesheim, Germany
    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4

  Visit us at the SPS/IPC/Drives in Nuernberg, H10/340!
