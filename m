From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: ondemand governor
Date: Sat, 25 Sep 2004 23:59:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040925215925.GB7424@message-id.gmane0305.slipkontur.de>
References: <88056F38E9E48644A0F562A38C64FB6002F2B0F4@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002F2B0F4@scsmsx403.amr.corp.intel.com>
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

On Sat, Sep 25, 2004 at 11:42:32AM -0700, Pallipadi, Venkatesh wrote:

> >> Unfortunately, only indirectly. Modprobe cpufreq_ondemand and then 
> >> cat /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
> >> The latency can be deduced then.
> >
> >10000
> > 
> 
> That means the CPU usage is being checked every 10mS and 100mS for
> Possible increase and decrease in freq, respectively.
> 
> Try tuning the following. 
> down_threshold=40
> up_threshold=60
> sampling_rate=100000
> sampling_down_factor=1
> 
> This will make CPU usage checks every 100mS and increase the freq if
> utilization is more than 60% and decrease the freq if utilization is 
> less than 40%.

That's much better (i didn't change up_treshold, 80 is already too
low IMO :-) but it still goes up with almost no cpu usage often when
disk is accessed.
"find /" will push it to 1700 solid.
-- 
Stefan Seyfried
