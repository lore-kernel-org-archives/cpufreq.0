From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq: ondemand: update frequency when limits are relaxed
Date: Sat, 8 Sep 2012 22:30:49 +0200
Message-ID: <201209082230.49760.rjw@sisk.pl>
References: <F22FC3EF73EF0942A7CD99A3AC5E4E1F380AF6B7BF@HQMAIL04.nvidia.com> <201209072258.43899.rjw@sisk.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201209072258.43899.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Michal Pecio <mpecio@nvidia.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Thomas Renninger <trenn@suse.de>

On Friday, September 07, 2012, Rafael J. Wysocki wrote:
> On Friday, August 31, 2012, Michal Pecio wrote:
> > From: Michal Pecio <mpecio@nvidia.com>
> > 
> > Reevaluate CPU load and update frequency immediately whenever limits 
> > are changed. Currently ondemand doesn't do so when limits are relaxed,
> > wasting power on CPUs with relatively low sampling rate.
> > Also, update the prev_cpu_* variables on frequency transitions. Their
> > old values aren't valid anymore because the governor assumes constant
> > frequency during entire sampling period.
> > 
> > Signed-off-by: Michal Pecio <mpecio@nvidia.com>
> 
> Applied to the linux-next branch of the linux-pm.git tree as v3.7 material.

Turns out to cause problems to happen, so reverting.

Thanks,
Rafael


> > ---
> > 
> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> > index 1aaf7af..8cee63e 100644
> > --- a/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -754,12 +754,7 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
> >  
> >  	case CPUFREQ_GOV_LIMITS:
> >  		mutex_lock(&this_dbs_info->timer_mutex);
> > -		if (policy->max < this_dbs_info->cur_policy->cur)
> > -			__cpufreq_driver_target(this_dbs_info->cur_policy,
> > -				policy->max, CPUFREQ_RELATION_H);
> > -		else if (policy->min > this_dbs_info->cur_policy->cur)
> > -			__cpufreq_driver_target(this_dbs_info->cur_policy,
> > -				policy->min, CPUFREQ_RELATION_L);
> > +		dbs_check_cpu(this_dbs_info);
> >  		mutex_unlock(&this_dbs_info->timer_mutex);
> >  		break;
> >  	}
> > -----------------------------------------------------------------------------------
> > This email message is for the sole use of the intended recipient(s) and may contain
> > confidential information.  Any unauthorized review, use, disclosure or distribution
> > is prohibited.  If you are not the intended recipient, please contact the sender by
> > reply email and destroy all copies of the original message.
> > -----------------------------------------------------------------------------------
> > 
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

