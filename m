From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] Remove p4_clockmode driver
Date: Fri, 16 May 2008 11:32:24 -0700
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEE010D5204@orsmsx423.amr.corp.intel.com>
References: <1209844030.13290.5.camel@linux-2bdv.site>
	<20080511161934.GI15445@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-reply-to: <20080511161934.GI15445@codemonkey.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: Dave Jones <davej@codemonkey.org.uk>, Thomas Renninger <trenn@suse.de>
Cc: cpufreq <cpufreq@lists.linux.org.uk>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>

 

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Dave Jones
>Sent: Sunday, May 11, 2008 9:20 AM
>To: Thomas Renninger
>Cc: cpufreq; mzahor@dtech.sk; Dominik Brodowski
>Subject: Re: [PATCH] Remove p4_clockmode driver
>
>On Sat, May 03, 2008 at 09:47:10PM +0200, Thomas Renninger wrote:
> > Remove p4_clockmode driver
> >
> > The driver is doing throttling which is supposed to be done 
>through another
> > ACPI interface. If both interfaces are used, the machine 
>may get very slow.
> > Remove this driver which should never be used.
> >
> > Signed-off-by: Thomas Renninger <trenn@suse.de>
>
>I agree this is long overdue being taken out back and shot.
>
>Some thoughts though:
>
>* Should we deprecate this for a release first ?
>  I'm torn over this, because I think no matter how long we do 
>this for,
>  we're going to get people who claim to be surprised.
>  Though given this driver is 99% useless, perhaps just ripping it out
>  is for the best.
>
>* Matthew Garrett mentioned something interesting this morning..
>
>mjg59 | davej: On machines that don't support acpi throttling, 
>I was under the impression that there was supposed to be a 
>hook between the thermal code and cpufreq
>mjg59 | Which would then let p4-clockmod be kicked even if 
>it's below the threshold at which the CPU would throttle itself
>davej | having that code expose T states rather than pretend 
>to be P states is probably for the best.
>mjg59 | Yeah, true
>
>  So whilst killing this off is probably the right thing to 
>do, there may be
>  some value in parts of it living on in the ACPI code ?

ACPI code already has support for T-states, which uses the same
mechanism as P4-clockmod
in response to thermal events (once the CPU is at lowest freq). However,
it needs the BIOS
to export T-state information. May be there is some value to add a
driver to do T-states even
without ACPI T-states and hook into thermal code.

Agree that sooner we get this out of cpufreq better it is. I don't think
we can explain it
any more that "P4-clockmod works does not mean it is saving any power".

Thanks,
Venki
