From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3] cpufreq: Add cpufreq driver for Freescale e500mc SoCs
Date: Sat, 30 Mar 2013 19:22:28 +0530
Message-ID: <CAOh2x=k2cchYWnX0AitOjCOfP_mC-=cm2sm4qhrGv0S9ywzP2g@mail.gmail.com>
References: <1364536350-23788-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=qJZ2v9xzBUaITxxxD/3/jgiy6EVamufwGcrGiuJKjKg=;
        b=HClrx0fySw1acRXJA6lIEbahD2/yQ26XLLwq3048Egf1OMS1evcOaMwFf1f+vmyaHn
         n8or2NQ7X5TWVgm2aRwZDIWr/m8Iy14jC7NbVIQikga3dgKX2RjiMWvQP8jxUsIJNmBR
         Yw7gaCWELAdiCyhgDsI6T6ZC/KB0FchTCPk5fWB4yI1Q2FJgxkMzHj+/NCjDTx9yhMbV
         h44QLa0HfPAQmXyrs2pWppwTkBLaIxu2CReF0mUN3QaEeXwrCAmbYndloPLGVrwB5t2U
         TWElioWZ0wTtRkt/ZrLqGlK8tQ+dssOK+TlPAUN4igpeuCSZhy8m9F4+f4IqR9+koLIS
         uKcQ==
In-Reply-To: <1364536350-23788-1-git-send-email-Yuantian.Tang@freescale.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuantian.Tang@freescale.com
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, Li Yang <leoli@freescale.com>

On Fri, Mar 29, 2013 at 11:22 AM,  <Yuantian.Tang@freescale.com> wrote:
> diff --git a/drivers/cpufreq/ppc-corenet-cpufreq.c b/drivers/cpufreq/ppc-corenet-cpufreq.c

> +static int corenet_cpufreq_cpu_init(struct cpufreq_policy *policy)
> +{

> +       for (i = 0; i < count; i++) {
> +               table[i].index = i;

One more thing, you don't need to set index at all as you aren't using it.
And cpufreq core never uses it.

> +               clk = of_clk_get(data->parent, i);
> +               table[i].frequency = clk_get_rate(clk) / 1000;
> +       }
