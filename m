From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [Fwd: Re: via-pmu runs device_power_down in atomic context]
Date: Thu, 25 May 2006 15:19:58 +1000
Message-ID: <1148534398.13249.246.camel@localhost.localdomain>
References: <1148531830.13249.237.camel@localhost.localdomain>
	<20060524215917.230af218.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@osdl.org>
Cc: linuxppc-dev@ozlabs.org, Johannes Berg <johannes@sipsolutions.net>, Alan Stern <stern@rowland.harvard.edu>, cpufreq@lists.linux.org.uk


> Here, pmac has gone and unilaterally decided that device_power_down() is
> atomic, even though device_power_down() _already_ calls suspend_device(),
> which does down().  So I'd say you've gone and found a via-pmu bug here.

No. Look at the implementation (and the comment) in device_power_down().
It's designed to be called with irqs off...  Of course, somebody changed
the locking in there and it's indeed ending up calling suspend_device()
for devices on the irq_off list which calls down ... bad bad... that's
another bug in the drivers/power/* to add to an already long list.
Fortunately, very few (if any) devics rely on this irq_off list. But
sysdev's do. 

> A way of shutting up the warning would be to use an atomic notifier, but
> it'll still be buggy.  Better would be to teach pmac_suspend_devices() not
> to assume things which aren't true ;)

No. If we call device_power_down with interrupts enabled, very bad
things will happen. This powermac code is very carefully crafted to do
things in a strict order and it's along those lines that the callbacks
in the device model were initially defined. Now, people who don't
understand shit about how to make power management reliable may have
broken things around, but the powermac implementation is right there.

Ben.
