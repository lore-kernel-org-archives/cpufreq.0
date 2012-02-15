From: Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH 10/12] drivers/cpufreq/db8500-cpufreq: remove references to cpu_*_map.
Date: Wed, 15 Feb 2012 15:28:04 +1030
Message-ID: <1329281884.20530.rusty@rustcorp.com.au>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: cpufreq@vger.kernel.org, davej@redhat.com, jonas.aberg@stericsson.com, martin.persson@stericsson.com, sundar.iyer@stericsson.com

From: Rusty Russell <rusty@rustcorp.com.au>

This has been obsolescent for a while; time for the final push.

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
Cc: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org
Cc: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: Martin Persson <martin.persson@stericsson.com>
Cc: Jonas Aaberg <jonas.aberg@stericsson.com>
---
 drivers/cpufreq/db8500-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/db8500-cpufreq.c b/drivers/cpufreq/db8500-cpufreq.c
--- a/drivers/cpufreq/db8500-cpufreq.c
+++ b/drivers/cpufreq/db8500-cpufreq.c
@@ -145,7 +145,7 @@ static int __cpuinit db8500_cpufreq_init
 	policy->cpuinfo.transition_latency = 20 * 1000; /* in ns */
 
 	/* policy sharing between dual CPUs */
-	cpumask_copy(policy->cpus, &cpu_present_map);
+	cpumask_copy(policy->cpus, cpu_present_mask);
 
 	policy->shared_type = CPUFREQ_SHARED_TYPE_ALL;
 

