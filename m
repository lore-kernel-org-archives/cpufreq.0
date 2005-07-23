From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] CPUFreq Support for PXA255
Date: Sat, 23 Jul 2005 21:16:59 +0200
Message-ID: <20050723191659.GA10331@dominikbrodowski.de>
References: <1121341256.10537.12.camel@icampbell-debian>
	<1121768102.29501.47.camel@icampbell-debian>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1121768102.29501.47.camel@icampbell-debian>
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

On Tue, Jul 19, 2005 at 11:15:02AM +0100, Ian Campbell wrote:
> +static int pxa_set_target(struct cpufreq_policy *policy,
> +			  unsigned int target_freq, unsigned int relation)
> +{
> +	int idx;
> +	struct cpufreq_freqs freqs;
> +	struct pxa_freqs *pxa_freq_settings;
> +	struct cpufreq_frequency_table *pxa_freqs_table;
> +	unsigned long flags;
> +	unsigned int unused;
> +	unsigned int preset_mdrefr, postset_mdrefr;
> +	void *ramstart;
> +
> +	/* Get the current policy */
> +	pxa_select_freq_table(policy, &pxa_freq_settings, &pxa_freqs_table);

In my opinion you should only switch between the tables in verify. Only then
can we assure that the ->min and ->max values provided are OK at this
moment.

> +	/* set default policy and cpuinfo */
> +	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
> +	policy->cpuinfo.max_freq = max_frequency;
> +	policy->cpuinfo.min_freq = PXA25x_MIN_FREQ;
> +	policy->cpuinfo.transition_latency = 1000000;	/* FIXME: 1 ms, assumed */
> +	policy->cur = get_clk_frequency_khz(0);		/* current freq */
> +	policy->min = policy->max = policy->cur;

Better set policy->min to cpuinfo.min_freq and ->max to cpuinfo.max_freq.

> +static struct freq_attr* pxa_cpufreq_attr[] = {
> +        &cpufreq_freq_attr_scaling_available_freqs,

Tab, not space


Looks good, thanks!

	Dominik
