From: "Jesse Brandeburg" <jesse.brandeburg@gmail.com>
Subject: Re: Linux v2.6.18-rc3
Date: Tue, 1 Aug 2006 21:31:22 -0700
Message-ID: <4807377b0608012131mf160bc3iff724910191b521@mail.gmail.com>
References: <20060731081112.05427677.akpm@osdl.org>
	 <Pine.LNX.4.44L0.0607311627240.5805-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751145AbWHBEbY@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.44L0.0607311627240.5805-100000@iolanthe.rowland.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Andrew Morton <akpm@osdl.org>, Kernel development list <linux-kernel@vger.kernel.org>, torvalds@osdl.org, cpufreq@www.linux.org.uk

On 7/31/06, Alan Stern <stern@rowland.harvard.edu> wrote:
> On Mon, 31 Jul 2006, Andrew Morton wrote:
>
> > core_initcall() would suit.  That's actually a bit late for this sort of
> > thing, but we can always add a new section later if it becomes a problem.
> > I'd suggest that we ensure that srcu_notifier_chain_register() performs a
> > reliable BUG() if it gets called too early.
>
> Here's a patch to test.  I can't try it out on my machine because
> 2.6.18-rc2-mm1 (even without the patch) crashes partway through a
> suspend-to-disk, in a way that's extremely hard to debug.  Some sort of
> spinlock-related bug occurs within ioapic_write_entry.

can't test because I also can't suspend or hibernate with rc2-mm1
(resume causes hard hang with the backlight and screen off)  The issue
i reported was against linus' 2.6.18-rc3 kernel.

patch didn't apply to 2.6.18-rc3.

Thanks,
  Jesse
