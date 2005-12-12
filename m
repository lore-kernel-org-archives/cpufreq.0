From: Nigel Cunningham <ncunningham@cyclades.com>
Subject: Re: p4-clockmod help
Date: Mon, 12 Dec 2005 10:29:37 +1000
Message-ID: <1134347376.3810.8.camel@localhost>
References: <200512091107.52676.pat@patdouble.com>
	<1134177285.6860.1.camel@coyote.rexursive.com>
	<200512100652.41406.pat@patdouble.com>
Reply-To: ncunningham@cyclades.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <suspend2-devel-bounces@lists.suspend2.net>
In-Reply-To: <200512100652.41406.pat@patdouble.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.suspend2.net/mailman/listinfo/suspend2-devel>, 
	<mailto:suspend2-devel-request@lists.suspend2.net?subject=unsubscribe>
List-Archive: <http://lists.suspend2.net/lurker/list/suspend2-devel.html>
List-Post: <mailto:suspend2-devel@lists.suspend2.net>
List-Help: <mailto:suspend2-devel-request@lists.suspend2.net?subject=help>
List-Subscribe: <http://lists.suspend2.net/mailman/listinfo/suspend2-devel>,
	<mailto:suspend2-devel-request@lists.suspend2.net?subject=subscribe>
Sender: suspend2-devel-bounces@lists.suspend2.net
Errors-To: suspend2-devel-bounces@lists.suspend2.net
Content-Type: text/plain; charset="us-ascii"
To: Pat Double <pat@patdouble.com>, Cpu-freq mailing list <cpufreq@www.linux.org.uk>
Cc: Suspend2 Devel List <suspend2-devel@lists.suspend2.net>

Hi again Pat et al.

On Sat, 2005-12-10 at 22:52, Pat Double wrote:
> On Friday 09 December 2005 19:14, Bojan Smojver wrote:
> > On Fri, 2005-12-09 at 11:07 -0600, Pat Double wrote:
> > > Has anyone been successful resuming with the p4-clockmod module loaded,
> > > or compiled in?
> >
> > It works on my notebook with FC Rawhide kernels and suspend2.
> 
> It does not work well here. I believe it is because I have a P4 HT, the SMP 
> part is causing problems. I get a BUG sometime after it starts writing the 
> image. Normally it happens while writing the image but can also happen during 
> the atomic copy. I tried to disable calls to change the freq during suspend 
> but I do not even get the suspend function called until the atomic copy, so 
> the bug happens before then. I do not know how to fix this.
> 
> Nigel, any help?
> 
> I get a BUG at p4-clockmod.c, line 142:
> BUG_ON(smp_processor_id() != i);
> 
> The error is an invalid operand 0000
> 
> Also, writing the image becomes VERY slow with p4-clockmod loaded. I do not 
> have any governer loaded except performance.

Since any fix should come from the cpufreq guys, and they'll understand
the issue better than me, I want to refer the problem to them...

Cqufreq guys, I've only had a superficial look at this, but this BUG_ON
appears to be triggering because hot unplugging of cpu1 is not being
taken into account. Can you please help?

Regards,

Nigel
