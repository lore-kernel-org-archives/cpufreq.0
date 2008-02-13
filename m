From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [PATCH] Use menuconfig for CONFIG_CPU_FREQ
Date: Wed, 13 Feb 2008 22:50:58 +0000
Message-ID: <20080213225058.GA20358@flint.arm.linux.org.uk>
References: <200802132330.23817.alessandro.guido@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200802132330.23817.alessandro.guido@gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: Alessandro Guido <alessandro.guido@gmail.com>
Cc: linux-arch@vger.kernel.org, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

On Wed, Feb 13, 2008 at 11:30:23PM +0100, Alessandro Guido wrote:
> Signed-off-by: Alessandro Guido <alessandro.guido@gmail.com>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 9619c43..2e21703 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -948,8 +948,6 @@ endmenu
>  
>  if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP || ARCH_IMX || ARCH_PXA)
>  
> -menu "CPU Frequency scaling"
> -
>  source "drivers/cpufreq/Kconfig"
>  
>  config CPU_FREQ_SA1100
> @@ -988,8 +986,6 @@ config CPU_FREQ_PXA
>  	default y
>  	select CPU_FREQ_DEFAULT_GOV_USERSPACE
>  
> -endmenu
> -

Doesn't this cause these CPUFREQ options to appear outside of the CPUFREQ
menu?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
