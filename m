From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH RFC 0/4] Scheduler idle notifiers and users
Date: Sat, 11 Feb 2012 15:45:30 +0100
Message-ID: <20120211144530.GA497@elte.hu>
References: <20120208013959.GA24535@panacea>
 <1328670355.2482.68.camel@laptop>
 <20120208202314.GA28290@redhat.com>
 <1328736834.2903.33.camel@pasglop>
 <20120209075106.GB18387@elte.hu>
 <4F35DD3E.4020406@codeaurora.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4F35DD3E.4020406@codeaurora.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saravana Kannan <skannan@codeaurora.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Todd Poynor <toddpoynor@google.com>, Russell King <linux@arm.linux.org.uk>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Nicolas Pitre <nico@fluxnic.net>, Oleg Nesterov <oleg@redhat.com>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Anton Vorontsov <anton.vorontsov@linaro.org>, linaro-kernel@lists.linaro.org, Mike Chan <mike@android.com>, Dave Jones <davej@redhat.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, Arjan Van De Ven <arjan@infradead.org>


* Saravana Kannan <skannan@codeaurora.org> wrote:

> When you say accommodate all hardware, does it mean we will 
> keep around CPUfreq and allow attempts at improving it? Or we 
> will completely move to scheduler based CPU freq scaling, but 
> won't try to force atomicity? Say, may be queue up a 
> notification to a CPU driver to scale up the frequency as soon 
> as it can?

I don't think we should (or even could) force atomicity - we 
adapt to whatever the hardware can do.

But the design should be directed at systems where frequency 
changes can be done in a reasonably fast manner. That is what he 
future is - any change we initiate today takes years to reach 
actual products/systems.

> IMHO, I think the problem with CPUfreq and its dynamic 
> governors today is that they do a timer based sampling of the 
> CPU load instead of getting some hints from the scheduler when 
> the scheduler knows that the load average is quite high.

Yes - that is one of the "frequency changes are slow" 
assumptions - which is wrong.

Thanks,

	Ingo
