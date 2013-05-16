From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/3] CPUFreq Fixes for 3.10-rc2
Date: Thu, 16 May 2013 10:46:26 +0200
Message-ID: <6691801.RqjZrI7EgH@vostro.rjw.lan>
References: <cover.1368679353.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1368679353.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, arvind.chauhan@arm.com

On Thursday, May 16, 2013 10:39:55 AM Viresh Kumar wrote:
> Hi Rafael,

Hi,

> Here are few more fixes for 3.10-rc2.

I'm actually going to sent the for-rc2 request today, so these are for -rc3.

> Viresh Kumar (3):
>   cpufreq: Add EXPORT_SYMBOL_GPL for have_governor_per_policy
>   cpufreq: governors: Move get_governor_parent_kobj() to cpufreq.c
>   cpufreq: Drop rwsem lock around CPUFREQ_GOV_POLICY_EXIT

Thanks,
Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
