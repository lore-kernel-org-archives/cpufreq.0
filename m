From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Fri, 22 Mar 2013 19:13:33 +0530
Message-ID: <CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com>
	<3039053.c3U9fYsQRn@vostro.rjw.lan>
	<1479611.koCCfMhmrZ@skinner.arch.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1479611.koCCfMhmrZ@skinner.arch.suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>, Borislav Petkov <bp@alien8.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

Hi guys,

I will answer to questions of both of you in this mail.

On 22 March 2013 18:23, Thomas Renninger <trenn@suse.de> wrote:
> Is this all to try to fix "cpufreq driver gets loaded while some cores
> were set offline before"?

Not really. There are problems with acpi-cpufreq without that case too.

> I wonder how you run into "cpufreq is initialized with offlined cpus" case.
> I remember that there were problems, but it's nearly impossible to run
> into this if the cpufreq driver is loaded early at boot.

I always thought there is a way not to boot all cpus by passing stuff in
command line and so this is a easy case to reproduce.

> cpufreq_add_dev() and friends are complicated.

Not anymore, they are hugely simplified now.

> Those init functions got split some time ago and there also slipped
> in a bug even it was simple splitting of functions.
>
> I do not have time to look at fcf8058296edbc3de43adf095824fc32b067b9f8
> right now. Don't know how much other stuff depends on it and how
> sever it is on ARM that cpufreq does not correctly initialize with offlined
> cpus..., I would revert this patch.

Let me clear it to everybody. There isn't/shouldn't be a bug in cpufreq core,
its just that acpi-cpufreq driver isn't adapted well with the changes related to
affected_cpus and related_cpus.

I have never gone into coding for any non-ARM platform and am really not
aware of acpi-cpufreq driver and its users. That's why i told everybody where
the issue is, and they just need to fix acpi-cpufreq driver with right values of
policy->cpus (affected_cpus) and everything else would work after that.

--
viresh
