From: Russell King <rmk+lkml@arm.linux.org.uk>
Subject: Re: Linux v2.6.18-rc3
Date: Wed, 2 Aug 2006 21:58:24 +0100
Message-ID: <20060802205824.GA17599@flint.arm.linux.org.uk>
References: <20060731081112.05427677.akpm@osdl.org>
	<20060801215919.8596da9d.akpm@osdl.org>
	<4807377b0608021257p27882866i69a5a0a4a1f05dda@mail.gmail.com>
	<200608022216.54797.rjw@sisk.pl>
	<20060802202309.GD7173@flint.arm.linux.org.uk>
	<20060802203236.GC23389@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060802203236.GC23389@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Jesse Brandeburg <jesse.brandeburg@gmail.com>, Andrew Morton <akpm@osdl.org>, stern@rowland.harvard.edu, linux-kernel@vger.kernel.org, torvalds@osdl.org, cpufreq@www.linux.org.uk

On Wed, Aug 02, 2006 at 04:32:36PM -0400, Dave Jones wrote:
> On Wed, Aug 02, 2006 at 09:23:09PM +0100, Russell King wrote:
>  > On Wed, Aug 02, 2006 at 10:16:54PM +0200, Rafael J. Wysocki wrote:
>  > > Please try the following patch from Russell King and see if it helps.
>  > 
>  > I'd have missed this if it weren't for that comment.  It hasn't been
>  > merged so far due to the lack of feedback on it...  Thanks for trying
>  > to get that feedback.
> 
> I'm fairly certain I gave feedback on this, and I'm sure I recall Pavel 
> did too.  It did nothing for me.

Maybe you did, but it never got here.  The last two messages in the
thread were mine posting this patch and pleading for some feedback
which never came.

Rafael has reported that it fixes his problem, which is great - and is
the first bit of feedback I've received on it (thanks Rafael.)

I've no idea why it doesn't work for you though.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 Serial core
