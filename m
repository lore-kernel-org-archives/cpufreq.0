From: Thomas Renninger <trenn@suse.de>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up after s2ram
Date: Fri, 22 Mar 2013 13:53:34 +0100
Message-ID: <1479611.koCCfMhmrZ@skinner.arch.suse.de>
References: <bug-55411-70601@https.bugzilla.kernel.org/> <CAKohpo=dRuE0bUHTNnq14d6G3ZEcnwPw4Amk5YpXFUVpekrxTQ@mail.gmail.com> <3039053.c3U9fYsQRn@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <3039053.c3U9fYsQRn@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Borislav Petkov <bp@alien8.de>

On Friday, March 22, 2013 01:17:18 PM Rafael J. Wysocki wrote:
> [Adding Boris and Thomas to the CC.]
> 
...
> > I don't have enough knowledge about this driver and how is it used for all
> > x86 systems and so want somebody else (who has some prior experience with
> > it) to check how policy->cpus and policy->related_cpus must be set from
> > driver->init().
> 
> OK, so what exactly do you need to now?
> 
> This has to be addressed before final 3.9 this way or another - and the
> sooner the better.

Is this all to try to fix "cpufreq driver gets loaded while some cores
were set offline before"?

I wonder how you run into "cpufreq is initialized with offlined cpus" case.
I remember that there were problems, but it's nearly impossible to run
into this if the cpufreq driver is loaded early at boot.

cpufreq_add_dev() and friends are complicated.
Those init functions got split some time ago and there also slipped
in a bug even it was simple splitting of functions.

I do not have time to look at fcf8058296edbc3de43adf095824fc32b067b9f8
right now. Don't know how much other stuff depends on it and how
sever it is on ARM that cpufreq does not correctly initialize with offlined
cpus..., I would revert this patch.

There are other cpu related drivers (at least on x86) which cannot
initialize correctly if the CPUs got offlined before driver init.
Obviously this is not a clever thing to do.

   Thomas
