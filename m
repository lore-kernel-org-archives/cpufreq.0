From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos: simplify .init() for setting policy->cpus
Date: Mon, 4 Feb 2013 17:52:03 +0530
Message-ID: <CAKohpo=aWbJ9a9vKep1aGYTXr=5asYPCri1BPCww-3GxEo8F=w@mail.gmail.com>
References: <f216e85846c302756d55cb6753863a66697f79a6.1359599087.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <f216e85846c302756d55cb6753863a66697f79a6.1359599087.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, jc.lee@samsung.com
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, kgene.kim@samsung.com, Viresh Kumar <viresh.kumar@linaro.org>

On 31 January 2013 07:56, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> With the recent changes in cpufreq core, we just need to set mask of all
> possible cpus into policy->cpus. Rest would be done by core.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/exynos-cpufreq.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)

Hi Rafael,

Are you picking up this patch ?
