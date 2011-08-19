From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Fix Makefile typo.
Date: Fri, 19 Aug 2011 16:50:26 +0200
Message-ID: <20110819145026.GA22120@comet.dominikbrodowski.net>
References: <20110816193620.GA3334@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110816193620.GA3334@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

Applied, thanks.

On Tue, Aug 16, 2011 at 03:36:21PM -0400, Dave Jones wrote:
> Signed-off-by: Dave Jones <davej@redhat.com>
> 
> diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
> index 94c2cf0..8ae576f 100644
> --- a/tools/power/cpupower/Makefile
> +++ b/tools/power/cpupower/Makefile
> @@ -35,7 +35,7 @@ NLS ?=		true
>  
>  # Set the following to 'true' to build/install the
>  # cpufreq-bench benchmarking tool
> -CPUFRQ_BENCH ?= true
> +CPUFREQ_BENCH ?= true
>  
>  # Prefix to the directories we're installing to
>  DESTDIR ?=
> @@ -139,7 +139,7 @@ ifeq ($(strip $(NLS)),true)
>  	COMPILE_NLS += create-gmo
>  endif
>  
> -ifeq ($(strip $(CPUFRQ_BENCH)),true)
> +ifeq ($(strip $(CPUFREQ_BENCH)),true)
>  	INSTALL_BENCH += install-bench
>  	COMPILE_BENCH += compile-bench
>  endif
> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
