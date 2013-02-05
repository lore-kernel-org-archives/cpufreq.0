From: dirk.brandewie@gmail.com
Subject: [PATCH 4/7] cpufreq: Do not track governor name for scaling drivers with internal governors.
Date: Tue,  5 Feb 2013 10:24:03 -0800
Message-ID: <1360088646-19104-5-git-send-email-dirk.brandewie@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=pzd0MjLcVbzlxZN43Hj2Mi5kTdtFbA8SNm9Kqt5tVoE=;
        b=vi59hcAFBm/3HKCTVpoTaC9gUgXDz6x93DAq7uAMaaPPQ2FkGaT++RvuFh3APXvrt8
         n5hmX/DeWOu9Y1BFSTovUX4BAZTm00kkR/Oij9v1wlvtojl/Nxd/k4Fasn1RGVxDsF0p
         hYnnAIzGKCZb/p8C+cB0ffbJwfFuU25iqEUxAcEGUpcA1l0XIGIhCjOsEsZktPLt7b7s
         ulMJGlUtOKaN0Nm64UYGChJ81Bng/c7fCVoKpXn4cwuI6YvY44rBNciYDygFrNhJnMNd
         od9wvQXLcqc9yL21+ES1ZpFyQrtap2ElgloZYgvVxa08M7BBm0W053mkWs/hDt9Dv5Yq
         UUFg==
In-Reply-To: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Scaling drivers that implement internal governors do not have governor
structures assocaited with them.  Only track the name of the governor
associated with the CPU if the driver does not implement
cpufreq_driver.setpolicy()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index d8daa4b..622e282 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1050,7 +1050,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
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
