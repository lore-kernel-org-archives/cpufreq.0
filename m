From: john stultz <johnstul@us.ibm.com>
Subject: Re: give the TSC a fair chance [Was: [PATCHES] cpufreq_get(),
	cpufreq->get()]
Date: Wed, 14 Apr 2004 14:24:36 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1081977876.4705.123.camel@cog.beaverton.ibm.com>
References: <20040411215912.GA8160@dominikbrodowski.de>
	<20040412120422.GA7337@dominikbrodowski.de>
	<1081967060.4705.91.camel@cog.beaverton.ibm.com>
	<20040414185434.GB19921@dominikbrodowski.de>
	<1081973006.4705.116.camel@cog.beaverton.ibm.com>
	<20040414205732.GA7230@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040414205732.GA7230@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

On Wed, 2004-04-14 at 13:57, Dominik Brodowski wrote:
> On Wed, Apr 14, 2004 at 01:03:27PM -0700, john stultz wrote:
> > As for the bug you
> > mentioned, I'm not sure I understand how after you've scheduled 
> > cpufreq_delayed_get_work() to run it wouldn't run? 
> 
> It would run, but too late. See below.
> 
> > So 50 consecutive interrupts occur where we notice we missed ticks, at
> > this point we schedule the function. If the next tick we don't notice
> > lost interrupts, why would the function not execute?
> 
> The following must happen:
> 50 consecutive interrupts with missed ticks occur
> -> handle_cpufreq_get_delayed_work() is scheduled
> 0 to 50 more consecutive interrupts with missed ticks must occur,
> then one or more interrupts with zero or one missed ticks so that lost_count
> is reset to zero, and then
> 50 consecutive interrupts with missed ticks again.
> _AND_ since the scheduling of handle_cpufreq_get_delayed_work() above
> this handler running at -10 priority must not have been called ==> so 
> it's really a very unlikely situation.

Hmm. That's still not parsing easily, but I think I get it. Might we
want to turn off the consecutive lost tick accounting after we schedule
the delayed_work() function, and once that code has executed start
again? 

And how likely is it that we end up hitting 100 consecutive lost ticks
and disable the timesource before the delayed_work function gets to run?
Should that watermark get bumped up some?

thanks
-john
