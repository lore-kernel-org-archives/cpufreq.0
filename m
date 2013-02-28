From: Namhyung Kim <namhyung@kernel.org>
Subject: [PATCH -next 1/3] cpufreq: Fix a typo in comment
Date: Thu, 28 Feb 2013 14:38:00 +0900
Message-ID: <1362029882-28993-1-git-send-email-namhyung@kernel.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: LKML <linux-kernel@vger.kernel.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Namhyung Kim <namhyung.kim@lge.com>, Viresh Kumar <viresh.kumar@linaro.org>

From: Namhyung Kim <namhyung.kim@lge.com>

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 drivers/cpufreq/cpufreq_governor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
index d2ac91150600..46bde01eee62 100644
--- a/drivers/cpufreq/cpufreq_governor.h
+++ b/drivers/cpufreq/cpufreq_governor.h
@@ -64,7 +64,7 @@ static void *get_cpu_dbs_info_s(int cpu)				\
  * dbs: used as a shortform for demand based switching It helps to keep variable
  *	names smaller, simpler
  * cdbs: common dbs
- * on_*: On-demand governor
+ * od_*: On-demand governor
  * cs_*: Conservative governor
  */
 
-- 
1.7.11.7

