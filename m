From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Mon, 10 Nov 2003 21:50:29 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031110205029.GA7149@brodo.de>
References: <20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
	<20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
	<20031110172246.GT10144@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
	<20031110172246.GT10144@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

Hi Dave and others,


On Mon, Nov 10, 2003 at 05:22:46PM +0000, Dave Jones wrote:
> On Mon, Nov 10, 2003 at 06:15:33PM +0100, Ducrot Bruno wrote:
> 
>  > > The 'latency' we read from the BIOS is in microseconds, but the hardware
>  > > wants it in units of 10ns. We do the necessary maths, and everything is fine.
>  > > But we're also storing that result in ..
>  > > 
>  > > 	policy->cpuinfo.transition_latency = latency;
>  > > 
>  > > Which is possibly not the right thing to be doing.
>  > > I think we want to be storing the 'pre 10ns munging' value here correct?
>  > > 
>  > 
>  > Well, maybe we have to double it as well (there is actually 2 steps, the
>  > VID change and the FID change, each having 'latency' 1e(-8) second)...
>  > 
>  > something like:
>  > 	policy->cpuinfo.transition_latency = latency / 50;
> 
> Actually, I'm wondering why we need this at all anyway..

To determine the "cost" of frequency and/or voltage transitions when doing
dynamic switching. If the system is unresponsive for too long a period of 
time, dynamic switching doesn't make sense [at least when some sort of
real-time or "responsiveness" is needed]. Also, the time to needed switch 
back to 100% of processing power should be added to the "overhead" idleness
on future load calculations of yet-to-be-written load-predicting cpufreq
governors.

e.g.
target_frequency = predicted_load + margin + overhead 

with "margin" being some sort of "reserve" of processing power available
instantly,
and "overhead" consisting of "book-keeping" and two times the cost of
a cpufreq transition => switching down now, and switching up when there is
the need to because of a higher demand for cpu processing power.


Also, there should be another field in cpufreq_cpuinfo: transition_interval:
the minimum time which must pass between two calls to ->range [currently
->setpolicy() or] ->target.

transition_latency is the time [in microseconds] the system is unresponsive
to interrupts after a ->target or ->range call is passed to the cpufreq
driver. To ease the computation of this value, the overhead of the cpufreq
driver and the cpufreq core may be ignored here, so that transition_latency
is the difference between the time a hardware command is issued, and the
time the hardware command returns, and necessary following delay() calls 
have passed.

transition_interval is the time [in microseconds] which must have passed
between another call to ->target or ->range is issued. It is the duty of the
cpufreq core [and of the cpufreq governors] to guarantee this.

	Dominik
