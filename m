From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq_stats: fix race between stats allocation and first usage
Date: Sat, 15 Dec 2012 12:22:38 +0100
Message-ID: <2504655.pJNUDF76QM@vostro.rjw.lan>
References: <20121214105921.5139.502.stgit@zurg> <4367394.4dMqb5NnJH@vostro.rjw.lan> <50CC205D.4040106@openvz.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <50CC205D.4040106@openvz.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Konstantin Khlebnikov <khlebnikov@openvz.org>
Cc: linux-kernel@vger.kernel.org, cpufreq <cpufreq@vger.kernel.org>, linux-pm <linux-pm@vger.kernel.org>

On Saturday, December 15, 2012 11:01:49 AM Konstantin Khlebnikov wrote:
> Rafael J. Wysocki wrote:
> > On Friday, December 14, 2012 02:59:21 PM Konstantin Khlebnikov wrote:
> >> This patch forces complete struct cpufreq_stats allocation for all cpus before
> >> registering CPUFREQ_TRANSITION_NOTIFIER notifier, otherwise in some conditions
> >> cpufreq_stat_notifier_trans() can be called in the middle of stats allocation,
> >> in this case cpufreq_stats_table already exists, but stat->freq_table is NULL.
> >
> > I'll queue it up for submission as v3.8 material.
> >
> > Does it need to be marked as -stable material too?
> 
> It's very old and rare bug. I think you can leave it as is.

OK

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
