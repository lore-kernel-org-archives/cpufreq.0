From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/7] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Wed, 6 Feb 2013 07:55:48 +0530
Message-ID: <CAOh2x=k8EwdrMzE2qQ+vat47WcmVHzJhZjntPnqNwMqAqibXVQ@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com>
	<CAOh2x=nYOf32jKqwwikgBS2oRHwmhZdVug=pLzQZWp-N2S9CGw@mail.gmail.com>
	<5111BCDA.1060507@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=tPCMuD9Ku1DQg/0c49BqNJmcD3RE2WE5AsDkxWANbnM=;
        b=U/fbOAnAQ+Okuk0qd/SiZiSpNjNwa66txM+TsSyw2mFghmGdCUwCK5LHfrozyrD8ab
         u91918sPNtIJHtO3rjCcpCEm33q1j3bAwnDgAgfupiSouuKtq5qe3YD6ysefZAfeql67
         Dx2jVI0uTQPT9L/ZfPCm6n9Js+/RdthJV6kTJjl+/o7o6M7dsR9mxFVKAriLscLEfp1U
         7NOX4xmlUoBJ0ra9mEyto75zsxxugegKZqVtphCjE8WWyeEav1lrcUiy+lWoH4TFZ6mP
         Zj8wOxLSIIgfl1vYPCM+EM1vDCcgJ/l6zrK3PgvluBPY+HLK7YG6RZSW1o/Ulng7bGas
         /oAA==
In-Reply-To: <5111BCDA.1060507@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Wed, Feb 6, 2013 at 7:45 AM, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> How about this?
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 2817c3c..9c0eac4 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1182,7 +1182,12 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
>
>         unsigned int ret_freq = 0;
>
>         if (policy) {
> -               ret_freq = policy->cur;
>
> +               if (cpufreq_driver && cpufreq_driver->setpolicy &&
> +                       cpufreq_driver->get) {
> +                       ret_freq = cpufreq_driver->get(cpu);
> +               } else {
> +                       ret_freq = policy->cur;
> +               }
>                 cpufreq_cpu_put(policy);

The problem is: You don't need to do get/put in your case at all.
