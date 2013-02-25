From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] cpufreq: fix sign check of an unsigned variable in cpufreq-cpu0
Date: Mon, 25 Feb 2013 10:42:45 -0800
Message-ID: <20130225184245.14870.87335@quantum>
References: <Pine.LNX.4.64.1302251227140.3030@axis700.grange>
 <CAOh2x=n-G0BwhjH+VXgy=+nbsaH0+5FqWHhDoyU=xWp-EH9Zdg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOh2x=n-G0BwhjH+VXgy=+nbsaH0+5FqWHhDoyU=xWp-EH9Zdg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Viresh Kumar (2013-02-25 04:09:47)
> On Mon, Feb 25, 2013 at 5:02 PM, Guennadi Liakhovetski
> <g.liakhovetski@gmx.de> wrote:
> > A "< 0" test for an unsigned variable is meaningless, change the variable
> > to signed.
> >
> > Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > ---
> >
> > stable?
> >
> >  drivers/cpufreq/cpufreq-cpu0.c |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
> > index 52bf36d..e7bad3c 100644
> > --- a/drivers/cpufreq/cpufreq-cpu0.c
> > +++ b/drivers/cpufreq/cpufreq-cpu0.c
> > @@ -44,7 +44,8 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
> >  {
> >         struct cpufreq_freqs freqs;
> >         struct opp *opp;
> > -       unsigned long freq_Hz, volt = 0, volt_old = 0, tol = 0;
> > +       unsigned long volt = 0, volt_old = 0, tol = 0;
> > +       long freq_Hz;
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> The disease is spread across a bigger region though.
> 
> @Mike: clk_round_rate returns long and __clk_round_rate returns unsigned long
> and clk_ops->round_rate returns long again.. Don't you see something
> strange here?

Yes, this is in my todo list.  I have a branch with some relevant
changes but I haven't posted it yet.

Regards,
Mike
