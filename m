From: vichy <vichy.kuo@gmail.com>
Subject: Re: about system time incorrect after changing cpu frequency
Date: Tue, 1 Sep 2015 15:37:20 +0800
Message-ID: <CAOVJa8GCAGn4aO01yfFjnJjXW_CU=18yC+hB3FjhKkZemXUw0A@mail.gmail.com>
References: <CAOVJa8GTDj3UJpgUd4nH1wknUKa6fgac=1SsqC8g=UCG0MGuDw@mail.gmail.com>
	<CAOh2x=ky8_uwqvdH-krKxgMSby5jgovJp7odK6x=MpqNL+YoGg@mail.gmail.com>
	<CAOVJa8HNQ-s=yDfADCcoL+r22ALpHFtTjWZ=oxTkBUriYbCk+Q@mail.gmail.com>
	<20150901060236.GB1456@linux>
	<20150901143923.11b075b5@xhacker>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=7BPqa8qSUgEqSRMy9+SiRkayQGy5uawVWIxC+g85Qa0=;
        b=WGU/c/he8HwKoUcuzwutWPYlAYc3TxZCIbhElVM7M4UF+R0Nnq4koqOfoGyKpU64em
         xHpFseIMR7VQmRHqR/uDar8XLBBIoHHxlY+MySPb8pm06t6stJklGyNaz6rWWLCCZt6t
         Z3LReYSWR288ZWhh0BUTGtBxqNtJ3i3TFjSqiOkvvJjauybhKPmHKv4cpTONc09cDvA+
         xrxKnBqBdiIfVM3BeSRdR44rgkT+olSbrphLeQpJhs+hts+LWTsZkTxLquKeq4EjuXA0
         UrvRDRfCnY53lP5VC3rjjAcT+xDVDTsz49nqv/x1lex0G4s9bHh2klwixFdD/omL4/NV
         csNA==
In-Reply-To: <20150901143923.11b075b5@xhacker>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jisheng Zhang <jszhang@marvell.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>

hi Jisheng:

2015-09-01 14:39 GMT+08:00 Jisheng Zhang <jszhang@marvell.com>:
> On Tue, 1 Sep 2015 11:32:36 +0530
> Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
>> On 01-09-15, 13:36, vichy wrote:
>> > >> I try to call below 2 functions to change the frequency of clocksource
>> > >> and clockevent, but the above b) sleep time is still incorrect when
>> > >> cpu runs in 500Mhz.
>> > >>     clockevents_update_freq(this_cpu_ptr(gt_evt), gt_clk_rate);
>> > >>     __clocksource_updatefreq_hz(&gt_clocksource, gt_clk_rate);
>>
>> How and when were you calling them? What kernel version is it ?
>>
>> > Clock Event Device: arm_global_timer
>>
>> This driver doesn't have support to update clkevt device's freq. You
>> may need to modify that based on how arch/arm/kernel/smp_twd.c is
>> updated. look for: clockevents_update_freq().
>>
>
> This can only help the clockevent. Even with this cpufreq notifier
> update, the globaltimer clocksource still can't hold correct/accurate time.
Why even global timer add clockevents_update_freq, it stilll CANNOT
hold currect/accurate time?
When I trace the kernel, clockevents_program_event will calculate the
cycles with mult/shift then put in comparator.
if we put the write mult/shift, the global  timer should hold
correct/accurate time under different phepherial clock, right?

Appreciate all your kind help,
