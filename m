From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Thu, 22 May 2008 00:01:18 -0400
Message-ID: <20080522040118.GA28737@anvil.corenet.prv>
References: <1209844030.13290.5.camel@linux-2bdv.site>
	<20080511161934.GI15445@codemonkey.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20080511161934.GI15445@codemonkey.org.uk>
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
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq <cpufreq@lists.linux.org.uk>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>

Hi Dave,

On Sun, May 11, 2008 at 12:19:34PM -0400, Dave Jones wrote:
> On Sat, May 03, 2008 at 09:47:10PM +0200, Thomas Renninger wrote:
>  > Remove p4_clockmode driver
>  >
>  > The driver is doing throttling which is supposed to be done through another
>  > ACPI interface. If both interfaces are used, the machine may get very slow.
>  > Remove this driver which should never be used.
>  >
>  > Signed-off-by: Thomas Renninger <trenn@suse.de>
> 
> I agree this is long overdue being taken out back and shot.
> 
> Some thoughts though:
> 
> * Should we deprecate this for a release first ?
>   I'm torn over this, because I think no matter how long we do this for,
>   we're going to get people who claim to be surprised.
>   Though given this driver is 99% useless, perhaps just ripping it out
>   is for the best.
> 
> * Matthew Garrett mentioned something interesting this morning..
> 
> mjg59 | davej: On machines that don't support acpi throttling, I was under the impression that there was supposed to be a hook between the thermal code and cpufreq
> mjg59 | Which would then let p4-clockmod be kicked even if it's below the threshold at which the CPU would throttle itself
> davej | having that code expose T states rather than pretend to be P states is probably for the best.
> mjg59 | Yeah, true
> 
>   So whilst killing this off is probably the right thing to do, there may be
>   some value in parts of it living on in the ACPI code ?
> 
> I'll queue up this removal patch for linux-next, and we'll see if anyone screams.
> (I doubt it, given the amount of testing that gets right now. It'll probably
> not really get noticed until after it's in a Linus sanctioned release)
> 

AAAAAAA!</scream>

I am using p4_clockmod in attempt to keep my old P4-based box a bit
cooler. It does not support anything besides C0 (no P-states, no
throttling) so acpi-based driver does not work.

-- 
Dmitry
