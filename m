From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/6] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Sat, 2 Feb 2013 08:18:47 +0530
Message-ID: <CAOh2x=m2Q3dA0D6utMKa_KaHaiEBzy0-EQeHT+Ybobb9bupfxg@mail.gmail.com>
References: <359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
	<1359744545-18825-1-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=q8p2+LsmtKzYXGF6csbsEnl6PCt3H4fnW3u6q+P3fsk=;
        b=KNrbyFLbWofUMzfp+UiQNZaQ8NKR49RDNjgQI6FlZzw+89BE61USA+VWfE7pis8lxW
         15iqOJqzdOl0911MxmYstXmu/65ArJVBGc+8lgOFeKeYdeuYktWWVwGWBDSb6YbBVoO3
         Dfo5L6crR3val0iWcApEzPGXzwyRh7ENw7pP+mU3/fmNjWXRL11gJNjLJvw6jR7o1bvJ
         VqlhYCFixXssD/OZJdgb0jbVS4SO7yPfgZinr1ZPyjFrLzrBVVGe72GHz9FWiaa65Qgc
         RJ2ZhTRvAjiYrQ43SyF4K3Pm4DHf3yNzuGd4PR3rTBHD6WMk20M+LBbtOFYlVPgSnAPB
         bO/Q==
In-Reply-To: <1359744545-18825-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Sat, Feb 2, 2013 at 12:19 AM,  <dirk.brandewie@gmail.com> wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c

> @@ -1219,6 +1219,9 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
>         struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
>         unsigned int ret_freq = 0;
>
> +       if (cpufreq_driver && cpufreq_driver->setpolicy && cpufreq_driver->get)
> +               return cpufreq_driver->get(cpu);

You are required to do cpufreq_cpu_put() in this case too... Better do
cpufreq_cpu_get() after your check.

> +
>         if (policy) {
>                 ret_freq = policy->cur;
>                 cpufreq_cpu_put(policy);
> --
> 1.7.7.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
