From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: instantiate cpufreq-cpu0 as a platform_driver
Date: Tue, 29 Jan 2013 10:21:56 +0530
Message-ID: <CAOh2x=kCMZHxUEh0uWDmj-22_Vrk5iegO6CZswsn_NJ3GyBc0w@mail.gmail.com>
References: <1359428020-21068-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=jBSJgmdZiwr6/1aQro2yYuankDi8zBwPl1tzlZ/E1B8=;
        b=H/w17Zk8U7OkV6QkLBSWHeJHDP8+n9qch7W8/hsCv8kd4qO9zw/FSj7rgl2FyD1XtG
         LhVpVnxPBH92eTW9woJBhwsL7UkvzmJt9L66su0lXWaegtdOj67HG1gIMx6RA3Dm1JZL
         t97zuqf7dQBC3hu9+G9ZbshLIpEXv+/mfp/Z5BqWzevt2QxzuEIZh00m2zutx8GcJPxq
         oMdVPoMRF0UYRk3MRy1T/JzEv9ztgdcCxFvGuknphoLUnPXCfxerOkFyaFC/IFGaWU+c
         zq2iJs6lV/AhsXa55Q2ONqoW4Z1Z0/MzATcONH1h3XXFH9GlQQdSdi+CxXp47VPjtWEs
         5Iug==
In-Reply-To: <1359428020-21068-1-git-send-email-shawn.guo@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawn.guo@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mark Langsdorf <mark.langsdorf@calxeda.com>, AnilKumar Ch <anilkumar@ti.com>, Tony Lindgren <tony@atomide.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

On Tue, Jan 29, 2013 at 8:23 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> As multiplatform build is being adopted by more and more ARM platforms,
> initcall function should be used very carefully.  For example, when
> GENERIC_CPUFREQ_CPU0 is built in the kernel, cpu0_cpufreq_driver_init()
> will be called on all the platforms to initialize cpufreq-cpu0 driver.
>
> To eliminate this undesired the effect, the patch changes cpufreq-cpu0
> driver to have it instantiated as a platform_driver.  Then it will only
> run on platforms that create the platform_device "cpufreq-cpu0".
>
> Along with the change, it also changes cpu_dev to be &pdev->dev,
> so that managed functions can start working, and module build gets
> supported too.
>
> The existing users of cpufreq-cpu0 driver highbank and am33xx are also
> updated accordingly to adapt the changes.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Mark Langsdorf <mark.langsdorf@calxeda.com>
> Cc: AnilKumar Ch <anilkumar@ti.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
