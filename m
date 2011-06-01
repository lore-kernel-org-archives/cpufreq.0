From: David C Niemi <dniemi@verisign.com>
Subject: Re: switching to top frequency too frequent with ondemand governor
 and no_hz
Date: Wed, 01 Jun 2011 13:34:54 -0400
Message-ID: <4DE6783E.70508@verisign.com>
References: <20110601160805.GA1775@x4.trippels.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110601160805.GA1775@x4.trippels.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: cpufreq@vger.kernel.org


A very interesting bit of information.  What do you have set for up_threshold?  You may have to set it higher for CONFIG_NO_HZ than without, based on your symptoms.  Another thing to look at is your sampling_rate.  I'm guessing it differs between CONFIG_NO_HZ being set or not.

And perhaps you need to set sampling_down_factor a bit lower.  I consider 100 a reasonable default, but a default of "1" was put in initially to make the behavior of the patch that enabled the factor identical with not having the patch.  If you are more concerned with saving power than maximizing throughput, you might consider a much lower value like 5 or 10.

DCN


On 06/01/2011 12:08 PM, Markus Trippelsdorf wrote:
> There seems to be a major difference in the behavior of the ondemand
> governor depending on whether CONFIG_NO_HZ is set or not in the kernel
> .config.
>
> In the NO_HZ case the ondemand governor spends too much time at the
> highest frequency and is also very trigger happy.
>
> I have compared the two cases on my system:
> powernow-k8: Found 1 AMD Phenom(tm) II X4 955 Processor (4 cpu cores) (version 2.20.00)
> powernow-k8:    0 : pstate 0 (3200 MHz)
> powernow-k8:    1 : pstate 1 (2500 MHz)
> powernow-k8:    2 : pstate 2 (2100 MHz)
> powernow-k8:    3 : pstate 3 (800 MHz)
>
> When I run:
> watch -n.1 'cat /proc/cpuinfo|grep MHz'
> on an otherwise idle system, I can see that the frequency always stays
> at 800 MHz in the "CONFIG_NO_HZ not set" case. But it will very
> frequently switch to 3200 MHz in the CONFIG_NO_HZ=y case under the same
> conditions.
>
> This also manifests itself in the cpufreq/stats/time_in_state
> statistics (again on a mostly idle system):
>
> First taken with:
> echo 200 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
> (BTW wouldn't it make sense to use something like this as the default
> value?)
>
> cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state
>
> CONFIG_NO_HZ not set: 
> 3200000 5845
> 2500000 0
> 2100000 5
> 800000 31552
>
> CONFIG_NO_HZ=y:
> 3200000 17650
> 2500000 0
> 2100000 0
> 800000 31129
>
>
> And with the default sampling_down_factor=1
>
> CONFIG_NO_HZ not set: 
> 3200000 140
> 2500000 2
> 2100000 29
> 800000 16614
>
> CONFIG_NO_HZ=y:
> 3200000 538
> 2500000 9
> 2100000 77
> 800000 16287
>
> Now my question is, is this expected? And what could be done to make the
> NO_HZ behavior more like the "CONFIG_NO_HZ not set" behavior.

