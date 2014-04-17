From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] cpufreq: ppc: Fix integer overflow in expression
Date: Thu, 17 Apr 2014 11:53:26 +0200
Message-ID: <1397728407-13909-2-git-send-email-geert+renesas@glider.be>
References: <1397728407-13909-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1397728407-13909-1-git-send-email-geert+renesas@glider.be>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

On 32-bit, "12 * NSEC_PER_SEC" doesn't fit in "unsigned long"
(NSEC_PER_SEC is a "long" constant), causing an integer overflow:

drivers/cpufreq/ppc-corenet-cpufreq.c: In function 'corenet_cpufreq_cpu_init':
drivers/cpufreq/ppc-corenet-cpufreq.c:211:9: warning: integer overflow in expression [-Woverflow]

Force the intermediate to be 64-bit by adding an "ULL" suffix to the
constant multiplier to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/cpufreq/ppc-corenet-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/ppc-corenet-cpufreq.c b/drivers/cpufreq/ppc-corenet-cpufreq.c
index e78f9c806de4..53881d78a931 100644
--- a/drivers/cpufreq/ppc-corenet-cpufreq.c
+++ b/drivers/cpufreq/ppc-corenet-cpufreq.c
@@ -208,7 +208,7 @@ static int corenet_cpufreq_cpu_init(struct cpufreq_policy *policy)
 		per_cpu(cpu_data, i) = data;
 
 	policy->cpuinfo.transition_latency =
-				(12 * NSEC_PER_SEC) / fsl_get_sys_freq();
+				(12ULL * NSEC_PER_SEC) / fsl_get_sys_freq();
 	of_node_put(np);
 
 	return 0;
-- 
1.7.9.5

