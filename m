From: Andreas Schwab <schwab@linux-m68k.org>
Subject: [PATCH] cpufreq-stats: fix time_in_state statistics
Date: Fri, 02 Aug 2013 20:31:16 +0200
Message-ID: <87vc3o3pxn.fsf@igel.home>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

The time_in_state numbers are in units of jiffies, not cputime.

Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
---
 drivers/cpufreq/cpufreq_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index d37568c..10e6138 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -81,7 +81,7 @@ static ssize_t show_time_in_state(struct cpufreq_policy *policy, char *buf)
 	for (i = 0; i < stat->state_num; i++) {
 		len += sprintf(buf + len, "%u %llu\n", stat->freq_table[i],
 			(unsigned long long)
-			cputime64_to_clock_t(stat->time_in_state[i]));
+			jiffies_64_to_clock_t(stat->time_in_state[i]));
 	}
 	return len;
 }
-- 
1.8.3.4

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
