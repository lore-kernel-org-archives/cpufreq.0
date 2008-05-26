From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Mon, 26 May 2008 14:56:54 +0200
Message-ID: <1211806614.29901.212.camel@queen.suse.de>
References: <20080511161934.GI15445@codemonkey.org.uk>
	<20080522040118.GA28737@anvil.corenet.prv>
	<1211541678.29901.78.camel@queen.suse.de>
	<20080523084737.ZZRA012@mailhub.coreip.homeip.net>
	<1211555977.29901.110.camel@queen.suse.de>
	<20080523113206.ZZRA012@mailhub.coreip.homeip.net>
	<1211559367.29901.140.camel@queen.suse.de>
	<20080523133809.ZZRA012@mailhub.coreip.homeip.net>
	<20080524110309.GB13173@isilmar.linta.de>
	<1211729971.3422.52.camel@linux-2bdv.site>
	<20080526120507.GA23310@srcf.ucam.org>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20080526120507.GA23310@srcf.ucam.org>
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
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Dave Jones <davej@codemonkey.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq <cpufreq@lists.linux.org.uk>

On Mon, 2008-05-26 at 13:05 +0100, Matthew Garrett wrote:
> On Sun, May 25, 2008 at 05:39:31PM +0200, Thomas Renninger wrote:
> 
> > Could you explain this in two easy sentences again, why this should not
> > use the throttling interface?
> 
> Because it involves rewriting code for purely aesthetic benefit. I agree 
> that, in an ideal world, p4-clockmod would integrate into the throttling 
> system. But unless someone wants to rewrite it, that doesn't look 
> likely...
Yes, I should add a p4-clockmod filter and move all upcoming issues on
the cpufreq list automatically to the trash...
> 
> > (former /proc/acpi/processor/*/throttling, now somewhere located in
> > sysfs. Also used for passive cooling if no cpufreq is available).
> > Throttling is what this driver is doing and with which it will interfere
> > and slow down the machine to be closed to unresponsive if both
> > (throttling and cpufreq interface) are using it?
> 
> The ACPI throttling interface will only be used if the minimum cpufreq 
> state has already been reached.
Yes and this is correct.
If there should really be a machine out there which can do real cpufreq
scaling and the p4-clockmod driver still works, real cpufreq scaling
should be preferred.
> Users really shouldn't play with the 
> throttling interface themselves, given its lack of useful functionality.
Right, this also applies for p4-clockmod. Therefore, if at all, this
should get moved to throttling. There it will be used for what it is
designed for: passive cooling to avoid critical temperatures. This is
done automatically through the trip points interface without the need of
user interaction (Yes, BIOSes do not define a passive trip point...,
this should hopefully be possible via userspace soon).

To be honest I do not care that much about removing this one. IMO things
should be cleaned up from time to time.
While ThinkPads, Acer, Dell seem to run quite hot currently with
powersaving capble CPUs, or cpufreq is broken or buggy on some, I am
tired discussing about p4-clockmod.
People waste time and file bugs on such unimportant things like
powersaving on a P4 and writing all this down and try to convince people
that p4-clockmod is not worth it is also not worth it. At least state
that this driver should not be used in distributions to not get
complains about this one any more or just remove it..., Dmitry can
compile it in for himself to save 2 degree and Pavel or whoever it was
with the broken battery... I mean does this still work, I expect the
battery is really broken now and you should be able to use this machine
on full performance again. As said p4-clockmod does only save if CPU is
utilized, but then you do not want throttling, only for critical
temperature reasons or broken batteries.

   Thomas
