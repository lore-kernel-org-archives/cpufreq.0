From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH] cpufreq: exynos: Add the missing cpufreq_cpu_put function
Date: Wed, 26 Dec 2012 13:35:34 -0800
Message-ID: <1356557734-15640-1-git-send-email-amit.daniel@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
        bh=0IRjljSb4Qorub/KImjpTu6TBa0eq5JlFRuaT0RlL94=;
        b=ME2A1ny/B4wQsC9f45pX6X+oftpLwWIiTCX0dLyYAohuCp1eHPYeh/thVMakl91gik
         5Fe58+sw4UfkADgXqo52nlrsGXIzkUPB7l8FRPFmVmaNEvv8yQ9xxuZV1ikXn6Z4wLFH
         JJvhZiP8mgRNagDxN2A4YJyJoZ4AReFv8ahXkmAWYz2y2joY5oBvqFvG6BCfS03DMq4L
         zVeENCNltMy5/671+0HngV6ZZds3F0fWm1bTyUBuz6xx/3ENYXUS4FcXMq5KaNmYwLrN
         TILT08R6yJBWBZ6Kx0M/p3/FXfPt32UIykjbGOx0hAVz7Os6VYYPWzTQEYel5f6GLyXR
         FeNw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@lists.linux-foundation.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

This patch adds the missing cpufreq_cpu_put function needed for
returning the cpufreq policy instance.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/exynos-cpufreq.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/exynos-cpufreq.c b/drivers/cpufreq/exynos-cpufreq.c
index 7012ea8..a2b7adc 100644
--- a/drivers/cpufreq/exynos-cpufreq.c
+++ b/drivers/cpufreq/exynos-cpufreq.c
@@ -208,6 +208,7 @@ static int exynos_cpufreq_pm_notifier(struct notifier_block *notifier,
 	}
 out:
 	mutex_unlock(&cpufreq_lock);
+	cpufreq_cpu_put(policy);
 
 	return NOTIFY_OK;
 }
-- 
1.7.5.4

