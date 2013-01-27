From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 1/3] cpufreq: kirkwood: Add a cpufreq driver for
 Marvell Kirkwood SoCs
Date: Sun, 27 Jan 2013 19:20:01 +0100
Message-ID: <20130127182001.GN29973@lunn.ch>
References: <1359281244-31455-1-git-send-email-andrew@lunn.ch>
 <1359281244-31455-2-git-send-email-andrew@lunn.ch>
 <20130127171111.GG23505@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130127171111.GG23505@n2100.arm.linux.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, rjw@sisk.pl, jacmet@sunsite.dk, linux ARM <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org, viresh.kumar@linaro.org

On Sun, Jan 27, 2013 at 05:11:11PM +0000, Russell King - ARM Linux wrote:
> On Sun, Jan 27, 2013 at 11:07:22AM +0100, Andrew Lunn wrote:
> > +static struct priv
> > +{
> > +	struct clk *cpu_clk;
> > +	struct clk *ddr_clk;
> > +	struct clk *powersave_clk;
> > +	struct device *dev;
> > +	void __iomem *base;
> > +} priv;
> 
> I guess you probably think that the compiler will do something special
> with this

Nope, i expect nothing at all from the compiler. I just know i need
only one of these structures so i statically allocated it. I could
allocate it dynamically, probably get the cleanup wrong in the error
path and get shouted at by Russel King. Oh well...

> > +static unsigned int kirkwood_cpufreq_get_cpu_frequency(unsigned int cpu)
> > +{
> > +	if (__clk_is_enabled(priv.powersave_clk))
> 
> This looks to me to be a layering violation.

Possibly is. Not sure. This is a gated clock, so clk_get_rate()
returns the rate of the parent clock independent of if the gated clock
is enabled or not. So that does not help me. The cpufreq driver needs
to cause a transition on this clock, either disabled->enabled, or
enabled->disabled, then do a WFI, and once the system is stable it
wakes up. If there is no transition, it was already enabled and all
that clk_enable() does is increment the count, the WFI never exits and
the system sleeps forever. I'm assuming here that no other driver is
using this clock, which i think is a sensible assumption. But i've no
idea of the initial state of the clock. Did uboot enable it or not?

Thanks
	Andrew
