From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: [PATCH 3/3] cpufreq / s3c24xx: Fix __init attribute locations
Date: Tue, 13 Aug 2013 18:20:10 +0800
Message-ID: <1376389210-11470-3-git-send-email-hanjun.guo@linaro.org>
References: <1376389210-11470-1-git-send-email-hanjun.guo@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1376389210-11470-1-git-send-email-hanjun.guo@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, linaro-acpi@lists.linaro.org, Hanjun Guo <hanjun.guo@linaro.org>

__init belongs after the return type on functions, not before it.

Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
---
 drivers/cpufreq/s3c24xx-cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/s3c24xx-cpufreq.c b/drivers/cpufreq/s3c24xx-cpufreq.c
index 87781eb..3d927d6 100644
--- a/drivers/cpufreq/s3c24xx-cpufreq.c
+++ b/drivers/cpufreq/s3c24xx-cpufreq.c
@@ -392,7 +392,7 @@ static int s3c_cpufreq_init(struct cpufreq_policy *policy)
 	return 0;
 }
 
-static __init int s3c_cpufreq_initclks(void)
+static int __init s3c_cpufreq_initclks(void)
 {
 	_clk_mpll = s3c_cpufreq_clk_get(NULL, "mpll");
 	_clk_xtal = s3c_cpufreq_clk_get(NULL, "xtal");
-- 
1.7.9.5

