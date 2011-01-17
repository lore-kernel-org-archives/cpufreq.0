From: Etienne Le Sueur <elesueur@cse.unsw.edu.au>
Subject: Re: scaled CPU frequency to half but no changes in power from battery
 - intel i5 on ASUS U30JC
Date: Mon, 17 Jan 2011 16:16:16 +1100
Message-ID: <4D33D0A0.4040404@cse.unsw.edu.au>
References: <AANLkTi=tb4+G13PuA5GoYPmm4d8cmwGiq7s_oGA=s+hE@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=tb4+G13PuA5GoYPmm4d8cmwGiq7s_oGA=s+hE@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Giacomo <delleceste@gmail.com>
Cc: cpufreq@vger.kernel.org

The energy efficiency of your netbook (and therefore its battery life) depends significantly how you use it.

Simply reducing the CPU frequency will not necessarily improve battery life. Most of the time, the CPU is idle and its frequency has little 
effect on the power consumption of it in this state.

If you are performing CPU intensive workloads (such as video or audio transcoding, games, etc) then the CPU frequency may have an impact on 
battery life, but research shows [1] that even then, reducing the CPU frequency can actually negatively impact energy efficiency.

Regards,
Etienne Le Sueur

[1] http://www.ertos.nicta.com.au/publications/papers/LeSueur_Heiser_10.abstract



On 3/01/11 10:25 PM, Giacomo wrote:
> Hi to all.
>
> Just a question.
>
> I have an intel i5 processor on an ASUS U30JC netbook.
> The frequency is 2.4 GHz.
> I set it manually to 1.20 GHz through /sys interface.
>
> I noticed no performance worsening at all abd especially no changes in
> the power supplied by the battery.
>
> I expected some improvements on the current/power consumption of the
> battery with half the processor
> frequency.
>
> Thanks in advance for any hint.
>
> Giacomo.
>
