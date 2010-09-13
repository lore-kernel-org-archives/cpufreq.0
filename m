From: David C Niemi <dniemi@verisign.com>
Subject: Re: Improving High-Load Performance with the Ondemand Governor
Date: Mon, 13 Sep 2010 16:18:51 -0400
Message-ID: <4C8E872B.2020503@verisign.com>
References: <4C88EF04.1030908@verisign.com> <87r5h2t5b5.fsf@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <87r5h2t5b5.fsf@basil.nowhere.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <andi@firstfloor.org>
Cc: cpufreq@vger.kernel.org, lenb@kernel.org

Andi Kleen wrote:
>
> David C Niemi <dniemi@verisign.com> writes:
>
> Perhaps better post to linux-kernel next time, I think cpufreq
> is mostly dead these days.
>
Hello Andi, thanks for your quick response.

There were some lively discussions on it in the fairly recent past.  
I'll post on linux-kernel if I don't get enough feedback.
>
> > I have tested patches for both 2.6.18 and 2.6.32, but before sharing
> > them I'd like to first describe the problem I'm trying to solve and
> > the strategy I've been trying and get some feedback on it.
>
> These are all ancient in terms of mainline kernel. The latest
> kernel should have some improvements, perhaps try them first.
>
I have looked at the latest kernels too, and the changes in the ondemand 
governor between that and RHEL 6's 2.6.32 kernel are quite modest.  I 
mention 2.6.18 just because it's what's been out in the field a while.

> On Nehalem class systems with recent kernels it often helps to use the
> "intel_idle" driver too, because that gives the governour more
> accurate latencies to work with. Many BIOS are known to report
> incorrect latencies.
>
Thanks for the suggestion.

I haven't seen much in the way of inaccurate latency problems, but then 
most of my testing has been on a fairly constrained set of fairly good 
hardware.

> > The workload has periods of really high CPU utilization with lulls in
> > between, and the servers need to respond quickly to the onset of load
> > to avoid dropping packets.  This resulted in 3 goals for my work with
> > the governor:
> >
> > 1) Negligible overhead when at high CPU utilization
> > 2) Save power when truly idle
> > 3) Ramp up quickly to the high-performance state when load appears
>
> FWIW when you're truly idle you typically don't need ondemand,
> the idle states on modern CPUs go to the lowest frequency by themselves
> or simply turn off the frequency completely.
>
I do see c-states getting used on Intel hardware to save power, and in 
some cases these are quite effective.  On AMD hardware lowering 
frequency tends to be very important to saving power.  But you must 
choose some governor or other, and if you choose the performance 
(non)governor clock frequency does NOT change by itself.  There are 
other governors more attuned to portable devices, but that's a different 
application; the ondemand governor is the closest I could find.

> ondemand and p-states mainly help you on moderate load.
>
> Just going to highest state unconditionally would be somewhat
> contraproductive to that goal.
>
On moderate load I might agree, but on the servers I care about it is a 
workload that's a bit like war -- long periods of boredom punctuated by 
sudden bursts of sheer terror.  So I am really only very interested in 
active idle and max performance, not so much states in between.  Of 
course, on new Intel hardware that decision can be made in a fairly 
fine-grained way; you do not have to ramp up every core just because one 
is busy.  But if performance during the peaks is inferior to the 
performance non-governor, we will end up being told to use that and 
running flat-out all the time and save no power at all other than that 
automatically saved through c-states.

David C Niemi
