From: Russell King <rmk@arm.linux.org.uk>
Subject: Re: [2.4] CVS update?
Date: Mon, 25 Aug 2003 15:48:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030825154804.A16790@flint.arm.linux.org.uk>
References: <20030825125909.GA10585@poupinou.org>
	<20030825143350.GA30810@redhat.com> <3F4A1F91.9010100@yucs.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3F4A1F91.9010100@yucs.org>;
	from spotter@yucs.org on Mon, Aug 25, 2003 at 10:39:13AM -0400
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaya Potter <spotter@yucs.org>
Cc: Dave Jones <davej@redhat.com>, Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Mon, Aug 25, 2003 at 10:39:13AM -0400, Shaya Potter wrote:
> Dave Jones wrote:
> 
> > On Mon, Aug 25, 2003 at 02:59:09PM +0200, Ducrot Bruno wrote:
> >  > There is now a
> >  > ftp://ftp.poupinou.org/cpufreq/cpufreq-24-20030825.tar.gz
> >  > ready to be cvs imported, based on your latest stuff.
> >  > 
> >  > I would like that one being imported to LINUX_2_4 (after tagging
> >  > the older one), but maybe people prefer it to be LINUX_2_4_dev
> >  > or something like that?
> > 
> > Hmm, I'd forgotten how much I hated CVS.
> > 
> > $ cvs add linux/arch/i386/kernel/cpufreq/speedstep-centrino.c
> > cvs server: cannot add file on non-branch tag LINUX_2_4
> > 
> > Ideas ?
> 
> you checked out a tag, not a branch.
> 
> cvs update -r "some_branch"

LINUX_2_4 is a branch though.

However, speedstep-centrino.c pre-exists in the prepository on the trunk.
Exactly how you get around this problem I don't know - CVS tends to suck
too badly most of the time for me (which is why I personally hardly use
it.)

Maybe what you need to do is to check out the head speedstep-centrino.c,
tell cvs to create a branch called "LINUX_2_4" and then commit your 2.4
version to that branch?

-- 
Russell King (rmk@arm.linux.org.uk)                The developer of ARM Linux
             http://www.arm.linux.org.uk/personal/aboutme.html
