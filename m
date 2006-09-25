From: Ryan Underwood <nemesis@icequake.net>
Subject: Re: writing a cpufreq driver
Date: Mon, 25 Sep 2006 10:39:14 -0500
Message-ID: <20060925153914.GB1364@dbz.icequake.net>
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
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
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
> > > 
> > > You are right.  Maybe Toshiba implemented that:
> > > 
> > > http://www.freepatentsonline.com/7082542.html
> > 
> > Very good catch!
> > 
> 
> Of course, I never wrote toshiba can invalidate this patent by earlyer
> works...  After all we are only speculating.

So I did some more poking around.. this is from the system maintenance
manual:

 System Controller Gate Array 

 This gate array has the following functions: 

 CPU interface/control 
 Level-2 cache memory control 
 DRAM control 
 PCI master/slave interface 
 Write buffer (CPU-DRAM, CPU-PCI, PCI-DRAM) 
 Prefetch buffer (PCI-PCI, PCI-DRAM) 
 Two DMACs: 82C37 equivalent 
 Two PICs: 82C59 equivalent 
 One PIT: 82C54 equivalent 
 Serial interrupt function 
 Power management control 
 Suspend/resume control 
 CPU stop clock function  <-----

Interesting that if it were SMI throttling, they would refer to it as
"stop clock".  I wonder if anyone can tell us whether STPCLK stops TSC
or not.


-- 
Ryan Underwood, <nemesis@icequake.net>
