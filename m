From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: iBook G3 upon resume...
Date: Fri, 16 Jul 2004 16:04:59 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1090008298.2934.98.camel@gaston>
References: <1089615548.3485.4.camel@hermione.aeon.com.my>
	<20040716082440.GA9707@dominikbrodowski.de>
	<1090004628.2485.94.camel@gaston>
	<20040716194738.GA9307@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040716194738.GA9307@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk, Colin Charles <byte@aeon.com.my>


> 
> Well, I might ask Dave to remove the "unable to verify frequency" warning
> then, as people seem to get curious about it. And a new switch is called for
> by the cpufreq core [*] upon resume [it's schedule_work()'ed]. However, in
> this code snippet from do_set_cpu_speed:
> 
>         freqs.old = cur_freq;
>         freqs.new = (speed_mode == PMAC_CPU_HIGH_SPEED) ? hi_freq : low_freq;
>         freqs.cpu = smp_processor_id();
> 
>         if (freqs.old == freqs.new)
>                 return 0;
> 
> the check (freqs.old == freqs.new) should be removed so that this "forcing"
> of (re- or new) setting is actually done. Also, did I miss anything or is
> there no "cpufreq notifier" on PPC?
> 
> 	Dominik
> 
> 
> 
> [*] At least if looking the latest cpufreq-bk tree, it
> contains a fix which actually enables this behaviour if
> using the most common of all governors, the userspace governor.

Nah, I didn't feel the need for a notifier... I need to check if the PMU
actually keeps the speed accross sleep.

Ben.
