From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [RESEND PATCH] EXYNOS: bugfix on retrieving old_index from
 freqs.old
Date: Fri, 20 Jul 2012 11:54:02 +0900
Message-ID: <1342752842-21368-1-git-send-email-myungjoo.ham@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Jonghwa Lee <jonghwa3.lee@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>

From: Jonghwa Lee <jonghwa3.lee@samsung.com>

The policy might have been changed since last call of target().
Thus, using cpufreq_frequency_table_target(), which depends on
policy to find the corresponding index from a frequency, may return
inconsistent index for freqs.old. Thus, old_index should be
calculated not based on the current policy.

We have been observing such issue when scaling_min/max_freq were
updated and sometimes cuased system lockups deu to incorrectly
configured voltages.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index b243a7e..af2d81e 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -62,8 +62,18 @@ static int exynos_target(struct cpufreq_policy *policy,
 		goto out;
 	}
 
-	if (cpufreq_frequency_table_target(policy, freq_table,
-					   freqs.old, relation, &old_index)) {
+	/*
+	 * The policy max have been changed so that we cannot get proper
+	 * old_index with cpufreq_frequency_table_target(). Thus, ignore
+	 * policy and get the index from the raw freqeuncy table.
+	 */
+	for (old_index = 0;
+		freq_table[old_index].frequency != CPUFREQ_TABLE_END;
+		old_index++)
+		if (freq_table[old_index].frequency == freqs.old)
+			break;
+
+	if (freq_table[old_index].frequency == CPUFREQ_TABLE_END) {
 		ret = -EINVAL;
 		goto out;
 	}
-- 
1.7.4.1

