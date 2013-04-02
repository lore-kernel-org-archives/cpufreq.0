From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH V2 1/2] cpufreq: ondemand: allow custom
 powersave_bias_target function to be registered
Date: Tue, 2 Apr 2013 15:31:14 +0200
Message-ID: <20130402133114.GC5488@pd.tnic>
References: <1364495057-14939-1-git-send-email-jacob.shin@amd.com>
 <1364495057-14939-2-git-send-email-jacob.shin@amd.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364909475; bh=tKlrCjAWfe0Tq1aIasgpN/s1tyWkkZuVkrQqiPCPD/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ZgI4WqjK22lqKBu4DdGxe7SbJc2bZzWVFpiKKe
	FubB9XeFMD3pH2aWvnb7JsQeMsZ585DSGfkCGWfoGWlxfIkGAFoA1gdE3DvG/wZidV8
	9xNRXrqthEQyRbEi5WRW4dlzugDN6kpbXTVw897LVabXtMBeNGWYi47gwB7iuYW+zc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364909475; bh=tKlrCjAWfe0Tq1aIasgpN/s1tyWkkZuVkrQqiPCPD/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To; b=ZgI4WqjK22lqKBu4DdGxe7SbJc2bZzWVFpiKKe
	FubB9XeFMD3pH2aWvnb7JsQeMsZ585DSGfkCGWfoGWlxfIkGAFoA1gdE3DvG/wZidV8
	9xNRXrqthEQyRbEi5WRW4dlzugDN6kpbXTVw897LVabXtMBeNGWYi47gwB7iuYW+zc=
Content-Disposition: inline
In-Reply-To: <1364495057-14939-2-git-send-email-jacob.shin@amd.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>

On Thu, Mar 28, 2013 at 01:24:16PM -0500, Jacob Shin wrote:
> @@ -206,8 +209,8 @@ static void od_check_cpu(int cpu, unsigned int load_freq)
>  			__cpufreq_driver_target(policy, freq_next,
>  					CPUFREQ_RELATION_L);
>  		} else {
> -			int freq = powersave_bias_target(policy, freq_next,
> -					CPUFREQ_RELATION_L);
> +			int freq = od_ops.powersave_bias_target(policy,
> +					freq_next, CPUFREQ_RELATION_L);
>  			__cpufreq_driver_target(policy, freq,
>  					CPUFREQ_RELATION_L);

Btw, one more thing: you can simplify this code a bit, while you're at
it:

                if (!od_tuners->powersave_bias) {
                        __cpufreq_driver_target(policy, freq_next,
						CPUFREQ_RELATION_L);
			return;
		}

		freq_next = od_ops.powersave_bias_target(policy, freq_next, CPUFREQ_RELATION_L);
		__cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
	}

and drop the local "int freq" too.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
