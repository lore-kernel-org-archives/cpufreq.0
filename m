From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: Clarification on the DVFS capabilities
Date: Wed, 29 May 2013 09:53:25 -0700
Message-ID: <51A63285.2000203@gmail.com>
References: <CAOuKo4=r5Npk=O9PVOLQ2wG3ST1ic=JW2c-GRHFy1z9anAKa0Q@mail.gmail.com> <CAOh2x=nMpMhYAYjhW8vxrHaY=Y8gQP+T0T1PL_FVD-u5LMiacg@mail.gmail.com> <CAOuKo4kr_=AOeiBjsr-7VBNJOsZvrKEtfo45JooZgsgm9gvZ_A@mail.gmail.com> <CAKohpoma0Z_OQxEAOuKHXq+HBwPc830yx83ZVfORM3er335F1A@mail.gmail.com> <CAOuKo4=3kchjS1b+EQQgskUWfZ0A9Mmizpsbk+cdWnT_k0zW-Q@mail.gmail.com> <CAKohpomwm8Qv6_pmbegM0kpPwYzceHBc_16gzSoULA_OzocVyA@mail.gmail.com> <CAOuKo4mgOcMUvqohWNOXr1J=rJ9SLG3=r9z+5qxd6zm4CuAkow@mail.gmail.com> <CAKohponxigN=DqZiKfd6E+2i+Jot3tQUR=z0cU8d0xxATnxkMw@mail.gmail.com> <CAOuKo4k+LNz4Ff5N+VJ8k-_TtRwV+9nWXwXz-Jsi00sUEvhA0A@mail.gmail.com> <51A4C89B.8090502@intel.com> <CAOuKo4=_6CoyZJXqy6dY919g7r2d-jyLP9PqgoYMRxL8tSvDBg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=l3rebrpOftEfxEPungyai3yztCrj3DRNn8pMDO68TRE=;
        b=q1ajJ1eE53BM6wZgmls9x+IhQGiBfoTBwp1N2Ftbrow8vkbp8FL9BrrFRH95TA/Wq0
         2zCNJbyuA1wnjlFsjjGCWj1KdSIxbcCrpkZCipXMo2l3cyoWI5SUrW7rv4QofTR9yzR4
         3H7oqzipJo6mQDTCqkEIdDwweBm06M2PWLP1I5jkHnHHW7o7MH4MZQZs8xsOOvdLyHuY
         rTLUwlZNvfL9bV0kZUpapNVaGUqqQfMs2rBhjIxH2aZunIto+7KOUlB9IXGbmFCKESyS
         +hN02pp4p1KnUzTm0fQjLzvVLn+2sOh7i2f3CYoKltI2TwMXxsX/orz6yHkO+PU1VoLg
         zpeg==
In-Reply-To: <CAOuKo4=_6CoyZJXqy6dY919g7r2d-jyLP9PqgoYMRxL8tSvDBg@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: karthik vm <meetvm@gmail.com>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq <cpufreq@vger.kernel.org>

On 05/29/2013 09:33 AM, karthik vm wrote:
> Thanks for the pointers Dirk & Viresh. They are very helpful.
>
> I went thru few white papers on power management on Sandy Bridge,
> Nehalem & Core Duo architectures.
>
> I found that for Sandy Bridge & Nehalem there is a embedded
> micro-controller called Power Control Unit(PCU) that accepts the
> p-state requests from OS for each core and it decides at what p-state
> all the cores(normally 4) should run.
>
> In Core Duo architecture there is a hardware coordinating unit which
> accepts the p-state requests from OS for each core and it decides what
> p-state both the cores should run based on some thermal limitations. I
> hope Core2Duo (my test processor) the successor to Core Duo also works
> the same way. Am I right Dirk?

AFAIK yes but I haven't looked at the specific docs for your processor.
The SDM 
http://www.intel.com/content/www/us/en/processors/architectures-software-developer-manuals.html 
has the authoritative info.

> because the paper said that "future
> implementations may choose to select a different operating point per
> core". Thats why I want to confirm.
>
> Hence as Dirk said we never know what the current instantaneous
> frequency of each core. The cpufreq stats only give the requested
> p-state on each core not their current values. Having said that I
> assume that the cpu frequency information from 1) "scaling_cur_freq"
> file in cpufreq directory 2) /proc/cpuinfo are also the requested
> p-state and not the current values. Kindly correct me if I am wrong.
>

If you are using acpi-cpufreq scaling driver and ondemand governor you
are correct.

The intel_pstate driver returns the frequency that the core ran at during
the most recent sample time.

> Thanks for your time,
> karthik
>
> On Tue, May 28, 2013 at 11:09 AM, Dirk Brandewie
> <dirk.brandewie@gmail.com> wrote:
>> On 05/26/2013 05:20 PM, karthik vm wrote:
>>>
>>> Thanks for your insights Viresh & Dirk. I really appreciate it.
>>>
>>> I read from the net that the p-state (Voltage/Frequency) pairs in
>>> Intel processors(e.g Nehalem) cannot be set for individual cores
>>>
>>> (http://web.archive.org/web/20130527001342/http://people.cs.pitt.edu/~kirk/cs3150spring2010/ShiminChen.pptx).
>>>
>>> As Dirk pointed out, each core may request a p-state but ultimately
>>> all the whole processor's p-state is set to the minimum of the
>>> requested p-states. But in my Core2Duo processor, I see that two cores
>>> are in different frequencies(p-state) and it did not fit into the
>>> explanation above :-(. I think I am missing something.
>>
>>
>> The requested p-state is being reported which is individually controllable
>> AFAIK there is no way to get the instantaneous operation frequncy of the
>> package.
>>
>> You can look at the APERF/MPERF to tell what effective frequency the core
>> ran
>> at over a sample time but that is the closet you can get to the actual
>> frequency the core "is" runing at.
>>
>>
>>
>>>
>>> Regards,
>>> karthik
>>>
>>> On Sun, May 26, 2013 at 3:01 AM, Viresh Kumar <viresh.kumar@linaro.org>
>>> wrote:
>>>>
>>>> On 26 May 2013 05:30, karthik vm <meetvm@gmail.com> wrote:
>>>>>
>>>>> Thanks for your insights Viresh. I really appreciate it!!
>>>>>
>>>>> Basically I wanted to know the DVFS granularity of a multi-core chip.
>>>>> i.e I want to know whether every core can separately increase or
>>>>> decrease its frequency or all the cores increase or decrease
>>>>> simultaneously. I think cpufreq-info command's output "CPUs which need
>>>>> to have their frequency coordinated by software" gives the answer. For
>>>>> my core2duo processor it says either core 0 or core 1. Hence frequency
>>>>> of each of my cores can be changed individually. Experimental results
>>>>> also supports it. Please correct me if there is any fallacy in my
>>>>> inference.
>>>>
>>>>
>>>> Whether cores can have separate control of clks or not is decided by
>>>> hardware implementation. On ARM normally all cores within a cluster
>>>> have common control of clk lines.. On Intel, I am not sure.
>>>>
>>>> Now, the hardware can have interesting capabilities where they can
>>>> manage separate clk lines themselves and software doesn't need to
>>>> do anything special for them. And so that's what Dirk pointed out
>>>> earlier.
>>>>
>>>> Your observation looks correct though.
>>
>>

