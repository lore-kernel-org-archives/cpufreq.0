From: Andras.Horvath@cern.ch
Subject: Re: Intel Clovertown vs. frequency scaling
Date: Fri, 2 Nov 2007 17:37:02 +0100
Message-ID: <20071102163702.GE5966@cern.ch>
References: <20071012150126.GY6058@cern.ch>
	<653FFBB4508B9042B5D43DC9E18836F50181D939@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F50181D939@scsmsx415.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

(sorry for the late reply)

> Hmmm. This processor should support 2GHz frequency. Most probably BIOS
> is not providing information for the driver to enable speedstep here.

This is embarassing, the option (named "EIST support") was off. Turning
it on resulted in

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
2333000 2000000 

but no C-state info (like on the L5335) with 2.6.23 and acpi-cpufreq.

> Can you make sure you have the latest BIOS and also check whether there
> are any options to enable speedstep in BIOS setup. Send me the output of
> acpidump (you can find acpidump in latest pmtools package here -
> http://www.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/ ). I can
> take a look at what BIOS is saying about speedstep.

Hm... I may be missing something again, but acpidump doesn't find the
RSD PTR table, and dmesg doesn't help either (all ACPI-related options
are enabled in the BIOS): 

root@pcitfiot05:/usr/src/pmtools-20070714/acpidump# ./acpidump
ACPI tables were not found. If you know location of RSD PTR table (from
dmesg, etc), supply it with either --addr or -a option
root@pcitfiot05:/usr/src/pmtools-20070714/acpidump# dmesg | grep ACPI | head -20
 BIOS-e820: 00000000cff60000 - 00000000cff69000 (ACPI data)
 BIOS-e820: 00000000cff69000 - 00000000cff80000 (ACPI NVS)
ACPI: RSDP 000F6030, 0014 (r0 PTLTD )
ACPI: RSDT CFF63C39, 003C (r1 PTLTD    RSDT    6040000  LTP        0)
ACPI: FACP CFF68E10, 0074 (r1 INTEL  TUMWATER  6040000 PTL         3)
ACPI: DSDT CFF65C59, 31B7 (r1  Intel BLAKFORD  6040000 MSFT  100000E)
ACPI: FACS CFF69FC0, 0040
ACPI: APIC CFF68E84, 00C8 (r1 PTLTD      APIC    6040000  LTP        0)
ACPI: MCFG CFF68F4C, 003C (r1 PTLTD    MCFG    6040000  LTP        0)
ACPI: BOOT CFF68F88, 0028 (r1 PTLTD  $SBFTBL$  6040000  LTP        1)
ACPI: SPCR CFF68FB0, 0050 (r1 PTLTD  $UCRTBL$  6040000 PTL         1)
ACPI: SSDT CFF63C75, 1405 (r1  PmRef    CpuPm     3000 INTL 20050228)
ACPI: PM-Timer IO Port: 0x1008
ACPI: Local APIC address 0xfee00000
ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
ACPI: LAPIC (acpi_id[0x01] lapic_id[0x04] enabled)
ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
ACPI: LAPIC (acpi_id[0x03] lapic_id[0x05] enabled)
ACPI: LAPIC (acpi_id[0x04] lapic_id[0x02] enabled)
ACPI: LAPIC (acpi_id[0x05] lapic_id[0x06] enabled)

This is with the latest BIOS (Supermicro X7DBT, 1.3c); it has an option
called "Processor Power Management" which can be set to either 

"GV1/GV3 only" - according to the BIOS, this enables GV1/GV3 (whatever
that is) but no C states. This is what I use.
"Disabled" - which disables everything.

According to the BIOS help there should be two more settings to that
that give me C states but those are only described, they don't appear in
the selection box. 

Two more options called "Thermal Management 2" and "C1 Enhanced Mode"
were also enabled, still no C states.

I guess I'll be nagging Supermicro about this.

thanks again,
Andras
