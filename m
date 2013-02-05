From: dirk.brandewie@gmail.com
Subject: [PATCH 5/7] cpufreq: balance out cpufreq_cpu_{get,put} for scaling drivers using setpolicy
Date: Tue,  5 Feb 2013 10:24:04 -0800
Message-ID: <1360088646-19104-6-git-send-email-dirk.brandewie@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=hPTBsghSMXx0uYFl35cojh3xWBJQpk0fB95wfBED/cE=;
        b=k9ehK+AM9eij/BLWpwMojkn2pu2qzXRDj+s2wQ3gI3DmA+FpJbISjB6Jk1f+fs45fU
         Y8zyEGvxrORf3rBP0HzhFxWw232uckTLulrG96VbOFHyGrQZ/SJgbYsJE0BLTrownG4P
         MsaQxKxVKHChpkvwQ3Zosa6P+N0Z/otJWvoEtkCF5Po4ODmBn8lTA8s35O4hwgyCbw0+
         o82gR5HHAqZ4Mn/TP6ki1jCyB1FS/rk40mCouyCBrNvCU16vpNUzXzpkEbTKuxj/eKys
         DZFBnXGqbB3fS/ywVJAXNqR9/by5vb67ddY7gL1/ZFBHDkg/f1NhoPBZ8JsUZzUbegUm
         5wAA==
In-Reply-To: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

There is an additional reference added to the driver in
cpufreq_add_dev()  that is removed in__cpufreq_governor() if the
driver implements target().  Remove the last reference when the
driver implements setpolicy()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 622e282..d17477b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1049,6 +1049,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
 
+	if (cpufreq_driver->setpolicy)
+		cpufreq_cpu_put(data);
+
 #ifdef CONFIG_HOTPLUG_CPU
 	if (!cpufreq_driver->setpolicy)
 		strncpy(per_cpu(cpufreq_cpu_governor, cpu),
-- 
1.7.7.6

