From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Sun, 8 Aug 2004 18:24:08 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040808162408.GA7986@dominikbrodowski.de>
References: <1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040807132449.GA9569@dominikbrodowski.de>
	<1091905423.29221.1.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091905423.29221.1.camel@pc>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Sat, Aug 07, 2004 at 03:03:42PM -0400, Brian J. Murrell wrote:
> On Sat, 2004-08-07 at 15:24 +0200, Dominik Brodowski wrote:
> > 
> > Might it be that interrupts are still disabled during the RESUME
> > notification, and 
> > 
> > #define write_sequnlock_irq(lock)                                       \
> >         do { write_sequnlock(lock); local_irq_enable(); } while(0)
> > 
> > tries to enable them?
> 
> But that sounds like such a fundamental issue that surely I would not be
> the first person to find it, especially considering how long even I was
> seeing it before I found the time to work it up into a bug report.

Problem is, I don't use the resume funcitonality on my notebook as that's
only available with the "vga" video driver instead of "i830"; and I can't
even try it now as my notebook is in quite a sick state [disk corruption!]
caused either by Ingo's voluntary-preempt patches or some experimenting by
myself, which accessed free'd data as if it were non-free'd...

Anyways, I've prepared a patch to work around the "local_irq_enable()" call.
Could you test it, please?

	Dominik

diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i386/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2004-08-05 17:44:47.000000000 +0200
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2004-08-08 18:23:27.791458408 +0200
@@ -265,7 +265,8 @@
 {
 	struct cpufreq_freqs *freq = data;
 
-	write_seqlock_irq(&xtime_lock);
+	if (val != CPUFREQ_RESUMECHANGE)
+		write_seqlock_irq(&xtime_lock);
 	if (!ref_freq) {
 		ref_freq = freq->old;
 		loops_per_jiffy_ref = cpu_data[freq->cpu].loops_per_jiffy;
@@ -291,7 +292,9 @@
 		}
 #endif
 	}
-	write_sequnlock_irq(&xtime_lock);
+
+	if (val != CPUFREQ_RESUMECHANGE)
+		write_sequnlock_irq(&xtime_lock);
 
 	return 0;
 }
