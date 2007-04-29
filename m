From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH v3] [2.6.22] pasemi: cpufreq driver
Date: Sat, 28 Apr 2007 22:50:21 -0400
Message-ID: <20070429025021.GC2781@isilmar.linta.de>
References: <20070425204633.GC19781@lixom.net>
	<20070426053700.GA23922@lixom.net>
	<20070427054601.GB7755@lixom.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20070427054601.GB7755@lixom.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olof Johansson <olof@lixom.net>
Cc: linuxppc-dev@ozlabs.org, egor@pasemi.com, paulus@samba.org, arnd@arndb.de, cpufreq@lists.linux.org.uk

Hi,

On Fri, Apr 27, 2007 at 12:46:01AM -0500, Olof Johansson wrote:
> +	max_freq = (u32*) get_property(cpu, "clock-frequency", NULL);

(u32) or (32*) ?

> +	cur_astate = get_cur_astate(policy->cpu);

May the different cores have different settings at initalization? e.g.

core 0:		freq A
core 1:		freq B

with (freq B > freq A)? If so, cur_astate is set wrongly, as the _effective_
frequency would be freq B, right?

> +#ifndef CONFIG_PPC_PASEMI_CPUFREQ
> +	printk(KERN_WARNING "No cpufreq driver, powersavings modes disabled\n");
> +	current_mode = 0;
> +#endif
> +

This confuses me a bit -- does something else than cpufreq not work if
cpufreq is disabled?


Overall, the patch looks good to me.

	Dominik
