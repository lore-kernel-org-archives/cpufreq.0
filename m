From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Sun, 26 Feb 2006 21:55:13 +0100
Message-ID: <20060226205513.GA26486@isilmar.linta.de>
References: <20060214152218.GI10701@stusta.de> <20060223204110.GE6213@redhat.com> <20060225015722.GC8132@linuxtv.org> <200602250527.03493.ak@suse.de> <20060225125326.GJ3674@stusta.de> <20060225132820.GA13413@isilmar.linta.de> <20060226203941.GA5783@linuxtv.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750949AbWBZUzS@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060226203941.GA5783@linuxtv.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Stezenbach <js@linuxtv.org>, Adrian Bunk <bunk@stusta.de>, Andi Kleen <ak@suse.de>, Dave Jones <davej@redhat.com>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

Hi,

On Sun, Feb 26, 2006 at 09:39:41PM +0100, Johannes Stezenbach wrote:
> > No. Let's do the math (again), and (again) for the actual values of an Intel
> > Pentium(R) M Processor, 1400 MHz @ 1.484 V, even though the same rules of
> > physics, logic and mathematics apply to _all_ processors.
> 
> Do you have the numbers for a Pentium(R) 4 HT? (I couldn't find
> anything substantial with google.) Especially C2 vs. C2 + throttling?
> Because the way I remember having read somewhere, the idle
> (C2) power consumption of the P4 is significantly higher
> than with the Pentium(R) M.

Unfortunately, I do not have these numbers present. You can check the
processor specification sheets at Intel's website, though.


> > Power consumption in idle state C2 (Stop-Grant state)	 7.3 W
> > Power consumption when "skipping instructions"
> > 	because of throttling (Stop-Grant state)	 7.3 W
> > 
> > Power consumption when doing work			22.0 W
> > 
> > 
> > This means that if the processor idle percentage is _larger_ than (1 -
> > throttling rate), throttling has no effect at all.
> 
> On a Pentium(R) M, but how about P4? The two have very different
> architectures, don't they?

They have different architectures, but again -- AFAIK -- throttling means STPCLK
is stopped, which is equivalent to the Stop-Grant state. And that's what's
usually entered in C2-type idle sleep.

> > However: for the 75% throttling state, the CPU only produces 11 W of heat
> > _all the time_ -- this means, the fan or air conditioning must only consider
> > 11 W. For 0%, the CPU may produce 44 W of heat in a second -- and to cool
> > that sufficiently, the fan _may_ need to run faster, which consumes more
> > energy than is saved by only having to cool 7.3 W (instead of 11W) the other
> > three seconds.
> 
> This is all fine, but why would anyone use throttling when the
> CPU has work to do (except for thermal emergency throttling)?

That's exactly the opposite of what you should do, if idling works at least
reasonably well: only enter throttling if the CPU has some substancial
workload.

> > So: P4-clockmod style throttling only makes sense if either
> > 
> > a) the idle handler does not enter the Stop-Grant state (C2) efficiently, or
> > 
> > b) the load varies significantly over time in a manner which has effect on
> >    the fan, and where the latency induced by throttling doesn't matter.
> 
> Maybe my previous mails were not clear enough: The goal is to
> reduce idle power consumption (and by that fan noise). The PC
> is running but is idle, e.g just listening for possible incoming
> jabber messages or whatever.

Most probably, the idle handler can't make use of the Stop-Grant state (C2)
here, so this is case a) noted above.

> p4-clockmod: has errata -- disabling frequencies lower than 2ghz


	Dominik
