From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: Re: OnDemand governor vs. work queue
Date: Wed, 25 May 2005 15:04:34 -0700
Message-ID: <20050525150433.A9210@unix-os.sc.intel.com>
References: <88056F38E9E48644A0F562A38C64FB6004D3529A@scsmsx403.amr.corp.intel.com>
	<1117057707.5076.23.camel@gaston>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1117057707.5076.23.camel@gaston>;
	from benh@kernel.crashing.org on Thu, May 26, 2005 at 07:48:27AM
	+1000
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>

On Thu, May 26, 2005 at 07:48:27AM +1000, Benjamin Herrenschmidt wrote:
> 
> > Agreed. For the larger latency transitions, ondemand governor should 
> > use its own thread rather than keventd. Probably, it may make sense to 
> > have separate threads for each CPU as well in that case (as otherwise 
> > this thread will end up being moved around from one CPU to other. I will
> > 
> > look at this in a couple of weeks unless someone beats me to it and 
> > sends the patch before that :).
> 
> A per-CPU thread could be a custom work queue (easy to implement form
> current code) but also a resource waste. I don't think there is that
> much of a problem having that thread moved around.
> 

This is how things work today.
- ondemand (keventd) wakes up on some CPU A.
- Then we loop through all the CPU Is
	- Figure out whether we need to increase the frequency
		- If yes, the underlying governor may (on i386, x86-64 it will)
		  move the thread to CPU I
		- Change the frequency
		- Move the thread back to CPU A.


And each of this affinity calls will wakeup migration thread to do the proper 
affinity and also IPIs for resched. At this moment I am not sure how much 
overhead we have due to this affinity. I need to look closely whether this 
is overhead is significant (Especially on systems with 4 or more CPUs).

-Thanks,
Venki
