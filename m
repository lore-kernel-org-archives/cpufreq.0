From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Fri, 6 Aug 2004 19:14:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040806171438.GA16087@dominikbrodowski.de>
References: <20040805200857.GA28775@redhat.com>
	<pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091742337.10552.44.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091742337.10552.44.camel@pc>
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

[Sidenote: hopefully this message won't be blocked by your blacklist.]

On Thu, Aug 05, 2004 at 05:45:37PM -0400, Brian J. Murrell wrote:
> On Thu, 2004-08-05 at 23:09 +0200, Dominik Brodowski wrote:
> > My bet is that speedstep_get_processor_frequency() returns something 
> > between one and 100000 kHz instead of the proper value _only_ _upon_
> > _resuming_.
> 
> Yeah.

But I lost my bet, too... 

> OK.  BTW: while building I got a compile error:
> 
> arch/i386/kernel/cpu/cpufreq/speedstep-smi.c: In function `speedstep_set_state':arch/i386/kernel/cpu/cpufreq/speedstep-smi.c:183: error: `freqs' undeclared (first use in this function)

Thanks, it's fixed in the current version, which hopefully will get into 2.6.8.

> The messages I get before the oops (and the oops for posterity):
> 
> Back to C!
> zapping low mappings.
> speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0x16300a16 0x0
> FSB code = 0, msr_lo = 372247062
> fsb = 100000
> mult = 372247062
> speedstep-lib: P4 - FSB 100000 kHz; Multiplier 22
> pentium4_get_frequency() returns = 2200000

... which is absolutely correct.

> Warning: CPU frequency out of sync: cpufreq and timingcore thinks of 1200000, i.
> do_div(4757913600000, 2200000)
> do_div(4826899000000, 2200000)
> do_div(4306623200000, 2200000)

... these divides look sane to me, too.

1st (should) return(s) 2162688 loops per jiffies...
2nd (should) return(s) 2194045 kHz ~ 2.2 GHz
3rd (should) return(s) 1957556 as fast_gettimeoffset_quotient.

Next thing is:

		set_cyc2ns_scale(cpu_khz/1000);

cpu_khz was set a few lines above to (hopefully) 2194045;
(inlined) set_cyc2ns_scale() consists of only one instruction:

	cyc2ns_scale = (1000 << CYC2NS_SCALE_FACTOR)/cpu_mhz;

and then time_cpufreq_notifier() exits with one further instruction:

	write_sequnlock_irq(&xtime_lock);

	return 0;


So that's _really_ strange. Could you add a "debug trap" in the form of

	printk("I got here!\n");
before set_cyc2ns_scale, the write_sequnlock_irq and the return statement?
Then we'll hopefully know for sure what breaks.

Thanks,
	Dominik
