From: Thomas Renninger <trenn@suse.de>
Subject: Re: question about scailing CPU frequency
Date: Thu, 20 Oct 2011 06:48:43 +0200
Message-ID: <201110200648.43552.trenn@suse.de>
References: <CABgotTJO-_PppTW_1cqmsgV-0VQcK=BdQ76jXWg-M2gTxNOVgA@mail.gmail.com> <CABgotT+TnOikBe5jwsy_+bPPto42OYS5Mq5=wpzAmaKmv+4raw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CABgotT+TnOikBe5jwsy_+bPPto42OYS5Mq5=wpzAmaKmv+4raw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: sabrina chang <sabrinaytchang@gmail.com>
Cc: cpufreq@vger.kernel.org

On Tuesday 18 October 2011 04:30:01 sabrina chang wrote:
> hello,
> I have some questions about scailing CPU frequency.
> I want to create an environment with 1 higher CPU frequency and 3
> lower CPU frequency on Fedora system(linux kernel 2.6.32) with
> acpi-cpufreq driver (Intel Core i7-920 Processor).
> ****************************************************************************************************
> this is the cpufreq-info report:
> cpufrequtils 007: cpufreq-info (C) Dominik Brodowski 2004-2009
> Report errors and bugs to cpufreq@vger.kernel.org, please.
> analyzing CPU 0:
>   driver: acpi-cpufreq
>   CPUs which run at the same hardware frequency: 0 1 2 3
>   CPUs which need to have their frequency coordinated by software: 0
>   maximum transition latency: 10.0 us.
>   hardware limits: 1.60 GHz - 2.67 GHz
>   available frequency steps: 2.67 GHz, 2.53 GHz, 2.40 GHz, 2.27 GHz,
> 2.13 GHz, 2.00 GHz, 1.87 GHz, 1.73 GHz, 1.60 GHz
>   available cpufreq governors: ondemand, userspace, performance
>   current policy: frequency should be within 1.60 GHz and 2.67 GHz.
>                   The governor "userspace" may decide which speed to use
>                   within this range.
>   current CPU frequency is 2.67 GHz (asserted by call to hardware).
...
> ****************************************************************************************************
> When I want to create the environment I want, the lower freq. always
> sync with the higher freq.
So you want, if for example cpufreq subsystem currently would set:
   1.2G
   2.0G
like to have both cores set to 2.0G?
This is what would really happen on an AMD core where HW frequency dependencies
exist and different freqs are applied and I expect it's same/similar on Intel.

I do not think it's very useful, but you could hardcode to add all cores
to the software cpumask (acpi-cpufreq.c):
        if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
            policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
                cpumask_copy(policy->cpus, perf->shared_cpu_map);
        }
Instead of perf->shared_cpu_map you could use all online cpus (cpu_online_mask).

Due to possible HW dependencies and to make sure they got correctly exported by
BIOS (_PSD ACPI func) and due to the fact that latest CPUs can boost which you
cannot control, which you even can only measure over a period of time (you don't
know at which freq your currently are) you should use mperf (in cpufrequtils)
or better latest cpupower monitor feature.
They show you the frequency your cores were really in.
Real HW frequency might behave rather different than you'd expect it.

  Thomas

> It means that as long as one CPU frequency is higher, the rest lower
> freq will adjust to the higher freq. even I set them to the lower
> freq.
> From the cpufreq-info report, it seems they are using hardware
> coordination, not software coordination.
> I saw some other articles talking about we can choose which coordination to use.
> Do you know how to setting to software coordination, even if the power
> do not save any consumption is ok.
> I want the different speed of CPU for experiment.
> Thanks for your listening!
