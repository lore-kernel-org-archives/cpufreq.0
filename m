From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
Date: Mon, 30 Aug 2004 14:19:23 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830121923.GR29560@poupinou.org>
References: <20040829124936.GA16770@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040829124936.GA16770@dominikbrodowski.de>
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
To: rmk@arm.linux.org.uk, cpufreq@www.linux.org.uk

Hi Dominik,

On Sun, Aug 29, 2004 at 02:49:36PM +0200, Dominik Brodowski wrote:
> > >  static struct cpufreq_driver sa1110_driver = {
> > > +	.flags		= CPUFREQ_STICKY |
> > > +			  CPUFREQ_PANIC_OUTOFSYNC | 		<<<<
> > > +			  CPUFREQ_PANIC_RESUME_OUTOFSYNC,	<<<<
> >
> > Erm, _why_ ?
> >
> > This makes very little sense.  If you put the system to sleep at
> > 147MHz and it normally boots at 206.4MHz, you'll resume at 206.4MHz.
> 
> I added PANIC_OUTOFSYNC because of the following concern: if the CPU 
> clock is different from what the kernel thinks it is, the RAM and LCD
> and PCMCIA and ... timings might be horribly broken, so better bail out as
> soon as this critical state is detetected.
> 
> With regard to PANIC_RESUME_OUTOFSYNC:
> 
> > It's up to the kernel to reset the clock rate itself.  This is nothing
> > new - cpufreq has always done this, so why are we adding this new
> > restriction?
> 
> cpufreq still does this. However not during sysdev-resume state [because
> notifiers can sleep], but later. This means the problematic discrepancy (see
> above) is there, just for a short period of time. If you think it isn't an
> issue, Bruno's patch to remove both flags is perfectly valid, otherwise
> these flags do make some sense.
> 
> > And to follow that up, yes, I missed it back in June when I added
> > the CPUFREQ_STICKY here.  However, I was completely unaware that
> > this change had been made back in May 2004.
> >
> > Can we please route changes to architecture files via the architecture
> > people _before_ merging them.  Pretty please?
> 
> Not sending this patch to you for discussion was an oversight, and I
> apologize for not having done so. After the first patch series [April 11th]
> didn't generate negative feedback, I -- incorrectly -- assumed everything
> was in order and asked Dave to merge.

Well, I don't see actually your points.  IIRC arm suspend/resume is only
available via apm, so if something goes wrong on this architecture, it's
much more likely a trouble of the firmware.  IIRC, the only action taken
some times ago was to set the frequency to what think the cpufreq
infractucture in the resume path, and this was clearly to make
arm folks happy.
I actually was thinking all those flags were added more for the
i386 architectures, not for arm, but I am apparently completely wrong,
I guess..

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
