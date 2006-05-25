From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [Fwd: Re: via-pmu runs device_power_down in atomic context]
Date: Thu, 25 May 2006 15:53:56 +1000
Message-ID: <1148536437.13249.262.camel@localhost.localdomain>
References: <1148531830.13249.237.camel@localhost.localdomain>
	<20060524215917.230af218.akpm@osdl.org>
	<1148534398.13249.246.camel@localhost.localdomain>
	<20060524223658.6fc797f5.akpm@osdl.org>
	<1148535984.13249.253.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1148535984.13249.253.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: linuxppc-dev@ozlabs.org, johannes@sipsolutions.net, stern@rowland.harvard.edu, cpufreq@lists.linux.org.uk

On Thu, 2006-05-25 at 15:46 +1000, Benjamin Herrenschmidt wrote:
> > This requirement to keep interrupts off in there breaks things again and
> > again and again and again.  And this time: again.
> 
> Where else ?
> 
> If you look at this function it's _designed_ for interrupts off ! the
> driver suspend have the option of deferring their suspend() callback
> until after irqs have been turned off (needed for legacy stuff afaik but
> rarely used) and the sysdev's are very low level things whose suspend
> and resume callbacks should be called after that point as well. 

BTW. The root of the problem with cpufreq is it's upside down design :)
Well, not all of it, but the fact that it registers a sysdev. It's not
the "midlayer" (ugh) business to register devices and hook things like
PM events to pass them down to actual drivers. It should be the cpufreq
drivers themselves that attach to the device model in a way or another
and "instanciate" the ability to control the cpu frequency, passing
along their struct device.

The driver itself should pick the right type of "device" to attach to
(sysdev's are just weird beast and were a bad idea in the first place
since they aren't even struct device).

But then, iirc, that's because we also did the cpu stuff in sysfs upside
down too ... :)

Now, wether the cpufreq notifier might end up calling things that will
sleep or not ... hrm... that's an interesting issue. Part of the problem
is that because cpufreq is a sysdev, it will be called so late in the
suspend process, pretty much everything else is asleep. So I'm quite
confident that things attaching to the cpufreq notifiers other than bits
of cpufreq itself are likely to break anyway. Is it documented anywhere
that registering a cpufreq notifier might cause it to be called in
atomic context or very later in the suspend process (possibly after the
interrupt controller hs been put down) ?

Yes it's messy, no I don't have a miracle solution, but I think here the
proper way to fix it in the long run is for cpufreq not to be a sysdev
or anything like that and to stop trying to do the suspend/resume thing
for the drivers. Drivers are in charge, they get to create the device of
whatever type it is and get the suspend/resume events whenever they are
sent. cpufreq can then provide maybe "helpers" to help work out what to
do at suspend and/or resume time but with the knowledge that for some
drivers maybe, this will happen in atomic context.

Ben.
