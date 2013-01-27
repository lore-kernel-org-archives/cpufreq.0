From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 1/3] cpufreq: kirkwood: Add a cpufreq driver for
 Marvell Kirkwood SoCs
Date: Sun, 27 Jan 2013 18:23:58 +0100
Message-ID: <20130127172358.GM29973@lunn.ch>
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

> > +	clkspec.np = np;
> > +	clkspec.args_count = 1;
> > +	clkspec.args[0] = 1;
> > +
> > +	priv.cpu_clk = of_clk_get_from_provider(&clkspec);
> 
> Oh, yet another way to get clocks...

Yep. I didn't like it, but could not find a better way.  It has been
argued that cpufreq drivers should not have nodes in DT. So the normal
of_clk_get() does not work. Since the clocks themselves are
instantiated from DT, there are no clkdev alias, so plain clk_get()
also does not work.

Do you know of a better way to do this?

   Thanks
	Andrew
