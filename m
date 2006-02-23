From: Andi Kleen <ak@suse.de>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Fri, 24 Feb 2006 00:15:59 +0100
Message-ID: <200602240016.00317.ak@suse.de>
References: <20060214152218.GI10701@stusta.de> <20060223195937.GA5087@stusta.de> <20060223204110.GE6213@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751806AbWBWXOd@vger.kernel.org>
In-Reply-To: <20060223204110.GE6213@redhat.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: Adrian Bunk <bunk@stusta.de>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Thursday 23 February 2006 21:41, Dave Jones wrote:

> It's really of limited practical use, but occasionally, we find
> some users that do find it handy.  (One case I heard was someone
> with a server farm that generated lots of heat, but at nighttime,
> he could throttle that back, which resulted in a drop in overall
> temperature in the serverroom -- no numbers to back it up though,
> just anecdotes).

Perhaps they should just turn some computers off over night then.

Another drawback is that adds very long latencies. e.g. when it is
enabled you can really end up with desktops where the mouse
doesn't react for a very visible to humans delay.

And it'll mess up kernel timing in general.

> As to the difference of EMBEDDED.. on 32bit, there's a lot more
> systems without speedstep/powernow, so it makes more sense to
> make it more widely available.  Nearly all AMD64/EM64T have
> some form of speed-scaling which is more effective than p4-clockmod,
> which is why I assume it's set that way.
>
> Andi can probably confirm the thinking on that one, as I think
> he added it when x86-64 first started supporting cpufreq.

It should IMHO depend on EMBEDDED on i386 too because
the uses are extremly specialized (if there are any) and most users setting it 
probably set it by mistake because they misunderstand it.

-Andi
