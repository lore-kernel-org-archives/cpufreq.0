From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 22:59:13 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021205913.GK26971@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>

A few comments on this patch.

> + *  Copyright (C)  2001 Russell King
> + *            (C)  2002 - 2003 Dominik Brodowski <linux@brodo.de>

As nothing in this driver is from me, please remove my copyright

> + * $Id:$

No need for an ID tag -- you can remove that as well.

> +#define DBS_RATE		(HZ/4)	/* timer rate is 250ms */
> +#define LOW_LATENCY_FREQUENCY_CHANGE_LIMIT 	100 /* in uS */
That's really low. latency_timer is in 10^(-9) s == ns [see cpufreq.h], so I 
think you're missing a factor of 1000 here -- but maybe some drivers miss a 
factor of 1000, too...

> +static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
> +				   unsigned int event)
> +{
> +	unsigned int cpu = policy->cpu;
> +
> +	switch (event) {
> +	case CPUFREQ_GOV_START:
> +		if ((!cpu_online(cpu)) || (!try_module_get(THIS_MODULE)) || !policy->cur)
> +			return -EINVAL;

You needn't worry about try_module_get()/put_module() and friends. That's handled by
the cpufreq core already.


	Dominik
