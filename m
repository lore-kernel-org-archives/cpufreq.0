From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH] ARM: ux500: send cpufreq notification for all cpus
Date: Wed, 24 Aug 2011 08:44:05 +0200
Message-ID: <1314168245-2373-1-git-send-email-vincent.guittot@linaro.org>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linus.walleij@linaro.org, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-dev@lists.linaro.org
Cc: patches@linaro.org, Vincent Guittot <vincent.guittot@linaro.org>

The same clock is used for all cpus so we must notify the frequency change
for each one in order to update the configuration of all twd clockevents.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 drivers/cpufreq/db8500-cpufreq.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/db8500-cpufreq.c b/drivers/cpufreq/db8500-cpufreq.c
index 0d8dd1c..4cb5785 100644
--- a/drivers/cpufreq/db8500-cpufreq.c
+++ b/drivers/cpufreq/db8500-cpufreq.c
@@ -76,13 +76,13 @@ static int db8500_cpufreq_target(struct cpufreq_policy *policy,
 
 	freqs.old = policy->cur;
 	freqs.new = freq_table[idx].frequency;
-	freqs.cpu = policy->cpu;
 
 	if (freqs.old == freqs.new)
 		return 0;
 
 	/* pre-change notification */
-	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	for_each_online_cpu(freqs.cpu)
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
 	/* request the PRCM unit for opp change */
 	if (prcmu_set_arm_opp(idx2opp[idx])) {
@@ -91,7 +91,8 @@ static int db8500_cpufreq_target(struct cpufreq_policy *policy,
 	}
 
 	/* post change notification */
-	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	for_each_online_cpu(freqs.cpu)
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
 	return 0;
 }
-- 
1.7.4.1

