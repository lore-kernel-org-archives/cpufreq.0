From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Mon, 10 Mar 2014 13:23:11 +0800
Message-ID: <CAOh2x=n-JbTRtE_d_Ov=anBh8wdm1fkfhv8E5f3J77ZtE7VnnQ@mail.gmail.com>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc:content-type;
        bh=IJxmxMdhlEctoo9mzJTVOsHgZu/ISwLLjQYt9nSyfgc=;
        b=tZa2wYj9p/uan8pVGQ0XHi+zDFE8rB7EseHa2UpkNoMExduOmo+UYqtdlRKMS5rp4x
         kwaX8mMf0y4xVOajr1SdHRnfjDcNjf/JOgcSYlu3fWiTAfj1U/ML7MWE61VeI0ht3p7L
         8aZHk3HeaiV29f6M/ztMQtt3JeEKjGCY70bpklysGgV/1f9CAvKTpdcMWHJ0Q20En/04
         mvtQPve1JBp9G9OaUy2HP63slOBeqWLYcplvnQuVagljvlwXJF+FTvZ42SBAIzW15PdR
         8qUeAIMt1vi40vtCUjsahlc3xIZS+kpyXZTSTN9JBUveat3EGyFZM+tPmrzOdW1sFYuC
         eJLw==
In-Reply-To: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Lundquist <patrik.lundquist@gmail.com>, Dirk Brandewie <dirk.brandewie@gmail.com>, Linux PM list <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Cc'ing relevant people..

On Fri, Mar 7, 2014 at 11:49 PM, Patrik Lundquist
<patrik.lundquist@gmail.com> wrote:
> Hi,
>
> booting 3.13.5 on a dual socket Ivy Bridge-EP resulted in this error:
>
> [    0.194139] smpboot: CPU0: Intel(R) Xeon(R) CPU E5-2687W v2 @
> 3.40GHz (fam: 06, model: 3e, stepping: 04)
> ...
> [    0.246755] x86: Booting SMP configuration:
> [    0.250935] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
> [    0.357648] .... node  #1, CPUs:    #8  #9 #10 #11 #12 #13 #14 #15
> [    0.553293] x86: Booted up 2 nodes, 16 CPUs
> [    0.557666] smpboot: Total of 16 processors activated (108850.19 BogoMIPS)
> ...
> [    5.210204] Intel P-state driver initializing.
> [    5.232407] Intel pstate controlling: cpu 0
> [    5.253628] Intel pstate controlling: cpu 1
> [    5.274899] cpufreq: __cpufreq_add_dev: ->get() failed
> [    5.294856] Intel pstate controlling: cpu 2
> [    5.313553] Intel pstate controlling: cpu 3
> [    5.332526] Intel pstate controlling: cpu 4
> [    5.352347] Intel pstate controlling: cpu 5
> [    5.372112] Intel pstate controlling: cpu 6
> [    5.391097] Intel pstate controlling: cpu 7
> [    5.410272] Intel pstate controlling: cpu 8
> [    5.429092] Intel pstate controlling: cpu 9
> [    5.447714] Intel pstate controlling: cpu 10
> [    5.465872] Intel pstate controlling: cpu 11
> [    5.482942] Intel pstate controlling: cpu 12
> [    5.498414] Intel pstate controlling: cpu 13
> [    5.513586] Intel pstate controlling: cpu 14
> [    5.529200] Intel pstate controlling: cpu 15
>
> CPU 1 is alive and well but missing the cpufreq driver. The system is
> running fine otherwise.
>
> Looking closer at the problem gives that intel_pstate_init_cpu() is
> successful but intel_pstate_get(), which is called right after by
> cpufreq, fails.
>
> Since all_cpu_data[1] is initialized it gives that sample->freq must
> be zero. So the bug should be in intel_pstate_calc_busy() which
> incorrectly sets sample->freq to zero.
>
> I guess cpu->pstate.max_pstate == 4000000 since that's what
> cpuinfo_max_freq and scaling_max_freq is on the other cores.
>
> So the error is likely that core_pct is calculated to 0 in
> intel_pstate.c:intel_pstate_calc_busy():
>
>     core_pct = div64_u64(int_tofp(sample->aperf * 100),
>                  sample->mperf);
>
>
>
> Might be fixed by this commit but should be backported in that case:
>
> commit fcb6a15c2e7e76d493e6f91ea889ab40e1c643a4
> Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Date:   Mon Feb 3 08:55:31 2014 -0800
>
>     intel_pstate: Take core C0 time into account for core busy calculation
>
>
>
> My options to explore the problem further by backporting patches and
> continuous reboots are a bit limited at the moment.
>
> Regards,
> Patrik
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
