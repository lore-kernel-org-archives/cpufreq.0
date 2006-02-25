From: Andi Kleen <ak@suse.de>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Sat, 25 Feb 2006 05:27:01 +0100
Message-ID: <200602250527.03493.ak@suse.de>
References: <20060214152218.GI10701@stusta.de> <20060223204110.GE6213@redhat.com> <20060225015722.GC8132@linuxtv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932670AbWBYElf@vger.kernel.org>
In-Reply-To: <20060225015722.GC8132@linuxtv.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johannes Stezenbach <js@linuxtv.org>
Cc: Dave Jones <davej@redhat.com>, Adrian Bunk <bunk@stusta.de>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Saturday 25 February 2006 02:57, Johannes Stezenbach wrote:
> On Thu, Feb 23, 2006, Dave Jones wrote:
> > On Thu, Feb 23, 2006 at 08:59:37PM +0100, Adrian Bunk wrote:
> >  > And if the option is mostly useless, what is it good for?
> > 
> > It's sometimes useful in cases where the target CPU doesn't have any better
> > option (Speedstep/Powernow).  The big misconception is that it
> > somehow saves power & increases battery life. Not so.
> > All it does is 'not do work so often'.  The upside of this is
> > that in some situations, we generate less heat this way.
> 
> Doesn't less heat imply less power consumption?

Not in this case no.

> P4 clockmod certainly sucks compared to Speedstep,
> but IMHO it is still potentially useful for the average
> desktop PC user (at least those many who let their PCs
> run 24/7, but 90% idle and unused).

I don't think so no. The latencies make it unusable.

-Andi
 
