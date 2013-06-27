From: Guru Prasad <gurupras@buffalo.edu>
Subject: Re: Porting cpufreq module for memory frequency scaling 'memfreq'
Date: Thu, 27 Jun 2013 09:06:18 -0400
Message-ID: <CAMefCkBFu6m4jqPgrjPvhn1=d6Hgo=eGfk8JVxsCGQQ_qMjK9Q@mail.gmail.com>
References: <CAMefCkCXyM4EV92Q==zScae7FzgD2VjmyGx2nTf_u2LK6b6hvQ@mail.gmail.com>
	<CAMefCkAwdGGeOrJWnkTdbFH8L453LC1Cvo7mh_Ntx0LBSwQv+g@mail.gmail.com>
	<CAKfTPtDtVsVFAZu0XjMrDQXemGOYD24qyVr9JiC6vQga-7nKHQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=nVrMABFEtuNXn4JtDJ31v+th69a/7Egi4Rk7c2M5rJA=;
        b=AWuCJTRET1SiJL9AhoYuuFhPmtnosQxRJAxivUnsewp3WvzslEWaoSm5shf8OWWsRF
         SSNKn0stHg7d7YE40zcMEgVy0ZnHjyiLM4KNcprnFJw8hkGblpsrBjtC/jEdMBPvpqvs
         +R96lbVtr5DStd96klECx1loHthoZ1n7vxvevF9ppZV1g5x244IXo/mlrZs4D5aucxxF
         PeKeme1ao3jQaXm5/gxy170uWvWQ68fQ8K3KwAbMJqMnF1q+Ps/U/L85J8MYMglAbcIj
         KNqI1jFN371cAL879WQCzmc2vEBRnZ6QRGRxrwkyth6O37Wgg0N2L1n+zQdNzueRo1fo
         vDew==
In-Reply-To: <CAKfTPtDtVsVFAZu0XjMrDQXemGOYD24qyVr9JiC6vQga-7nKHQ@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

@Viresh Kumar:
Thank you for taking time out to resolve my questions.

@Vincent Guittot:
I have not looked into the devfreq framework. Thank you for pointing
me towards it. I will try to use this framework to implement the
proposed memory frequency scaling.
I have only been working on the Linux kernel a few months, but it
seems to me that Linux has thought of everything already!


Regards
Guru


On Thu, Jun 27, 2013 at 4:11 AM, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
> On 26 June 2013 17:58, Guru Prasad <gurupras@buffalo.edu> wrote:
>> Hi,
>>
>> I'm working with a hardware simulator - Gem5 (http://gem5.org). I have
>> added some functionality to this simulator to modify memory frequency.
>>
>> I would like to add kernel support to manage memory frequency similar
>> to how cpu frequency is currently maintained so that I can study the
>> cost-benefit of memory frequency scaling.
>
> Have you looked at devfreq framework ? It should match with what you
> are looking for.
>
> devfreq is used to manage the frequency scaling of devices other than
> cpu like the gpu or the memory
>
> Vincent
>
>
>>
>> I copied all the generic cpufreq sources to a separate folder
>> kernel_source/drivers/memfreq and setup the drivers/Makefile. I have
>> also done the preliminary Kconfig modifications.
>>
>> A few things I don't follow are
>>
>> Where does the kernel actually implement the delay resulting from
>> cpuinfo.transition_latency?
>> Does the kernel stall for the duration of the delay?
>>
>> the per_cpu macro        - I don't understand what this does..How can
>> I implement the same for memory - which I'm considering as a shared
>> resource rather than per_cpu.
>>
>> the subsys interface      - What does it do and how do I reproduce
>> this for memory? Can I use the existing bus_type memory_subsys?
>> (drivers/base/memory.c)
>>
>> callback                       - This seems to be specific for
>> CONFIG_HOTPLUG_CPU..do I need to implement this at all for memfreq?
>>
>> sysfs interface              - Is there any place I can look to
>> implement a nice sysfs interface similar to cpufreq?
>>
>>
>> Please let me know if there is anything I've missed out that might
>> complicate the process.
>>
>>
>> Regards
>> Guru
>> --
>> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
