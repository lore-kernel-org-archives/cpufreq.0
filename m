From: Shaya Potter <spotter@yucs.org>
Subject: Re: [2.4] CVS update?
Date: Mon, 25 Aug 2003 10:39:13 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F4A1F91.9010100@yucs.org>
References: <20030825125909.GA10585@poupinou.org>
	<20030825143350.GA30810@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20030825143350.GA30810@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

Dave Jones wrote:

> On Mon, Aug 25, 2003 at 02:59:09PM +0200, Ducrot Bruno wrote:
>  > There is now a
>  > ftp://ftp.poupinou.org/cpufreq/cpufreq-24-20030825.tar.gz
>  > ready to be cvs imported, based on your latest stuff.
>  > 
>  > I would like that one being imported to LINUX_2_4 (after tagging
>  > the older one), but maybe people prefer it to be LINUX_2_4_dev
>  > or something like that?
> 
> Hmm, I'd forgotten how much I hated CVS.
> 
> $ cvs add linux/arch/i386/kernel/cpufreq/speedstep-centrino.c
> cvs server: cannot add file on non-branch tag LINUX_2_4
> 
> Ideas ?

you checked out a tag, not a branch.

cvs update -r "some_branch"

shaya
