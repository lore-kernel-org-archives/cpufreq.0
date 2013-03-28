From: Tang Yuantian-B29983 <B29983@freescale.com>
Subject: RE: [PATCH 3/3] cpufreq: Add cpufreq driver for Freescale e500mc
 SOCs
Date: Thu, 28 Mar 2013 03:02:11 +0000
Message-ID: <D07C73A334FF604B95B3CBD2A545D07B0B105983@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1364265391-26077-1-git-send-email-Yuantian.Tang@freescale.com>
	<1364265391-26077-3-git-send-email-Yuantian.Tang@freescale.com>
 <20130327143236.7cb4613b78ad18d79bfbcc57@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20130327143236.7cb4613b78ad18d79bfbcc57@freescale.com>
Content-Language: en-US
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Phillips Kim-R1AAHA <R1AAHA@freescale.com>
Cc: "rjw@sisk.pl" <rjw@sisk.pl>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

> > +		return ret;
> > +
> > +	pr_info("Freescale PowerPC corenet CPU frequency scaling driver\n");
> > +
> > +	return ret;
> > +}
> > +
> > +static void __exit ppc_corenet_cpufreq_exit(void) {
> > +	cpufreq_unregister_driver(&ppc_corenet_cpufreq_driver);
> > +}
> > +
> > +module_init(ppc_corenet_cpufreq_init);
> > +module_exit(ppc_corenet_cpufreq_exit);
> 
> this needs to be a module_platform_driver.
> 
The compatible string is used for clock driver.
This driver can not be a platform_driver.

-Yuantian

