From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 2/3] cpufreq: add imx6q-cpufreq driver
Date: Tue, 8 Jan 2013 21:10:48 +0800
Message-ID: <20130108131046.GB19534@S2101-09.ap.freescale.net>
References: <1357628043-19256-1-git-send-email-shawn.guo@linaro.org>
 <1357628043-19256-3-git-send-email-shawn.guo@linaro.org>
 <20130108085756.GM1906@pengutronix.de>
 <20130108112856.GA19534@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130108112856.GA19534@S2101-09.ap.freescale.net>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On Tue, Jan 08, 2013 at 07:28:59PM +0800, Shawn Guo wrote:
> > > +	cpu_dev->of_node = np;
> > > +
> > > +	arm_clk = clk_get(cpu_dev, "arm");
> > > +	pll1_sys_clk = clk_get(cpu_dev, "pll1_sys");
> > > +	pll1_sw_clk = clk_get(cpu_dev, "pll1_sw");
> > > +	step_clk = clk_get(cpu_dev, "step");
> > > +	pll2_pfd2_396m_clk = clk_get(cpu_dev, "pll2_pfd2_396m");
> > 
> > devm_*?
> > 
> That what I tried to do at the first time.  But the dev of cpu is
> special, and managed functions do not work as we expect with it.
> 
Inspired by the comment, I think I should attach /cpus/cpu@0 node to
pdev->dev instead of the one retrieved from get_cpu_device(0), so that
both managed functions and dev_* print can work.

Shawn

