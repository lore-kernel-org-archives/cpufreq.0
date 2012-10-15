From: Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH] cpufreq: timer: Move tick-sched specific code outside of
 cpufreq governors
Date: Mon, 15 Oct 2012 10:51:37 +0200
Message-ID: <20121015085137.GD29069@dhcp22.suse.cz>
References: <10f0412be71dec50a3e57732c1f2aa5b94fe1df8.1350288504.git.viresh.kumar@linaro.org>
 <20121015083533.GB29356@dhcp22.suse.cz>
 <CAKohponUigqKOkj3i2=LDgVG0bi4dXsbrJCDpzv6M3k1E_Y6Ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKohponUigqKOkj3i2=LDgVG0bi4dXsbrJCDpzv6M3k1E_Y6Ew@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, tglx@linutronix.de, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, Robin.Randhawa@arm.com

On Mon 15-10-12 14:11:53, Viresh Kumar wrote:
> On 15 October 2012 14:05, Michal Hocko <mhocko@suse.cz> wrote:
[...]
> > I would suggest moving the common functionality into drivers/cpufreq/
> > (e.g. cpufreq_common.c).
> 
> Initially i did that only, but then thought these routines must be present in
> more generic files if possible, available across frameworks.
> 
> Can we try renaming these to show there exact functionality and then put
> them in generic files like, tick-sched.c?

But we already do have generic generic functionality for nohz case
get_cpu_{idle,iowait}_time_us and kcpustat_cpu for !nohz. The only one
that cares for both is /proc/stat code and it has its own helpers
get_{idle,iowait}_time and as you can see it's demands are different
from what governors want.

-- 
Michal Hocko
SUSE Labs
