From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V2 2/4] cpufreq: exynos: Remove error return even if no soc is found
Date: Sat,  2 Mar 2013 15:04:12 +0530
Message-ID: <1362216854-6633-2-git-send-email-amit.daniel@samsung.com>
References: <1362216854-6633-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=0RRXFWqRZKoyDubdlp30gaBpygtYV6TqlnoWKHStDds=;
        b=K9ObR8MCrvqkOUAhpiRTsRZmp8lfREnNyZrdIbEiNkW4+dtAshm/UB9EfdOUPYk6kY
         P0yQjV+glYO9ggGRB4Y4aR3YICgto3cjspPGqncBw3v9jut7kl5YuYeOBWqnaS7kQekS
         9nBB5fLBGZ8poSi4vkq4rfqdehHcC1jyfi28t69ekaJliiDK5XWg7dSgq+rHfo+3QfgS
         lXNDO90vM7oI8cz6/YTw76E1GbvsFAo5h0ZjZQ/Dp1CxsTIIR1aui3hlZnr9z2o8Ry3O
         6KPG9pqVTl/+8orUuqY83tuIS2L4MQYR3wMZ7D5+iW/9E0t5MeBYfETanVCxgzRJCPHr
         V5Gw==
In-Reply-To: <1362216854-6633-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>

This patch helps to have single binary for exynos5440 and previous
exynos soc's. This change is needed for adding exynos5440 cpufreq driver
which does not uses exynos-cpufreq common file and adds it own driver.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 78057a3..ee75997 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -297,7 +297,7 @@ static int __init exynos_cpufreq_init(void)
 	else if (soc_is_exynos5250())
 		ret = exynos5250_cpufreq_init(exynos_info);
 	else
-		pr_err("%s: CPU type not found\n", __func__);
+		return 0;
 
 	if (ret)
 		goto err_vdd_arm;
-- 
1.7.1
