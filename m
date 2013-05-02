From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/2] CPUFreq core fixes for v3.10-rc2
Date: Thu, 02 May 2013 23:19:10 +0200
Message-ID: <1496263.0WG0vFmtlD@vostro.rjw.lan>
References: <cover.1367332148.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1367332148.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, arvind.chauhan@arm.com

On Tuesday, April 30, 2013 08:02:16 PM Viresh Kumar wrote:
> I just saw your pull request and so these should go in rc2 now.
> 
> These are fixes for cpufreq core and common governor part. They mostly impact
> systems which have set have_governor_per_policy to true. i.e. big LITTLE cpufreq
> driver.
> 
> Viresh Kumar (2):
>   cpufreq: governors: Fix CPUFREQ_GOV_POLICY_{INIT|EXIT} notifiers
>   cpufreq: Issue CPUFREQ_GOV_POLICY_EXIT notifier before dropping
>     policy refcount
> 
>  drivers/cpufreq/cpufreq.c          |  6 +++---
>  drivers/cpufreq/cpufreq_governor.c | 11 +++++++----
>  drivers/cpufreq/cpufreq_governor.h |  1 +
>  3 files changed, 11 insertions(+), 7 deletions(-)

Both queued up for the v3.10-rc2 push.

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
