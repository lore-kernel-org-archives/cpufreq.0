From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: ACPI / CPUFREQ.
Date: Tue, 3 Aug 2004 22:51:20 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040803205120.GB8421@dominikbrodowski.de>
References: <20040803151010.GQ12724@redhat.com>
	<1091547688.3473.4.camel@dhcppc4>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091547688.3473.4.camel@dhcppc4>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <len.brown@intel.com>
Cc: Dave Jones <davej@redhat.com>, "cpufreq@www.linux.org.uk" <cpufreq@www.linux.org.uk>

On Tue, Aug 03, 2004 at 11:41:28AM -0400, Len Brown wrote:
> On Tue, 2004-08-03 at 11:10, Dave Jones wrote:
> > At his ACPI talk at OLS, Len mentioned that it would be beneficial
> > to have ACPI and CPUFREQ working together a little better.
> > 
> > Len, care to kick off some thoughts on what pieces you had in mind ?
> > 
> > The biggest problem is probably ACPI thinking the CPU should be at a
> > certain P-state whilst the user has forced it to another with cpufreq.
> 
> I think there are 2 major issues.
> 
> 1. confusion about best driver to use
>    this, of course, should be automatic
>    and should not depend on if the drivers
>    are built-in or modules.

AFAICS, p4-clockmod should be considered to be removed and put into a
"pending" state on some external website until a
"two-cpufreq-drivers-at-a-time,one-throttling,one-scaling-driver"
implementation is merged.

Other than that, only speedstep-centrino.c and acpi.c, the latter of which
should be renamed IMHO to something like cpufreq-acpi-io.c, are in some
sort of "conflict". A good startup-script, as well as recommending to use
modules for cpufreq drivers, should solve this issue completely. Also, more
extensive Documentation would help.

> 2. no coordination between P-states
>    and T-states.  ACPI currently kicks
>    in throttling upon high temperature conditions,
>    but it doesn't make sense to use throttling
>    unless we're already in the most power-conserving
>    P-state available.

AFAICS, this is already done in drivers/acpi/processor.c:


in acpi_processor_set_thermal_limit():
	case ACPI_PROCESSOR_LIMIT_INCREMENT:
		/* if going up: P-states first, T-states later */

		result = acpi_thermal_cpufreq_increase(pr->id);

and acpi_thermal_cpufreq_increase() does reduce the CPU frequency
up to 40% in 20%-steps [hardcoded], independent of the cpufreq driver used
or whether there's even P-States data in the ACPI tables. IMO the limit of
"40%" could be overriden if a cpufreq-driver is registered with the ACPI
P-States library, or even decreased further. The code is there, though.


3.) No coordination between ACPI T-States and frequency scaling.

ACPI T-States should become a cpufreq-throttling-driver once the
"allow-for-two-drivers" implemenation mentioned above is written, found to
be sufficient and good, and merged.

Thanks,
	Dominik
