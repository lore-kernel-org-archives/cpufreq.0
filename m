From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: imx6q: Drop devm_clk/regulator_get usage
Date: Mon, 10 Feb 2014 15:33:52 +0800
Message-ID: <20140210073350.GM9628@S2101-09.ap.freescale.net>
References: <1391699485-2212-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1391699485-2212-1-git-send-email-p.zabel@pengutronix.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: cpufreq@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, kernel@pengutronix.de

On Thu, Feb 06, 2014 at 04:11:24PM +0100, Philipp Zabel wrote:
> This driver is using devres managed calls incorrectly, giving the cpu0
> device as first parameter instead of the cpufreq platform device.
> This results in resources not being freed if the cpufreq platform device
> is unbound, for example if probing has to be deferred for a missing
> regulator. This is currently a theoretical problem since the anatop
> regulators are probed earlier, but this might change when adding
> support for external switching regulators.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

For both,

Acked-by: Shawn Guo <shawn.guo@linaro.org>

