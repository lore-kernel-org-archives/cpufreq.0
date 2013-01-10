From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: Simplify __cpufreq_remove_dev()
Date: Thu, 10 Jan 2013 11:31:35 +0530
Message-ID: <CAKohpok4WLHkBQFoh1-T8H33Mi=+ZHmuKYnik_dZBOG_B2LzOA@mail.gmail.com>
References: <aa10abe640afed8700abf262dbfc9b9c22659b6a.1357729671.git.viresh.kumar@linaro.org>
	<CAKohpo=ajxxanDPNpdxiJO8vvcQPxeQA29sZgeRtRg85F4CVGg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=ajxxanDPNpdxiJO8vvcQPxeQA29sZgeRtRg85F4CVGg@mail.gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, linaro-dev@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, shawn.guo@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>

On 9 January 2013 21:09, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 9 January 2013 16:50, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>> [Probably need to simplify cpufreq_add_dev() too, but that can be done as next
>> step.]
>
> I have tried that too, it is also pushed at:
>
> https://lkml.org/lkml/2012/12/16/5
>
> [Untested for now, will be doing it tomorrow]
>
> From: Viresh Kumar <viresh.kumar@linaro.org>
> Date: Wed, 9 Jan 2013 21:02:50 +0530
> Subject: [PATCH] cpufreq: Simplify cpufreq_add_dev()
>
> Currently cpufreq_add_dev() firsts allocated policy, calls ->init() and then
> checks if this cpu should be already managed or not. And if it already managed,
> free its policy.
>
> We can save all this if we somehow know if this cpu is managed or not in
> advance. policy->related_cpus contains list of all valid sibling cpus of
> policy->cpu. We can check this to know if current cpu is already managed.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>
