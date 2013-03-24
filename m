From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Bug 55411] sysfs per-cpu cpufreq subdirs/symlinks screwed up
 after s2ram
Date: Sun, 24 Mar 2013 14:40:53 +0530
Message-ID: <CAKohponb3gvzQMPZH=vfBGpzG8NMYZRCx_Ym==xDH0BwgzN+Nw@mail.gmail.com>
References: <bug-55411-70601@https.bugzilla.kernel.org/>
	<CAKohponFbCpBGtRRkzbzHEE4ez7FJieiQJQJSwbhUJP_dee_9g@mail.gmail.com>
	<1694228.Eg36y3ID9W@skinner.arch.suse.de>
	<2581491.irn18K9zaF@hammer82.arch.suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <2581491.irn18K9zaF@hammer82.arch.suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rjw@sisk.pl>, bugzilla-daemon@bugzilla.kernel.org, Andre Przywara <andre.przywara@linaro.org>, 1i5t5.duncan@cox.net, cpufreq@vger.kernel.org, Lists linaro-kernel <linaro-kernel@lists.linaro.org>

On 24 March 2013 14:35, Thomas Renninger <trenn@suse.de> wrote:
> I take that back.
> CPU hot-add (even if CPU is not present at boot time) works.
> I looked at C-states for that some time ago and it should only work if
> the hot-add event came in via ACPI events for CPUs which were not
> initialized at boot time. Better would be to initialize the first time it
> gets switched online.

I removed it from my TODO list, thanks :)

> Anyway, making such stuff (cpufreq/cpuidle/...) more robust,
> is certainly a good idea.

Yes, that was the basic intent of my earlier patches that went into 3.9.
It was all about simplifying it and making it robust.

> And powernow-k8 does not exist anymore..., fortunately I didn't have to
> look at this stuff for some time.

Sure? Driver is still present in mainline.

BTW, i have given an initial fix for acpi-cpufreq (which should work)
and waiting
for Duncan to reply back. All other drivers don't set affected/related
cpus directly,
so they should be alright.

--
viresh
