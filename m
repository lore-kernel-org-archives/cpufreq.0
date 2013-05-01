From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V2] cpufreq: cpufreq-cpu0: defer probe when regulator is
 not ready
Date: Wed, 1 May 2013 10:06:18 +0530
Message-ID: <CAKohpomaBC8zOxiKJj8QHLcwiVYT6n8hAbQamGixdW7b7sBJ_Q@mail.gmail.com>
References: <1367334782-32484-1-git-send-email-nm@ti.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1367334782-32484-1-git-send-email-nm@ti.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishanth Menon <nm@ti.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On 30 April 2013 20:43, Nishanth Menon <nm@ti.com> wrote:
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

My earlier Ack was a waste of money :)

> diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
> index 37d23a0..e472167 100644
> --- a/drivers/cpufreq/cpufreq-cpu0.c
> +++ b/drivers/cpufreq/cpufreq-cpu0.c
> @@ -200,6 +200,20 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
>         cpu_dev = &pdev->dev;
>         cpu_dev->of_node = np;
>
> +       cpu_reg = devm_regulator_get(cpu_dev, "cpu0");
> +       if (IS_ERR(cpu_reg)) {
> +               /*
> +                * If cpu0 regulator supply node is present, but regulator is
> +                * not yet registered, we should try defering probe.
> +                */
> +               if (PTR_ERR(cpu_reg) == -EPROBE_DEFER) {
> +                       dev_err(cpu_dev, "cpu0 regulator not ready, retry\n");
> +                       return -EPROBE_DEFER;

You need to do following here:

	of_node_put(np);
	of_node_put(parent);

better mark ret = -EPROBE_DEFER;
and do a goto out_put_node.
