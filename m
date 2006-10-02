From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: transition latency
Date: Mon, 2 Oct 2006 04:25:43 +0200
Message-ID: <20061002022543.GF19253@isilmar.linta.de>
References: <20060929003247.GA20765@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060929003247.GA20765@dbz.icequake.net>
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
To: Ryan Underwood <nemesis@icequake.net>
Cc: cpufreq@lists.linux.org.uk

On Thu, Sep 28, 2006 at 07:32:47PM -0500, Ryan Underwood wrote:
> 
> What's the purpose of the transition_latency field with respect to the
> cpufreq infrastructure?  Should I be setting this to:
> * the time it takes for my set_cpu_state function to execute and return
> * the latency between the call to set_cpu_state and the actual CPU speed
> change
> * the time it takes for the hardware to respond to MY request (inside
> set_cpu_state function) to change speeds
> 
> Just a little confused.  Here the problem is that my set_cpu_state
> function could take up to 35ms to execute, but the actual frequency
> transition ( a component of that function) happens within 7ms.  10ms is
> the ondemand/conservative governors' upper limit for transition latency,
> so if I take the whole function into account, those governors reject my
> driver.

My original intention was this:

<timer starts>
- "system freeze" / IRQs off / ... (if needed)
- actual setting of the new frequency
- "system unfreeze" / IRQs on
- waiting until it is safe to return, and until
  it would also be safe to set the frequency anew.
<timer ends>

Note that 3 and 4 might be ordered differently in "real life". Also I'm not
totally sure that this "latency" is really what we need for ondemand et al.
So if anyone has a better input on what "latency" should mean here, speak up
please.

Thanks,
	Dominik
