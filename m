From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Sun, 24 Mar 2013 15:32:39 +0530
Message-ID: <CAKohpoksBOpW59YETR-SMWJSGsJSWKoXktJoVM38SietN9p3Ug@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
	<2581491.irn18K9zaF@hammer82.arch.suse.de>
	<CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 1i5t5.duncan@cox.net
Cc: Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Thomas Renninger <trenn@suse.de>

Hi Duncan,

Please reply to this mail rather than using bugzilla as all others might not
be following bugzilla rerport.

> --- Comment #31 from Duncan <1i5t5.duncan@cox.net>  2013-03-24 09:48:41 ---
> (In reply to comment #28)
>> My weekend is already spoiled (due to my bugs :) ) and i don't want to spoil
>> yours.
>
> Don't worry about it.  They're all days in the week, to me.  I don't really
> have a defined "weekend".  In fact, I had been (somewhat impatiently) grumbling
> to myself Friday that I was likely to have to wait until Monday for something
> concrete to test, so I'm happy to be demonstrated wrong! =:^)

:)

>> [PATCH] cpufreq: acpi-cpufreq: Set policy->cpus correctly from .init()
>
> You appear to be on the right path as all the dirs and symlinks are there now,
> but it looks like you'll need a v2 as the order/pairing is now very strange,
> both as booted and after a s2ram/resume (which changes the order but it's still
> strange):

:(

> Testing against 3.9-rc4 now.
>
> Patch applied pre-suspend ls -dl as above (original pairing is 0/1, 2/3, 4/5,
> with the first always a dir and the second always a symlink to the first, as
> seen in comment #0):
>
> /sys/devices/system/cpu/cpu0/cpufreq/
> /sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
> /sys/devices/system/cpu/cpu2/cpufreq/
> /sys/devices/system/cpu/cpu3/cpufreq/
> /sys/devices/system/cpu/cpu4/cpufreq -> ../cpu3/cpufreq/
> /sys/devices/system/cpu/cpu5/cpufreq -> ../cpu2/cpufreq/

The way it works (in cpufreq core), the first cpu of group registered
for cpufreq
would get a directory and second one would get a symlink.

And the above ones also doesn't look good. 2/5 and 3/4 shouldn't be the groups.

acpi-cpufreq driver is getting this information from perf->shared_cpu_map and
that seems to be wrong to me now.

> Post s2ram/resume cycle:
>
> /sys/devices/system/cpu/cpu0/cpufreq/
> /sys/devices/system/cpu/cpu1/cpufreq -> ../cpu0/cpufreq/
> /sys/devices/system/cpu/cpu2/cpufreq -> ../cpu4/cpufreq/
> /sys/devices/system/cpu/cpu3/cpufreq -> ../cpu5/cpufreq/
> /sys/devices/system/cpu/cpu4/cpufreq/
> /sys/devices/system/cpu/cpu5/cpufreq/

2/4 and 3/5 are also wrong groups.

> But I don't know whether it's CPU ordering that's weird, or the cpufreq
> ordering.  IOW, I don't know whether it /should/ be 0/1, 2/3, 4/5 or not,
> because I don't know whether those numbers actually reflect the hardware so
> it's the ordering above that's bad, or if the cpu numbers are just arbitrarily
> assigned, and the ordering above reflects the actual hardware, and just looks
> strange due to the arbitrary cpu numbering.

One thing i am sure about is cpu order is fixed at boot and after boot whatever
you do can't change that order... So order should always be 0/1, 2/3, 4/5

> Either way, there's the correct number of dirs and links now, but the ordering
> is extremely confusing and looks wrong, regardless of whether it actually
> corresponds to the hardware or not, something I don't have the ability to
> judge.

Hmm.. Can you try one thing? Run 3.8 over your machine and give output of
cpufreq-info and ls -ld after boot and resume..

I would like to see what's the original behavior.

--
viresh
