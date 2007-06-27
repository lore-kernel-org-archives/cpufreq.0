From: Thomas Renninger <trenn@suse.de>
Subject: Re: [Bug 8671] CPU frequency always on highest frequency after
	wakeup from suspend to disk
Date: Wed, 27 Jun 2007 11:28:06 +0200
Message-ID: <1182936486.4249.128.camel@queen.suse.de>
References: <20070626133323.70AED1080F7@picon.linux-foundation.org>
	<1182866228.4249.102.camel@queen.suse.de>
	<20070626203121.GC14751@redhat.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20070626203121.GC14751@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Hal@freedesktop.org, linux@markus-schaub.de, Danny Kukawka <dkukawka@suse.de>, cpufreq <cpufreq@www.linux.org.uk>

On Tue, 2007-06-26 at 16:31 -0400, Dave Jones wrote:
> On Tue, Jun 26, 2007 at 03:57:08PM +0200, Thomas Renninger wrote:
>  > On Tue, 2007-06-26 at 06:33 -0700, bugme-daemon@bugzilla.kernel.org
>  > wrote:
>  > > http://bugzilla.kernel.org/show_bug.cgi?id=8671
>  > 
>  > > ------- Comment #10 from linux@markus-schaub.de  2007-06-26 06:37 -------
>  > > Yepp, the patch from Thomas works.
>  > 
>  > Dave, is this acceptable?
>  > If yes, I expect you are going to pick it for the next kernel iteration
>  > and people still need to workaround this one in userspace or need to
>  > pick up the patch separately?
> 
> Yeah, looks like the easiest way to solve that.
> Can you mail me a copy off-list, and I'll get to it
> as soon as I get back from OLS ?
> 
Ok.
But people should be aware that as soon as userspace integrates a policy
to add/remove CPUs for e.g. power saving reasons dynamically, userspace
still must rewrite governors for specific events.
For these solutions:

   a) store the governor of each removed CPU.
   b) restore to the default governor (currently done)
   c) restore to the governor CPU0 uses (that's what you propose)
      But you might have run different governors on the CPUs, so this
      patch still does not ensure that the same governor is run as
      before removing the CPU.

This action needs to be taken in user space:

a) If a CPU got removed and user space switches governors,
   it must make sure the governor gets written as soon as the
   CPU gets added again.
   Not sure about resume. If all CPUs (also the removed ones)
   are brought up again, the governor must be written to them.

b) If run on an alternative governor governor must be rewritten in 
   resume and re-add case.

c) Best solution for userspace if only one governor can run at the same 
   time.
   Synchronization needed at resume and hot-adding if several governors
   can run at the same time.

I am really not sure what is best here....
Reducing the abilities so that only one governor can be run at the same
time, would make this all much easier, then we should go for c) and
everything is fine.
Some people liked the idea, some not..., again is this really necessary?

   Thomas
