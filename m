From: Lutz Vieweg <lkv@isg.de>
Subject: Re: [patches] 2.6.2 to 2.6.3 regression: powernow-k8 doesn't work
 anymore
Date: Mon, 01 Mar 2004 11:12:40 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40430C98.3020702@isg.de>
References: <4038ED24.3080402@isg.de> <20040222231431.GA24835@elf.ucw.cz>
	<403E8248.2040902@isg.de> <20040228001649.GJ425@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040228001649.GJ425@elf.ucw.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pavel Machek <pavel@suse.cz>
Cc: patches@x86-64.org, cpufreq@www.linux.org.uk

Pavel Machek wrote:

>>A factor 1000 lost somewhere?
> 
> Yes.
> 
> Try this one. [Warning: extremely ugly hand-edited patch follows;
> taking akpm off Cc list, I do not want him to even see it]

This second patch (applied addtionally to the first one) fixes
the cpufreq behaviour for the K8V board - thanks!

Regards,

Lutz Vieweg

> 
> --- clean/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-20 12:29:10.000000000 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-02-23 21:06:01.000000000 +0100
> @@ -8,6 +8,8 @@
>   *
>   *  Based on the powernow-k7.c module written by Dave Jones.
>   *  (C) 2003 Dave Jones <davej@codemonkey.ork.uk> on behalf of SuSE Labs
> + *  (C) 2004 Dominik Brodowski <linux@brodo.de>
> + *  (C) 2004 Pavel Machek <pavel@suse.cz>
>   *  Licensed under the terms of the GNU GPL License version 2.
>   *  Based upon datasheets & sample CPUs kindly provided by AMD.
>   *
> @@ -34,10 +36,6 @@
>  #define VERSION "version 1.00.08a"
>  #include "powernow-k8.h"
>  
> -#ifdef CONFIG_PREEMPT
> -#warning this driver has not been tested on a preempt system
> -#endif
> -
>  static u32 vstable;	/* voltage stabalization time, from PSB, units 20 us */
>  static u32 plllock;	/* pll lock time, from PSB, units 1 us */
>  static u32 numps;	/* number of p-states, from PSB */
> @@ -521,7 +519,8 @@
>  		}
>  		if ((pst[j].fid > MAX_FID)
>  		    || (pst[j].fid & 1)
> -		    || (pst[j].fid < HI_FID_TABLE_BOTTOM)){
> +		    || (j && (pst[j].fid < HI_FID_TABLE_BOTTOM))) {
> +			/* Only first fid is allowed to be in "low" range */
>  			printk(KERN_ERR PFX "fid %d invalid : 0x%x\n", j, pst[j].fid);
>  			return -EINVAL;
>  		}
> @@ -548,6 +547,7 @@
>  	unsigned int i, j;
>  	u32 mvs;
>  	u8 maxvid;
> +	int arima = 0;
>  
>  	for (i = 0xc0000; i < 0xffff0; i += 0x10) {
>  		/* Scan BIOS looking for the signature. */
> @@ -589,7 +589,7 @@
>  		dprintk(KERN_DEBUG PFX "numpst: 0x%x\n", psb->numpst);
>  		if (psb->numpst != 1) {
>  			printk(KERN_ERR BFX "numpst must be 1\n");
> -			return -ENODEV;
> +			arima = 0;
>  		}
>  
>  		dprintk(KERN_DEBUG PFX "cpuid: 0x%x\n", psb->cpuid);
> @@ -601,7 +601,7 @@
>  		printk("maxfid 0x%x (%d MHz), maxvid 0x%x\n", 
>  		       psb->maxfid, find_freq_from_fid(psb->maxfid), maxvid);
>  
> -		numps = psb->numpstates;
> +		numps = arima ? 3 : psb->numpstates;
>  		if (numps < 2) {
>  			printk(KERN_ERR BFX "no p states to transition\n");
>  			return -ENODEV;
> @@ -626,8 +626,10 @@
>  		}
>  
>  		pst = (struct pst_s *) (psb + 1);
> -		if (check_pst_table(pst, maxvid))
> -			return -EINVAL;
> +		if (check_pst_table(pst, maxvid)) {
> +			if (!arima)
> +				return -EINVAL;
> +		}
>  
>  		powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (numps + 1)), GFP_KERNEL);
>  		if (!powernow_table) {
> @@ -635,13 +637,24 @@
>  			return -ENOMEM;
>  		}
>  
> -		for (j = 0; j < numps; j++) {
> -			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz), vid 0x%x\n", j,
> -			       pst[j].fid, find_freq_from_fid(pst[j].fid), pst[j].vid);
> +		for (j = 0; j < numps; j++) {
>  			powernow_table[j].index = pst[j].fid; /* lower 8 bits */
>  			powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
> -			powernow_table[j].frequency = find_freq_from_fid(pst[j].fid);
>  		}
> +
> +		if (arima) {
> +			powernow_table[1].index = 0x0608;
> +			powernow_table[2].index = 0x020a;
> +		}
> +
> +		for (j = 0; j < numps; j++) {
> +			powernow_table[j].frequency = find_freq_from_fid(powernow_table[j].index & 0xff)*1000;
> +			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz), vid 0x%x\n", j,
> +			       powernow_table[j].index & 0xff, 
> +			       powernow_table[j].frequency/1000,
> +			       powernow_table[j].index >> 8);
> +		}
> +
>  		powernow_table[numps].frequency = CPUFREQ_TABLE_END;
>  		powernow_table[numps].index = 0;
>  
> 
> 
