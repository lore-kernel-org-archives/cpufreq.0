From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: iBook G3 upon resume...
Date: Fri, 16 Jul 2004 21:47:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040716194738.GA9307@dominikbrodowski.de>
References: <1089615548.3485.4.camel@hermione.aeon.com.my>
	<20040716082440.GA9707@dominikbrodowski.de>
	<1090004628.2485.94.camel@gaston>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1090004628.2485.94.camel@gaston>
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
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: cpufreq@www.linux.org.uk, Colin Charles <byte@aeon.com.my>

> > Ben: in pmac_cpufreq_setup there's this code snippet:
> > 
> > 	/* Get current cpu clock freq */
> > 	value = (u32 *)get_property(cpunode, "clock-frequency", NULL);
> > 	if (!value)
> > 		goto out;
> > 	cur_freq = (*value) / 1000;
> > 
> > Does "get_property(,"clock-frequency",)" return appropriate results even
> > after frequency transitions? If so, we could use that for the
> > "get_current_frequency" function.
> 
> No. We could force a new switch, or we could eventually check the CPU
> PLL divider but that's a bit nasty. 

Well, I might ask Dave to remove the "unable to verify frequency" warning
then, as people seem to get curious about it. And a new switch is called for
by the cpufreq core [*] upon resume [it's schedule_work()'ed]. However, in
this code snippet from do_set_cpu_speed:

        freqs.old = cur_freq;
        freqs.new = (speed_mode == PMAC_CPU_HIGH_SPEED) ? hi_freq : low_freq;
        freqs.cpu = smp_processor_id();

        if (freqs.old == freqs.new)
                return 0;

the check (freqs.old == freqs.new) should be removed so that this "forcing"
of (re- or new) setting is actually done. Also, did I miss anything or is
there no "cpufreq notifier" on PPC?

	Dominik



[*] At least if looking the latest cpufreq-bk tree, it
contains a fix which actually enables this behaviour if
using the most common of all governors, the userspace governor.
