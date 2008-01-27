From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 9636] cpufreq reports too low max freq on Intel P4
Date: Sun, 27 Jan 2008 03:20:13 -0800 (PST)
Message-ID: <20080127112013.B720E108016@picon.linux-foundation.org>
References: <bug-9636-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-9636-3570@http.bugzilla.kernel.org/>
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
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=9636





------- Comment #4 from peter.ganzhorn@googlemail.com  2008-01-27 03:20 -------
Latest BIOS update done, didn't help at all.
BTW the machine is an IBM ThinkCentre 9210-CTO.

$ dmesg |grep -i acpi
 BIOS-e820: 000000003f520000 - 000000003f536000 (ACPI data)
 BIOS-e820: 000000003f536000 - 000000003f600000 (ACPI NVS)
ACPI: RSDP 000F6590, 0014 (r0 PTLTD )
ACPI: RSDT 3F53003F, 0040 (r1 PTLTD    RSDT    60400D0  LTP        0)
ACPI: FACP 3F535E2B, 0074 (r1 IBM    THINKCEN  60400D0 PTL         1)
ACPI: DSDT 3F530761, 56CA (r1    IBM THINKCEN  60400D0 MSFT  100000E)
ACPI: FACS 3F58BFC0, 0040
ACPI: TCPA 3F535E9F, 0032 (r2 IBM    THINKCEN  60400D0 PTL         1)
ACPI: MCFG 3F535ED1, 003C (r1 PTLTD    MCFG    60400D0  LTP        0)
ACPI: APIC 3F535F0D, 0068 (r1 PTLTD      APIC    60400D0  LTP        0)
ACPI: BOOT 3F535F75, 0028 (r1 PTLTD  $SBFTBL$  60400D0  LTP        1)
ACPI: ASF! 3F535F9D, 0063 (r32   CETP     CETP  60400D0 PTL         1)
ACPI: SSDT 3F53007F, 01FB (r1  PmRef    CpuPm     3000 INTL 20030224)
ACPI: PM-Timer IO Port: 0x1008
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[0])
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 high edge)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
ACPI: IRQ0 used by override.
ACPI: IRQ2 used by override.
ACPI: IRQ9 used by override.
Using ACPI (MADT) for SMP configuration information
ACPI: Core revision 20070126
ACPI: bus type pci registered
ACPI: EC: Look up EC in DSDT
ACPI: Interpreter enabled
ACPI: (supports S0 S5)
ACPI: Using IOAPIC for interrupt routing
ACPI: PCI Root Bridge [PCI0] (0000:00)
PCI quirk: region 1000-107f claimed by ICH6 ACPI/GPIO/TCO
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP0._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP1._PRT]
ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.SLOT._PRT]
ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 *7 9 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 *5 7 9 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 7 9 *10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 7 *9 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 7 9 10 11 12 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKF] (IRQs *3 4 5 7 9 10 11 12 14 15)
ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 7 9 10 11 12 14 15) *0, disabled.
ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 7 9 10 *11 12 14 15)
pnp: PnP ACPI init
ACPI: bus type pnp registered
pnp: PnP ACPI: found 14 devices
ACPI: ACPI bus type pnp unregistered
PCI: Using ACPI for IRQ routing
ACPI: RTC can wake from S4
ACPI: PCI Interrupt 0000:00:1c.0[A] -> GSI 17 (level, low) -> IRQ 16
ACPI: PCI Interrupt 0000:00:1c.1[B] -> GSI 16 (level, low) -> IRQ 17
ACPI: Power Button (FF) [PWRF]
ACPI: Power Button (CM) [PWRB]
ACPI: SSDT 3F53030A, 01C3 (r1  PmRef  Cpu0Ist     3000 INTL 20030224)
ACPI: Processor [CPU0] (supports 8 throttling states)
ACPI: SSDT 3F53027A, 0090 (r1  PmRef  Cpu1Ist     3000 INTL 20030224)
ACPI: Processor [CPU1] (supports 8 throttling states)
ACPI: Thermal Zone [THM0] (60 C)
ACPI: PCI Interrupt 0000:00:02.0[A] -> GSI 16 (level, low) -> IRQ 17
ACPI: PCI Interrupt 0000:02:00.0[A] -> GSI 16 (level, low) -> IRQ 17
ACPI: PCI Interrupt 0000:00:1f.2[B] -> GSI 19 (level, low) -> IRQ 18
ACPI: PCI Interrupt 0000:00:1d.0[A] -> GSI 23 (level, low) -> IRQ 19
ACPI: PCI Interrupt 0000:00:1d.1[B] -> GSI 19 (level, low) -> IRQ 18
ACPI: PCI Interrupt 0000:00:1d.2[C] -> GSI 18 (level, low) -> IRQ 20
ACPI: PCI Interrupt 0000:00:1d.3[D] -> GSI 16 (level, low) -> IRQ 17
ACPI: PCI Interrupt 0000:00:1f.3[B] -> GSI 19 (level, low) -> IRQ 18

acpidump output attached. Sorry for the little delay but I didn't have physical
access to the machine to do the BIOS upgrade for the last 2 weeks.
Thanks for investigating this :)

Peter


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
