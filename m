From: Ryan Underwood <nemesis@icequake.net>
Subject: Re: writing a cpufreq driver
Date: Mon, 25 Sep 2006 11:44:53 -0500
Message-ID: <20060925164453.GA32312@dbz.icequake.net>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060922153948.GN4945@poupinou.org>
	<20060922160025.GA4459@dbz.icequake.net>
	<20060922160514.GQ4945@poupinou.org>
	<20060922161149.GC4459@dbz.icequake.net>
	<20060923150751.GR4945@poupinou.org>
	<20060923152144.GA15964@dbz.icequake.net>
	<20060923154442.GT4945@poupinou.org>
	<20060923160335.GB15964@dbz.icequake.net>
	<20060923161311.GV4945@poupinou.org>
Reply-To: nemesis@icequake.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060923161311.GV4945@poupinou.org>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Cpufreq@lists.linux.org.uk, Ryan Underwood <nemesis@icequake.net>


On Sat, Sep 23, 2006 at 06:13:11PM +0200, Bruno Ducrot wrote:
> On Sat, Sep 23, 2006 at 11:03:36AM -0500, Ryan Underwood wrote:
> > 
> > On Sat, Sep 23, 2006 at 05:44:42PM +0200, Bruno Ducrot wrote:
> > > > 
> > > > But if it were using STPCLK, TSC would be slowed too, right?  TSC just
> > > > counts the clock cycles of CPU.  I was thinking the method was to enter
> > > > SMM and run HLT instructions or similar.  That way power is saved but
> > > > TSC is preserved.  Unfortunately, that makes the power saving mode on
> > > > this particular machine useless, since Linux already runs HLT during
> > > > idle.

Hmm:
24319201.pdf Intel P3 system programmers guide, page 425. 

"The counter is incremented on every processor clock cycle, 
 even when the processor is halted by the HLT instruction or 
 the external STPCLK# pin"

So maybe it is using STPCLK after all.  Certainly seems like counter
intuitive behavior though.

-- 
Ryan Underwood, <nemesis@icequake.net>
