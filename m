From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: Correct header guards typo
Date: Tue, 2 Apr 2013 18:41:20 +0530
Message-ID: <CAOh2x=nJTcaEAe5eS4JzHLY_vUx0HJo9pDD7exoq0OffMqzJDQ@mail.gmail.com>
References: <1364905575-10234-1-git-send-email-bp@alien8.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=xBcD1UJssoLMJu3SlYP6CFwGHjdU9zeGi883jsr1UzQ=;
        b=wAExNn0Xal73EKSJZ+p0dTpAqVoSfyqZCM1G/Iz8l2iJgjJGjoK6oTfu/hBbm5zzeB
         RWeUlAyH2frmC4/6JenEppcrymnrtVnutFeaUjwJ3ED/PqT9e1Y0uJ8IzWFx91KYXiE9
         kuN1m6sQrujbJN9mpaIOKBkjrAjuRqvAUQ9f2Mn4XtfM88zaHNOkX0nSkymd7efp7R9m
         nYQ/7Br+BAZTHcyRjsCe8ZSi6Na8FfxBfyZt5iMUFNBPrV8cdz1oQnyVsWSmiptJ4RJe
         odwbqrxGaGCtfX9cNjatnLgQmwmWwpP6kSBK8w/Vn+473z0PVZJPfEj8wZMToxQVr1iP
         GcyA==
In-Reply-To: <1364905575-10234-1-git-send-email-bp@alien8.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

On Tue, Apr 2, 2013 at 5:56 PM, Borislav Petkov <bp@alien8.de> wrote:
> From: Borislav Petkov <bp@suse.de>
>
> It should be "governor".
>
> Signed-off-by: Borislav Petkov <bp@suse.de>
> ---
>  drivers/cpufreq/cpufreq_governor.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 513cc8234e5e..65937697cab3 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -14,8 +14,8 @@
>   * published by the Free Software Foundation.
>   */
>
> -#ifndef _CPUFREQ_GOVERNER_H
> -#define _CPUFREQ_GOVERNER_H
> +#ifndef _CPUFREQ_GOVERNOR_H
> +#define _CPUFREQ_GOVERNOR_H
>
>  #include <linux/cpufreq.h>
>  #include <linux/kobject.h>
> @@ -263,4 +263,4 @@ int cpufreq_governor_dbs(struct cpufreq_policy *policy,
>                 struct common_dbs_data *cdata, unsigned int event);
>  void gov_queue_work(struct dbs_data *dbs_data, struct cpufreq_policy *policy,
>                 unsigned int delay, bool all_cpus);
> -#endif /* _CPUFREQ_GOVERNER_H */
> +#endif /* _CPUFREQ_GOVERNOR_H */

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
