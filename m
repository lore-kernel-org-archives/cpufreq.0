From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 08/13] cpufreq: omap: call CPUFREQ_POSTCHANGE notfier
 in error cases
Date: Wed, 19 Jun 2013 10:44:54 -0400
Message-ID: <51C1C3E6.8090000@ti.com>
References: <cover.1371630975.git.viresh.kumar@linaro.org> <957838f1065ccc20b0252e0a6d37b61f6b173970.1371630975.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <957838f1065ccc20b0252e0a6d37b61f6b173970.1371630975.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, arvind.chauhan@arm.com, dave.martin@arm.com

On Wednesday 19 June 2013 04:53 AM, Viresh Kumar wrote:
> PRECHANGE and POSTCHANGE notifiers must be called in groups, i.e either both
> should be called or both shouldn't be.
> 
> In case we have started PRECHANGE notifier and found an error, we must call
> POSTCHANGE notifier with freqs.new = freqs.old to guarantee that sequence of
> calling notifiers is complete.
> 
> Omap driver was taking care of it well, but wasn't restoring freqs.new to
> freqs.old in some cases. I wasn't required to add code for it as moving
> PRECHANGE notifier down was a better option, so that we call it just before
> starting frequency transition.
> 
> Cca: Santosh Shilimkar <santosh.shilimkar@ti.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
Looks safe to me.
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>


