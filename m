From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/2] cpufreq: imx6q: Remove unused include
Date: Fri, 7 Feb 2014 11:10:03 +0530
Message-ID: <CAKohpo=0LQ_h-qPXwvbGHse84+CMm5J7D0un30t-zcbuuoewMw@mail.gmail.com>
References: <1391699485-2212-1-git-send-email-p.zabel@pengutronix.de>
	<1391699485-2212-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1391699485-2212-2-git-send-email-p.zabel@pengutronix.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Sascha Hauer <kernel@pengutronix.de>

On 6 February 2014 20:41, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> There is no need to include delay.h.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/cpufreq/imx6q-cpufreq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
> index b1fc5ef..20f332e 100644
> --- a/drivers/cpufreq/imx6q-cpufreq.c
> +++ b/drivers/cpufreq/imx6q-cpufreq.c
> @@ -9,7 +9,6 @@
>  #include <linux/clk.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
> -#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/module.h>
>  #include <linux/of.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
