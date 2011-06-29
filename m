From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH 2/2] Add cpufreq driver for Momentum Maple boards
Date: Wed, 29 Jun 2011 13:28:30 +1000
Message-ID: <1309318110.32158.520.camel@pasglop>
References: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
	 <1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Dave Jones <davej@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org, Paul Mackerras <paulus@samba.org>

Before I comment on this last one, a quick Q. for Dave: Do you want to
handle this or should I merge it via powerpc.git ? (It depends on
another change to the arch code to expose the SCOM functions that it
uses, and that patch is going to be in my -next branch).

Now some remaining small nits:

On Fri, 2011-06-17 at 17:10 +0400, Dmitry Eremin-Solenikov wrote:
> Add simple cpufreq driver for Maple-based boards (ppc970fx evaluation
> kit and others). Driver is based on a cpufreq driver for 64-bit powermac
> boxes with all pmac-dependant features removed and simple cleanup
> applied.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/cpufreq/Kconfig         |    5 +
>  drivers/cpufreq/Kconfig.powerpc |    7 +
>  drivers/cpufreq/Makefile        |    5 +
>  drivers/cpufreq/maple-cpufreq.c |  314 +++++++++++++++++++++++++++++++++++++++

If we're going to have a Kconfig.powerpc, should we maybe just have a
powerpc subdirectory instead with the driver in it ?

I'm happy at some later point to try moving some of my other ones there.

 .../...

> +	/* Look for the powertune data in the device-tree */
> +	maple_pmode_data = of_get_property(cpunode, "power-mode-data", &psize);
> +	if (!maple_pmode_data) {
> +		DBG("No power-mode-data !\n");
> +		goto bail_noprops;
> +	}
> +	maple_pmode_max = psize / sizeof(u32) - 1;

Do you get that property in your device-tree ? Or have you modified your
firmware ? If that requires a modified firmware, you should probably put
at least a link indicating where to get it somewhere and display a nicer
error code.

Also this driver is specific to the Maple HW, you don't want it to kick
in and mess around on ... an Apple G5 for example. So stick somewhere a

	if (!machine_is(maple))
		return 0;

> +	printk(KERN_INFO "Registering G5 CPU frequency driver\n");

s/G5/Maple

> +	printk(KERN_INFO "Frequency method: SCOM, Voltage method: none\n");

This is useless.

Cheers,
Ben.


