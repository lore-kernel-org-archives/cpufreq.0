From: David C Niemi <dniemi@verisign.com>
Subject: Improving High-Load Performance with the Ondemand Governor
Date: Thu, 09 Sep 2010 10:28:20 -0400
Message-ID: <4C88EF04.1030908@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@vger.kernel.org

I have tested patches for both 2.6.18 and 2.6.32, but before sharing 
them I'd like to first describe the problem I'm trying to solve and the 
strategy I've been trying and get some feedback on it.

I have an application for RHEL 5-based network servers where the 
Performance "governor" was being used due to measurably worse 
performance with the stock Ondemand governor.  The hardware includes 
Woodcrest, Opteron, and Nehalem dual-socket machines with CPUs towards 
the high-performance end.  My changes have been in production use for 
over a year on RHEL 5.x, and I'm now looking at applying them to RHEL 6 
and would like to get them into the mainstream kernel.  I believe my 
changes can be generally beneficial to neutral across all applications 
if done right.

The workload has periods of really high CPU utilization with lulls in 
between, and the servers need to respond quickly to the onset of load to 
avoid dropping packets.  This resulted in 3 goals for my work with the 
governor:

1) Negligible overhead when at high CPU utilization
2) Save power when truly idle
3) Ramp up quickly to the high-performance state when load appears

One of the first things I discovered is that the Ondemand governor has 
symmetric logic for deciding to increase or decrease clock speed.  This 
might be good for a battery-powered device, but under heavy load, the 
overhead of checking load on all cores on a frequent basis impairs 
performance very noticeably.  I also noticed that even under heavy 
loads, the CPU speed would not remain at maximum all the time.  The 
governor was seeking any chance to downshift for the slightest perceive 
dip in load, which in this case resulted in dropped packets; this is 
simply not good behavior for my application.

Sampling less frequently helps somewhat, but not enough, and conflicts 
with goal #3.

Lowering up_threshold helps somewhat too, but not enough, as it can only 
be lowered to 11 and it does not solve the conflict between goals #1 and #3.

My Strategy:

1) (re)introduced the sampling_down tunable, but made it work a bit 
differently.  This turned out to be the centerpiece and most important 
of all my changes.  When set to 1 (default) it changes nothing from 
existing behavior.  If set to more than one, it is a multiplier for the 
scheduling interval when in the top CPU speed.  So if we set it to 100, 
the overhead of checking for idle CPU is reduce to 1% what it was when 
we are really busy, and we are much less prone to downshift as long as 
we continue to be busy.  But as soon as we are not at the top speed, 
scheduling goes back to normal so we can quickly respond to a load spike.

2) made it possible for up_threshold to be set much lower (5) to improve 
responsiveness to sudden load spikes.

3) Made hysteresis (DOWN_DIFFERENTIAL) scalable based on up_threshold, 
in order to make it possible to reach an up_threshold of 5.

4) Clock speed jitter is highly undesirable, and became more noticeable 
when up_threshold is small.  A specific problem I found is that the 
overhead of lowering clock speed can be mistaken for more load, causing 
the CPU to upshift again right away.  I solved this by throwing away the 
sample right after reducing speed, as it is never going to be a good 
indication of what the normal load really is.  When increasing speed, 
the extra load is harmless and nothing needs to be changed.

Additional observations:

5) I don't like the addition of a down_differential variable per CPU.  I 
consider it to be unnecessary baggage, and would prefer to always 
calculate down_differential (hysteresis) whenever needed on the fly 
based on up_threshold.  I don't think it should be a tunable because 
there is a fairly narrow range of useful values that are probably better 
to calculate automatically.

6) The MICRO_FREQUENCY changes are not very helpful to my cause.  An 
UP_THRESHOLD of 95 is awful for my goal #3, a DOWN_DIFFERENTIAL of 3 is 
very jitter-inducing, and a sample rate (really interval) of 10000 is 
way too fast.  I'd like to hear what these changes are intended to do so 
I can preserve their intent while meeting my needs too.

David C Niemi
