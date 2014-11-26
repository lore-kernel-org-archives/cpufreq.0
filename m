From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: cpufreq-info and acpi-cpufreq: reporting MSR_IA32_PERF_CTL as
 "actual frequency"
Date: Wed, 26 Nov 2014 07:29:46 -0800
Message-ID: <5475F1EA.7020003@intel.com>
References: <CAHOOexvOXKr4s-mg20VdUOAR3o7EN5iAS-ModAk6-vNKbhwT=g@mail.gmail.com> <CAKohpom1=k=KP3csObfBPRqDQSWGyRrJUjw69NW04YB5RppcMw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:message-id:date:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=rlOehyXnfsT5JA5pse9ufulQQP/3jgaxhuURgAYzg9c=;
        b=ad++XQ++s7PPzgZWZQSkd7A+/qigLs9LqtRFQ0fAyBrxjozqpN0HuJpxwUNO4EY05x
         ibP5M8QJVu11TZR6wLpzMIbXmQwG/wZO3TT2npH6pb1CoDWjcfI970NoJSrFwuyozR4n
         6WoGrAPQELLjL12gH/dSKrZFdQ3+yY3bcryX/Byu2/aVbsaf08Q2inm2MNR/R1a4G+hp
         wZw3TH0cVbguzMz+Af2WkvC9E6/37DZze8znPsSGJY9K/Xvk59yGXV6vwe6ZtoBks7Ce
         9QYzUO2avYmEDqSTOpEHEvnjcNgiW8Jth9m4YeGDleH7rqVYDdLD6mz+5OKAWXAXrKA1
         R3fw==
In-Reply-To: <CAKohpom1=k=KP3csObfBPRqDQSWGyRrJUjw69NW04YB5RppcMw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>, Magdalena Dobosz <maj.dobosz@gmail.com>
Cc: dirk.j.brandewie@intel.com, "cpufreq@vger.kernel.org" <CPUFREQ@vger.kernel.org>, Ross Lagerwall <rosslagerwall@gmail.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Len Brown <lenb@kernel.org>

On 11/25/2014 10:07 PM, Viresh Kumar wrote:
> On 25 November 2014 at 22:51, Magdalena Dobosz <maj.dobosz@gmail.com> wrote:
>> Hi,
>> I was analyzing the code and behaviour of cpufrequtils (kernel 3.13).
>> I noticed that the value reported by cpufreq-info as the frequency
>> "asserted by call to hardware" (exported to sysfs as
>> "cpuinfo_cur_freq") is always the same as the value reported as the
>> frequency requested by a governor (exported to sysfs as "freq", stored
>> in policy->cur).
>> It was not the case for kernel 3.2 (these two values tend to differ).
>>
>> I found a reason: while using acpi-cpufreq driver, the value reported
>> as hardware frequency is retrieved using  get_cur_freq_on_cpu function
>> (defined in acpi-cpufreq). Now, in kernel version 3.2 this function
>> reads a value from MSR_IA32_PERF_STATUS, while in kernel 3.13 it reads
>> MSR_IA32_PERF_CTL.
>> It is a result of the patch shown below:
>> https://lists.ubuntu.com/archives/kernel-team/2013-June/029493.html
>>
>> It looks like a bug for me - we take a requested frequency (control
>> register) and we report it as "cpuinfo_cur_freq - Current frequency of
>> the CPU as obtained from the hardware, in KHz. This is the frequency
>> the CPU actually runs at." (as desribed in cpufrequtils documentation:
>> https://www.kernel.org/doc/Documentation/cpu-freq/user-guide.txt". I
>> believe we should read status register (MSR_IA32_PERF_STATUS) instead.
>
> Fixed list and cc'd few more.
>
> This is what Len Brown said to that patch:
>
> Ack -- MSR_IA32_PERF_STATUS is ill-conceived.  It is un-reliable
> by its very definition.  Any code that depends on it should be questioned...
>
> @Dirk: Can you help ?

Not really. This issue is one of the reasons that intel_pstate returns a
measured/effective frequency.  There is no way that I know of to get the
instantaneous frequency that the core is running at in the presence of
hardware coordination and idle.  The best you can do is measure the effective
frequency over a sample time.  This is what turbostat and intel_pstate
report.

--Dirk

>

