From: chao xie <xiechao.linux@gmail.com>
Subject: Re: cpufreq governor with SMP support
Date: Tue, 6 Dec 2011 13:40:53 +0800
Message-ID: <CAK9wHMS5F4B3=vsmz-hg=CkxCmJqgiFJK2Poyb4tc5uo_n4BCA@mail.gmail.com>
References: <CAK9wHMTatnwEMKUYjykFzdWJXtoLbBC9fzOfn+gDYS+HMDcbKg@mail.gmail.com>
	<CAJ0PZbQ7X4a_L9qqa=sa9HXNMVk-hODxmQ8y-=sdVF8Ww229_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=yg2axQzzmcSbNc0Tlkk/lYo2SUeP0l3zRDHEh0MEEo8=;
        b=ile5jSe8+1+Z6fItfoKQSi0N5CvBVXGNnDfBXf/qwSB0GTvV3kFSNjaXRJ+xaBYrBI
         qR9Ej55WkYD8VLFSX8ZfF6BrVxYx5g2Wi+ZRs4x7tAopk0LIJ9Nw2fGPrpqb1sPLkBPP
         Yp3SGzflkWO+qFkC+6nOe2SSJgE+sSq4YY92I=
In-Reply-To: <CAJ0PZbQ7X4a_L9qqa=sa9HXNMVk-hODxmQ8y-=sdVF8Ww229_Q@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: MyungJoo Ham <myungjoo.ham@gmail.com>
Cc: cpufreq@vger.kernel.org, davej@redhat.com

CPU1 will not be in idle for ever.
If current system only have one task that will run in period. The task
will be schedule to CPU0 at most time. So CPU1 will be idle. The idle
time may be very long. It can reach minutes.

2011/12/6 MyungJoo Ham <myungjoo.ham@gmail.com>:
> On Mon, Dec 5, 2011 at 7:00 PM, chao xie <xiechao.linux@gmail.com> wr=
ote:
>> Hi
>> The CPUFreq ondemand governor will use =A0deferrable timer for cpu
>> workload profiling.
>> The deferrable timer will not invoke the core when the core is total=
ly idle.
>> So for a SMP system, there are two cores, each one will have its own
>> cpufreq_policy and do the profiling and change the frequency of core=
=2E
>> I find that after system boot up, and I set the governor of the two
>> cores to be =93ondemand=94. The profiling in CPU1 will never start b=
ecause
>> CPU1 is in idle, and the deferrable timer cpu profiling depends on
>> will not wake up core.
>> Is that a problem, or I made mistake about how to set up cpufreq in
>> the SMP system?
>
> If CPU1 is in idle indefinitely, why is not having CPU1 profiled a pr=
oblem?
>
> If CPU1 is not used, you don't need to profile and adjust the
> frequency of CPU1 either, do you?
>
>
>
> MyungJoo
>
>> --
>> To unsubscribe from this list: send the line "unsubscribe cpufreq" i=
n
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> MyungJoo Ham, Ph.D.
> Mobile Software Platform Lab, DMC Business, Samsung Electronics
