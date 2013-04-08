From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V6 2/4] cpufreq: exynos: Remove error return even if no soc is found
Date: Mon,  8 Apr 2013 13:47:36 +0530
Message-ID: <1365409058-32643-3-git-send-email-amit.daniel@samsung.com>
References: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=HJ2AadefxzjMjNpZEqYkBBHILjgjQhcW04B9Cjfj13k=;
        b=MPiAlVx6LaiTVhS7oFjrbmU+rxmAyLJAPx/n85rM6MHcaNYqUSD0oTzDQZXhrg4qrE
         IIyNMZOjIitlIavQHFIm51xqXewbSYlF2xV4p6XGvgfoY/KX5mth5kLeaZ44wA+RqB/D
         SUT9KjoX2+LR8JpRc0WvDR07tXtKFgJNo9WtMLFZVenTT9m9qU9zk5pEeEzmiLu4urtr
         XvTgLh3+fd0YTriaFLf82YDvz5jU6NvXl1eaAtg9pjovBiQp1QrTtPrhqnvBu0aKYugf
         w+eW8gcLx7loud1PmOFrC/C6EkzggY7TRRFw873bPHjVLHICCgLbyJHHB/0LfosUNQ7N
         D5Xw==
In-Reply-To: <1365409058-32643-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, cpufreq@vger.kernel.org, Inderpal Singh <inderpal.singh@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>

This patch helps to have single binary for exynos5440 and previous
exynos soc's. This change is needed for adding exynos5440 cpufreq driver
which does not uses exynos-cpufreq common file and adds it own driver.

Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael J. Wysocki <rjw@sisk.pl>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index c0c4ce5..475b4f6 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -294,7 +294,7 @@ static int __init exynos_cpufreq_init(void)
 	else if (soc_is_exynos5250())
 		ret = exynos5250_cpufreq_init(exynos_info);
 	else
-		pr_err("%s: CPU type not found\n", __func__);
+		return 0;
 
 	if (ret)
 		goto err_vdd_arm;
-- 
1.7.1
