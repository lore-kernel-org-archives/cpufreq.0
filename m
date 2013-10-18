From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 5/5] ARM: vexpress/TC2: register vexpress-spc cpufreq
 device
Date: Fri, 18 Oct 2013 14:58:58 -0400 (EDT)
Message-ID: <alpine.LFD.2.03.1310181457010.1951@syhkavp.arg>
References: <1381931563-16785-1-git-send-email-Sudeep.KarkadaNagesha@arm.com> <1381931563-16785-6-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1381931563-16785-6-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Pawel Moll <Pawel.Moll@arm.com>

On Wed, 16 Oct 2013, Sudeep KarkadaNagesha wrote:

> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
> 
> This patch adds vexpress-spc platform device to enables the vexpress
> SPC cpufreq interface driver.
> 
> Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
> Cc: Pawel Moll <Pawel.Moll@arm.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  arch/arm/mach-vexpress/spc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-vexpress/spc.c b/arch/arm/mach-vexpress/spc.c
> index a8b8310..4ddfbfe 100644
> --- a/arch/arm/mach-vexpress/spc.c
> +++ b/arch/arm/mach-vexpress/spc.c
> @@ -25,6 +25,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/opp.h>
> +#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/semaphore.h>
>  
> @@ -532,6 +533,7 @@ static int __init ve_spc_clk_init(void)
>  			pr_warn("failed to initialise cpu%d opp table\n", cpu);
>  	}
>  
> +	platform_device_register_simple("vexpress-spc-cpufreq", -1, NULL, 0);
>  	return 0;
>  }
>  module_init(ve_spc_clk_init);

OK... this solves my concern about initcall ordering.  Please just 
disregard my suggestions on patch #3.  I'd suggest folding this patch 
into patch 3/5 though.


Nicolas
