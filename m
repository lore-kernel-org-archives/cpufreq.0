From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: fix sign check of an unsigned variable in cpufreq-cpu0
Date: Mon, 25 Feb 2013 17:39:47 +0530
Message-ID: <CAOh2x=n-G0BwhjH+VXgy=+nbsaH0+5FqWHhDoyU=xWp-EH9Zdg@mail.gmail.com>
References: <Pine.LNX.4.64.1302251227140.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=XVqtPU98T6hL+2Afe2hky7mdY07UXjp4NTp3ASkQjyY=;
        b=IuRzyzBujy9yOfhYDufKjlNA77tS1AMDnm3WDMR+uZ2CI/y89tlSguPHhdXcISvAy3
         DngB/gPqmK209fHg9Puk6yX8CzMASWfGqsldG0zEH9clIRPi4C0H0KRbTo7nKln1BMZd
         fqW+PhQ2LD2s/xZUIFeGV/wHsYr6zJpAmbA7YOC7d/LkyPCn2xemfUa9GMkveaiJ85Wj
         9EVJUhmWDQ6mNCPVLyyp1dHFgjjCzmgae9N5ZFSjPUcjMqyeSEP4Y2GxT6HG9Ej6sTmT
         KzgYRh3N/a8TTV0S+Cwt6xX2kUT8yWu8cSErfQOrU+wjGhqaXdzhkG9aeIK/WipGgP7o
         BNjw==
In-Reply-To: <Pine.LNX.4.64.1302251227140.3030@axis700.grange>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Mike Turquette <mturquette@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 25, 2013 at 5:02 PM, Guennadi Liakhovetski
<g.liakhovetski@gmx.de> wrote:
> A "< 0" test for an unsigned variable is meaningless, change the variable
> to signed.
>
> Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> ---
>
> stable?
>
>  drivers/cpufreq/cpufreq-cpu0.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
> index 52bf36d..e7bad3c 100644
> --- a/drivers/cpufreq/cpufreq-cpu0.c
> +++ b/drivers/cpufreq/cpufreq-cpu0.c
> @@ -44,7 +44,8 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
>  {
>         struct cpufreq_freqs freqs;
>         struct opp *opp;
> -       unsigned long freq_Hz, volt = 0, volt_old = 0, tol = 0;
> +       unsigned long volt = 0, volt_old = 0, tol = 0;
> +       long freq_Hz;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

The disease is spread across a bigger region though.

@Mike: clk_round_rate returns long and __clk_round_rate returns unsigned long
and clk_ops->round_rate returns long again.. Don't you see something
strange here?
