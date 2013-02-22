From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH -next] imx6q-cpufreq: fix return value check in imx6q_cpufreq_probe()
Date: Fri, 22 Feb 2013 10:51:30 +0530
Message-ID: <CAOh2x==C=BHTP5-b2MCYUJbWntzy7UO3E_2NaTxnjELR=XRYOw@mail.gmail.com>
References: <CAPgLHd_sbN0i_6Lqh+-2o9rZx_CG3=czZJV3N6oAuSKrjkttbw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=KPQne4jBqoEz1IGhncpZueCFSJ/mDy2nF/yW7LYbVUQ=;
        b=O5Rsf51kvZYv5XxCWdsRxnL5OaD8bYDE3J2/2dYKQBBFnUBId/pqLWodIsJsQ81Cz+
         1cjHxdNV4dMHqmlWc+5l63RjZJzgGAEBVStdzw6L60VkBSQPGZbERk+GgAXLUYqKLXU5
         HwIAsMBH6/zvzH8jkXCgKElOoIpWz2qDSn4bjCWvqnXd2cxPe4grDuHxJwKPnNJ7g2UA
         CAQpzwErprHW601kT8dzXbxGnpG2OlrnyBQM9Tobn6uuKqeUDELL1an8+JQYkfQdD7va
         Vnm+DrbS9iOngO2gxRK3Klouzwj8lKJSkl64BChBmSCjzcfZ0qm13bzc91ljq0rALPKm
         zg7Q==
In-Reply-To: <CAPgLHd_sbN0i_6Lqh+-2o9rZx_CG3=czZJV3N6oAuSKrjkttbw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: rjw@sisk.pl, shawn.guo@linaro.org, yongjun_wei@trendmicro.com.cn, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On Fri, Feb 22, 2013 at 10:09 AM, Wei Yongjun <weiyj.lk@gmail.com> wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> In case of error, the function devm_regulator_get() returns
> ERR_PTR() and never returns NULL. The NULL test in the return
> value check should be replaced with IS_ERR().
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
> index d6b6ef3..54e336d 100644
> --- a/drivers/cpufreq/imx6q-cpufreq.c
> +++ b/drivers/cpufreq/imx6q-cpufreq.c
> @@ -245,7 +245,7 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
>         arm_reg = devm_regulator_get(cpu_dev, "arm");
>         pu_reg = devm_regulator_get(cpu_dev, "pu");
>         soc_reg = devm_regulator_get(cpu_dev, "soc");
> -       if (!arm_reg || !pu_reg || !soc_reg) {
> +       if (IS_ERR(arm_reg) || IS_ERR(pu_reg) || IS_ERR(soc_reg)) {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
