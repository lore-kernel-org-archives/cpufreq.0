From: Lutz Vieweg <lkv@isg.de>
Subject: Re: [patches] 2.6.2 to 2.6.3 regression: powernow-k8 doesn't work
 anymore
Date: Mon, 01 Mar 2004 11:15:59 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40430D5F.1030503@isg.de>
References: <4038ED24.3080402@isg.de> <20040222231431.GA24835@elf.ucw.cz>
	<403E8248.2040902@isg.de> <20040228001649.GJ425@elf.ucw.cz>
	<20040228131538.GA19729@elf.ucw.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040228131538.GA19729@elf.ucw.cz>
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
Cc: patches@x86-64.org, Andrew Morton <akpm@zip.com.au>, cpufreq@www.linux.org.uk

Pavel Machek wrote:

>>>A factor 1000 lost somewhere?
>>
>>Yes.
> 
> 
> Better patch follows.

Ah, I just realized I replied to the wrong mail - of course I just
tried this "better patch" :-) and confirmed that it works with the K8V board.

Regards,

Lutz Vieweg

> Index: arch/i386/kernel/cpu/cpufreq/powernow-k8.c
> ===================================================================
> RCS file: /home/pavel/sf/bitbucket/bkcvs/linux-2.5/arch/i386/kernel/cpu/cpufreq/powernow-k8.c,v
> retrieving revision 1.6
> diff -u -u -r1.6 powernow-k8.c
> --- arch/i386/kernel/cpu/cpufreq/powernow-k8.c	23 Feb 2004 07:07:45 -0000	1.6
> +++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	28 Feb 2004 13:02:27 -0000
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
> @@ -636,13 +636,22 @@
>  			return -ENOMEM;
>  		}
>  
> -		for (j = 0; j < numps; j++) {
> -			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz), vid 0x%x\n", j,
> -			       pst[j].fid, find_freq_from_fid(pst[j].fid), pst[j].vid);
> +		for (j = 0; j < psb->numpstates; j++) {
>  			powernow_table[j].index = pst[j].fid; /* lower 8 bits */
>  			powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
> -			powernow_table[j].frequency = find_freq_from_fid(pst[j].fid);
>  		}
> +
> +		/* If you want to override your frequency tables, this
> +		   is right place. */
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


-- 
  Dipl. Phys. Lutz Vieweg   | email: lutz.vieweg@is-teledata.com
  IS.Teledata AG            | Phone/Fax: +49-69-505030 -120/-505
  Sandweg 94                | http://www.isg.de/people/lkv/
  60316 Frankfurt am Main   | ^^^ PGP key available here ^^^
