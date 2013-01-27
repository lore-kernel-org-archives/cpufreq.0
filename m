From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v3 1/3] cpufreq: kirkwood: Add a cpufreq driver for
 Marvell Kirkwood SoCs
Date: Sun, 27 Jan 2013 20:19:56 +0530
Message-ID: <CAKohpomWM41MhRjdhFixy-ELXc6QjE0BhCAHfTzovOD0CBPoOQ@mail.gmail.com>
References: <1359281244-31455-1-git-send-email-andrew@lunn.ch>
	<1359281244-31455-2-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1359281244-31455-2-git-send-email-andrew@lunn.ch>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, rjw@sisk.pl, cpufreq@vger.kernel.org, linux ARM <linux-arm-kernel@lists.infradead.org>, jacmet@sunsite.dk

On 27 January 2013 15:37, Andrew Lunn <andrew@lunn.ch> wrote:
> diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
> +static void kirkwood_cpufreq_set_cpu_state(unsigned int index)
> +{

> +       if (freqs.old != freqs.new) {

> +               switch (state) {
> +               case STATE_CPU_FREQ:
> +                       clk_disable(priv.powersave_clk);
> +                       break;
> +               case STATE_DDR_FREQ:
> +                       clk_enable(priv.powersave_clk);
> +                       break;
> +               default:
> +                       WARN_ON(1);

I still don't feel this case is required :)

> +               }

> +static struct cpufreq_driver kirkwood_cpufreq_driver = {
> +       .get    = kirkwood_cpufreq_get_cpu_frequency,
> +       .verify = kirkwood_cpufreq_verify,
> +       .target = kirkwood_cpufreq_target,
> +       .init   = kirkwood_cpufreq_cpu_init,
> +       .exit   = kirkwood_cpufreq_cpu_exit,
> +       .name   = "kirkwood_freq",
> +       .owner  = THIS_MODULE,
> +       .attr   = kirkwood_cpufreq_attr,
> +};
> +
> +static int kirkwood_cpufreq_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np = of_find_compatible_node(
> +               NULL, NULL, "marvell,kirkwood-core-clock");

np can be NULL here, want to check?

> +       np = of_find_compatible_node(NULL, NULL,
> +                                    "marvell,kirkwood-gating-clock");

here too.

> +}

> +static struct platform_driver kirkwood_cpufreq_platform_driver = {
> +       .probe = kirkwood_cpufreq_probe,
> +       .remove = kirkwood_cpufreq_remove,
> +       .driver = {
> +               .name = "kirkwood-cpufreq",
> +               .owner = THIS_MODULE,
> +       },
> +};

Two things. Any reason why you created an extra layer of platform_driver?
You could have called cpufreq_probe/remove (with names modified) from
module init/exit.

Also, in case you want to keep it (which i don't feel is required),
then would make
sense to keep same names in .name field for both structures.
