From: Blaisorblade <blaisorblade@yahoo.it>
Subject: Re: [patch 1/1] cpufreq_conservative: invert meaning of 'ignore_nice'
Date: Thu, 29 Sep 2005 13:46:33 +0200
Message-ID: <200509291346.33855.blaisorblade@yahoo.it>
References: <20050929084435.GC3169@inskipp.digriz.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932285AbVI2TVx@vger.kernel.org>
In-Reply-To: <20050929084435.GC3169@inskipp.digriz.org.uk>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexander Clouter <alex@digriz.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk, Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, alex-kernel@digriz.org.uk

On Thursday 29 September 2005 10:44, Alexander Clouter wrote:
> The use of the 'ignore_nice' sysfs file is confusing to anyone using.  This
> patch makes it so when you now set it to the default value of 1, process
> nice time is also ignored in the cpu 'busyness' calculation.

> Prior to this patch to set it to '1' to make process nice time count...even
> confused me :)

> WARNING: this obvious breaks any userland tools that expect things to be
> the other way round.  This patch clears up the confusion but should go in
> ASAP as at the moment it seems very few tools even make use of this
> functionality; all I could find was a Gentoo Wiki entry.

My suggestion on this is to rename the flag too, as ignore_nice_load (or 
ignore_nice_tasks, choose your way). Don't forget to do it in docs too.

So userspace tools will error out rather than do the reverse of what they were 
doing, and the user will fix the thing according to the (new) docs.

This is the way we avoid problems in kernel code, when changing APIs (I read 
Linus talking about this), so I assume it's ok?

-- 
Inform me of my mistakes, so I can keep imitating Homer Simpson's "Doh!".
Paolo Giarrusso, aka Blaisorblade (Skype ID "PaoloGiarrusso", ICQ 215621894)
http://www.user-mode-linux.org/~blaisorblade


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it
