From: Viktor Radnai <efti@gotiao.com>
Subject: Re: [PATCH 2.6.4] (2/5) p4-clockmod: single-line KERN_WARNING
	messages
Date: Sun, 21 Mar 2004 15:25:50 +1100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <405D194E.8070600@gotiao.com>
References: <20040315141453.GC8636@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040315141453.GC8636@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

Hi all,

It seems that there's a slight gramatical error in this patch. The 
second message says:

 > +           printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. "
 > +		    "The speedstep-ich or acpi cpufreq modules offers "
 > +		    "voltage scaling in addition of frequency scaling. "
 > +		    "You should use either one instead of p4-clockmod, "
 > +		    "if possible.\n");

It should say "offer" instead of "offers":

+		    "The speedstep-ich or acpi cpufreq modules offer "

Apologies if this is considered nitpicking...

Regards,
Vik

Dominik Brodowski wrote:
> Use KERN_WARNING for warning. Thanks to Dave Jones, Pavel Machel and Russell 
> King for their help getting this patch right.
> 
>  arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   17 ++++++++++-------
>  1 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
> --- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-03-15 09:20:50.000000000 +0100
> +++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-03-15 13:28:00.997133712 +0100
> @@ -181,21 +181,24 @@
>  {
>  	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
>  		/* Pentium M */
> -		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
> -		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
> -		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
> +		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
> +		       "The speedstep_centrino module offers voltage scaling"
> +		       " in addition of frequency scaling. You should use "
> +		       "that instead of p4-clockmod, if possible.\n");
>  		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
>  	}
>  
>  	if (c->x86 != 0xF) {
> -		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
> +		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
>  		return 0;
>  	}
>  
>  	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
> -		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
> -		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
> -		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
> +		printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. "
> +		       "The speedstep-ich or acpi cpufreq modules offers "
> +		       "voltage scaling in addition of frequency scaling. "
> +		       "You should use either one instead of p4-clockmod, "
> +		       "if possible.\n");
>  		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
>  	}
>  
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
> 
