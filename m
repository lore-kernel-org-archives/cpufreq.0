From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Fri, 2 Dec 2005 19:19:27 +0100
Message-ID: <20051202181927.GD9766@wotan.suse.de>
References: <20051202101331.A2723@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750929AbVLBSTb@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20051202101331.A2723@unix-os.sc.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: Andrew Morton <akpm@osdl.org>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

On Fri, Dec 02, 2005 at 10:13:31AM -0800, Pallipadi, Venkatesh wrote:
> On x86_64:
> There is one single variable cpu_khz that gets written by all the CPUs. So,
> the frequency set by last CPU will be seen on /proc/cpuinfo of all the
> CPUs in the system. What you see also depends on whether you have constant_tsc
> capable CPU or not.

x86-64 part looks good. Thanks.

>  /* query the current CPU frequency (in kHz). If zero, cpufreq couldn't detect it */
>  unsigned int cpufreq_get(unsigned int cpu);
>  
> +/* query the last known CPU freq (in kHz). If zero, cpufreq couldn't detect it */
> +#ifdef CONFIG_CPU_FREQ
> +unsigned int cpufreq_quick_get(unsigned int cpu);
> +#else
> +unsigned int cpufreq_quick_get(unsigned int cpu)
> +{
> +	return 0;
> +}
> +#endif

Shouldn't this be a static inline? 

-Andi
