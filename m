From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 7/8] latency must be in _nano_seconds
Date: Wed, 19 Nov 2003 19:07:25 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119190725.GA5653@redhat.com>
References: <20031119183330.GH20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031119183330.GH20576@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Wed, Nov 19, 2003 at 07:33:30PM +0100, Dominik Brodowski wrote:

 >  	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
 > diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
 > --- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-19 17:06:10.571868800 +0100
 > +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-19 18:48:10.150551432 +0100
 > @@ -386,7 +386,7 @@
 >  				minimum_speed, maximum_speed);
 >  
 >  	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 > -	policy->cpuinfo.transition_latency = latency;
 > +	policy->cpuinfo.transition_latency = latency * 20;
 >  	policy->cur = maximum_speed;

Can we at least get a comment explaining where '20' comes from
when we add magic numbers like this? I know, and you know, but
it's a little non-obvious, and in six months time, I'll probably
have forgotten too 8)

 > diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
 > --- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-19 17:07:58.537455536 +0100
 > +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-19 18:46:57.031667192 +0100
 > @@ -959,8 +959,8 @@
 >  	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 >  
 >  	/* Take a crude guess here. */
 > -	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)
 > -	    + (3 * (1 << irt) * 10);
 > +	pol->cpuinfo.transition_latency = (((rvo + 8) * vstable * VST_UNITS_20US)
 > +	    + (3 * (1 << irt) * 10)) * 1000;

Ditto. This one moreso, as its quite complex to begin with.

		Dave
