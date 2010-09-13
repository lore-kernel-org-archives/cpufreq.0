From: David C Niemi <dniemi@verisign.com>
Subject: Re: Improving High-Load Performance with the Ondemand Governor
Date: Mon, 13 Sep 2010 18:02:17 -0400
Message-ID: <4C8E9F69.3020502@verisign.com>
References: <4C88EF04.1030908@verisign.com>	<87r5h2t5b5.fsf@basil.nowhere.org>	<4C8E872B.2020503@verisign.com> <20100913225456.13cbbaef@basil.nowhere.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20100913225456.13cbbaef@basil.nowhere.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <andi@firstfloor.org>
Cc: cpufreq@vger.kernel.org

Andi Kleen wrote:
> On Mon, 13 Sep 2010 16:18:51 -0400
> David C Niemi <dniemi@verisign.com> wrote:
>
>   
>> I have looked at the latest kernels too, and the changes in the
>> ondemand governor between that and RHEL 6's 2.6.32 kernel are quite
>> modest.  I mention 2.6.18 just because it's what's been out in the
>> field a while.
>>     
>
> Most of the interesting changes were post 2.6.32 (2.6.32 is ancient
> too for mainline)  
>   
I did see a few changes in cpufreq_ondemand.c between 2.6.32 and the git 
version I grabbed last week, but not really relevant to what I was 
trying to do.

>>> FWIW when you're truly idle you typically don't need ondemand,
>>> the idle states on modern CPUs go to the lowest frequency by
>>> themselves or simply turn off the frequency completely.
>>>
>>>       
>> I do see c-states getting used on Intel hardware to save power, and
>>     
>
> ondemand has nothing to do with c-states, c-states are handled
> by the menu governor.
>   
We're using the standard cpuidle on the newer (RHEL 6 beta-based) 
kernels.  If you think there are compelling improvements in it after 
2.6.32 I'll certainly take a look.
 
>> in some cases these are quite effective.  On AMD hardware lowering 
>> frequency tends to be very important to saving power.
>>     
>
> AFAIK modern AMD doesn't need this either in c-states.
>   
It makes a dramatic difference in power consumption whether you use a 
p-state governor on the 2-year-old AMD hardware that matters to me.  On 
both old (Woodcrest) and new (Nehalem) Intel hardware the difference is 
much smaller, as c-states are the dominant form of power saving, but 
using a p-state governor still makes a measurable difference.  On the 
plus side the power-saving c-states we are using don't measurably hurt 
performance on our workloads, so cpuidle is doing a pretty good job; 
whereas the stock ondemand p-state governor does in a big way.

>> On moderate load I might agree, but on the servers I care about it is
>> a workload that's a bit like war -- long periods of boredom
>> punctuated by sudden bursts of sheer terror. 
>>     
>
> In this case on modern hardware you don't need a p-state
> governor at all except for "performance"
>
> -Andi
>   
No doubt true in the long run, but see above.

DCN
