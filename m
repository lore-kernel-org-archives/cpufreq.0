From: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: Linux v2.6.18-rc3
Date: Mon, 31 Jul 2006 11:59:45 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0607311140360.8047-100000@iolanthe.rowland.org>
References: <20060731081112.05427677.akpm@osdl.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751106AbWGaP7r@vger.kernel.org>
In-Reply-To: <20060731081112.05427677.akpm@osdl.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: jesse.brandeburg@gmail.com, linux-kernel@vger.kernel.org, torvalds@osdl.org, cpufreq@www.linux.org.uk

On Mon, 31 Jul 2006, Andrew Morton wrote:

> > > I think this is the cpufreq problem wherein it sometimes requires that the
> > > notifier chain be traversed from atomic context and at other times it
> > > requires that sleeping functions be callable from within the traversal. 
> > > IOW: we're screwed whatever type of locking we use on that chain.
> > 
> > I have looked at that problem more closely, and my earlier understanding
> > wasn't quite right.  It's not that the context needs to be atomic at some
> > times but not others -- it should always be a process context.  The
> > problem is that the suspend and resume traversals are done at a time when
> > interrupts need to remain disabled, since cpufreq registers its drivers as
> > sysdevs.  (Kind of like SYSTEM_BOOTING, except that system_state isn't set
> > to anything special.)  Because the down_read() call that protects the
> > notifier chain isn't allowed when interrupts are disabled, the BUG occurs.
> 
> So why wouldn't an atomic notifier be suitable?

I can't be entirely certain.  It looks like most of the callout routines
would work fine in an atomic context, but there are a couple of 
exceptions:

drivers/pcmcia/soc_common.c:soc_pcmcia_notifier() does a down().  Perhaps
this should be made conditional on the notifier message not being
CPUFREQ_SUSPENDCHANGE or CPUFREQ_RESUMECHANGE.  Similarly,
arch/i386/kernel/tsc.c:time_cpufreq_notifier() calls
write_sequnlock_irq().

(Not to mention the fact that drivers/serial/sh-sci.c:sci_init() registers 
a cpufreq notifier but sci_exit() neglects to unregister it.)

In general, the callout routines don't seem to treat the PRECHANGE and
POSTCHANGE messages differently from the SUSPENDCHANGE and RESUMECHANGE
messages.  So I'm reluctant to split the two sorts of messages up into two
separate chains.

> > If someone could give me a hint where a good place would be to carry out
> > the initialization, I'd appreciate it.  Would an initcall be appropriate?  
> > And if so, which sort of initcall?  core_initcall?  The only requirement 
> > is that alloc_percpu() must be available.
> > 
> 
> core_initcall() would suit.  That's actually a bit late for this sort of
> thing, but we can always add a new section later if it becomes a problem. 
> I'd suggest that we ensure that srcu_notifier_chain_register() performs a
> reliable BUG() if it gets called too early.

Okay, let me work on a patch.

Alan Stern
