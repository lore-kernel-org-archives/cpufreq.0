From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: use the exact frequency for
 clk_set_rate()
Date: Wed, 5 Jun 2013 13:25:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1306051323160.19739@axis700.grange>
References: <Pine.LNX.4.64.1302251820431.3030@axis700.grange>
 <20130328020732.GF5429@S2101-09.ap.freescale.net>
 <Pine.LNX.4.64.1305222000510.12715@axis700.grange> <16318112.i755nOUCKx@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <16318112.i755nOUCKx@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Shawn Guo <shawn.guo@linaro.org>

Hi Rafael

On Wed, 22 May 2013, Rafael J. Wysocki wrote:

> On Wednesday, May 22, 2013 08:12:22 PM Guennadi Liakhovetski wrote:
> > Hi Rafael
> > 
> > I don't see this patch in your cpufreq branch nor in next or Linus' trees, 
> > has it been pulled yet?
> 
> No, I haven't applied it yet, not sure why exactly.
> 
> In the future it's better to CC cpufreq patches to linux-pm@vger.kernel.org so
> that the kernel.org Patchwork can pick them up.  I'm much less likely to
> overlook them then.
> 
> This is a fix, so do we need it in 3.10-rc?

Would be good, yes.

Thanks
Guennadi

> 
> Rafael
> 
> 
> > On Thu, 28 Mar 2013, Shawn Guo wrote:
> > 
> > > On Wed, Mar 27, 2013 at 11:46:38PM +0100, Guennadi Liakhovetski wrote:
> > > > Hi Shawn
> > > > 
> > > > On Mon, 25 Feb 2013, Guennadi Liakhovetski wrote:
> > > > 
> > > > > clk_set_rate() isn't supposed to accept approximate frequencies, instead
> > > > > a supported frequency should be obtained from clk_round_rate() and then
> > > > > used to set the clock.
> > > > > 
> > > > > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > > 
> > > > Can I have your ack for this one, please?
> > > 
> > > Acked-by: Shawn Guo <shawn.guo@linaro.org>

---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
