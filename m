From: Ari Pollak <ajp@aripollak.com>
Subject: Re: powernow-k8 patch
Date: Thu, 19 Aug 2004 15:00:59 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <cg2td9$mim$1@sea.gmane.org>
References: <84EA05E2CA77634C82730353CBE3A84310F326@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84310F326@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

 > No.  Your problem is caused by a malformed PST table
 > that has too many "low" frequency entries and by a
 > PSB header that isn't the correct revision (1.4).
 > Complain to your BIOS vendor.  Tell them that their
 > BIOS does not support PN! on Win2K.
That's interesting, since IIRC AMD distributed a similar MSI motherboard 
as a demo/reference. Maybe there's some obscure BIOS setting I'm missing.

 > I'm curious as to why it doesn't work under ACPI.
 > Can you instantiate the ACPI version and give me the
 > debug messages?
I'm also wondering why powernow-k8 doesn't fallback to retrieving 
information from ACPI, which is what the documentation says it's 
supposed to do.

Not sure if this is what you want, but here's the ACPI debugging stuff 
from dmesg:
ACPI: RSDP (v000 AMI                                       ) @ 0x000fa3f0
ACPI: RSDT (v001 AMIINT VIA_K8   0x00000010 MSFT 0x00000097) @ 0x1fff0000
ACPI: FADT (v001 AMIINT VIA_K8   0x00000011 MSFT 0x00000097) @ 0x1fff0030
ACPI: MADT (v001 AMIINT VIA_K8   0x00000009 MSFT 0x00000097) @ 0x1fff00c0
ACPI: DSDT (v001    VIA   VIA_K8 0x00001000 MSFT 0x0100000d) @ 0x00000000
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
ACPI: Subsystem revision 20040326
  tbxface-0117 [03] acpi_load_tables      : ACPI Tables successfully 
acquired
Parsing all Control 
Methods:.....................................................................................................................................................
Table [DSDT](id F004) - 520 Objects with 48 Devices 149 Methods 26 Regions
ACPI Namespace successfully loaded at root c03c0c7c
ACPI: IRQ9 SCI: Edge set to Level Trigger.
evxfevnt-0093 [04] acpi_enable           : Transition to ACPI mode 
successful
evgpeblk-0867 [06] ev_create_gpe_block   : GPE 00 to 15 [_GPE] 2 regs at 
0000000000000820 on int 9
evgpeblk-0925 [06] ev_create_gpe_block   : Found 0 Wake, Enabled 6 
Runtime GPEs in this block
Completing Region/Field/Buffer/Package 
initialization:.......................................................................................................
Initialized 26/26 Regions 9/9 Fields 44/44 Buffers 24/24 Packages (529 
nodes)
Executing all Device _STA and_INI 
methods:..................................................
50 Devices found containing: 50 _STA, 1 _INI methods
ACPI: Interpreter enabled
ACPI: Using PIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (00:00)
PCI: Probing PCI hardware (bus 00)
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: Power Resource [URP1] (off)
ACPI: Power Resource [URP2] (off)
ACPI: Power Resource [FDDP] (off)
ACPI: Power Resource [LPTP] (off)
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 *11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 *5 6 7 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 11 *12 14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, 
disabled.
ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, 
disabled.
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, 
disabled.
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 10 11 12 14 15) *0, 
disabled.
PCI: Using ACPI for IRQ routing
ACPI: PCI Interrupt Link [LNKB] enabled at IRQ 10
ACPI: PCI interrupt 0000:00:06.0[A] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI Interrupt Link [LNKA] enabled at IRQ 11
ACPI: PCI interrupt 0000:00:0b.0[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:00:0f.0[B] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI interrupt 0000:00:0f.1[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:00:10.0[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:00:10.1[A] -> GSI 11 (level, low) -> IRQ 11
ACPI: PCI interrupt 0000:00:10.2[B] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI interrupt 0000:00:10.3[B] -> GSI 10 (level, low) -> IRQ 10
ACPI: PCI Interrupt Link [LNKC] enabled at IRQ 5
ACPI: PCI interrupt 0000:00:10.4[C] -> GSI 5 (level, low) -> IRQ 5
ACPI: PCI interrupt 0000:00:11.5[C] -> GSI 5 (level, low) -> IRQ 5
ACPI: PCI interrupt 0000:01:00.0[A] -> GSI 11 (level, low) -> IRQ 11

and after I try to load the acpi module:
ACPI: Processor [CPU1] (supports C1)
acpi_processor_perf-0301 [30] acpi_cpufreq_cpu_init : Unsupported 
address space [127, 127]
