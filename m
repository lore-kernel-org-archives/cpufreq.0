From: Kronos <kronos@kronoz.cjb.net>
Subject: Re: [2.6.9-rc2] ondemand governor not working
Date: Wed, 15 Sep 2004 23:11:09 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040915211109.GA1123@dreamland.darkstar.lan>
References: <88056F38E9E48644A0F562A38C64FB6002E1C5AA@scsmsx403.amr.corp.intel.com>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002E1C5AA@scsmsx403.amr.corp.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

Il Wed, Sep 15, 2004 at 01:34:44PM -0700, Pallipadi, Venkatesh ha scritto: 
> >It fixes the sampling rate, but the governor isn't working as
> >expected.  powernow_target gets called but even when the cpu usage is
> >at 100% the target frequency is 441877 (which is 535608 - 93731,
> >cur_policy->cur - freq_down_step). The governor tries to lower the
> >frequency even when the CPU is loaded.
> >
> 
> Hmm.. Looks like we are hitting some other corner case with sampling
> freq set to 1 mS, which is kind of too low. Can you try increasing it
> to 10mS or 100mS and see whether the driver works as expected.  You
> can do that either in /sys interface under sys/../cpufreq/ondemand or
> change the latency in the previous patch (something like this).
> >> +			if (latency < 1000)
> >> +				latency = 100000;

It works with a latency of 5000usec. It stops working if I go below
that value.

Back to the original problem, powernow-k7 is setting transition_latency
to 1ns, is it sensible?

Luca
-- 
Home: http://kronoz.cjb.net
Se non sei parte della soluzione, allora sei parte del problema.
