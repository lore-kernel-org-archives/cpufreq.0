From: Adrian Bunk <bunk@stusta.de>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Sat, 25 Feb 2006 13:53:26 +0100
Message-ID: <20060225125326.GJ3674@stusta.de>
References: <20060214152218.GI10701@stusta.de> <20060223204110.GE6213@redhat.com> <20060225015722.GC8132@linuxtv.org> <200602250527.03493.ak@suse.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932696AbWBYMx2@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200602250527.03493.ak@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Johannes Stezenbach <js@linuxtv.org>, Dave Jones <davej@redhat.com>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Sat, Feb 25, 2006 at 05:27:01AM +0100, Andi Kleen wrote:
> On Saturday 25 February 2006 02:57, Johannes Stezenbach wrote:
> > On Thu, Feb 23, 2006, Dave Jones wrote:
> > > On Thu, Feb 23, 2006 at 08:59:37PM +0100, Adrian Bunk wrote:
> > >  > And if the option is mostly useless, what is it good for?
> > > 
> > > It's sometimes useful in cases where the target CPU doesn't have any better
> > > option (Speedstep/Powernow).  The big misconception is that it
> > > somehow saves power & increases battery life. Not so.
> > > All it does is 'not do work so often'.  The upside of this is
> > > that in some situations, we generate less heat this way.
> > 
> > Doesn't less heat imply less power consumption?
> 
> Not in this case no.
>...

Sorry for the dumb question, but how could this work physically?

If a computer produces less heat with the same power consumption, what 
happens with the other energy?

> -Andi

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
