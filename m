From: Fabio Baltieri <fabio.baltieri@linaro.org>
Subject: [PATCH] cpufreq: ondemand: fix wrong delay sampling rate
Date: Fri, 23 Nov 2012 14:12:38 +0100
Message-ID: <1353676358-4385-1-git-send-email-fabio.baltieri@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Fabio Baltieri <fabio.baltieri@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>

Restore the correct delay value for ondemand's od_dbs_timer, as it was
changed erroneously in 83f0e55.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Fabio Baltieri <fabio.baltieri@linaro.org>
---
 drivers/cpufreq/cpufreq_ondemand.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index bdaab92..cca3e9f 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -234,7 +234,8 @@ static void od_dbs_timer(struct work_struct *work)
 			dbs_info->sample_type = OD_SUB_SAMPLE;
 			delay = dbs_info->freq_hi_jiffies;
 		} else {
-			delay = delay_for_sampling_rate(dbs_info->rate_mult);
+			delay = delay_for_sampling_rate(od_tuners.sampling_rate
+						* dbs_info->rate_mult);
 		}
 	}
 
-- 
1.7.12.1

