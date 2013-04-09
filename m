From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4] cpufreq: powerpc: Add cpufreq driver for Freescale
 e500mc SoCs
Date: Tue, 9 Apr 2013 15:17:11 +0530
Message-ID: <CAKohpokVf0hCokDL62WeaUdYEBycf+Kh_cRgWxTR--_12xjEBA@mail.gmail.com>
References: <1365496365-28450-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1365496365-28450-1-git-send-email-Yuantian.Tang@freescale.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuantian.Tang@freescale.com
Cc: rjw@sisk.pl, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Li Yang <leoli@freescale.com>

Mostly good now, V5 should be the final one.

On 9 April 2013 14:02,  <Yuantian.Tang@freescale.com> wrote:
> diff --git a/drivers/cpufreq/ppc-corenet-cpufreq.c b/drivers/cpufreq/ppc-corenet-cpufreq.c

> +static int corenet_cpufreq_target(struct cpufreq_policy *policy,
> +               unsigned int target_freq, unsigned int relation)
> +{
> +       struct cpufreq_freqs freqs;
> +       unsigned int new;
> +       struct clk *parent;
> +       int ret;
> +       struct cpu_data *data = per_cpu(cpu_data, policy->cpu);
> +
> +       cpufreq_frequency_table_target(policy, data->table,
> +                       target_freq, relation, &new);
> +
> +       if (policy->cur == data->table[new].frequency)
> +               return 0;
> +
> +       freqs.old = policy->cur;
> +       freqs.new = data->table[new].frequency;
> +       freqs.cpu = policy->cpu;

You don't need to set freqs.cpu..

> +       mutex_lock(&cpufreq_lock);
> +       cpufreq_notify_transition(policy, &freqs, CPUFREQ_PRECHANGE);
> +
> +       parent = of_clk_get(data->parent, new);
> +       ret = clk_set_parent(data->clk, parent);
> +       if (ret) {
> +               freqs.new = freqs.old;
> +               cpufreq_notify_transition(policy, &freqs, CPUFREQ_POSTCHANGE);
> +               mutex_unlock(&cpufreq_lock);
> +               return ret;
> +       }
> +
> +       cpufreq_notify_transition(policy, &freqs, CPUFREQ_POSTCHANGE);
> +       mutex_unlock(&cpufreq_lock);

What about writing it as:

+       ret = clk_set_parent(data->clk, parent);
+       if (ret)
+               freqs.new = freqs.old;
+
+       cpufreq_notify_transition(policy, &freqs, CPUFREQ_POSTCHANGE);
+       mutex_unlock(&cpufreq_lock);

return ret;

> +       return 0;
> +}
