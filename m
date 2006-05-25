From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [Fwd: Re: via-pmu runs device_power_down in atomic context]
Date: Thu, 25 May 2006 15:46:24 +1000
Message-ID: <1148535984.13249.253.camel@localhost.localdomain>
References: <1148531830.13249.237.camel@localhost.localdomain>
	<20060524215917.230af218.akpm@osdl.org>
	<1148534398.13249.246.camel@localhost.localdomain>
	<20060524223658.6fc797f5.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060524223658.6fc797f5.akpm@osdl.org>
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


> This requirement to keep interrupts off in there breaks things again and
> again and again and again.  And this time: again.

Where else ?

If you look at this function it's _designed_ for interrupts off ! the
driver suspend have the option of deferring their suspend() callback
until after irqs have been turned off (needed for legacy stuff afaik but
rarely used) and the sysdev's are very low level things whose suspend
and resume callbacks should be called after that point as well. 

Ben.
