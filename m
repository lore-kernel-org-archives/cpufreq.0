From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: iBook G3 upon resume...
Date: Fri, 16 Jul 2004 15:03:49 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1090004628.2485.94.camel@gaston>
References: <1089615548.3485.4.camel@hermione.aeon.com.my>
	<20040716082440.GA9707@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040716082440.GA9707@dominikbrodowski.de>
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


> The problem is that the PPC cpufreq driver doesn't yet implement a
> "get_current_frequency" function. As -- at least on x86 hardware -- it isn't
> guarantueed that the frequency upon resume is the same as when going to
> sleep, the cpufreq core wants to compare the result of
> "get_current_frequency" with what it saved before going to sleep. 

It isn't guaranteed on ppc neither actually, well ... I don't really
know at leat for PMU originated switches, as I don't have a spec.

> Ben: in pmac_cpufreq_setup there's this code snippet:
> 
> 	/* Get current cpu clock freq */
> 	value = (u32 *)get_property(cpunode, "clock-frequency", NULL);
> 	if (!value)
> 		goto out;
> 	cur_freq = (*value) / 1000;
> 
> Does "get_property(,"clock-frequency",)" return appropriate results even
> after frequency transitions? If so, we could use that for the
> "get_current_frequency" function.

No. We could force a new switch, or we could eventually check the CPU
PLL divider but that's a bit nasty. 

Ben.
