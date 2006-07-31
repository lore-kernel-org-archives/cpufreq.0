From: Andrew Morton <akpm@osdl.org>
Subject: Re: Linux v2.6.18-rc3
Date: Mon, 31 Jul 2006 08:11:12 -0700
Message-ID: <20060731081112.05427677.akpm@osdl.org>
References: <20060730212746.4c2e1466.akpm@osdl.org>
	<Pine.LNX.4.44L0.0607311033310.7225-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <Pine.LNX.4.44L0.0607311033310.7225-100000@iolanthe.rowland.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Alan Stern <stern@rowland.harvard.edu>
Cc: cpufreq@www.linux.org.uk, torvalds@osdl.org, linux-kernel@vger.kernel.org, jesse.brandeburg@gmail.com

On Mon, 31 Jul 2006 10:54:55 -0400 (EDT)
Alan Stern <stern@rowland.harvard.edu> wrote:

> On Sun, 30 Jul 2006, Andrew Morton wrote:
> 
> > On Sun, 30 Jul 2006 21:13:48 -0700
> > "Jesse Brandeburg" <jesse.brandeburg@gmail.com> wrote:
> > 
> > > On 7/29/06, Linus Torvalds <torvalds@osdl.org> wrote:
> > > >
> > > > Ok, this missed a week (it should really have been -rc4, and we should
> > > > have had a -rc3 a week ago), but the fact is, with a lot of people at the
> > > > kernel summit and at OLS, it was so quiet for a week that there simply was
> > > > no point.
> > > 
> > > not sure if this is a regression or not, get this on my IBM thinkpad
> > > T43 when resuming from S3 or from hibernate to disk.
> > > 
> > > acpi acpi: suspend
> > > PM: Entering mem sleep
> > > Intel machine check architecture supported.
> > > Intel machine check reporting enabled on CPU#0.
> > > Back to C!
> > > BUG: sleeping function called from invalid context at kernel/rwsem.c:20
> > > in_atomic():0, irqs_disabled():1
> > >  [<c012d638>] down_read+0x12/0x1f
> > >  [<c012605b>] blocking_notifier_call_chain+0xe/0x29
> > >  [<c029199a>] cpufreq_resume+0x118/0x13f
> > >  [<c0231b68>] __sysdev_resume+0x20/0x53
> > >  [<c0231ca9>] sysdev_resume+0x16/0x47
> > >  [<c0235f93>] device_power_up+0x5/0xa
> > >  [<c013358d>] suspend_enter+0x3b/0x44
> > >  [<c011b644>] printk+0x1b/0x1f
> > >  [<c01336fe>] enter_state+0x168/0x198
> > >  [<c01337b3>] state_store+0x85/0x99
> > >  [<c013372e>] state_store+0x0/0x99
> > >  [<c019047a>] subsys_attr_store+0x1e/0x22
> > >  [<c01906ca>] sysfs_write_file+0xa6/0xcc
> > >  [<c0190624>] sysfs_write_file+0x0/0xcc
> > >  [<c015ae52>] vfs_write+0xa8/0x159
> > >  [<c015b398>] sys_write+0x41/0x67
> > >  [<c0102bc9>] sysenter_past_esp+0x56/0x79
> > > PM: Finishing wakeup.
> > > acpi acpi: resuming
> > > 
> > > full dmesg and .config attached, I can test patches.
> > 
> > I think this is the cpufreq problem wherein it sometimes requires that the
> > notifier chain be traversed from atomic context and at other times it
> > requires that sleeping functions be callable from within the traversal. 
> > IOW: we're screwed whatever type of locking we use on that chain.
> 
> I have looked at that problem more closely, and my earlier understanding
> wasn't quite right.  It's not that the context needs to be atomic at some
> times but not others -- it should always be a process context.  The
> problem is that the suspend and resume traversals are done at a time when
> interrupts need to remain disabled, since cpufreq registers its drivers as
> sysdevs.  (Kind of like SYSTEM_BOOTING, except that system_state isn't set
> to anything special.)  Because the down_read() call that protects the
> notifier chain isn't allowed when interrupts are disabled, the BUG occurs.

So why wouldn't an atomic notifier be suitable?

> > I think Alan is cooking up a scheme wherein we fix this with an srcu-locked
> > notifier chain.  If so, it'd be nice to get that moving along a bit?
> 
> Yes; protecting the notifier chain by SRCU instead of an rwsem will 
> prevent the problem.  It's a trivial change, except for one thing: SRCU 
> structures require initialization at runtime before they can be used.  
> This initialization must be done before any driver tries to register on 
> the cpufreq transition notifier chain.
> 
> If someone could give me a hint where a good place would be to carry out
> the initialization, I'd appreciate it.  Would an initcall be appropriate?  
> And if so, which sort of initcall?  core_initcall?  The only requirement 
> is that alloc_percpu() must be available.
> 

core_initcall() would suit.  That's actually a bit late for this sort of
thing, but we can always add a new section later if it becomes a problem. 
I'd suggest that we ensure that srcu_notifier_chain_register() performs a
reliable BUG() if it gets called too early.
