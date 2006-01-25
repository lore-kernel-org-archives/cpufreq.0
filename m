From: Mischa Jonker <mischa.jonker@philips.com>
Subject: [PATCH 2.6.15.1] CPUFREQ: Added range check for ARM Integrator
Date: Wed, 25 Jan 2006 14:59:22 +0100
Message-ID: <OF4BB77455.2FF23295-ONC1257101.004A6D07-C1257101.004D2929@philips.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

From: Mischa Jonker <m.d.s.x.jonker@gmail.com>

Added range check for minimum target frequency for ARM Integrator 
platform.

Signed-off-by: Mischa Jonker <m.d.s.x.jonker@gmail.com>
---
Without the patch, the "ondemand" governor hangs the system, because it 
tries to set a too low operating point. Maybe some range-checking should 
be implemented there as well.

--- linux-2.6.15.1/arch/arm/mach-integrator/cpu.c       2006-01-25 
14:56:21.000000000 +0100
+++ linux-2.6.15.1-patched/arch/arm/mach-integrator/cpu.c       2006-01-25 
14:00:04.000000000 +0100
@@ -109,6 +109,8 @@ static int integrator_set_target(struct 
        vco.r = 22;
        freqs.old = icst525_khz(&cclk_params, vco);
 
+       if (target_freq < policy->min)
+               target_freq = policy->min;
        /* icst525_khz_to_vco rounds down -- so we need the next
         * larger freq in case of CPUFREQ_RELATION_L.
         */
