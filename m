From: Len Brown <len.brown@intel.com>
Subject: Re: Main differences between drivers
Date: Tue, 15 Aug 2006 10:56:45 -0400
Message-ID: <200608151056.45913.len.brown@intel.com>
References: <59a2a3420608150722i15be71d4wfa014e18c38dbba5@mail.gmail.com>
Reply-To: Len Brown <lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <59a2a3420608150722i15be71d4wfa014e18c38dbba5@mail.gmail.com>
Content-Disposition: inline
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

On Tuesday 15 August 2006 10:22, Guilherme Moro wrote:
> Hello all,
> 
> Can someone explain, or send a link or a document that explain the
> real difference between the different drivers for Intel processors ?
> Why the same processor can use speedstep-ich, speedstep-centrino and
> acpi-cpufreq ?
> the basic differences I can understand, like acpi-cpufreq use of acpi
> tables, but what driver is the "better" or more "official" for Intel
> platforms?

good question -- the names are quite poor, and unfortunately
it is a pain to re-name drivers.

As of 2.6.17, both acpi-cpufreq and speedstep-centrino 
use ACPI tables, but acpi-cpufreq uses IO accesses
and speedstep centrino uses MSR accesses. 
Since MSR accesses are faster,
it is preferred to try speedstep-centrino first.

speedstep centrino also has reverse engineered tables to fall back on
if ACPI tables fail.  I haven't seen this happen in practice in recent history.
The hard-coded tables were there from before Intel published the PDC
bits that allow ACPI tables to work with MSR accesses.

Going forward, there has been a set of patches on the list to:
1. add MSR access to acpi-cpufreq
2. remove ACPI tables from speedstep-centrino.

That would mean that acpi-cpufreq can handle any ACPI situation --
IO or MSR; and that speedstep-centrino would be only for the reverse-engineered case.
Thus the preference would change to be acpi-cpufreq first, speedstep-centrino second --
though the reverse preference would probably be okay too.

-Len

ps. don't bother with speedstep-ich if the above work, and never use p4-clockmod.
