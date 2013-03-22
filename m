From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 19:40:45 +0530
Message-ID: <CAKohpon0_aNK6-eXwdqPUg9SVAjScF7+-s+WTP0wWFNaOY-YSQ@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<1479611.koCCfMhmrZ@skinner.arch.suse.de>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1694228.Eg36y3ID9W@skinner.arch.suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On 22 March 2013 19:34, Thomas Renninger <trenn@suse.de> wrote:
> I am pretty sure cpuidle states won't initialize and in best case you never
> get them working on the offlined cpus.
> Local APICs won't be set up, ...
>
> Such a parameter will never exist for x86.

I will see if i can find what i was referring to here.

> They were hugely simplified and things are not working anymore and you
> do not know why...

I know why, but don't know (for now) how to fix it for acpi-cpufreq.

> And powernow-k8 driver is broken.
> The others are not tested that often, I expect they broke as well, right?

acpi-cpufreq is broken and so all others who are using it. Sorry for asking
the stupid question now but what's the hierarchy of cpufreq drivers for intel
(I will try to go through it now), some drivers use acpi-cpufreq driver?

> Sorry, I cannot look into this due to lack of time, but I remember that
> there were reasons why cpufreq_add_dev() was complicated.
> Or that it's really easy to mess it up and it's not easy to fix it again.

Its not cpufreq_add_dev() that is broken but some changes that were part
of the same patch, i.e. part that tried to sort out affected and related cpus.
