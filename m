From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH 7/8] latency must be in _nano_seconds
Date: Thu, 20 Nov 2003 19:31:33 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031120183133.GA4425@brodo.de>
References: <20031119183330.GH20576@brodo.de>
	<20031119190725.GA5653@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031119190725.GA5653@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Nov 19, 2003 at 07:07:25PM +0000, Dave Jones wrote:
> On Wed, Nov 19, 2003 at 07:33:30PM +0100, Dominik Brodowski wrote:
> 
>  >  	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
>  > diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
>  > --- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-19 17:06:10.571868800 +0100
>  > +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-19 18:48:10.150551432 +0100
>  > @@ -386,7 +386,7 @@
>  >  				minimum_speed, maximum_speed);
>  >  
>  >  	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
>  > -	policy->cpuinfo.transition_latency = latency;
>  > +	policy->cpuinfo.transition_latency = latency * 20;
>  >  	policy->cur = maximum_speed;
> 
> Can we at least get a comment explaining where '20' comes from
> when we add magic numbers like this? I know, and you know, but
> it's a little non-obvious, and in six months time, I'll probably
> have forgotten too 8)

Comment added.
 
>  > diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
>  > --- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-19 17:07:58.537455536 +0100
>  > +++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-19 18:46:57.031667192 +0100
>  > @@ -959,8 +959,8 @@
>  >  	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
>  >  
>  >  	/* Take a crude guess here. */
>  > -	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)
>  > -	    + (3 * (1 << irt) * 10);
>  > +	pol->cpuinfo.transition_latency = (((rvo + 8) * vstable * VST_UNITS_20US)
>  > +	    + (3 * (1 << irt) * 10)) * 1000;
> 
> Ditto. This one moreso, as its quite complex to begin with.

What Paul Devriendt did here I do not know, but I added a comment for the
factor "1000"...

	Dominik

Even though the core stated that cpuinfo.transition_latency needs to be
in 10^(-9) s, hardly any driver set it to nanoseconds but to microseconds.
So, fix up the drivers.

 arch/arm/mach-integrator/cpu.c             |    2 +-
 arch/i386/kernel/cpu/cpufreq/acpi.c        |    4 ++--
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |    2 +-
 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |    6 +++++-
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |    7 ++++---
 include/linux/cpufreq.h                    |    2 +-
 6 files changed, 14 insertions(+), 9 deletions(-)

diff -ruN linux-original/arch/arm/mach-integrator/cpu.c linux/arch/arm/mach-integrator/cpu.c
--- linux-original/arch/arm/mach-integrator/cpu.c	2003-11-20 19:17:28.489660360 +0100
+++ linux/arch/arm/mach-integrator/cpu.c	2003-11-20 19:17:34.311775264 +0100
@@ -172,7 +172,7 @@
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.max_freq = 160000;
 	policy->cpuinfo.min_freq = 12000;
-	policy->cpuinfo.transition_latency = 1000; /* 1 ms, assumed */
+	policy->cpuinfo.transition_latency = 1000000; /* 1 ms, assumed */
 	policy->cur = policy->min = policy->max =
 		icst525_khz(&cclk_params, vco); /* current freq */
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c linux/arch/i386/kernel/cpu/cpufreq/acpi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-11-20 19:17:28.510657168 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-11-20 19:17:34.312775112 +0100
@@ -578,8 +578,8 @@
 	/* detect transition latency */
 	policy->cpuinfo.transition_latency = 0;
 	for (i=0;i<perf->state_count;i++) {
-		if (perf->states[i].transition_latency > policy->cpuinfo.transition_latency)
-			policy->cpuinfo.transition_latency = perf->states[i].transition_latency;
+		if ((perf->states[i].transition_latency * 1000) > policy->cpuinfo.transition_latency)
+			policy->cpuinfo.transition_latency = perf->states[i].transition_latency * 1000;
 	}
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cur = perf->states[pr->limit.state.px].core_frequency * 1000;
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-20 19:17:28.540652608 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-20 19:17:34.312775112 +0100
@@ -255,7 +255,7 @@
 	
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = 1000;
+	policy->cpuinfo.transition_latency = 1000000; /* assumed */
 	policy->cur = stock_freq;
 
 	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-20 19:17:28.541652456 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-20 19:20:35.230271472 +0100
@@ -386,7 +386,11 @@
 				minimum_speed, maximum_speed);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = latency;
+
+	/* latency is in 10 ns (look for SGTC above) for each VID
+	 * and FID transition, so multiply that value with 20 */
+	policy->cpuinfo.transition_latency = latency * 20;
+
 	policy->cur = maximum_speed;
 
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-20 19:17:28.591644856 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-20 19:18:45.550945264 +0100
@@ -958,9 +958,10 @@
 
 	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	/* Take a crude guess here. */
-	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)
-	    + (3 * (1 << irt) * 10);
+	/* Take a crude guess here. 
+	 * That guess was in microseconds, so multply with 1000 */
+	pol->cpuinfo.transition_latency = (((rvo + 8) * vstable * VST_UNITS_20US)
+	    + (3 * (1 << irt) * 10)) * 1000;
 
 	if (query_current_values_with_pending_wait())
 		return -EIO;
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-11-20 19:17:28.695629048 +0100
+++ linux/include/linux/cpufreq.h	2003-11-20 19:17:34.314774808 +0100
@@ -57,7 +57,7 @@
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
-	unsigned int		transition_latency; /* in 10^(-9) s */
+	unsigned int		transition_latency; /* in 10^(-9) s = nanoseconds */
 };
 
 struct cpufreq_real_policy {
