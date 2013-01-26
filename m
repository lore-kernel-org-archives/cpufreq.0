From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH v2 0/3] Kirkwoode cpufreq driver
Date: Sat, 26 Jan 2013 18:04:59 -0500
Message-ID: <20130126230459.GU1758@titan.lakedaemon.net>
References: <1359215039-2848-1-git-send-email-andrew@lunn.ch>
 <3759655.fLV8aUUe7v@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3759655.fLV8aUUe7v@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, linux ARM <linux-arm-kernel@lists.infradead.org>, jacmet@sunsite.dk, cpufreq@vger.kernel.org, viresh.kumar@linaro.org

On Sat, Jan 26, 2013 at 10:52:42PM +0100, Rafael J. Wysocki wrote:
> On Saturday, January 26, 2013 04:43:56 PM Andrew Lunn wrote:
> > This patchset adds a cpufreq driver for Marvell Kirkwood SoCs.
> > 
> > The changes to kirkwood_defconfig enable it and set the default
> > governor to ondemand.
> > 
> > Changes since v1:
> > 
> > tabify Kconfig.arm entry
> > Sort order of include files
> > Remove some unnecassary include files
> > Reformat multiline comment to be coding style conform.
> > 
> > Andrew Lunn (3):
> >   cpufreq: kirkwood: Add a cpufreq driver for Marvell Kirkwood SoCs
> >   arm: kirkwood: Instantiate cpufreq driver
> >   arm: kirkwood: Enable cpufreq and ondemand on kirkwood_defconfig
> 
> If you want me to take this, it'll need some ACKs from the clk people
> and arm-soc maintainers at least.

In the past, we've sent the driver changes (patch #1) through the
appropriate driver maintainer's tree, and the subsequent patches (2 & 3)
through arm-soc with a listed dependency on the driver maintainer's
tree/branch.  We've found that causes the fewest conflicts/headaches
that way.

If you're Ok with that, just let me know which tree and branch you pull
it in to.

> An ACK from Viresh would be welcome too.

fwiw:

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
