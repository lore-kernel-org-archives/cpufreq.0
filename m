From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Pentium-M minimum clock-freq
Date: Mon, 5 Apr 2004 12:27:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040405102747.GW19001@poupinou.org>
References: <200404021824.10912.steffen-hein@gmx.de>
	<20040402164459.GB7034@dominikbrodowski.de>
	<20040404075803.2fdc50ad.neurowork@free.fr>
	<20040404105652.GA7723@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040404105652.GA7723@dominikbrodowski.de>
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
To: Cyril Wattebled <neurowork@free.fr>, cpufreq@www.linux.org.uk

On Sun, Apr 04, 2004 at 12:56:52PM +0200, Dominik Brodowski wrote:
> On Sun, Apr 04, 2004 at 07:58:03AM +0200, Cyril Wattebled wrote:
> > > > Will they be supported in future?
> > > 
> > > Maybe -- if multiple cpufreq drivers can be loaded and be running at the
> > > same time, it'd be possible. I'm not yet sure whether this is a good idea,
> > > though.
> > 
> > To my opinion, even if C2 state saves even more power that cpu throttling,
> > there's still a very big advantage in lowering the cpu speed for laptop users,
> > especially with high speed CPUs: Heat. I have a Pentium-M 1.7 ghz and even if I
> > use Linux as my main OS, I had to work on Windows from time to time (happily
> > that doesn't happen too often =]) and I have noticed that the laptop really hot
> > under linux compared with Windows. During normal use, the meters indicate 48
> > degrees Celcius on Linux and only 32 under Windows. So heat is also a thing
> > that might be interresting to be considered because it can be very
> > unconfortable to use a very hot laptop that burns your knees if you put your
> > laptop on them, that makes your hands sweat while typing and so on.
> 
> Heat indeed is an aspect. However, there are several issues you need to
> be aware of:
> a) Linux has a higher processor load than Windows [especially when running
>    X, this seems to be true to me... does anyone have any specifics on
>    this?] -- and only as the processor load is higher, the temperature rises
>    because the CPU spends less time in the idle loop. If you'd "force" it to
>    spend more time in the idle loop -- and that's what throttling
>    effectively does on the hardware (not software!) side, you'd find your
>    system unresponsive, "busy", etc.

You may try to use 16 depth instead of 24 or 32.  The rational is that
you will use less the bus in order to refresh screens, plus you will
use less the graphic chips in general, which is nowdays real power hungry.
Finally, I've seen some power management stuff in dri cvs for radeon
(mobile), I don't know if that work well, though.
For others video chips, I can't say unfortunately, even though nvidia chips
mobiles can be put in low power, there is no public documents about this, other
than they have those features.

> b) In cause you have USB devices plugged into your notebook, you'll notice
>    that the CPU will never go into the C3 sleep state [check for "bus
>    mastering activity" in /proc/acpi/processor/*/power ]. This is a bug, but
>    I think ACPI developers are aware of this.
> c) Linux does not yet take advantage of C4 or higher idle states. Patches
>    which implement this are in testing stage, though.
> d) If heat is an issue for you, you should adapt the limits to be found
>    in /proc/acpi/thermal_zone/*/limits. It'll influence, based on
>    configuration, cpufreq scaling, throttling, and fans. Note that a 
>    generic interface so that lm_sensors have this functionality, too, might
>    be created during 2.7.

e) Try to use laptop-mode.  It's in -mm series IIRC.

> > I'm not qualified enough to talk about the technical aspect of the current
> > implementation but would it be technicly possible to use C2 state as the main
> > speed driver and use throttle on demand, for instance while unplugged to allow
> > the laptop to be even cooler ?
> 
> C2 can't be a "speed driver" -- C2 is a form of "sleep" the CPU is put into
> while the system is idle. It's already utilized almost always if it's
> available on your system (technically, C1 is denoted "default state" in the
> ACPI processor driver; however, it is hardly used in 0.01% of all cases on
> my notebook...)
> 
> For thermal management (and /proc/acpi/thermal_zone/*/limits is the place
> for that _policy_, not cpufreq), CPU frequency scaling is used primarily;
> and only if that does not suffice, throttling is activated by the ACPI
> processor driver.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
