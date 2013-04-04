From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V4 1/2] cpufreq: ondemand: allow custom
 powersave_bias_target handler to be registered
Date: Thu, 4 Apr 2013 21:12:25 +0200
Message-ID: <20130404191225.GH32271@pd.tnic>
References: <1365092344-11310-1-git-send-email-jacob.shin@amd.com>
 <1365092344-11310-2-git-send-email-jacob.shin@amd.com>
 <CAKohpom6BSJZc_ohgnjRTV2EBUAPy8TKVphtoRaNSt1wFP70uA@mail.gmail.com>
 <20130404171804.GA4696@jshin-Toonie>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1365102748; bh=rAQkkcnAnbASlSr2Y7hdsTD61Zf2bMLHjN3yJ51Isr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=XBrO+yqN6iXGtRPlHCuPTIp4u1lhR9/ybiMw9y
	XSQ8FjnzzHdqNgIu8D+Qs2SjKMkNHrV6MtCvG7FgtA7f58DYC/6/SzMdsmZP3E8qS/I
	qVcy/I7kqn/wCfCYAPHrXuaLc8kAHOVfON4Nrsri9PCZ5W/88uz5wyLapZlskVB3tE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1365102748; bh=rAQkkcnAnbASlSr2Y7hdsTD61Zf2bMLHjN3yJ51Isr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=XBrO+yqN6iXGtRPlHCuPTIp4u1lhR9/ybiMw9y
	XSQ8FjnzzHdqNgIu8D+Qs2SjKMkNHrV6MtCvG7FgtA7f58DYC/6/SzMdsmZP3E8qS/I
	qVcy/I7kqn/wCfCYAPHrXuaLc8kAHOVfON4Nrsri9PCZ5W/88uz5wyLapZlskVB3tE=
Content-Disposition: inline
In-Reply-To: <20130404171804.GA4696@jshin-Toonie>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>

On Thu, Apr 04, 2013 at 12:18:04PM -0500, Jacob Shin wrote:
> @@ -574,6 +577,45 @@ static struct common_dbs_data od_dbs_cdata = {
>  	.exit = od_exit,
>  };
>  
> +static void od_set_powersave_bias(unsigned int powersave_bias)
> +{
> +	struct cpufreq_policy *policy;
> +	struct dbs_data *dbs_data;
> +	struct od_dbs_tuners *od_tuners;
> +	unsigned int cpu;
> +	cpumask_t done;
> +
> +	cpumask_clear(&done);
> +

get_online_cpus();

> +	for_each_online_cpu(cpu) {
> +		if (cpumask_test_cpu(cpu, &done))
> +			continue;
> +
> +		policy = per_cpu(od_cpu_dbs_info, cpu).cdbs.cur_policy;
> +		dbs_data = policy->governor_data;
> +		od_tuners = dbs_data->tuners;
> +		od_tuners->powersave_bias = powersave_bias;
> +
> +		cpumask_or(&done, &done, policy->cpus);
> +	}

put_online_cpus();

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
