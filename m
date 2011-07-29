From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] aperf: fix compilation on x86-32 with -fPIC
Date: Fri, 29 Jul 2011 19:36:53 +0200
Message-ID: <20110729173653.GA30265@comet.dominikbrodowski.net>
References: <1311722911-14562-1-git-send-email-mattst88@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1311722911-14562-1-git-send-email-mattst88@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: cpufreq@vger.kernel.org

applied, thanks.

Best,
	Dominik

On Tue, Jul 26, 2011 at 07:28:31PM -0400, Matt Turner wrote:
> ebx is used to store the GOT pointer when compiled with -fPIC, so it's
> not usable by inline assembly.
> 
> https://bugs.gentoo.org/375967
> 
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  utils/cpuid.h |   14 +++++++++++++-
>  1 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/utils/cpuid.h b/utils/cpuid.h
> index 2bac69a..53da789 100644
> --- a/utils/cpuid.h
> +++ b/utils/cpuid.h
> @@ -5,9 +5,21 @@ static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
>  				unsigned int *ecx, unsigned int *edx)
>  {
>  	/* ecx is often an input as well as an output. */
> -	asm volatile("cpuid"
> +	asm volatile(
> +#if defined(__i386__) && defined(__PIC__)
> +	    "push %%ebx\n"
> +	    "cpuid\n"
> +	    "movl %%ebx, %1\n"
> +	    "pop %%ebx\n"
> +#else
> +	    "cpuid\n"
> +#endif
>  	    : "=a" (*eax),
> +#if defined(__i386__) && defined(__PIC__)
> +	      "=r" (*ebx),
> +#else
>  	      "=b" (*ebx),
> +#endif
>  	      "=c" (*ecx),
>  	      "=d" (*edx)
>  	    : "0" (*eax), "2" (*ecx));
> -- 
> 1.7.3.4
> 
