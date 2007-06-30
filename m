From: Federico Flego <flego.federico@gmail.com>
Subject: Re: ondemand governor hangs up on my Dell 5150
Date: Sat, 30 Jun 2007 11:53:59 +0200
Message-ID: <46862837.10906@gmail.com>
References: <46840176.6050502@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:references:in-reply-to:content-type:content-transfer-encoding;
	b=B3wfMMX+vtBAtojRCvHHwYPNxGwbU+DywcOgyD0RESUg1XPDGXccT3IS5Qs7B1/T/VopWoT5aWCrtqAtdNEuEEaELV/Z1X6wFra+xkeYisJZWAQfF9u9qZGIFS9JBaRGcRyFWCV+who1+/0NLrTObgB4pndQcgRxll/NFuTnz94=
In-Reply-To: <46840176.6050502@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Sorry I didn't provide you with more precise information but I'm still 
learning... :)

I was suggested to post here part of 'dmesg' output where some 
errors/warnings/exceptions appear:

[flego@gardelito ~]$ dmesg |grep -i speedstep
speedstep: frequency transition measured seems out of range (0 nSec), 
falling back to a safe one of 500000 nSec.


[flego@gardelito ~]$ dmesg |grep -i acpi
ACPI: RSDP (v000 DELL                                  ) @ 0x000fdea0
ACPI: RSDT (v001 DELL    CPi R   0x27d4071e ASL  0x00000061) @ 0x3fff0000
ACPI: FADT (v001 DELL    CPi R   0x27d4071e ASL  0x00000061) @ 0x3fff0400
ACPI: MADT (v001 DELL    CPi R   0x27d4071e ASL  0x00000047) @ 0x3fff0c00
ACPI: DSDT (v001 INT430 SYSFexxx 0x00001001 MSFT 0x0100000e) @ 0x00000000
ACPI: PM-Timer IO Port: 0x1008
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Using ACPI (MADT) for SMP configuration information
ACPI: Core revision 20060707
ACPI: bus type pci registered
ACPI: Interpreter enabled
ACPI: Using IOAPIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (0000:00)
ACPI: Assume root bridge [\_SB_.PCI0] bus is 0
PCI quirk: region 1000-107f claimed by ICH4 ACPI/GPIO/TCO
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7) *11
ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 *11)
ACPI: PCI Interrupt Link [LNKD] (IRQs 5 7 9 10 *11)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
PCI: Using ACPI for IRQ routing
ACPI: PCI Interrupt 0000:02:04.0[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: AC Adapter [AC] (off-line)
ACPI: Battery Slot [BAT0] (battery present)
ACPI: Video Device [VID] (multi-head: yes  rom: no  post: no)
ACPI Error (dswload-0333): [SMIX] Namespace lookup failure, 
AE_ALREADY_EXISTS
ACPI Exception (psloop-0285): AE_ALREADY_EXISTS, During name 
lookup/catalog [20060707]
ACPI Error (psparse-0537): Method parse/execution failed 
[\_PR_.CPU0._PDC] (Node c1903cfc), AE_ALREADY_EXISTS
ACPI: Processor [CPU0] (supports 8 throttling states)
ACPI Error (dswload-0333): [GETC] Namespace lookup failure, 
AE_ALREADY_EXISTS
ACPI Exception (psloop-0285): AE_ALREADY_EXISTS, During name 
lookup/catalog [20060707]
ACPI Error (psparse-0537): Method parse/execution failed 
[\_PR_.CPU1._PDC] (Node c1903cd4), AE_ALREADY_EXISTS
ACPI: Processor [CPU1] (supports 8 throttling states)
ACPI: Thermal Zone [THM] (34 C)
ACPI: PCI Interrupt 0000:00:1f.1[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:00:1d.7[D] -> GSI 23 (level, low) -> IRQ 17
ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 16 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:00:1d.1[B] -> GSI 19 (level, low) -> IRQ 18
ACPI: PCI Interrupt 0000:00:1d.2[C] -> GSI 18 (level, low) -> IRQ 19
ACPI: PCI Interrupt 0000:00:1f.5[B] -> GSI 17 (level, low) -> IRQ 20
ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 20 (level, low) -> IRQ 21
Time: acpi_pm clocksource has been installed.


Hope this can help somebody to understand what is the problem on my 
machine!

Thank you very much for your help,

Federico.

Federico Flego wrote:
> Hi all!
> 
> I'm new to this list and I'd like to have your feedback on the following 
> problem I'm experimenting and which is starting to annoying me very much!
> 
> After compiling a new kernel with cpu frequency scaling capabilities 
> activated my system execute the following script at boot time:
> 
> echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
> /usr/bin/i8kfan 0 0 (*)
> 
> And finally, I have my laptop quiet and with low battery consuption at 
> least when I write e-mail read newspaper on line! :)
> 
> The problem is that now and then the computer hangs and there's no way 
> to reboot it but holding down the power-off button... thus losing any 
> unsaved data and having to wait for a whole disk error checking at next 
> boot! :(
> 
> This problem is sort of repeatable, in fact whenever I launch mplayer 
> the machine hangs up immediately 90% of the times.
> 
> I thought a kernel upgrade can solve the problem, but kernel 2.6.21.5 
> didn't fix it!
> 
> Can you tell me whether you experimented similar problem? And how you 
> solved it in case? Or can you help me to understand what is the possible 
> cause?
> 
> My laptop is a Dell Inspiron 5150 with:
> 
> cpu family      : 15
> model           : 2
> model name      : Mobile Intel(R) Pentium(R) 4     CPU 3.06GHz
> stepping        : 9
> cpu MHz         : 3066.590
> 
> and os is:
> 
> Linux gardelito 2.6.21.5-ARCH #1 SMP Tue Jun 19 19:43:55 CEST 2007 i686 
> Mobile Intel(R) Pentium(R) 4     CPU 3.06GHz GenuineIntel GNU/Linux
> 
> 
> Thank you very very much for any help/hints you can provide...
> 
> 
> Federico.
> 
> 
> (*) I found out that if I stop the fan this way at boot time, then it is 
> started/tuned/stopped depending on cpu temperature, otherwise it is kept 
> speed controlled but never stopped.
> 
