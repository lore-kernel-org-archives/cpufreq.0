From: jorgen@greven.dk
Subject: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Tue, 2 Jan 2007 23:16:49 +0100 (CET)
Message-ID: <35957.192.168.3.96.1167776209.squirrel@www.jgnet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk

>On Tue, Jan 02, 2007 at 01:17:05PM +0100, jorgen at greven.dk wrote:
> > Hi
> >
> > I have just bought a nice little sbc mainboard with a Via C7 cpu. It run
> > Centos with stock kernel 2.6.19.1 that I downloaded and installed a few
> > days ago.
> > But cpufreq does not work.
> >
> > Can I in some way help with testing/debugging the cpufreq driver
>(centrino
> > or longhaul?) for this cpu?
>
>The C7 works fine with acpi-cpufreq if the correct BIOS tables are present.
>Support *could* be added to speedstep-centrino to use hardcoded tables
>for these CPUs for systems where the BIOSes lack them, but hasn't been
>done yet.
>
>Given speedstep-centrino is due to be obsoleted by acpi-cpufreq at some
>stage,
>the feature of using hardcoded tables probably needs to be added to
>acpi-cpufreq at some point too.
>
>		Dave

The acpi_cpufreq don't load, I suppose that the bios do not support
acpi_cpufreq:

# modprobe acpi_cpufreq
FATAL: Error inserting acpi_cpufreq
(/lib/modules/2.6.19.1/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko):
Unknown symbol in module, or unknown parameter (see dmesg)

# dmesg
acpi_cpufreq: disagrees about version of symbol acpi_processor_notify_smm
acpi_cpufreq: Unknown symbol acpi_processor_notify_smm

I have looked arround in bios setup and found and enabled whatever look
related to pwr management, and it did give some new messages.

Here is a few ACPI comments from boot (dmesg)

DMI 2.3 present.
ACPI: RSDP (v000 CN700                                 ) @ 0x000f7880
ACPI: RSDT (v001 CN700  AWRDACPI 0x42302e31 AWRD 0x00000000) @ 0x1eee3040
ACPI: FADT (v001 CN700  AWRDACPI 0x42302e31 AWRD 0x00000000) @ 0x1eee30c0
ACPI: MADT (v001 CN700  AWRDACPI 0x42302e31 AWRD 0x00000000) @ 0x1eee8000
ACPI: DSDT (v001 CN700  AWRDACPI 0x00001000 MSFT 0x0100000e) @ 0x00000000
...
...
ACPI: Processor [CPU0] (supports 2 throttling states)
...
How can I determine if this is a driver problem or a bios problem?

Jorgen
