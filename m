From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] AMD Elan SC520 cpufreq driver
Date: Wed, 30 Mar 2005 00:04:32 +0200
Message-ID: <20050329220432.GA4018@isilmar.linta.de>
References: <20050329213658.GA12868@levin.pad.mess.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050329213658.GA12868@levin.pad.mess.org>
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
To: Sean Young <sean@mess.org>
Cc: cpufreq@lists.linux.org.uk

Hi,

> +#include <linux/slab.h>

What do you need slab.h for?

> +	printk(KERN_INFO "sc520_freq: attempting to set frequency to %i kHz\n",
> +			sc520_freq_table[state].frequency);

Please change this to a dprintk and use the cpufreq_debug infrastructure for
that -- users who want to use dynamic frequency scaling don't want to have
their dmesg flooded with printk's :)

> +	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;

Do you know how long a transition takes and for how long no other transition
may be done?

> +        cpufreq_frequency_table_get_attr(sc520_freq_table, policy->cpu);

broken indenting

> +	/* Test if we have the right hardware */
> +	if (c->x86_vendor != X86_VENDOR_AMD ||
> +		c->x86 != 4 || c->x86_model != 9) {
> +		printk(KERN_INFO "sc520_freq: error: no Elan SC520 processor found!\n");

please do only a dprintk here as well, and I think a tab is missing, too.


Nice work :)

Thanks,
	Dominik
