From: viresh kumar <viresh.kumar@linaro.org>
Subject: Re: [Update PATCH 1/1] Cpufreq: Make governor data on nonboot cpus
 across system suspend/resume
Date: Sat, 16 Nov 2013 10:54:46 +0530
Message-ID: <5287019E.2080608@linaro.org>
References: <1384495294-10565-1-git-send-email-tianyu.lan@intel.com>	<1384503334-18809-1-git-send-email-tianyu.lan@intel.com> <CAKohponu0UFZig3xXTAnn8fKnqc5FnFMpxp2JfYQPQjOjAULTw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohponu0UFZig3xXTAnn8fKnqc5FnFMpxp2JfYQPQjOjAULTw@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lan Tianyu <tianyu.lan@intel.com>, rainer.kaluscha@web.de
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Friday 15 November 2013 04:24 PM, Viresh Kumar wrote:
> Though the patch I have sent fixes a problem similar to this but I don't think
> patch of any of us will solve the issue Rainer is facing..
> 
> I checked his system configuration and its like this:
> - Four CPUs, all having separate clock domains (atleast from kernel
> perspective) and so separate policy structure.
> - All are using ondemand governor
> - not using CPUFREQ_HAVE_GOVERNOR_PER_POLICY feature
> - So there is a single set of tunables for ondemand governor that is applicable
> across all CPUs..
> 
> The way INIT/EXIT are designed in cpufreq_governor.c should take care
> of this scenario.
> 
> memory for tunables must not be freed unless all the CPUs are removed.
> Which can't happen, as we only offline non-boot CPUs and so I believe
> that memory isn't getting freed and so your solution wouldn't address his
> problem..
> 
> Sorry if I said something stupid enough :)

I haven't :)

From your another mail it is clear that you have used separate governors and so
you have faced the real problem :)

Hope my patch fixes it for you.

