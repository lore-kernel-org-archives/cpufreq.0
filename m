From: Dave Jones <davej@redhat.com>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
Date: Tue, 31 Aug 2004 23:23:58 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040831222358.GA19600@redhat.com>
References: <20040829124936.GA16770@dominikbrodowski.de>
	<20040830152954.A22480@flint.arm.linux.org.uk>
	<20040830150831.GA9380@dominikbrodowski.de>
	<20040830171607.C22480@flint.arm.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040830171607.C22480@flint.arm.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Mon, Aug 30, 2004 at 05:16:07PM +0100, Russell King wrote:
 > On Mon, Aug 30, 2004 at 05:08:31PM +0200, Dominik Brodowski wrote:
 > > On Mon, Aug 30, 2004 at 03:29:54PM +0100, Russell King wrote:
 > > > Obviously given this information, this flag needs to be removed from ARM.
 > > > If ARM is the only user, then the flag and associated code needs to be
 > > > completely removed.
 > > 
 > > Who shall "push" this patch upstreams? Dave or Russell?
 > 
 > The patch looks good, thanks.
 > 
 > I think Dave would be better - Dave has been pushing most cpufreq stuff
 > to Linus anyway.  Since this is a bug fix rather than a feature, it's
 > definite 2.6.9-rc material.

Merged. I've a handful of other small bits I'm about to merge,
and then I'll send Linus a pull request tonight. Should make it in for -rc2
unless Linus surprises me 8-).

		Dave
