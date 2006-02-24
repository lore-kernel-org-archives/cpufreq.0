From: Adrian Bunk <bunk@stusta.de>
Subject: Re: Status of X86_P4_CLOCKMOD?
Date: Fri, 24 Feb 2006 18:33:03 +0100
Message-ID: <20060224173303.GE3674@stusta.de>
References: <20060214152218.GI10701@stusta.de> <200602240055.30603.ak@suse.de> <20060224023937.GC3674@stusta.de> <200602240342.04573.ak@suse.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932399AbWBXRdG@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <200602240342.04573.ak@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@suse.de>
Cc: Dave Jones <davej@redhat.com>, Dmitry Torokhov <dtor_core@ameritech.net>, davej@codemonkey.org.uk, Zwane Mwaikambo <zwane@commfireservices.com>, Samuel Masham <samuel.masham@gmail.com>, Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@osdl.org>, cpufreq@lists.linux.org.uk

On Fri, Feb 24, 2006 at 03:42:02AM +0100, Andi Kleen wrote:
> On Friday 24 February 2006 03:39, Adrian Bunk wrote:
> 
> > We need an additional option for such cases, but overloading EMBEDDED 
> > with more than one meaning is definitely not a good idea.
> 
> I think it works just fine.

It works in the way that users don't see this option.

Both for this purpose, BROKEN or even simply removing the option would 
work equally well...

> -Andi

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
