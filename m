From: Michal Hocko <mhocko@suse.cz>
Subject: Re: [PATCH 0/3 RFC] Fix /proc/stat idle/iowait statistics for
 tickless kernel
Date: Wed, 17 Aug 2011 13:59:25 +0200
Message-ID: <20110817115925.GB7482@tiehlicka.suse.cz>
References: <20110802170249.GA23698@tiehlicka.suse.cz>
 <cover.1312544541.git.mhocko@suse.cz>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1312544541.git.mhocko@suse.cz>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, cpufreq@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>

Nobody interested or it just slipped through?

On Fri 05-08-11 13:42:21, Michal Hocko wrote:
> [Added cpufreq people into CC - the email thread started at
> https://lkml.org/lkml/2011/7/25/227]
> 
> This patch set aims at addressing /proc/stat issue which has been
> introduced with tickless kernel.
> In short, show_stat (proc handler) relies on kstat_cpu(i).cpustat
> statistics which are updated periodically so those numbers are more or
> less accurate.
> This is, however, not true with tickless kernel for idle and iowait
> counters because those are not updated while the cpu is in the tickless
> state. As the time when CPU might be tickless is not bounded, we can see
> really outdated values.
> The biggest problem is that tools which read /proc/stat interpret
> unchanged idle/iowait numbers as 0% idle/iowait which might confuse
> those who rely on them.
> 
> First patch in this series changes update_ts_time_stat semantic. The
> current implementation updates idle counter regardless we are in iowait
> loop at the moment. I see it as an optimization because cpufreq drivers,
> which are only users of those counters, care about busy vs. non-busy
> states so idle+iowait makes perfect sense. This, however, makes idle
> counter useless for others. 
> I think that calling using get_cpu_idle_time_us + get_cpu_iowait_time_us
> should have the same meaning (at least this is what we do for jiffies
> variants).
> This is necessary for the third patch.
> 
> The second patch is trivial and just a cleanup. It is not necessary for
> the series but I fixed those macros while I was at it.
> 
> The third patch uses get_cpu_{idle,iowait}_time_us to get precise
> counters. We still fall back to kstat_cpu if tickless kernel is
> disabled.
> 
> Thanks for any comments.
> 
> Michal Hocko (3):
>   tick: fix update_ts_time_stat idle accounting
>   cputime: clean up cputime_to_usecs and usecs_to_cputime macros
>   proc: consider NO_HZ when printing idle and iowait times
> 
>  drivers/cpufreq/cpufreq_conservative.c |    4 ++-
>  drivers/cpufreq/cpufreq_ondemand.c     |    4 ++-
>  fs/proc/stat.c                         |   41 ++++++++++++++++++++++++++-----
>  include/asm-generic/cputime.h          |    4 +-
>  kernel/time/tick-sched.c               |    8 +++---
>  5 files changed, 46 insertions(+), 15 deletions(-)
> 
> -- 
> 1.7.5.4

-- 
Michal Hocko
SUSE Labs
SUSE LINUX s.r.o.
Lihovarska 1060/12
190 00 Praha 9    
Czech Republic
