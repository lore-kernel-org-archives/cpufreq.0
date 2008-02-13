From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [PATCH] Use menuconfig for CONFIG_CPU_FREQ
Date: Wed, 13 Feb 2008 23:15:12 +0000
Message-ID: <20080213231512.GB20358@flint.arm.linux.org.uk>
References: <200802132330.23817.alessandro.guido@gmail.com>
	<20080213225058.GA20358@flint.arm.linux.org.uk>
	<200802140000.52936.alessandro.guido@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200802140000.52936.alessandro.guido@gmail.com>
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
To: Alessandro Guido <alessandro.guido@gmail.com>, Roman Zippel <zippel@linux-m68k.org>
Cc: linux-arch@vger.kernel.org, davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk

On Thu, Feb 14, 2008 at 12:00:52AM +0100, Alessandro Guido wrote:
> > Doesn't this cause these CPUFREQ options to appear outside of the CPUFREQ
> > menu?
> > 
> 
> No because they all depend on CPU_FREQ and as far as I understand Kconfig
> automagically puts them under the same menu.

Hmm, that's not documented behaviour.  If we're starting to rely on that
maybe it should be documented as being the expected behaviour?

(here's the cut down patch for Roman's reference)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9619c43..2e21703 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -948,8 +948,6 @@ endmenu
 
 if (ARCH_SA1100 || ARCH_INTEGRATOR || ARCH_OMAP || ARCH_IMX || ARCH_PXA)
 
-menu "CPU Frequency scaling"
-
 source "drivers/cpufreq/Kconfig"
 
 config CPU_FREQ_SA1100
@@ -988,8 +986,6 @@ config CPU_FREQ_PXA
 	default y
 	select CPU_FREQ_DEFAULT_GOV_USERSPACE
 
-endmenu
-
 endif
 
 menu "Floating point emulation"
diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index c159ae6..ef80bd0 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -1,4 +1,4 @@
-config CPU_FREQ
+menuconfig CPU_FREQ
 	bool "CPU Frequency scaling"
 	help
 	  CPU Frequency scaling allows you to change the clock speed of 


-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
