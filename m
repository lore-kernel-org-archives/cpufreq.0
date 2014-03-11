From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Tue, 11 Mar 2014 10:58:59 -0700
Message-ID: <531F4EE3.4080701@gmail.com>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=2BJEWhkuXjsBMlzbVzzPPnm+2Wf8EM9ouXqVEm7LtpM=;
        b=RSA6XrF3RAujNZ02+nACiiwlQN28d0TBShDHxv+abBW3gTV6WQA6SWtXY8PPy8quZZ
         RSnoMgCHia9/Mz51UAameyIVTnHHGseBTgrR3m2Aoz2kxYiGaAZ/YQEOqmW3XxgnZC1i
         UnwvUxZjZupaw3kZQurk76ZIFQVNAcbUXAmoS7wpS8deXtXdkdutgvJEU2KrPMoqH/l+
         4tb9XGH2Iowx6kThcdJZ0tBkK8SypO+AYYnZCvJHpLqwndWgtyYgz0R9E+vfOWPNr5yw
         nghoAOCtDiyni6rQ/HbEAcgQCC9QCHvoqWOrd3MZJzX4BIRp33Qw0sGxyQ3eb2QVHFu6
         Yznw==
In-Reply-To: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Patrik Lundquist <patrik.lundquist@gmail.com>, cpufreq@vger.kernel.org
Cc: dirk.brandewie@gmail.com

Hi Patrick,

Sorry for the slow response you caught me taking a few days off :-)

On 03/07/2014 07:49 AM, Patrik Lundquist wrote:
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

This is a regression introduced by commit
da60ce9f2fa cpufreq: call cpufreq_driver->get() after calling ->init()


A return of zero from cpufreq_driver->get() is a warning at best for
intel_pstate at init time.  In fact zero is a valid return value AFAICT.
I should be doing something rational in any case.

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
>      core_pct = div64_u64(int_tofp(sample->aperf * 100),
>                   sample->mperf);
>

The truncation from the integer math is the likely culprit.

>
>
> Might be fixed by this commit but should be backported in that case:
>
> commit fcb6a15c2e7e76d493e6f91ea889ab40e1c643a4
> Author: Dirk Brandewie <dirk.j.brandewie@intel.com>
> Date:   Mon Feb 3 08:55:31 2014 -0800
>
>      intel_pstate: Take core C0 time into account for core busy calculation
>

This commit and the follow-on to fix a performance regression it introduced
are on my list to get into stable.

If you could file a bugzilla and add me to the CC list it would help me out
when I update stable.
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
>

