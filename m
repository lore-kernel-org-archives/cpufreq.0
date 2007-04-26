From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] [2.6.22] pasemi: cpufreq driver
Date: Thu, 26 Apr 2007 10:55:33 +0200
Message-ID: <200704261055.33739.arnd@arndb.de>
References: <20070425204633.GC19781@lixom.net>
	<20070426053700.GA23922@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org>
In-Reply-To: <20070426053700.GA23922@lixom.net>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@ozlabs.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
Errors-To: linuxppc-dev-bounces+glppd-linuxppc64-dev=m.gmane.org@ozlabs.org
To: linuxppc-dev@ozlabs.org
Cc: Olof Johansson <olof@lixom.net>, egor@pasemi.com, paulus@samba.org, cpufreq@lists.linux.org.uk

On Thursday 26 April 2007, Olof Johansson wrote:

> I chose not to do this as an of_platform driver since it doesn't fit
> that well with the cpufreq driver model; having 3 levels of init/probe
> functions is excessive.

<snip>

> +	dn = of_find_compatible_node(NULL, "sdc", "1682m-sdc");
> +	if (!dn)
> +		goto out;
> +	err = of_address_to_resource(dn, 0, &res);
> +	of_node_put(dn);
> +	if (err)
> +		goto out;
> +	sdcasr_mapbase = ioremap(res.start + SDCASR_OFFSET, 0x2000);
> +	if (!sdcasr_mapbase) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	dn = of_find_compatible_node(NULL, "gizmo", "1682m-gizmo");
> +	if (!dn) {
> +		err = -ENODEV;
> +		goto out_unmap_sdcasr;
> +	}
> +	err = of_address_to_resource(dn, 0, &res);
> +	of_node_put(dn);
> +	if (err)
> +		goto out_unmap_sdcasr;
> +	sdcpwr_mapbase = ioremap(res.start, 0x1000);
> +	if (!sdcpwr_mapbase) {
> +		err = -EINVAL;
> +		goto out_unmap_sdcasr;
> +	}

What are sdc and gizmo anyway? If they are both only used for cpufreq, maybe the
easiest way to do this with an of_platform_driver would be to have a single
node that has two register ranges.

	Arnd <><
