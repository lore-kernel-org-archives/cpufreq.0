From: Magdalena Dobosz <maj.dobosz@gmail.com>
Subject: Re: cpufreq-info and acpi-cpufreq: reporting MSR_IA32_PERF_CTL as
 "actual frequency"
Date: Thu, 27 Nov 2014 17:38:23 +0100
Message-ID: <CAHOOextX=QK1-x7SbgKG9_zSUaZFLBX5FU5+iCFzJaqeJ7BYrg@mail.gmail.com>
References: <CAHOOexvOXKr4s-mg20VdUOAR3o7EN5iAS-ModAk6-vNKbhwT=g@mail.gmail.com>
	<5475F1EA.7020003@intel.com>
	<CAHOOexses3--hwcL5Mz=hnk+e1O32T8NXH=y+Se24-VXkWWAcw@mail.gmail.com>
	<3849711.qUm3dg8PlV@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=FxzcZWnV9rvjEtQk0Mebl3FQohsbqXp5UuW8c7Ij0q0=;
        b=ml1xl+QUsvvzhPkQaDbxXrxhz0EKxYDl85xrSLpIdeS4OC+k+rp3QhraNjQ87yTWBQ
         LQNCckojhWApsUtysvCqdCyB9Go3Gal7QdAyU8ebOVjL+I+hYSJn2pvHXHvJhLhR0yYe
         R9cGjw1QzMCx/vjyrKsyBUInjNDsDTq+z2RV//oOMSX6NWyVnpNoh0fgR/InJU6Bwsev
         GLUxTLUGDCKS0SH/AjZoj5wJr+iUjC0JeU1J65xq6439xzb14sEfq8K+5YQLML/91dW2
         F/ujTLBkq68X7oQ/zOvHv3rZey3K/aYO29M1LCBrILEc7PLVrYliCAulSI4aiX42fBU6
         24ZQ==
In-Reply-To: <3849711.qUm3dg8PlV@vostro.rjw.lan>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, dirk.j.brandewie@intel.com, "cpufreq@vger.kernel.org" <CPUFREQ@vger.kernel.org>, Ross Lagerwall <rosslagerwall@gmail.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Len Brown <lenb@kernel.org>

It can be already stale? Why is that?

Anyway, cpufreq documentation is misleading: it says "cpuinfo_cur_freq
: Current frequency of the CPU as obtained from the hardware, in KHz.
This is the frequency the CPU actually runs at.", while the value is
read from MSR_IA32_PERF_STATUS (or MSR_IA32_PERF_CTL in newer
kernels).

Best regards,
Magdalena

2014-11-26 23:37 GMT+01:00 Rafael J. Wysocki <rjw@rjwysocki.net>:
> On Wednesday, November 26, 2014 09:41:02 PM Magdalena Dobosz wrote:
>> Dirk: I understand that it does not say about current frequency (it
>> does not take into account such factors as c-states and turbo boost
>> for instance). Yet, if it does say about a current p-state of a core,
>> then it is a valid and useful piece of information. For instance,
>
> You can't trust it, though, because the moment you've read the value
> and are now going to use it, it may be already stale.
>
>> while testing cpufrequtils on Intel i7, Intel i5 and Core 2 duo cpus,
>> I observed that while the requested frequency (policy->cur) for
>> different cores may be different, the frequency reported on the basis
>> of the current p-state (read from MSR_IA32_PERF_STATUS) is all the
>> time the same for all the cores. This suggests that all the cores are
>> in the same frequency domain (hardware coordinated).
>
> Which usually is the case for (current) desktop processors, but may not
> be the case for server ones.
>
>> Viresh, why is it ill-conceived? As I said above, I think the
>> information concerning current p-state can be useful - as long as it
>> is accurate. Do you have any premises to say that it is not accurate
>> in terms of the current p-state of a core?
>
> Please see above.
>
> Kind regards,
> Rafael
>
>
>> 2014-11-26 16:29 GMT+01:00 Dirk Brandewie <dirk.brandewie@gmail.com>:
>> > On 11/25/2014 10:07 PM, Viresh Kumar wrote:
>> >>
>> >> On 25 November 2014 at 22:51, Magdalena Dobosz <maj.dobosz@gmail.com>
>> >> wrote:
>> >>>
>> >>> Hi,
>> >>> I was analyzing the code and behaviour of cpufrequtils (kernel 3.13).
>> >>> I noticed that the value reported by cpufreq-info as the frequency
>> >>> "asserted by call to hardware" (exported to sysfs as
>> >>> "cpuinfo_cur_freq") is always the same as the value reported as the
>> >>> frequency requested by a governor (exported to sysfs as "freq", stored
>> >>> in policy->cur).
>> >>> It was not the case for kernel 3.2 (these two values tend to differ).
>> >>>
>> >>> I found a reason: while using acpi-cpufreq driver, the value reported
>> >>> as hardware frequency is retrieved using  get_cur_freq_on_cpu function
>> >>> (defined in acpi-cpufreq). Now, in kernel version 3.2 this function
>> >>> reads a value from MSR_IA32_PERF_STATUS, while in kernel 3.13 it reads
>> >>> MSR_IA32_PERF_CTL.
>> >>> It is a result of the patch shown below:
>> >>> https://lists.ubuntu.com/archives/kernel-team/2013-June/029493.html
>> >>>
>> >>> It looks like a bug for me - we take a requested frequency (control
>> >>> register) and we report it as "cpuinfo_cur_freq - Current frequency of
>> >>> the CPU as obtained from the hardware, in KHz. This is the frequency
>> >>> the CPU actually runs at." (as desribed in cpufrequtils documentation:
>> >>> https://www.kernel.org/doc/Documentation/cpu-freq/user-guide.txt". I
>> >>> believe we should read status register (MSR_IA32_PERF_STATUS) instead.
>> >>
>> >>
>> >> Fixed list and cc'd few more.
>> >>
>> >> This is what Len Brown said to that patch:
>> >>
>> >> Ack -- MSR_IA32_PERF_STATUS is ill-conceived.  It is un-reliable
>> >> by its very definition.  Any code that depends on it should be
>> >> questioned...
>> >>
>> >> @Dirk: Can you help ?
>> >
>> >
>> > Not really. This issue is one of the reasons that intel_pstate returns a
>> > measured/effective frequency.  There is no way that I know of to get the
>> > instantaneous frequency that the core is running at in the presence of
>> > hardware coordination and idle.  The best you can do is measure the
>> > effective
>> > frequency over a sample time.  This is what turbostat and intel_pstate
>> > report.
>> >
>> > --Dirk
>> >
>> >>
>> >
>
> --
> I speak only for myself.
> Rafael J. Wysocki, Intel Open Source Technology Center.
