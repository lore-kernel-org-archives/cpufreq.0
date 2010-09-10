From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Improving High-Load Performance with the Ondemand Governor
Date: Fri, 10 Sep 2010 09:40:14 +0200
Message-ID: <87r5h2t5b5.fsf@basil.nowhere.org>
References: <4C88EF04.1030908@verisign.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4C88EF04.1030908@verisign.com> (David C. Niemi's message of
	"Thu, 09 Sep 2010 10:28:20 -0400")
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David C Niemi <dniemi@verisign.com>
Cc: cpufreq@vger.kernel.org, lenb@kernel.org

David C Niemi <dniemi@verisign.com> writes:

Perhaps better post to linux-kernel next time, I think cpufreq
is mostly dead these days.

> I have tested patches for both 2.6.18 and 2.6.32, but before sharing
> them I'd like to first describe the problem I'm trying to solve and
> the strategy I've been trying and get some feedback on it.

These are all ancient in terms of mainline kernel. The latest
kernel should have some improvements, perhaps try them first.

On Nehalem class systems with recent kernels it often helps to use the
"intel_idle" driver too, because that gives the governour more 
accurate latencies to work with. Many BIOS are known to report
incorrect latencies.

> The workload has periods of really high CPU utilization with lulls in
> between, and the servers need to respond quickly to the onset of load
> to avoid dropping packets.  This resulted in 3 goals for my work with
> the governor:
>
> 1) Negligible overhead when at high CPU utilization
> 2) Save power when truly idle
> 3) Ramp up quickly to the high-performance state when load appears

FWIW when you're truly idle you typically don't need ondemand,
the idle states on modern CPUs go to the lowest frequency by themselves
or simply turn off the frequency completely.

ondemand and p-states mainly help you on moderate load.

Just going to highest state unconditionally would be somewhat 
contraproductive to that goal.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
