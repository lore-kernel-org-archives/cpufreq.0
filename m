From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: ondemand: allow custom od_ops to be registered
Date: Thu, 28 Mar 2013 13:06:39 +0530
Message-ID: <CAKohpokNNOfawOuvYFnFacMwKQV9gLnhD370UU4-BiVMnft87g@mail.gmail.com>
References: <1364423841-6920-1-git-send-email-jacob.shin@amd.com>
	<1364423841-6920-2-git-send-email-jacob.shin@amd.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1364423841-6920-2-git-send-email-jacob.shin@amd.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 28 March 2013 04:07, Jacob Shin <jacob.shin@amd.com> wrote:
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> +void od_register_ops(struct od_ops *ops)
> +{
> +       if (ops->powersave_bias_init_cpu)
> +               od_ops.powersave_bias_init_cpu = ops->powersave_bias_init_cpu;
> +       if (ops->powersave_bias_target)
> +               od_ops.powersave_bias_target = ops->powersave_bias_target;
> +       if (ops->freq_increase)
> +               od_ops.freq_increase = ops->freq_increase;
> +}

We don't need to support all the three. First and last ones strictly belong
to ondemand governor.
