From: Mike Galbraith <efault@gmx.de>
Subject: Re: Fwd: Nice processes prevent frequency increases - possible
 scheduler regression (known good in 2.6.35)
Date: Sat, 03 Nov 2012 04:48:52 -0700
Message-ID: <1351943332.16850.25.camel@maggy.simpson.net>
References: <CAKKZj2Do+ViFbdmeA9y4qZ4Dd_CrW_wmVWc0_CB4BAAwO6SfJg@mail.gmail.com>
	 <CAKKZj2Av0TN9MbYk=-2ZB_jxDnUCWfrN5tJNZ7azgSHyOrMzvg@mail.gmail.com>
	 <1351942405.16850.23.camel@maggy.simpson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1351942405.16850.23.camel@maggy.simpson.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michal Zatloukal <myxal.mxl@gmail.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

On Sat, 2012-11-03 at 04:33 -0700, Mike Galbraith wrote: 
> On Fri, 2012-11-02 at 21:09 +0100, Michal Zatloukal wrote:
> 
> > On the new kernel, the nice processes are never starved - even when
> > starting a tab-laden chromium session, the processes for BOINC keep
> > about 20% CPU each (that is normalized to all CPUs, ie 40% nice load
> > on each core). The problem is, the governor now seems to consider the
> > non-nice task unable to saturate the CPU, and the cores' frequencies
> > are hovering between 1.0 and 1.8 GHz. The scheduler keeps scheduling
> > the nice tasks, and the non-nice tasks are progressing much slower,
> > caused by the lower CPU speed as well as less processing time
> > allocated to them. HD video stutters often, and Chromium takes at
> > least 2-3 times longer to fully load.
> 
> Your nice 19 tasks receiving 'too much' CPU when there are other
> runnable tasks around sounds like you have SCHED_AUTOGROUP enabled.

(forgot to mention: if that's the case, you can add noautogroup to your
kernel command line to turn it off if distro turned it on in .config)

