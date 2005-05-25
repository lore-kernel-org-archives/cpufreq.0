From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: RE: OnDemand governor vs. work queue
Date: Thu, 26 May 2005 07:48:27 +1000
Message-ID: <1117057707.5076.23.camel@gaston>
References: <88056F38E9E48644A0F562A38C64FB6004D3529A@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6004D3529A@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>


> Agreed. For the larger latency transitions, ondemand governor should 
> use its own thread rather than keventd. Probably, it may make sense to 
> have separate threads for each CPU as well in that case (as otherwise 
> this thread will end up being moved around from one CPU to other. I will
> 
> look at this in a couple of weeks unless someone beats me to it and 
> sends the patch before that :).

A per-CPU thread could be a custom work queue (easy to implement form
current code) but also a resource waste. I don't think there is that
much of a problem having that thread moved around.

Ben.
