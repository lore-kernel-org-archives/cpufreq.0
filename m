From: Viktor Radnai <efti@gotiao.com>
Subject: Re: Dell Inspiron 8200
Date: Sun, 16 Nov 2003 12:39:27 +1100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3FB6D54F.6090208@gotiao.com>
References: <20031107145510.GH2750@pengutronix.de>	<3FAE1F07.5020305@gotiao.com>
	<20031115145944.GE24323@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080607000001000400070805"
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031115145944.GE24323@pengutronix.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Robert Schwebel <robert@schwebel.de>
Cc: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.
--------------080607000001000400070805
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Robert,

The DSDT table supplied by the Dell BIOS (which describes the available 
ACPI functions) is buggy, so you'll need to replace it with a custom 
one. This will probably solve your problem.

There are some instructions on how to do that at 
http://www.cpqlinux.com/acpi-howto.html, but they're somewhat out of 
date, so here's the simplified version of what I did (I left out the 
editing of the ASL source since your model already has a fixed source 
available).

1. You can download the ASL source of a replacement table for the 8200 
from here: 
http://acpi.sourceforge.net/dsdt/tables/Dell/Inspiron_8200/Dell-Inspiron_8200-A07-custom.asl.gz

2. You'll need to get intel's ASL compiler from 
http://www.intel.com/technology/iapc/acpi/downloads/iasl-linux-20030523.tar.gz

For simplicity's sake, I keep my ASL source file at /usr/src/dsdt.asl 
(and the compiled table at /usr/src/dsdt.hex).

3. Compile the DSDT table by running /path/to/iasl -tc dsdt.asl
This will leave a file called dsdt.hex, which is your replacement table.

4. Now you need to patch your kernel (drivers/acpi/osl.c) to use the new 
DSDT table:
# cd /usr/src/linux/drivers/acpi/
# patch -p1 < /usr/src/custom-dsdt.patch (see attachment)

Note that this patch expects to find dsdt.hex in /usr/src, which is IMHO 
a pretty good place for it since you'll need to compile it into every 
new kernel you build until Dell releases a bug-free BIOS.

5. Recompile your kernel. You won't need CONFIG_X86_SPEEDSTEP_CENTRINO, 
since you have a Pentium 4-M chip (not Pentium M aka Centrino). You can 
either use the speedstep-ich, acpi or p4-clockmod cpufreq drivers.

6. Boot with the new kernel, load one of the above driver modules, and 
keep your fingers crossed ;)

Note on the cpufreq drivers: Speedstep-ich and acpi are the best for 
saving power (because they also scale the CPU voltage), but p4-clockmod 
lets you drastically lower the effective frequency of the CPU (about 10% 
of maximum speed) so it can be useful for keeping the CPU cool or 
reducing the peak power consumption allowing you to run longer on a flat 
battery.

Unfortunately you can't really use more than one driver at the same 
time. I've found that it's possible to scale down the cpu speed using 
the speedstep-ich or acpi driver module, then remove the module, load 
p4-clockmod and lower the cpu speed even further, but this is a bit of a 
hack. At one time there was a CPUFreq FAQ in the making, but I couldn't 
find it. Perhaps someone on the list would be kind enough to post the link?

Hope this helps. Let us know if you're still having problems or mail me 
off the list if you're having problems with my instructions.

Regards,
Vik

Robert Schwebel wrote:
> On Sun, Nov 09, 2003 at 10:03:35PM +1100, Viktor Radnai wrote:
> 
>>I had that problem before with my Dell Inspiron 4150. I was using an 
>>older (late 2.5 iirc) kernel. I've found that the ACPI frequency scaling 
>>driver was crashing on startup and my 2GHz Pentium 4M was running at 
>>700MHz (which could be a BIOS default for saving power, maybe?).
>>
>>In any case, it would be useful if you could tell us what cpufreq 
>>related settings you configured in your kernel, and any related output 
>>from dmesg. It's no point speculating without more information.
> 
> 
> #
> # CPUFreq processor drivers
> #
> CONFIG_X86_ACPI_CPUFREQ=m
> CONFIG_X86_ACPI_CPUFREQ_PROC_INTF=y
> # CONFIG_X86_POWERNOW_K6 is not set
> # CONFIG_X86_POWERNOW_K7 is not set
> # CONFIG_X86_POWERNOW_K8 is not set
> # CONFIG_X86_GX_SUSPMOD is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=m
> CONFIG_X86_SPEEDSTEP_ICH=m
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> CONFIG_X86_SPEEDSTEP_LIB=m
> CONFIG_X86_P4_CLOCKMOD=m
> # CONFIG_X86_LONGRUN is not set
> # CONFIG_X86_LONGHAUL is not set
> 
> ----------8<----------
> 
> Linux version 2.6.0-test9 (root@europa) (gcc version 3.3.2 (Debian)) #3 Fri Nov 7 13:16:49 CET 2003
> [...]
> DMI 2.3 present.
> Dell Inspiron with broken BIOS detected. Refusing to enable the local APIC.
> ACPI: RSDP (v000 DELL                                      ) @ 0x000fde50
> ACPI: RSDT (v001 DELL    CPi R   0x27d20811 ASL  0x00000061) @ 0x000fde64
> ACPI: FADT (v001 DELL    CPi R   0x27d20811 ASL  0x00000061) @ 0x000fde90
> ACPI: DSDT (v001 INT430 SYSFexxx 0x00001001 MSFT 0x0100000e) @ 0x00000000
> Building zonelist for node : 0
> Kernel command line: BOOT_IMAGE=2.6.0-test9 ro root=302 video=vesa:791
> Initializing CPU#0
> PID hash table entries: 1024 (order 10: 8192 bytes)
> Detected 1198.979 MHz processor.
> [...]
> Calibrating delay loop... 2351.10 BogoMIPS
> Dentry cache hash table entries: 32768 (order: 5, 131072 bytes)
> Inode-cache hash table entries: 16384 (order: 4, 65536 bytes)
> Mount-cache hash table entries: 512 (order: 0, 4096 bytes)
> CPU:     After generic identify, caps: 3febf9ff 00000000 00000000 00000000
> CPU:     After vendor identify, caps: 3febf9ff 00000000 00000000 00000000
> CPU: Trace cache: 12K uops, L1 D cache: 8K
> CPU: L2 cache: 512K
> CPU:     After all inits, caps: 3febf9ff 00000000 00000000 00000080
> Intel machine check architecture supported.
> Intel machine check reporting enabled on CPU#0.
> CPU#0: Intel P4/Xeon Extended MCE MSRs (12) available
> CPU#0: Thermal monitoring enabled
> CPU: Intel(R) Pentium(R) 4 Mobile CPU 1.70GHz stepping 04
> Enabling fast FPU save and restore... done.
> Enabling unmasked SIMD FPU exception support... done.
> Checking 'hlt' instruction... OK.
> POSIX conformance testing by UNIFIX
> NET: Registered protocol family 16
> PCI: PCI BIOS revision 2.10 entry at 0xfbfee, last bus=2
> PCI: Using configuration type 1
> mtrr: v2.0 (20020519)
> ACPI: Subsystem revision 20031002
> ACPI: IRQ 9 was Edge Triggered, setting to Level Triggerd
> ACPI: Interpreter enabled
> ACPI: Using PIC for interrupt routing
> ACPI: PCI Root Bridge [PCI0] (00:00)
> PCI: Probing PCI hardware (bus 00)
> Transparent bridge - 0000:00:1e.0
> ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
> ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
> ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7)
> ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 *11)
> ACPI: PCI Interrupt Link [LNKD] (IRQs 5 7 9 10 *11)
> ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
> ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
> ACPI: Power Resource [PADA] (on)
> Linux Plug and Play Support v0.97 (c) Adam Belay
> drivers/usb/core/usb.c: registered new driver usbfs
> drivers/usb/core/usb.c: registered new driver hub
> ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
> ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 11
> ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 11
> ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11
> PCI: Using ACPI for IRQ routing
> PCI: if you experience problems, try using option 'pci=noacpi' or even 'acpi=off'
> vesafb: framebuffer at 0xe0000000, mapped to 0xd0807000, size 16384k
> vesafb: mode is 1024x768x16, linelength=2048, pages=1
> vesafb: protected mode interface info at c000:f120
> vesafb: scrolling: redraw
> vesafb: directcolor: size=0:5:6:5, shift=0:11:5:0
> fb0: VESA VGA frame buffer device
> Machine check exception polling timer started.
> ikconfig 0.7 with /proc/config*
> Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
> Initializing Cryptographic API
> ACPI: AC Adapter [AC] (off-line)
> ACPI: Battery Slot [BAT0] (battery present)
> ACPI: Battery Slot [BAT1] (battery present)
> ACPI: Lid Switch [LID]
> ACPI: Power Button (CM) [PBTN]
> ACPI: Sleep Button (CM) [SBTN]
> ACPI: Processor [CPU0] (supports C1 C2, 8 throttling states)
> ACPI: Thermal Zone [THM] (25 C)
> [...]
> PCI: Setting latency timer of device 0000:00:1f.5 to 64
> intel8x0: clocking to 48000
> drivers/usb/host/uhci-hcd.c: bf80: suspend_hc
> drivers/usb/host/uhci-hcd.c: bf20: suspend_hc
> mtrr: 0xe0000000,0x2000000 overlaps existing 0xe0000000,0x1000000
> spurious 8259A interrupt: IRQ7.
>     ACPI-0277: *** Error: Looking up [BST1] in namespace, AE_ALREADY_EXISTS
>     ACPI-1120: *** Error: Method execution failed [\_SB_.BAT1._BST] (Node cffd0a60), AE_ALREADY_EXISTS
> [...]
> 
> Robert


--------------080607000001000400070805
Content-Type: text/plain;
 name="custom-dsdt.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="custom-dsdt.patch"

--- old/osl.c	2003-06-19 00:36:33.000000000 +1000
+++ new/osl.c	2003-04-19 00:21:34.000000000 +1000
@@ -224,6 +224,9 @@
 	return AE_OK;
 }
 
+static const
+#include "/usr/src/dsdt.hex"
+ 
 acpi_status
 acpi_os_table_override (struct acpi_table_header *existing_table,
 			struct acpi_table_header **new_table)
@@ -231,7 +234,9 @@
 	if (!existing_table || !new_table)
 		return AE_BAD_PARAMETER;
 
-	*new_table = NULL;
+	if (strncmp(existing_table->signature,"DSDT",4))
+		*new_table = NULL;
+	else *new_table = (struct acpi_table_header *) AmlCode;
 	return AE_OK;
 }
 

--------------080607000001000400070805
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--------------080607000001000400070805--


