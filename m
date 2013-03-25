From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Mon, 25 Mar 2013 16:53:39 +0530
Message-ID: <CAKohpo=DY6kmUVjpuHimMdYp1ubRfbNYfTjAB=mDPEkSzqumRg@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
	<2581491.irn18K9zaF@hammer82.arch.suse.de>
	<CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
	<CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
	<20130324044927.6a2b1588@ws>
	<CAKohpokknnU7jn0UuNsoRoho5MSmzT-Ub3sVwR030uJqMjSH7g@mail.gmail.com>
	<CAKohpomsrafpNii9zqAjqe5kqEGOEdP5mDpSSjTswrY1YNfhBw@mail.gmail.com>
	<20130325041541.4574f51a@ws>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20130325041541.4574f51a@ws>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duncan <1i5t5.duncan@cox.net>
Cc: bugzilla-daemon@bugzilla.kernel.org, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Renninger <trenn@suse.de>, Andre Przywara <andre.przywara@linaro.org>, djwong@us.ibm.com

On 25 March 2013 16:45, Duncan <1i5t5.duncan@cox.net> wrote:
> FWIW, with this patch, pre-s2ram and post-resume are indeed consistent,
> but it's not back to where it was.
>
> With this patch, each core is a cpufreq law unto itself.  Maybe that's
> what you meant with the note, maybe not (I know the mapping of sysfs
> files to cpufreq-info output was stated up-thread, but I lost track,
> and how affected vs related maps to hardware vs software coordinated
> and what it all actually means other than what I'm seeing isn't ideal,
> is apparently a bit more than I'm able to keep in my head ATM), but it's
> what I get. The relevant bits of cpufreq-info output:
>
> analyzing CPU 0:
>   CPUs which run at the same hardware frequency: 0
>   CPUs which need to have their frequency coordinated by software: 0
> analyzing CPU 1:
>   CPUs which run at the same hardware frequency: 1
>   CPUs which need to have their frequency coordinated by software: 1
> analyzing CPU 2:
>   CPUs which run at the same hardware frequency: 2
>   CPUs which need to have their frequency coordinated by software: 2
> analyzing CPU 3:
>   CPUs which run at the same hardware frequency: 3
>   CPUs which need to have their frequency coordinated by software: 3
> analyzing CPU 4:
>   CPUs which run at the same hardware frequency: 4
>   CPUs which need to have their frequency coordinated by software: 4
> analyzing CPU 5:
>   CPUs which run at the same hardware frequency: 5
>   CPUs which need to have their frequency coordinated by software: 5
>
> But at least it's consistent:  The same results both before and after a
> suspend/resume cycle.
>
> And given that 3.8 wasn't ideal either, maybe that's good enough for
> this cycle, and a real fix will have to wait until the next commit
> window and stable-tree.  That'd give us more leeway to fix it right, as
> well as a full cycle for testing anything else the "correct" fix might
> dredge up.

This is exactly what i expected and i wrote in Note. Because cpufreq core
does a lot of work based on related_cpus now, its better we don't set it
blindly for x86.

Following code was the only user of relatead_cpus in 3.8 code:

        /* Set governor before ->init, so that driver could check it */
#ifdef CONFIG_HOTPLUG_CPU
        for_each_online_cpu(sibling) {
                struct cpufreq_policy *cp = per_cpu(cpufreq_cpu_data, sibling);
                if (cp && cp->governor &&
                    (cpumask_test_cpu(cpu, cp->related_cpus))) {
                        policy->governor = cp->governor;
                        found = 1;
                        break;
                }
        }
#endif


There is no other user of relatead_cpus earlier in cpufreq core and that's why
i wonder why it was added earlier.

But a grep of relatead_cpus for 3.8 showed some interesting users in:
tools/power/cpupower/

I will try to check what they are doing with it, but for the kernel it
was almost unused.
And not it is very much used :)

But for 3.9 i believe this patch should be good enough.

Thanks for testing it.

--
viresh
