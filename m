From: Andi Kleen <andi@firstfloor.org>
Subject: Re: Improving High-Load Performance with the Ondemand Governor
Date: Mon, 13 Sep 2010 22:54:56 +0200
Message-ID: <20100913225456.13cbbaef@basil.nowhere.org>
References: <4C88EF04.1030908@verisign.com>
	<87r5h2t5b5.fsf@basil.nowhere.org>
	<4C8E872B.2020503@verisign.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4C8E872B.2020503@verisign.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David C Niemi <dniemi@verisign.com>
Cc: cpufreq@vger.kernel.org, lenb@kernel.org

On Mon, 13 Sep 2010 16:18:51 -0400
David C Niemi <dniemi@verisign.com> wrote:


> > > I have tested patches for both 2.6.18 and 2.6.32, but before
> > > sharing them I'd like to first describe the problem I'm trying to
> > > solve and the strategy I've been trying and get some feedback on
> > > it.
> >
> > These are all ancient in terms of mainline kernel. The latest
> > kernel should have some improvements, perhaps try them first.
> >
> I have looked at the latest kernels too, and the changes in the
> ondemand governor between that and RHEL 6's 2.6.32 kernel are quite
> modest.  I mention 2.6.18 just because it's what's been out in the
> field a while.

Most of the interesting changes were post 2.6.32 (2.6.32 is ancient
too for mainline)  

> > FWIW when you're truly idle you typically don't need ondemand,
> > the idle states on modern CPUs go to the lowest frequency by
> > themselves or simply turn off the frequency completely.
> >
> I do see c-states getting used on Intel hardware to save power, and

ondemand has nothing to do with c-states, c-states are handled
by the menu governor.

> in some cases these are quite effective.  On AMD hardware lowering 
> frequency tends to be very important to saving power.

AFAIK modern AMD doesn't need this either in c-states.

> > ondemand and p-states mainly help you on moderate load.
> >
> > Just going to highest state unconditionally would be somewhat
> > contraproductive to that goal.
> >
> On moderate load I might agree, but on the servers I care about it is
> a workload that's a bit like war -- long periods of boredom
> punctuated by sudden bursts of sheer terror. 

In this case on modern hardware you don't need a p-state
governor at all except for "performance"

-Andi
-- 
ak@linux.intel.com -- Speaking for myself only.
