From: Ronald van der Meer <revdmeer@conceptsfa.nl>
Subject: Re: Mobile Intel Pentium 4 + ICH5
Date: Sun, 15 Feb 2004 18:03:12 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1076864174.4677.76.camel@laptop>
References: <1076542663.4323.17.camel@laptop>
	<402B6516.1030408@basmevissen.nl> <1076610612.4491.42.camel@laptop>
	<20040213001555.GD13262@poupinou.org> <1076652625.4339.6.camel@laptop>
	<20040213092644.GA5230@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040213092644.GA5230@dominikbrodowski.de>
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
To: cpufreq mailing list <cpufreq@www.linux.org.uk>

On Fri, 2004-02-13 at 10:26, Dominik Brodowski wrote:
> On Fri, Feb 13, 2004 at 07:10:25AM +0100, Ronald van der Meer wrote:
> > I don't think it's a special mobile version. Probably this one:
> > http://developer.intel.com/design/chipsets/datashts/252523.htm
> > 
> > would this totally rule out the using speedstep which the CPU does seem
> > to support? 
> 
> Unfortunately, it does seem so. The ICH-5 is a desktop version and does
> not include the special registers necessary for speedstep control.

What registers would be required for the Intel Mobile Pentium 4 to do
it's speedstep thing?

Reading through it's datasheet
(http://www.intel.com/design/mobile/datashts/253028.htm)
I couldn't find any reference to southbridges or it's registers. It
seems to require significantly less signals from outside than older
intel mobile procs. For example:

The processor determines it's own voltage by driving it's VID[4:0] pins
(table 3, page 15 of datasheet) to a Voltage Regulation Module (VRM).
So this processor doesn't need a mobile ICH and an external latch (as
shown in the block diagram figure 5-14, on page 155 of the ICH4-M
datasheet) to provide this functionality.

The datasheet btw doesn't talk about speedstep, but about enhanced
speedstep. The VID[4:0] signal driving described above seem like one of
the enhancements to me, anybody know any others ?

Infact the way I read the datasheet all it takes to do speedstepping is:

Switch to max-performance mode : Set GHI# pin low, put processor into
Deep Sleep state, return to normal state.
Switch to battery optimized mode : Set GHI# pin high, put processor into
Deep Sleep state, return to normal state.

This raises 2 questions:

Is changing the processors state to "Deep Sleep" and back possible in
linux?
To what is the processors GHI# pin connected? 

I realise all this research may turn out to be pointless, but I would
like to be 100% certain if speedstepping is possible or not. Just saying
'the ICH5 is not a special mobile version so speedstepping is not
possible' seems too easy to me.

> Does the acpi cpufreq-driver (latest(!) 2.6.) work?

I'm afraid it will not because 'cat
/proc/acpi/processor/CPU/performance' always showed '<not supported>' on
the kernels I tried. But next time I try a recent 2.6 kernel I'll try. 

Ronald
