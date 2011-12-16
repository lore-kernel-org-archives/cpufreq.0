From: Richard Zhao <richard.zhao@freescale.com>
Subject: Re: [RFC V1 1/4] cpufreq: add arm soc generic cpufreq driver
Date: Fri, 16 Dec 2011 18:18:27 +0800
Message-ID: <20111216101826.GV28768@b20223-02.ap.freescale.net>
References: <1323947798-25251-1-git-send-email-richard.zhao@linaro.org>
 <4EEA415F.8030901@calxeda.com>
 <20111216082423.GM14542@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111216082423.GM14542@n2100.arm.linux.org.uk>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Mark Langsdorf <mark.langsdorf@calxeda.com>, "linaro-dev@lists.linaro.org" <linaro-dev@lists.linaro.org>, "patches@linaro.org" <patches@linaro.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "eric.miao@linaro.org" <eric.miao@linaro.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "davej@redhat.com" <davej@redhat.com>, "shawn.guo@linaro.org" <shawn.guo@linaro.org>, Richard Zhao <richard.zhao@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Fri, Dec 16, 2011 at 08:24:23AM +0000, Russell King - ARM Linux wrote:
> On Thu, Dec 15, 2011 at 12:50:07PM -0600, Mark Langsdorf wrote:
> > I'd prefer to see clk_get90 replaced with of_clk_get() and
> > get_this_cpu_node() from the clk-cpufreq driver by Jamie Iles that
> > I resubmitted yesterday.
> 
> Why isn't of_clk_get() hidden inside clk_get() ?
Good point.
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

