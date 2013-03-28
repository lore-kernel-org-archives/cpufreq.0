From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: use the exact frequency for
 clk_set_rate()
Date: Thu, 28 Mar 2013 10:07:34 +0800
Message-ID: <20130328020732.GF5429@S2101-09.ap.freescale.net>
References: <Pine.LNX.4.64.1302251820431.3030@axis700.grange>
 <Pine.LNX.4.64.1303272345260.9558@axis700.grange>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1303272345260.9558@axis700.grange>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Mar 27, 2013 at 11:46:38PM +0100, Guennadi Liakhovetski wrote:
> Hi Shawn
> 
> On Mon, 25 Feb 2013, Guennadi Liakhovetski wrote:
> 
> > clk_set_rate() isn't supposed to accept approximate frequencies, instead
> > a supported frequency should be obtained from clk_round_rate() and then
> > used to set the clock.
> > 
> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> 
> Can I have your ack for this one, please?

Acked-by: Shawn Guo <shawn.guo@linaro.org>

