From: Francesco Lavra <francescolavra.fl@gmail.com>
Subject: Re: [PATCH V2] cpufreq: ARM big LITTLE: Add generic cpufreq driver
 and its DT glue
Date: Sat, 13 Apr 2013 22:13:58 +0200
Message-ID: <5169BC86.7010905@gmail.com>
References: <1f864ec505cae7c5daea3810a3c26e0f5cda38ea.1364290815.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=12IUGMJZ6nf7QjvA72x9oteImCwFAewtyyKVWO84wiA=;
        b=INftLdKpXVPlQp46EdBmKU3AbHPPN4q73GRQxgB8TyLASEUqmaZb76aj7VwaM2Pn8R
         166dEjcEtWmiHq/QURZVvZqUVDlkcOYHYAAqbfdmhjnE2PFlC0CJp/RlWDxq3mamYiZ6
         yUpN7ierhLp6l5EAOzbxIqykAi2E5rWJG7jnhLgbD64LOvVX9bCG5nXZWnm6FhpfTM8l
         mbKiSrI8OMQ/GhVNgB8jOb3PzM4u4ZnIpzIlIq0xMZLr/lURAQGoF8nYxwepBYne3Qhc
         eIOr3pWXBDJHKd1SSdi0aZ0X6hj7AEN38e3x27XUpLyzzmJ1AkUJ3FNcgWFahB7g/OFn
         noQA==
In-Reply-To: <1f864ec505cae7c5daea3810a3c26e0f5cda38ea.1364290815.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: rjw@sisk.pl, nicolas.pitre@linaro.org, robin.randhawa@arm.com, linux@arm.linux.org.uk, mark.hambleton@broadcom.com, linux-pm@vger.kernel.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>, devicetree-discuss@lists.ozlabs.org, Liviu.Dudau@arm.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Steve.Bannister@arm.com, arvind.chauhan@arm.com, linux-arm-kernel@lists.infradead.org, charles.garcia-tobin@arm.com

On 03/26/2013 10:51 AM, Viresh Kumar wrote:
> big LITTLE is ARM's new Architecture focussing power/performance needs of modern
> world. More information about big LITTLE can be found here:
> 
> http://www.arm.com/products/processors/technologies/biglittleprocessing.php
> http://lwn.net/Articles/481055/
> 
> In order to keep cpufreq support for all big LITTLE platforms simple/generic,
> this patch tries to add a generic cpufreq driver layer for all big LITTLE
> platforms.
> 
> The driver is divided into two parts:
> - Core driver: Generic and shared across all big LITTLE SoC's
> - Glue drivers: Per platform drivers providing ops to the core driver
> 
> This patch adds in a generic glue driver which would extract information from
> Device Tree.
> 
> Future SoC's can either reuse the DT glue or write their own depending on the
> need.
> 
> Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
[...]
> diff --git a/drivers/cpufreq/arm_big_little_dt.c b/drivers/cpufreq/arm_big_little_dt.c
> new file mode 100644
> index 0000000..452ff46
> --- /dev/null
> +++ b/drivers/cpufreq/arm_big_little_dt.c
> @@ -0,0 +1,92 @@
> +/*
> + * Generic big.LITTLE CPUFreq Interface driver
> + *
> + * It provides necessary ops to arm_big_little cpufreq driver and gets
> + * Frequency information from Device Tree. Freq table in DT must be in KHz.
> + *
> + * Copyright (C) 2013 Linaro.
> + * Viresh Kumar <viresh.kumar@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether express or implied; without even the implied warranty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/cpufreq.h>
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/opp.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include "arm_big_little.h"
> +
> +static int dt_init_opp_table(struct device *cpu_dev)
> +{
> +	struct device_node *np = NULL;
> +	int count = 0, ret;
> +
> +	for_each_child_of_node(of_find_node_by_path("/cpus"), np) {

If of_find_node_by_path() returns NULL, there will be a NULL pointer
dereference.

> +		if (count++ != cpu_dev->id)
> +			continue;
> +		if (!of_get_property(np, "operating-points", NULL))
> +			return -ENODATA;
> +
> +		cpu_dev->of_node = np;
> +
> +		ret = of_init_opp_table(cpu_dev);
> +		if (ret)
> +			return ret;
> +
> +		return 0;

of_node_put() should be called on np before returning.
Also, the reference count of the parent node should be decremented as well.

These comments apply to the below function dt_get_transition_latency() too.

> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int dt_get_transition_latency(struct device *cpu_dev)
> +{
> +	struct device_node *np = NULL;
> +	u32 transition_latency = CPUFREQ_ETERNAL;
> +	int count = 0;
> +
> +	for_each_child_of_node(of_find_node_by_path("/cpus"), np) {
> +		if (count++ != cpu_dev->id)
> +			continue;
> +
> +		of_property_read_u32(np, "clock-latency", &transition_latency);
> +		return 0;
> +	}
> +
> +	return -ENODEV;
> +}

--
Francesco
