From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH V2 Resend 28/92] cpufreq: s5pv210: Use generic cpufreq
 routines
Date: Sat, 05 Oct 2013 11:28:49 +0900
Message-ID: <0d8b01cec172$9fd82c20$df888460$@org>
References: <cover.1380783079.git.viresh.kumar@linaro.org>
 <f675427788a1fb09d6fb9002bead956921c88846.1380783079.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <f675427788a1fb09d6fb9002bead956921c88846.1380783079.git.viresh.kumar@linaro.org>
Content-language: ko
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Viresh Kumar' <viresh.kumar@linaro.org>, rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Viresh Kumar wrote:
> 
> Most of the CPUFreq drivers do similar things in .exit() and .verify()
> routines
> and .attr. So its better if we have generic routines for them which can be
> used
> by cpufreq drivers then.
> 
> This patch uses these generic routines for this driver.
> 
> Cc: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/s5pv210-cpufreq.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)

