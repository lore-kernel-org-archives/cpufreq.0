From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 7/8] latency must be in _nano_seconds
Date: Wed, 19 Nov 2003 19:33:30 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119183330.GH20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
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
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

Even though the core stated that cpuinfo.transition_latency needs to be
in 10^(-9) s, hardly any driver set it to nanoseconds but to microseconds.
So, fix up the drivers.

 arch/arm/mach-integrator/cpu.c             |    2 +-
 arch/i386/kernel/cpu/cpufreq/acpi.c        |    4 ++--
 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |    2 +-
 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |    2 +-
 arch/i386/kernel/cpu/cpufreq/powernow-k8.c |    4 ++--
 include/linux/cpufreq.h                    |    2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff -ruN linux-original/arch/arm/mach-integrator/cpu.c linux/arch/arm/mach-integrator/cpu.c
--- linux-original/arch/arm/mach-integrator/cpu.c	2003-11-19 17:06:11.554719384 +0100
+++ linux/arch/arm/mach-integrator/cpu.c	2003-11-19 18:43:38.036918992 +0100
@@ -172,7 +172,7 @@
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.max_freq = 160000;
 	policy->cpuinfo.min_freq = 12000;
-	policy->cpuinfo.transition_latency = 1000; /* 1 ms, assumed */
+	policy->cpuinfo.transition_latency = 1000000; /* 1 ms, assumed */
 	policy->cur = policy->min = policy->max =
 		icst525_khz(&cclk_params, vco); /* current freq */
 
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c linux/arch/i386/kernel/cpu/cpufreq/acpi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-11-19 17:06:10.570868952 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-11-19 18:46:00.268296536 +0100
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
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-19 18:22:58.441366160 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-19 18:44:47.510357424 +0100
@@ -255,7 +255,7 @@
 	
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = 1000;
+	policy->cpuinfo.transition_latency = 1000000; /* assumed */
 	policy->cur = stock_freq;
 
 	return cpufreq_frequency_table_cpuinfo(policy, &p4clockmod_table[0]);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-19 17:06:10.571868800 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2003-11-19 18:48:10.150551432 +0100
@@ -386,7 +386,7 @@
 				minimum_speed, maximum_speed);
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = latency;
+	policy->cpuinfo.transition_latency = latency * 20;
 	policy->cur = maximum_speed;
 
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-19 17:07:58.537455536 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2003-11-19 18:46:57.031667192 +0100
@@ -959,8 +959,8 @@
 	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	/* Take a crude guess here. */
-	pol->cpuinfo.transition_latency = ((rvo + 8) * vstable * VST_UNITS_20US)
-	    + (3 * (1 << irt) * 10);
+	pol->cpuinfo.transition_latency = (((rvo + 8) * vstable * VST_UNITS_20US)
+	    + (3 * (1 << irt) * 10)) * 1000;
 
 	if (query_current_values_with_pending_wait())
 		return -EIO;
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-11-19 18:38:58.586401928 +0100
+++ linux/include/linux/cpufreq.h	2003-11-19 18:42:27.944574648 +0100
@@ -57,7 +57,7 @@
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
-	unsigned int		transition_latency; /* in 10^(-9) s */
+	unsigned int		transition_latency; /* in 10^(-9) s = nanoseconds */
 };
 
 struct cpufreq_real_policy {
