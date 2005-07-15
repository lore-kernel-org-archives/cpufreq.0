From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Fri, 15 Jul 2005 18:41:15 +0200
Message-ID: <20050715164115.GA3240@isilmar.linta.de>
References: <1121341256.10537.12.camel@icampbell-debian>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1121341256.10537.12.camel@icampbell-debian>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Campbell <icampbell@arcom.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Thu, Jul 14, 2005 at 12:40:56PM +0100, Ian Campbell wrote:
> +#define DEBUG  0
> +
> +#ifdef DEBUG
> +static unsigned int freq_debug = DEBUG;
> +module_param(freq_debug, int, 0);
> +MODULE_PARM_DESC(freq_debug, "Set the debug messages to on=1/off=0");
> +#else
> +#define freq_debug  0
> +#endif

Please use the cpufreq debug infrastructure for this:

#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "pxa", msg)

> +typedef struct {
> +	unsigned int khz;
> +	unsigned int membus;
> +	unsigned int cccr;
> +	unsigned int div2;
> +} pxa_freqs_t;

Don't use typedefs, please. Just name it "struct pxa_freqs"

> +static void pxa_select_freq_table(struct cpufreq_policy *policy,
> +				  pxa_freqs_t ** settings,
> +				  struct cpufreq_frequency_table **table)
> +{
> +	if (strcmp(policy->governor->name, "performance") == 0) {
> +		if (settings)
> +			*settings = pxa255_run_freqs;
> +		if (table)
> +			*table = pxa255_run_freq_table;
> +	} else {
> +		if (settings)
> +			*settings = pxa255_turbo_freqs;
> +		if (table)
> +			*table = pxa255_turbo_freq_table;
> +	}
> +}

As noted by Eric Piel already, please use a module parameter combined with a
sysfs file instead.

> +	if (freq_debug) {
> +		printk("Verified CPU policy: %dKhz min to %dKhz max\n",
> +		       policy->min, policy->max);
> +	}

	dprintk("Verified ...);

> +	cpumask_t cpus_allowed;

Is this a SMP-capable platform?

> +	policy->cpuinfo.transition_latency = 1000;	/* FIXME: 1 ms, assumed */

1000000

> +1.1 ARM, PXA
> +------------
>  
>  The following ARM processors are supported by cpufreq:
>  
>  ARM Integrator
>  ARM-SA1100
>  ARM-SA1110
> +Intel PXA

Is the PXA just a sub-architecture of ARM?

>  choice
>  	prompt "Default CPUFreq governor"
> -	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
> +	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110 || CPU_FREQ_PXA

Why is that?


Except the two-tables-issue I'd like to see solved differently, it's good
code IMHO.

	Dominik
