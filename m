From: Thomas Renninger <trenn@suse.de>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Tue, 08 Aug 2006 14:52:52 +0200
Message-ID: <1155041572.4302.868.camel@queen.suse.de>
References: <EB12A50964762B4D8111D55B764A84545A604D@scsmsx413.amr.corp.intel.com>
	<8be731880608061243m10d3944bv3e38b7247d4959a0@mail.gmail.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <8be731880608061243m10d3944bv3e38b7247d4959a0@mail.gmail.com>
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
To: tobias.bocanegra@day.com
Cc: cpufreq@lists.linux.org.uk

On Sun, 2006-08-06 at 21:43 +0200, Tobias Bocanegra wrote:
> 
> it working! it was the processor_perflib and not the processor_thermal.
> i commented the call to cpufreq_verify_within_limits() and now i can
> set the 2.17ghz. i just wonder how to control the powerstates in
> perflib?

Sorry for reading that so late.
I got two reports about this problem (X60 and HP nx9420).
Both with a Core Duo CPU (T2400).

On the X60 it was hard to reproduce and the phenomenon vanished for the
X60 when changing a performance-management setting in BIOS from
"Powersave" to "Automatic".
https://bugzilla.novell.com/show_bug.cgi?id=177963


On the HP nx9420 (nc6320 and nx7400 should also be affected) I could
identify that _PPC always returned 1.

But the value calculated in _PPC comes from several function invocations
and I gave up as I hoped some HP BIOS guys would have a look at it.
https://bugzilla.novell.com/show_bug.cgi?id=179702

This is no cpufreq, but an ACPI/AML problem.
Maybe someone who owns such a machine could do an ACPI_DEBUG trace when
_PPC is entered. Adding these two lines (ACPI_DEBUG=y must be compiled
into kernel) around the acpi_evaluated_integer() call should limit acpi
debug output to a sane level. Better unload all unnecessary ACPI modules
(thermal/fan/..) before loading acpi-cpufreq/speedstep-centrino:

drivers/acpi/processor_perf.c:

acpi_dbg_level=0xFFFFFFFF;
       status = acpi_evaluate_integer(pr->handle, "_PPC", NULL, &ppc);
acpi_dbg_level=0x3;


It would be nice if we could go on with the novell bug, if people do not
like to open an account there, please open a separate
bugzilla.kernel.org bug and take me into CC.
Please also describe the affected model and attach acpidump output.

Thanks,

    Thomas
