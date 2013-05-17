From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Add additional supported CPU ID
Date: Fri, 17 May 2013 09:10:24 -0700
Message-ID: <1368807024-15251-1-git-send-email-dirk.j.brandewie@gmail.com>
References: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=Ml9XJcmkCzgUPRsOoEn1BDfLbT0BU7Sjz9O3DUWahxw=;
        b=K5asTNhuTZsvNPStHSrq2+a4JcU3AhVs1nIv+JjbTbNdZ6bo1WZT9pY1AewRp+XTOG
         kbi0wL58LUn7Yc9wRlU93F1wToqgHdjoFfqi+q6XYKPqPbfJWLy3fVJ1v695JQ3LrFPt
         8DLcxDAVo69dmndTYuf2XNW5yclcbqZqpJkaynAdS4TZImz6r2cYVl20vfgZmE+8NQPb
         mvNZp0fqSOVqmSj7bI8Ku/e8yX1+IP1ZTC1mTEEbFsupSVeDY3VA9EzX4EnaT7qMirr8
         jFNoKzKGLIBdwHqaQJQ1roiXxvPVeBwhIXGeeRJ5P75eGKP68/G/CS4VXW5E5MC0/SWI
         +clw==
In-Reply-To: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, torvalds@linux-foundation.org

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Add CPU ID for Ivybrigde processor.

Cc: torvalds@linux-foundation.org
Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 1813311..d1e36fe 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -521,6 +521,7 @@ static void intel_pstate_timer_func(unsigned long __data)
 static const struct x86_cpu_id intel_pstate_cpu_ids[] = {
 	ICPU(0x2a, default_policy),
 	ICPU(0x2d, default_policy),
+	ICPU(0x3a, default_policy),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_pstate_cpu_ids);
-- 
1.7.7.6

