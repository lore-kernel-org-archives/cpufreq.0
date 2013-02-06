From: dirk.brandewie@gmail.com
Subject: [PATCH 3/5] cpufreq: Do not track governor name for scaling drivers with internal governors.
Date: Wed,  6 Feb 2013 09:02:11 -0800
Message-ID: <1360170133-5066-5-git-send-email-dirk.brandewie@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=AviLWe90WXO5k43vWG+E1EEy1fBzkZSyCDxdu8q7W9w=;
        b=f/auOcITkK28tcDsE3d+hBhxJLuKqDx1nnyk2AkCYYpoNv7rHqeqoTxncGv/LWzhHE
         LtvXwDV2xyp6YWTGqJg/OvGj7GH8ooxWiFZdWc148BpvtN4yAEHBlB3QQwyZdCl99ltP
         ofE54WVUdvVp3igeRyNKIJEhVEQgRiOGVFt7R0Qoorv5jd3zOcSkRcpAXmHYk7bFGAzp
         JsqZ8ZRGFRd79zZwQtwNcycvDlRBGluY8Dmg3RnU7H2iDBzYxNP85p1I/j5DfnZ8AWsU
         M7ZpiVRrMFc5WCI+1HjY0bPHW9LDkK4qitdXHdBT4728fiVsyk/vdC0v1tKOtOMQvayP
         54Og==
In-Reply-To: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Scaling drivers that implement internal governors do not have governor
structures assocaited with them.  Only track the name of the governor
associated with the CPU if the driver does not implement
cpufreq_driver.setpolicy()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0ba0344..e772053 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1049,7 +1049,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
 
 #ifdef CONFIG_HOTPLUG_CPU
-	strncpy(per_cpu(cpufreq_cpu_governor, cpu), data->governor->name,
+	if (!cpufreq_driver->setpolicy)
+		strncpy(per_cpu(cpufreq_cpu_governor, cpu),
+			data->governor->name,
 			CPUFREQ_NAME_LEN);
 #endif
 
-- 
1.7.7.6
