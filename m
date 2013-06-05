From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq: cpufreq-cpu0: use the exact frequency for clk_set_rate()
Date: Wed, 05 Jun 2013 14:15:28 +0200
Message-ID: <91385266.39H0Z0D5Kr@vostro.rjw.lan>
References: <Pine.LNX.4.64.1302251820431.3030@axis700.grange> <16318112.i755nOUCKx@vostro.rjw.lan> <Pine.LNX.4.64.1306051323160.19739@axis700.grange>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1306051323160.19739@axis700.grange>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Shawn Guo <shawn.guo@linaro.org>

On Wednesday, June 05, 2013 01:25:37 PM Guennadi Liakhovetski wrote:
> Hi Rafael
> 
> On Wed, 22 May 2013, Rafael J. Wysocki wrote:
> 
> > On Wednesday, May 22, 2013 08:12:22 PM Guennadi Liakhovetski wrote:
> > > Hi Rafael
> > > 
> > > I don't see this patch in your cpufreq branch nor in next or Linus' trees, 
> > > has it been pulled yet?
> > 
> > No, I haven't applied it yet, not sure why exactly.
> > 
> > In the future it's better to CC cpufreq patches to linux-pm@vger.kernel.org so
> > that the kernel.org Patchwork can pick them up.  I'm much less likely to
> > overlook them then.
> > 
> > This is a fix, so do we need it in 3.10-rc?
> 
> Would be good, yes.

OK, queued up for 3.10.

Thanks,
Rafael


> > > On Thu, 28 Mar 2013, Shawn Guo wrote:
> > > 
> > > > On Wed, Mar 27, 2013 at 11:46:38PM +0100, Guennadi Liakhovetski wrote:
> > > > > Hi Shawn
> > > > > 
> > > > > On Mon, 25 Feb 2013, Guennadi Liakhovetski wrote:
> > > > > 
> > > > > > clk_set_rate() isn't supposed to accept approximate frequencies, instead
> > > > > > a supported frequency should be obtained from clk_round_rate() and then
> > > > > > used to set the clock.
> > > > > > 
> > > > > > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > > > > 
> > > > > Can I have your ack for this one, please?
> > > > 
> > > > Acked-by: Shawn Guo <shawn.guo@linaro.org>
> 
> ---
> Guennadi Liakhovetski, Ph.D.
> Freelance Open-Source Software Developer
> http://www.open-technology.de/
-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
