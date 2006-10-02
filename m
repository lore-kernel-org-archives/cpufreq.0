From: Len Brown <len.brown@intel.com>
Subject: Re: transition latency
Date: Mon, 2 Oct 2006 01:07:51 -0400
Message-ID: <200610020107.51825.len.brown@intel.com>
References: <20060929003247.GA20765@dbz.icequake.net>
	<20061002022543.GF19253@isilmar.linta.de>
Reply-To: Len Brown <lenb@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061002022543.GF19253@isilmar.linta.de>
Content-Disposition: inline
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
To: cpufreq@lists.linux.org.uk
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Ryan Underwood <nemesis@icequake.net>

On Sunday 01 October 2006 22:25, Dominik Brodowski wrote:
> On Thu, Sep 28, 2006 at 07:32:47PM -0500, Ryan Underwood wrote:
> > 
> > What's the purpose of the transition_latency field with respect to the
> > cpufreq infrastructure?  Should I be setting this to:
> > * the time it takes for my set_cpu_state function to execute and return
> > * the latency between the call to set_cpu_state and the actual CPU speed
> > change
> > * the time it takes for the hardware to respond to MY request (inside
> > set_cpu_state function) to change speeds
> > 
> > Just a little confused.  Here the problem is that my set_cpu_state
> > function could take up to 35ms to execute, but the actual frequency
> > transition ( a component of that function) happens within 7ms.  10ms is
> > the ondemand/conservative governors' upper limit for transition latency,
> > so if I take the whole function into account, those governors reject my
> > driver.
> 
> My original intention was this:
> 
> <timer starts>
> - "system freeze" / IRQs off / ... (if needed)
> - actual setting of the new frequency
> - "system unfreeze" / IRQs on
> - waiting until it is safe to return, and until
>   it would also be safe to set the frequency anew.
> <timer ends>
> 
> Note that 3 and 4 might be ordered differently in "real life". Also I'm not
> totally sure that this "latency" is really what we need for ondemand et al.
> So if anyone has a better input on what "latency" should mean here, speak up
> please.

Just for reference, the ACPI spec _PSS and _TSS define latency this way:
"Indicates the worst case latency in microseconds that the CPU
is unavailable during a transition from a (performance) state to this (performance) state".

ie. it is the maximum period that the processor might execute no instructions
when you make this transition.

Which appears to correspond roughly to this one:

> > * the time it takes for my set_cpu_state function to execute and return

On Intel processors, you can ask the hardware for a new state right away --
even if it is internally still ramping the voltage and speed from the previous request.

cheers,
-Len

ps. I think you mean 10us above, not 10ms
