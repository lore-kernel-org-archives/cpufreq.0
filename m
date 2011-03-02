From: Thomas Renninger <trenn@suse.de>
Subject: Re: [2.6.38-rc7, patch] cpuinfo_cur_freq unreadable by non-root
Date: Wed, 2 Mar 2011 10:27:38 +0100
Message-ID: <201103021027.38810.trenn@suse.de>
References: <AANLkTikhgKn9ZCqUXP-K2CtSSTiJ_=tXuhF_t7Rbqgdx@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTikhgKn9ZCqUXP-K2CtSSTiJ_=tXuhF_t7Rbqgdx@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Daniel J Blueman <daniel.blueman@gmail.com>
Cc: cpufreq@vger.kernel.org, Dave Jones <davej@redhat.com>, linux@dominikbrodowski.net

Hi,

<resend, because my stupid mailer added a strange content-type header
preventing the mail to be sent to the cpufreq list (hope it works now)>

On Wednesday, March 02, 2011 06:52:05 AM Daniel J Blueman wrote:
> I failed to find why
> /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq is only readable
> by root; the cost of reading it isn't sufficient to cause memory or
> scheduling denial, but may have been in the past.
> 
> Thus, allow non-root users read permission, consistent with other
> attributes, allowing it to be monitored.
> 
> Signed-off-by: Daniel J Blueman <daniel.blueman@gmail.com>
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 1109f68..0f491fe 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -664,7 +664,7 @@ static ssize_t show_bios_limit(struct
> cpufreq_policy *policy, char *buf)
>  	return sprintf(buf, "%u\n", policy->cpuinfo.max_freq);
>  }
> 
> -cpufreq_freq_attr_ro_perm(cpuinfo_cur_freq, 0400);
> +cpufreq_freq_attr_ro(cpuinfo_cur_freq);
>  cpufreq_freq_attr_ro(cpuinfo_min_freq);
Having this read only for root goes back to the beginning
of git history of this file in 2005...
It looks like this is done on purpose, but I do not see why
this should not be readable for others.

Maybe Dominik or Dave have an idea.
Please also remove the definition of cpufreq_freq_attr_ro_perm
in include/linux/cpufreq.h, cpuinfo_cur_freq is the only
instance using it.

Thanks,

   Thomas
