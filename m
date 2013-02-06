From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 2/7] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Wed, 6 Feb 2013 07:15:47 +0530
Message-ID: <CAOh2x=nYOf32jKqwwikgBS2oRHwmhZdVug=pLzQZWp-N2S9CGw@mail.gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
	<1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=2ZM/G316vGv9i/OMbADG7ncqvZ469u5+g2q5uKfhzH8=;
        b=nZVCa3MEd2P7o3/sWbmLu8zHEpsqUFTh/t2HZZc0GAU8lBiXaq6ksk194DeyOrOS+0
         bxVq9+QHIt9jMN87PWfdD0PscyZz8kUb9neB2wTFLjQEJiJG1QqPx5g9QNeHcN3myILP
         UvObhu52oFapueAf78Pho3kG2ykhm1Lo0b/kUoqYIEgL9z3Wd0GIlTjT6+d5RiRFudxx
         XZcoC+sYAeBxmuLhnKXfslGU5n4tJDtw0Pg5o6r76fPmITWD0YDNlb4jKLrE+64kS6ao
         44vtYuxksbg0nU3QvIzXx0x4YI836/YHpvVURMRUna0uMtwZSAoUa0oQGPyyFJpf6Api
         7MQQ==
In-Reply-To: <1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dirk.brandewie@gmail.com
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 2817c3c..96bc302 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -1181,6 +1181,13 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
>         struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
>         unsigned int ret_freq = 0;
>
> +       if (cpufreq_driver && cpufreq_driver->setpolicy &&
> +               cpufreq_driver->get) {
> +               ret_freq = cpufreq_driver->get(cpu);
> +               cpufreq_cpu_put(policy);
> +               return ret_freq;
> +       }
> +

This was my comment on the last version:

"You are required to do cpufreq_cpu_put() in this case too... Better do
cpufreq_cpu_get() after your check."

It still applies.
