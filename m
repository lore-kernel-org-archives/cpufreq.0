From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: [PATCH 3/6 v2] cpufreq: tolerate inexact values when collecting stats
Date: Fri,  2 Nov 2012 13:51:46 -0500
Message-ID: <1351882309-733-4-git-send-email-mark.langsdorf@calxeda.com>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com>
 <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: cpufreq@vger.kernel.org, Mark Langsdorf <mark.langsdorf@calxeda.com>, MyungJoo Ham <myungjoo.ham@gmail.com>

When collecting stats, if a frequency doesn't match the table, go through
the table again with both the search frequency and table values shifted
left by 10 bits.

Signed-off-by: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: MyungJoo Ham <myungjoo.ham@gmail.com>

Changes from v1:
	Implemented a simple round-up algorithm instead of the over/under
method that could cause errors on Intel processors with boost mode.
---
 drivers/cpufreq/cpufreq_stats.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 3998316..ab583e7 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -158,8 +158,12 @@ static struct attribute_group stats_attr_group = {
 static int freq_table_get_index(struct cpufreq_stats *stat, unsigned int freq)
 {
 	int index;
+	for (index = 0; index < stat->max_state; index++) 
+		 if (stat->freq_table[index] == freq)
+			return index;
+	/* no exact match, round up */
 	for (index = 0; index < stat->max_state; index++)
-		if (stat->freq_table[index] == freq)
+		if ((stat->freq_table[index] >> 10) == (freq >> 10))
 			return index;
 	return -1;
 }
@@ -251,6 +255,8 @@ static int cpufreq_stats_create_table(struct cpufreq_policy *policy,
 	spin_lock(&cpufreq_stats_lock);
 	stat->last_time = get_jiffies_64();
 	stat->last_index = freq_table_get_index(stat, policy->cur);
+	if (stat->last_index > stat->max_state)
+		stat->last_index = stat->max_state - 1;
 	spin_unlock(&cpufreq_stats_lock);
 	cpufreq_cpu_put(data);
 	return 0;
-- 
1.7.11.7
