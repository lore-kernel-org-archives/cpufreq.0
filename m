From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] cpufreq: Fix timer/workqueue corruption by protecting
 reading governor_enabled
Date: Thu, 2 Jan 2014 15:26:38 -0800
Message-ID: <20140102232638.GA21548@core.coreip.homeip.net>
References: <1388632482-16921-1-git-send-email-jiel@marvell.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=XoU8mqFNlsAn2XN6P4FQSQB9C0oYwx3fXA9F+z8wWOc=;
        b=HTdrZJOZl7X4IJpPNhYs+xoDrHawACJjARn2h2t1g57F1RGvIl/GU2Xt9zbNTUNTcs
         QLrHv/oZmhDesuhwy8um2KNAD1+ym3psWpiTG7ojuUXgdJUECqfcjZYAUOwdlutBd8KQ
         N/Jcmfhe+ZXMqUvFrwYs2aYlb8+Qw3sB4ipP6LvcHRXPYt96ctBVxXmBgDs/Yij5gOFi
         xp8vpvf84D5Lvi0NnHHD0jXsJOxKn0BGGnqSPUojhwRNHXMkqDMNZWQe3DCJFYPJTqJr
         0sXAmTaxdv/FhFQORC7YOXdbOYcYeFIDYLIJlkzGSk731nxfj0kA0WpYP1kheAyNi1sp
         IH9w==
Content-Disposition: inline
In-Reply-To: <1388632482-16921-1-git-send-email-jiel@marvell.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jiel@marvell.com
Cc: rjw@rjwysocki.net, viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Jane:

On Thu, Jan 02, 2014 at 11:14:42AM +0800, jiel@marvell.com wrote:
> @@ -119,8 +121,11 @@ void gov_queue_work(struct dbs_data *dbs_data, struct cpufreq_policy *policy,
>  {
>  	int i;
>  
> -	if (!policy->governor_enabled)
> +	mutex_lock(&cpufreq_governor_lock);
> +	if (!policy->governor_enabled) {
> +		mutex_unlock(&cpufreq_governor_lock);
>  		return;
> +	}
>  
>  	if (!all_cpus) {
>  		/*
> @@ -135,6 +140,7 @@ void gov_queue_work(struct dbs_data *dbs_data, struct cpufreq_policy *policy,
>  		for_each_cpu(i, policy->cpus)
>  			__gov_queue_work(i, dbs_data, delay);
>  	}
> +	mutex_unlock(&cpufreq_governor_lock);

Unlocking in different branches is not the best practice IMO, I'd
recommend doing:

	mutex_lock(&cpufreq_governor_lock);

	if (!policy->governor_enabled)
		goto out_unlock;

	...

out_unlock:
	mutex_unlock(&cpufreq_governor_lock);

Thanks!

-- 
Dmitry
