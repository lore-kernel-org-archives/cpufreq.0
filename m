From: john stultz <johnstul@us.ibm.com>
Subject: Re: give the TSC a fair chance [Was: [PATCHES] cpufreq_get(),
	cpufreq->get()]
Date: Wed, 14 Apr 2004 13:03:27 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1081973006.4705.116.camel@cog.beaverton.ibm.com>
References: <20040411215912.GA8160@dominikbrodowski.de>
	<20040412120422.GA7337@dominikbrodowski.de>
	<1081967060.4705.91.camel@cog.beaverton.ibm.com>
	<20040414185434.GB19921@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040414185434.GB19921@dominikbrodowski.de>
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

On Wed, 2004-04-14 at 11:54, Dominik Brodowski wrote:
> On Wed, Apr 14, 2004 at 11:24:21AM -0700, john stultz wrote:
> > On Mon, 2004-04-12 at 05:04, Dominik Brodowski wrote:
> > > However, this patch has one slight chance for a bug: if lost_count reaches
> > > 50, a call to handle_cpufreq_delayed_work is scheduled, but does not execute
> > > until lost_count reaches 50 again [e.g. when no lost ticks are
> > > detected at the next call, but on the next 50 consecutive calls...]. As
> > > keventd runs at -10 priority I doubt this will happen under normal
> > > circumstances, though.
> > 
> > I'm not sure I follow this (lost_count == 50) bit. You're trying to
> > schedule work only when we've noticed we're missing exactly 50 ticks?
> 
> No, not when we're missing exactly 50 ticks, but when we've detected 50
> consecutive times we're missing ticks. That's half of the amount needed
> before TSC is disabled and should mean enough time for cpufreq even under
> heavy load to execute a cpufreq_get() call. 

Ok! Got it. Yea, in that case the patch looks fine. As for the bug you
mentioned, I'm not sure I understand how after you've scheduled 
cpufreq_delayed_get_work() to run it wouldn't run? 

So 50 consecutive interrupts occur where we notice we missed ticks, at
this point we schedule the function. If the next tick we don't notice
lost interrupts, why would the function not execute?

> > I'm not sure I understand the significance of that value.
> 
> It's not really significant, it should be less than what triggers
> clock_fallback();
> though. Note that it needs to be _one_ value instead of (lost_count > 50)
> so that it doesn't get scheduled more than once. As lost_count is only
> inc'ed, this shouldn't be a problem.

Ah! Indeed! Sorry, my context was a bit off. 

thanks
-john
