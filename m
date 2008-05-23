From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] Remove p4_clockmode driver
Date: Fri, 23 May 2008 11:54:43 -0400
Message-ID: <20080523113206.ZZRA012@mailhub.coreip.homeip.net>
References: <1209844030.13290.5.camel@linux-2bdv.site>
	<20080511161934.GI15445@codemonkey.org.uk>
	<20080522040118.GA28737@anvil.corenet.prv>
	<1211541678.29901.78.camel@queen.suse.de>
	<20080523084737.ZZRA012@mailhub.coreip.homeip.net>
	<1211555977.29901.110.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1211555977.29901.110.camel@queen.suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, mzahor@dtech.sk, Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq <cpufreq@lists.linux.org.uk>

On Fri, May 23, 2008 at 05:19:37PM +0200, Thomas Renninger wrote:
> On Fri, 2008-05-23 at 08:55 -0400, Dmitry Torokhov wrote:
> > Hi Thomas,
> > 
> > On Fri, May 23, 2008 at 01:21:18PM +0200, Thomas Renninger wrote:
> > > On Thu, 2008-05-22 at 00:01 -0400, Dmitry Torokhov wrote:
> > > > Hi Dave,
> > > > 
> > > > On Sun, May 11, 2008 at 12:19:34PM -0400, Dave Jones wrote:
> > > > > On Sat, May 03, 2008 at 09:47:10PM +0200, Thomas Renninger wrote:
> > > > >  > Remove p4_clockmode driver
> > > > >  >
> > > > >  > The driver is doing throttling which is supposed to be done through another
> > > > >  > ACPI interface. If both interfaces are used, the machine may get very slow.
> > > > >  > Remove this driver which should never be used.
> > > > >  >
> > > > >  > Signed-off-by: Thomas Renninger <trenn@suse.de>
> > > > > 
> > > > > I agree this is long overdue being taken out back and shot.
> > > > > 
> > > > > Some thoughts though:
> > > > > 
> > > > > * Should we deprecate this for a release first ?
> > > > >   I'm torn over this, because I think no matter how long we do this for,
> > > > >   we're going to get people who claim to be surprised.
> > > > >   Though given this driver is 99% useless, perhaps just ripping it out
> > > > >   is for the best.
> > > > > 
> > > > > * Matthew Garrett mentioned something interesting this morning..
> > > > > 
> > > > > mjg59 | davej: On machines that don't support acpi throttling, I was under the impression that there was supposed to be a hook between the thermal code and cpufreq
> > > > > mjg59 | Which would then let p4-clockmod be kicked even if it's below the threshold at which the CPU would throttle itself
> > > > > davej | having that code expose T states rather than pretend to be P states is probably for the best.
> > > > > mjg59 | Yeah, true
> > > > > 
> > > > >   So whilst killing this off is probably the right thing to do, there may be
> > > > >   some value in parts of it living on in the ACPI code ?
> > > > > 
> > > > > I'll queue up this removal patch for linux-next, and we'll see if anyone screams.
> > > > > (I doubt it, given the amount of testing that gets right now. It'll probably
> > > > > not really get noticed until after it's in a Linus sanctioned release)
> > > > > 
> > > > 
> > > > AAAAAAA!</scream>
> > > > 
> > > > I am using p4_clockmod in attempt to keep my old P4-based box a bit
> > > > cooler. It does not support anything besides C0 (no P-states, no
> > > > throttling) so acpi-based driver does not work.
> > > 
> > > P4 CPUs do waste power, it is not designed for power savings.
> > > How much do you save with p4-clockmod?
> > > 
> > 
> > Zilch. As I said I am not really try to save power but I am trying to
> > keep my room a bit cooler when I leave the box idle.
> Having people believe they get a cooler room without saving power is a
> nice feature. Removing it is not a regression. This is exactly what the
> p4_clockmod driver suggests and what people were complaining "Windows is
> running with 300 MHz on my P4", it's nice marketing, but not reality.
> Intel told me they did some tests with SMP machines where throttling
> actually increases the power consumption.

How about this:

The hardware does throttling in case of critical overheat therefore
throttling descreases the temperature. Thus one can use p4_clockmod
that does the throttling to make the box a bit cooler.

I don't care about overall power consumption. I thought I was clear in
the first letter and even more clear in the second.

> 
> > > But maybe a reimplementation as Matthew suggested it may really be worth
> > > it. If it is, someone probably will do it.
> > > 
> > > The cpufreq interface is the wrong place for this driver.
> > > If you have a machine that exposes throttling as expected and you make
> > > use of it (and there are userspace tools doing this), you are busted.
> > >
> > 
> > And I don't care since:
> > 
> > 	a) my box does not expose it and
> > 	b) I might or might not be using such tools, depending on my
> > 	   circumstances
> > 
> >  
> > > Instead of screaming, better provide suggestions for a proper
> > > integration for machines which are capable of throttling, but have a
> > > broken BIOS which does not export it (maybe they are just doing this
> > > because it's not worth it?).
> > > 
> > > AFAIK there are AMD drivers with static cpufreq tables which were never
> > > accepted. People with a BIOS who's CPU is not detected and cpufreq info
> > > is not exposed have bad luck and must either poke the vendor or
> > > self-compile the out-of-tree static table solution.
> > > I would 10 times more support this to be integrated because:
> > >   - It fits the design and does not slow down other machines as a side
> > >     effect
> > >   - It really saves some power
> > > I still think it's ok that it did not go mainline, for maintenance and
> > > "it's the wrong way" reasons.
> > > 
> > 
> > The difference here is that p4_clockmod is _in_ mainline so by simply
> > removing it you introduce regression.
> Please prove, I do not see a regression.

Yes it is. The thing is gone. I can't use it anymore.

> How much Watts does the machine
> save power when it is idle using p4-clockmod?

Don't care. Don't care. Do I need to repeat it? I don't care. All I
know is that it87 reports lower temperature when CPU is throttled.

> 
> > You can't just remove driver
> > without providing a similarly working replacement. If you are concerned
> > about unwanted iteractions with ACPI code you could either add a hook
> > disabling p4_clockmod when acpi throtting gets loaded, or put a big
> > bfat warning about p4_clockmod in dmesg and make it depend on
> > CONFIG_EXPERIMENTAL or CONFIG_EMBEDDED.
> > 
> > > Please, if you have verified that it really saves power (I'd really like
> > > to see some figures here, I never saw any for p4-clockmod) and it's
> > > worth having it, help to get this implemented properly, but do not delay
> > > a process which is overdue for a long time already.
> > >
> > The process woudld be to implement the new way properly and then retire
> > the old driver. You are putting a carriage before the horse here.
> This will never happen. Nobody cares about throttling because it doesn't
> save you anything. So we have broken machines (through double
> throttling) and a driver which is of no (at least not much) use.
> 
> This reminds me about the broken drivers/acpi/video.c state:
> http://bugzilla.kernel.org/show_bug.cgi?id=9614
> ThinkPads do use the wrong ACPI device (Nvidia instead Intel ACPI
> graphics device) and therefore works by luck.
> The correct fix, making a lot other models work is ignored because for
> the Intel ACPI graphics device there is no ACPI (IGD) Linux driver.
> There even is a workaround to get the ThinkPad working by using
> thinkpad_acpi driver for brightness switching...
> Now everything is broken and will stay like that, because the change
> will introduce a regression for ThinkPads (cannot switch brightness via
> video.c for Intel ACPI graphics device, poking with the wrong HW device
> works somehow...).
> What I mean..., the regression argument is a powerful one, misusing it
> for unimportant, wrong designed or broken implementations (at least the
> first two are valid here) can make things worse.
> 

You can call my hardware broken and the driver broken but the fact is
regression for me. And as long as you remove something that works well
for some people for the sake of non-existing yet clean implementaion
(which btw you aren't going to implement it appears) it is a
regression, plain and simple.

-- 
Dmitry
