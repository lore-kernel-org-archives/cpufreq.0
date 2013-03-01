From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: Re: [PATCH/RFC v2 0/2] CPUFreq for kzm9g
Date: Fri, 1 Mar 2013 22:11:41 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1303011649260.18776@axis700.grange>
References: <Pine.LNX.4.64.1302251644010.3030@axis700.grange>
 <CANqRtoSpu3V5KC-POq7+y0NpRx6yNfdZFfgaxa7Lv1gU1rO53Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <CANqRtoSpu3V5KC-POq7+y0NpRx6yNfdZFfgaxa7Lv1gU1rO53Q@mail.gmail.com>
Sender: linux-sh-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-sh@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org

On Tue, 26 Feb 2013, Magnus Damm wrote:

> On Tue, Feb 26, 2013 at 2:16 AM, Guennadi Liakhovetski
> <g.liakhovetski@gmx.de> wrote:
> > In v2 of this patch-set I dropped patches 1 and 3, because #1 is a bug-fix
> > and can go in separately, #3 is more of a debugging help, than a real
> > patch for mainlining. Of the remaining 2 patches the main difference to v1
> > is the omission of the PLL0 manipulation. More is explained in respective
> > patches.
> >
> > Guennadi Liakhovetski (2):
> >   ARM: shmobile: sh73a0: add support for adjusting CPU frequency
> >   ARM: shmobile: kzm9g-reference: add CPUFreq support
> 
> Hi Guennadi,
> 
> Thanks for your work on this. In general I am quite happy about this series.
> 
> One rather significant question is however this: Would it be possible
> for you to check if the TWD is operating as expected when you scale
> the CPU Frequency? I suspect it is not, so please cook up a v3 of this
> series that also includes updates for timers.

At last I managed to get twd running with a recent (of 27.02) all+next 
snapshot on kzm9g with DT (reference) and actually I'm not really sure the 
problem is there. At least definitely not as bad as I saw it last time. To 
remind, the problem I observed was, that at lower CPU speeds a simple 
shell script, consisting of 20 20-second sleep calls was gaining multiple 
seconds, was taking more like 405 seconds, than 400. Now I only see it 
going to 401 seconds. This is still not good, but I need a more precise 
comparison to actually decide, whether this problem only appears at lower 
CPU speeds or it is always there. I'll look further into it next week.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
