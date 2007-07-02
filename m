From: Thomas Renninger <trenn@suse.de>
Subject: Re: ondemand governor hangs up on my Dell 5150
Date: Mon, 02 Jul 2007 11:49:02 +0200
Message-ID: <1183369742.15856.13.camel@queen.suse.de>
References: <46840176.6050502@gmail.com>  <46862837.10906@gmail.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <46862837.10906@gmail.com>
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
To: Federico Flego <flego.federico@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Sat, 2007-06-30 at 11:53 +0200, Federico Flego wrote:
> Sorry I didn't provide you with more precise information but I'm still 
> learning... :)
> 
> I was suggested to post here part of 'dmesg' output where some 
> errors/warnings/exceptions appear:
> 
> [flego@gardelito ~]$ dmesg |grep -i speedstep
> speedstep: frequency transition measured seems out of range (0 nSec), 
> falling back to a safe one of 500000 nSec.
> 
> 
> [flego@gardelito ~]$ dmesg |grep -i acpi
> ACPI: RSDP (v000 DELL                                  ) @ 0x000fdea0
> ACPI: RSDT (v001 DELL    CPi R   0x27d4071e ASL  0x00000061) @ 0x3fff0000
> ACPI: FADT (v001 DELL    CPi R   0x27d4071e ASL  0x00000061) @ 0x3fff0400
> ACPI: MADT (v001 DELL    CPi R   0x27d4071e ASL  0x00000047) @ 0x3fff0c00
> ACPI: DSDT (v001 INT430 SYSFexxx 0x00001001 MSFT 0x0100000e) @ 0x00000000
> ACPI: PM-Timer IO Port: 0x1008
> ACPI: Local APIC address 0xfee00000
> ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
> ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
> ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
> ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
> ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> ACPI: IRQ0 used by override.
> ACPI: IRQ2 used by override.
> ACPI: IRQ9 used by override.
> Using ACPI (MADT) for SMP configuration information
> ACPI: Core revision 20060707
> ACPI: bus type pci registered
> ACPI: Interpreter enabled
> ACPI: Using IOAPIC for interrupt routing
> ACPI: PCI Root Bridge [PCI0] (0000:00)
> ACPI: Assume root bridge [\_SB_.PCI0] bus is 0
> PCI quirk: region 1000-107f claimed by ICH4 ACPI/GPIO/TCO
> ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
> ACPI: PCI Interrupt Link [LNKA] (IRQs 9 10 *11)
> ACPI: PCI Interrupt Link [LNKB] (IRQs 5 7) *11
> ACPI: PCI Interrupt Link [LNKC] (IRQs 9 10 *11)
> ACPI: PCI Interrupt Link [LNKD] (IRQs 5 7 9 10 *11)
> ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
> ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11 12 14 15)
> ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.AGP_._PRT]
> ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.PCIE._PRT]
> PCI: Using ACPI for IRQ routing
> ACPI: PCI Interrupt 0000:02:04.0[A] -> GSI 16 (level, low) -> IRQ 16
> ACPI: AC Adapter [AC] (off-line)
> ACPI: Battery Slot [BAT0] (battery present)
> ACPI: Video Device [VID] (multi-head: yes  rom: no  post: no)
> ACPI Error (dswload-0333): [SMIX] Namespace lookup failure, 
> AE_ALREADY_EXISTS
> ACPI Exception (psloop-0285): AE_ALREADY_EXISTS, During name 
> lookup/catalog [20060707]
> ACPI Error (psparse-0537): Method parse/execution failed 
> [\_PR_.CPU0._PDC] (Node c1903cfc), AE_ALREADY_EXISTS
> ACPI: Processor [CPU0] (supports 8 throttling states)
> ACPI Error (dswload-0333): [GETC] Namespace lookup failure, 
> AE_ALREADY_EXISTS
> ACPI Exception (psloop-0285): AE_ALREADY_EXISTS, During name 
> lookup/catalog [20060707]
> ACPI Error (psparse-0537): Method parse/execution failed 
> [\_PR_.CPU1._PDC] (Node c1903cd4), AE_ALREADY_EXISTS
> ACPI: Processor [CPU1] (supports 8 throttling states)
> ACPI: Thermal Zone [THM] (34 C)
> ACPI: PCI Interrupt 0000:00:1f.1[A] -> GSI 16 (level, low) -> IRQ 16
> ACPI: PCI Interrupt 0000:00:1d.7[D] -> GSI 23 (level, low) -> IRQ 17
> ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 16 (level, low) -> IRQ 16
> ACPI: PCI Interrupt 0000:00:1d.1[B] -> GSI 19 (level, low) -> IRQ 18
> ACPI: PCI Interrupt 0000:00:1d.2[C] -> GSI 18 (level, low) -> IRQ 19
> ACPI: PCI Interrupt 0000:00:1f.5[B] -> GSI 17 (level, low) -> IRQ 20
> ACPI: PCI Interrupt 0000:01:00.0[A] -> GSI 20 (level, low) -> IRQ 21
> Time: acpi_pm clocksource has been installed.
> 
> 
> Hope this can help somebody to understand what is the problem on my 
> machine!
Yes this helps.
You do not have a cpufreq, but an ACPI problem.
Best is you open a bug on: bugzilla.kernel.org
Shortly describe your problem (also add this output, it clearly points
to ACPI). Then use "create an attachment" and add the output of the
acpidump command from this machine ("acpidump >/tmp/acpidump" and upload
the created file).
Assign the bug to the ACPI component and add
venkatesh.pallipadi@intel.com and myself (trenn@suse.de) to CC'ed people
of the bug.

Thanks,

   Thomas
