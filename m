From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Sun, 15 Feb 2004 20:42:52 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040215194252.GM13262@poupinou.org>
References: <1076542663.4323.17.camel@laptop> <402B6516.1030408@basmevissen.nl>
	<1076610612.4491.42.camel@laptop>
	<20040213001555.GD13262@poupinou.org>
	<1076652625.4339.6.camel@laptop>
	<20040213092644.GA5230@dominikbrodowski.de>
	<1076864174.4677.76.camel@laptop>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1076864174.4677.76.camel@laptop>
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
To: Ronald van der Meer <revdmeer@conceptsfa.nl>
Cc: cpufreq mailing list <cpufreq@www.linux.org.uk>

On Sun, Feb 15, 2004 at 06:03:12PM +0100, Ronald van der Meer wrote:
> On Fri, 2004-02-13 at 10:26, Dominik Brodowski wrote:
> > On Fri, Feb 13, 2004 at 07:10:25AM +0100, Ronald van der Meer wrote:
> > > I don't think it's a special mobile version. Probably this one:
> > > http://developer.intel.com/design/chipsets/datashts/252523.htm
> > > 
> > > would this totally rule out the using speedstep which the CPU does seem
> > > to support? 
> > 
> > Unfortunately, it does seem so. The ICH-5 is a desktop version and does
> > not include the special registers necessary for speedstep control.
> 
> What registers would be required for the Intel Mobile Pentium 4 to do
> it's speedstep thing?
> 
> Reading through it's datasheet
> (http://www.intel.com/design/mobile/datashts/253028.htm)
> I couldn't find any reference to southbridges or it's registers. It
> seems to require significantly less signals from outside than older
> intel mobile procs. For example:

Normal, that's under NDA, mostly, apart the register associated to the
ICH?m southbridge.

> The processor determines it's own voltage by driving it's VID[4:0] pins
> (table 3, page 15 of datasheet) to a Voltage Regulation Module (VRM).
> So this processor doesn't need a mobile ICH and an external latch (as
> shown in the block diagram figure 5-14, on page 155 of the ICH4-M
> datasheet) to provide this functionality.

You program the VID output via the VRM module which is under NDA, and
actualy I don't know if that is correct :)

> The datasheet btw doesn't talk about speedstep, but about enhanced
> speedstep. The VID[4:0] signal driving described above seem like one of
> the enhancements to me, anybody know any others ?

No.  That's how it work back to pentium III (coppermine, speedstep
capable).

> Infact the way I read the datasheet all it takes to do speedstepping is:
> 
> Switch to max-performance mode : Set GHI# pin low, put processor into
> Deep Sleep state, return to normal state.
> Switch to battery optimized mode : Set GHI# pin high, put processor into
> Deep Sleep state, return to normal state.

You toggle the GHI# pin via an enhanced propritary ASIC for which you
will not get specification from Intel unless you sign a NDA.

> This raises 2 questions:
> 
> Is changing the processors state to "Deep Sleep" and back possible in
> linux?
> To what is the processors GHI# pin connected? 

To a propritary ASIC already mentionned that you will find no reference
from Intel litterature.

> I realise all this research may turn out to be pointless, but I would
> like to be 100% certain if speedstepping is possible or not. Just saying
> 'the ICH5 is not a special mobile version so speedstepping is not
> possible' seems too easy to me.

No.  That's the truth unfortunately.  All Speedstep capable processor
(apart perhaps the Banias on centrino platform) need at least:
A mobile VRM,
A propritary ASIC,
A northbridge which will connected somehow to that ASIC,
A southbridge, that one integrated a part of the state machine
associated to SpeedStep technology (the trigger part, mostly).

It was possible, back to PIII, to have a southbridge that do not
incorporate a part of the state machine associated to speedstep, 
but then it was necessary to reserve a GPO and a GPI for speedstep.

It is possible after all that it is still the case when the southbridge
is not a mobile version, but frankly, I doubt that is the case.
To be sure, you may try to dump the GPO associated when you boot on AC,
then on Battery, and see if that make a difference, like it's done
for the PIIX4 IO version.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
