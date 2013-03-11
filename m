From: amit kachhap <amit.kachhap@gmail.com>
Subject: Re: [PATCH V3 1/4] cpufreq: exynos: Adding cpufreq driver for exynos5440
Date: Mon, 11 Mar 2013 09:15:50 +0530
Message-ID: <CADGdYn5hQUmYM5K=-tdsfACXKsJSb=AB+n3N8ATtzD=mFJikMw@mail.gmail.com>
References: <1362629627-10012-1-git-send-email-amit.daniel@samsung.com>
	<CAKohpokJafWjXj8hYT6tgYMGSqgnFCc3MZmNFco2tTeNkOWDmQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=xAmjpEsR21y4+rBbRD8gaAEJPSJMUknNAeuQ5W6lj0E=;
        b=g0ovFr5Ghv7Y1McnhI0oJD87XVIjqhdvaHl46x/HVAceYlOdeDYQyjOqSsqTN24oFe
         T7aPviu5PSzj96Yc2qv7+kw1kyGhBhmQPUCGnEYq2WzOt8VUERlBp7yVbSnD1gDYQxHW
         W+Mv4xxsSgz86KSqiz3T1KvTHEp72PoqClt+XHvHyjO30urdro2TlaQH2keaVhsBZpMH
         stHPwvNoGlT8uKcax7d5bDrX99k6tT80jSECtjKF/yw473UG9HX0lnfIiGaU9AGe2ZW3
         q0+xK6IlKl2GSlybkO4BvI0nHT1Q1fC9/thsLDfWLwDVlf8rq0ot6LxJ1kCA8Riyxj4q
         2T4g==
In-Reply-To: <CAKohpokJafWjXj8hYT6tgYMGSqgnFCc3MZmNFco2tTeNkOWDmQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>

Hi Viresh,

On Sat, Mar 9, 2013 at 4:17 PM, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 7 March 2013 12:13, Amit Daniel Kachhap <amit.daniel@samsung.com> wrote:
>> diff --git a/drivers/cpufreq/exynos5440-cpufreq.c b/drivers/cpufreq/exynos5440-cpufreq.c
>> +struct exynos_dvfs_data {
>> +       void __iomem *base;
>> +       struct resource *mem;
>> +       int irq;
>> +       struct clk *cpu_clk;
>> +       unsigned int cur_frequency;
>> +       unsigned int latency;
>> +       struct cpufreq_frequency_table *freq_table;
>> +       unsigned int freq_count;
>> +       struct device *dev;
>> +       bool dvfs_enable;
>
> s/enable/enabled?
Ok
>
>> +static int exynos_cpufreq_probe(struct platform_device *pdev)
>
>> +       dvfs_info->cpu_clk = devm_clk_get(dvfs_info->dev, "armclk");
>> +       if (IS_ERR_OR_NULL(dvfs_info->cpu_clk)) {
>
> s/IS_ERR_OR_NULL/IS_ERR
Ok.
>
>> +       if (devm_request_irq(dvfs_info->dev, dvfs_info->irq, exynos_cpufreq_irq,
>> +                               IRQF_TRIGGER_NONE, CPUFREQ_NAME, dvfs_info)) {
>> +               pr_err("Failed to register IRQ\n");
>> +               ret = -ENODEV;
>
> use the value returned from this function rather than creating your
> own.. true for all
> other calls too, unless they return NULL on error.
>
Will integrate your suggestions in the next version.

Thanks,
Amit D
>> +}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
