From: Ryan Underwood <nemesis@icequake.net>
Subject: Re: transition latency
Date: Mon, 2 Oct 2006 11:06:23 -0500
Message-ID: <20061002160623.GA18695@dbz.icequake.net>
References: <20060929003247.GA20765@dbz.icequake.net>
	<20061002022543.GF19253@isilmar.linta.de>
	<200610020107.51825.len.brown@intel.com>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200610020107.51825.len.brown@intel.com>
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
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>, Ryan Underwood <nemesis@icequake.net>


On Mon, Oct 02, 2006 at 01:07:51AM -0400, Len Brown wrote:
> 
> Just for reference, the ACPI spec _PSS and _TSS define latency this way:
> "Indicates the worst case latency in microseconds that the CPU
> is unavailable during a transition from a (performance) state to this (performance) state".
> 
> ie. it is the maximum period that the processor might execute no instructions
> when you make this transition.
> 
> Which appears to correspond roughly to this one:
> 
> > > * the time it takes for my set_cpu_state function to execute and return

Is it possible for that function to be preempted?  If it is, the only
time the CPU is truly unavailable is while it is in SMM.

> On Intel processors, you can ask the hardware for a new state right away --
> even if it is internally still ramping the voltage and speed from the previous request.

Right, same here.  Except in my case it's not ramping anything, it is
either changing FSB, multiplier, or enabling chipset throttling.

> cheers,
> -Len
> 
> ps. I think you mean 10us above, not 10ms

No, it's ms.  A single SMM round trip on one Toshiba laptop I have takes
~7ms (about 800K cycles on a 120MHz processor).  When I take into
account the SMM calls to set the cache, fan and friends, set_cpu_state
takes around 35ms.  If I set transition_latency to 7ms, ondemand and
conservative still work, but if I set it to 35ms (the true latency of
the set_cpu_state function), those governors are rejected because of
their TRANSITION_LATENCY_LIMIT.

So I'm still confused whether I should set transition_latency to the
latency of the individual SMM call (since the CPU will be available in
between calls), or the total execution time of set_cpu_state, or
something else.  It doesn't seem to hurt anything to set it to 7ms, but
there must be a reason for ondemand and conservative to have a limit on
it...

-- 
Ryan Underwood, <nemesis@icequake.net>
