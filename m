From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V4 1/2] cpufreq: ondemand: allow custom
 powersave_bias_target handler to be registered
Date: Thu, 4 Apr 2013 22:06:35 +0530
Message-ID: <CAKohpom6BSJZc_ohgnjRTV2EBUAPy8TKVphtoRaNSt1wFP70uA@mail.gmail.com>
References: <1365092344-11310-1-git-send-email-jacob.shin@amd.com>
	<1365092344-11310-2-git-send-email-jacob.shin@amd.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1365092344-11310-2-git-send-email-jacob.shin@amd.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>, Borislav Petkov <bp@alien8.de>

On 4 April 2013 21:49, Jacob Shin <jacob.shin@amd.com> wrote:
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c

> +static void od_set_powersave_bias(unsigned int powersave_bias)
> +{
> +       unsigned int cpu;
> +       struct od_dbs_tuners *od_tuners;
> +
> +       if (!have_governor_per_policy()) {
> +               od_tuners = od_dbs_cdata.gdbs_data->tuners;
> +               od_tuners->powersave_bias = powersave_bias;
> +               return;
> +       }
> +
> +       for_each_online_cpu(cpu) {
> +               struct cpufreq_policy *policy;
> +               struct dbs_data *dbs_data;
> +               policy = per_cpu(od_cpu_dbs_info, cpu).cdbs.cur_policy;
> +               dbs_data = policy->governor_data;
> +               od_tuners = dbs_data->tuners;
> +               od_tuners->powersave_bias = powersave_bias;
> +       }

You can keep only the for_each_online_cpu() loop and remove the other
one. And in that one also, you don't have to do this for every cpu...

something like this will help you...

cpus_processed = NULL;

for_each_online_cpu(cpu) {
    if cpu-is-present-in cpus_processed
        continue;

    cpu-set-mask(cpus_processed, policy->cpus);

}

Syntax is poor, please choose the correct one.

> +}
