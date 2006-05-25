From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [Fwd: Re: via-pmu runs device_power_down in atomic context]
Date: Thu, 25 May 2006 10:12:05 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0605251005450.6990-100000@iolanthe.rowland.org>
References: <20060524215917.230af218.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060524215917.230af218.akpm@osdl.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: cpufreq@lists.linux.org.uk, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@ozlabs.org

On Wed, 24 May 2006, Andrew Morton wrote:

> > device_power_down should be called with interrupts off, thus the PMU
> > driver is fine. It's a misnamed function, it calls the sysdev's suspend
> > and those should be called with irq off. I think the problem is more due
> > to some cpufreq or notifier change that somebody done to recent kernels
> > and that added some might_sleep.... I wonder why. 
> > 
> > Andrew, what's up there ? What is this new
> > "blocking_notifier_call_chain" thing ? notifiers use to not use
> > semaphores and not be blocking... at least powermac implementation of
> > cpufreq relies on that.
> 
> notifiers used to be racy too - we just waddled across them without any
> locking.
> 
> Alan made a best-effort conversion of callers, and there have been a few
> problems.
> 
> Here, pmac has gone and unilaterally decided that device_power_down() is
> atomic, even though device_power_down() _already_ calls suspend_device(),
> which does down().  So I'd say you've gone and found a via-pmu bug here.
> 
> A way of shutting up the warning would be to use an atomic notifier, but
> it'll still be buggy.  Better would be to teach pmac_suspend_devices() not
> to assume things which aren't true ;)

Someone else had a problem with the cpufreq conversion earlier.  I posted 
a message on the cpufreq mailing list but nobody ever responded to it.  
This may or may not be related to that earlier problem.

In essence, the problem seemed to be that the cpufreq notifier chain is
sometimes expected to be blocking and sometimes expected to be atomic,
based on the "val" code passed to notifier_call_chain.  The cleanest
solution would be to split the single notifier chain into two chains,
one always blocking and the other always atomic.

Somebody who knows more about cpufreq than I do will have to make that
change.

Alan Stern
