From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: v3.13.5 intel_pstate: cpufreq: __cpufreq_add_dev: ->get() failed
Date: Wed, 12 Mar 2014 12:09:41 +0100
Message-ID: <1484350.k4sryJixDI@vostro.rjw.lan>
References: <CAA7pwKNmosWaWPR0x3kNzL7eNLk8vdCB=NknU9ayLT9s1fJQYA@mail.gmail.com> <531F6D2D.7070306@gmail.com> <CAKohpokp_-awmmRJ3Vj0vNpORe3cvoZ0+YBW6_pPZxj6_M_OmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpokp_-awmmRJ3Vj0vNpORe3cvoZ0+YBW6_pPZxj6_M_OmA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Patrik Lundquist <patrik.lundquist@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>

On Wednesday, March 12, 2014 01:21:33 PM Viresh Kumar wrote:
> On 12 March 2014 04:08, Dirk Brandewie <dirk.brandewie@gmail.com> wrote:
> > Zero frequency the core is not running.  I said it is a valid answer not
> > that I should be returning it.  There is nothing in the docs or headers that
> > I can
> > find that says Zero is a failure value.
> 
> In this case cpufreq_add_dev() shouldn't have been called for this CPU
> then. And so its obviously better to return error in such cases.

Why isn't it documented, then?

In fact, zero returned by ->get() has no defined meaning as I said before.

The point, however, is that at least intel_pstate could return 0 *before*
your changes and you made up that whole "0 can't be returned from ->get()"
argument.  It *could* be returned and it *was* returned sometimes.

That's what the report is about.

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
