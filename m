From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 15:28:54 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414132854.GE8953@poupinou.org>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414121857.GC8953@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 02:18:57PM +0200, Bruno Ducrot wrote:
> * Integrate acpi perflib from Dominik.
> * Use acpi if the PST tables are known to be broken (ASUS Aspire match one PST,
>   but give brain damaged values), or use ACPI if no PST found.
> 
>  arch/i386/kernel/cpu/cpufreq/powernow-k7.c |  180 +++++++++++++++++++++++++++--
>  1 files changed, 168 insertions(+), 12 deletions(-)
> 
> --- linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 11:49:44	1.3
> +++ linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 12:11:24
....

> @@ -341,8 +480,14 @@ static int powernow_decode_bios (int max
>  			}
>  			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
>  			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
> -			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
> -			return -EINVAL;
> +
> +			printk (KERN_INFO PFX "Trying ACPI perflib\n");
> +			ret = powernow_acpi_init();
> +			if (ret) {
> +				printk (KERN_INFO PFX "ACPI and legacy methods failed\n");
> +				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
> +			}
> +			return ret;
>  		}
>  		p++;
>  	}


This chunk is wrong, because I handle that at powernow_cpu_init() now.
Just removing that one should be OK.  Do you want I resend the whole
patch, or only that part ?

Sorry.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
