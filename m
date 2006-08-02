From: Linus Torvalds <torvalds@osdl.org>
Subject: Re: Linux v2.6.18-rc3
Date: Wed, 2 Aug 2006 15:04:44 -0700 (PDT)
Message-ID: <Pine.LNX.4.64.0608021501420.4168@g5.osdl.org>
References: <20060731081112.05427677.akpm@osdl.org> <20060801215919.8596da9d.akpm@osdl.org>
 <4807377b0608021257p27882866i69a5a0a4a1f05dda@mail.gmail.com>
 <200608022216.54797.rjw@sisk.pl> <20060802202309.GD7173@flint.arm.linux.org.uk>
 <20060802203236.GC23389@redhat.com> <20060802205824.GA17599@flint.arm.linux.org.uk>
 <Pine.LNX.4.64.0608021416200.4168@g5.osdl.org> <20060802213834.GB17599@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932261AbWHBWFZ@vger.kernel.org>
In-Reply-To: <20060802213834.GB17599@flint.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Brandeburg <jesse.brandeburg@gmail.com>, Andrew Morton <akpm@osdl.org>, stern@rowland.harvard.edu, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk



On Wed, 2 Aug 2006, Russell King wrote:
> 
> > The serial layer should use set_termios() when users set the termios state 
> > (surprise surprise), not to emulate suspend/restore.
> 
> Yes Linus, you're obviously right.  Would you mind re-engineering this
> while I'm away for the next few days.  For _ALL_ serial drivers, not
> just 8250.  Thanks.

The problem is that right now, the silly set_termios() call can be 
actively detrimental to sub-drivers that do this right. 

I suspect it would be a lot better to just fix a few major serial drivers 
(and yes, that means primarily 8250), and just force others to fix 
themselves as developers get around to it and care (in many cases they 
might not even do so). As it is, going to set_termios way is likely to 
just make things _worse_ in the long run, by just not letting the serial 
driver do what's sane.

		Linus
