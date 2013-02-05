From: dirk.brandewie@gmail.com
Subject: [PATCH 2/7] cpufreq: Retrieve current frequency from scaling drivers with internal governors
Date: Tue,  5 Feb 2013 10:24:01 -0800
Message-ID: <1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=iFLmLeFsQgh99i4z/aXCWFyh53uvNxR+6Ba36d64xTs=;
        b=07WQwc7xLwBbfyBfqeRllb19emOl4jeZzT1mGAkAIxHWcCav/HxNgx6YlsDxaQoxkj
         ENHuo+2arS4FjLsHtr5IdYMtsfxayhg0eoDsuI4UihmvV9q2GYMBvR2pVMlRFI03R/rP
         0afDXAfSOCg9ZakssCDP3iyVHYgUG1rS9XfyqS+NCX4gioww22pNonrrz0clNVHC2BvI
         YCw3hyleGnjnqtaYFzOl+QCsm7Jii/8cevpS7GK6nRO/V8Ejk8oR2Y5PGYVatOSany6Y
         Pmxq8sLf0Sepxbsq5g49/d95peSqdQC1nY+x/tBW4+n1wDACo5Bclv5Oi8LjXj6jappA
         vTMQ==
In-Reply-To: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Scaling drivers that implement the cpufreq_driver.setpolicy() versus
the cpufreq_driver.target() interface do not set policy->cur.

Normally policy->cur is set during the call to cpufreq_driver.target()
when the frequnecy request is made by the governor.

If the scaling driver implements cpufreq_driver.setpolicy() and
cpufreq_driver.get() interfaces use cpufreq_driver.get() to retrieve
the current frequency.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
From: Dirk Brandewie <dirk.brandewie@gmail.com>
Date: 2013-02-04 18:44:40 -0800

cpufreq: balance out cpufreq_cpu_{get,put} for scaling drivers using setpolicy

There is an additional reference added to the driver in
cpufreq_add_dev()  that is removed in__cpufreq_governor() if the
driver implements target().  Remove the last reference when the
driver implements setpolicy()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 2817c3c..96bc302 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1181,6 +1181,13 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
 	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
 	unsigned int ret_freq = 0;
 
+	if (cpufreq_driver && cpufreq_driver->setpolicy &&
+		cpufreq_driver->get) {
+		ret_freq = cpufreq_driver->get(cpu);
+		cpufreq_cpu_put(policy);
+		return ret_freq;
+	}
+
 	if (policy) {
 		ret_freq = policy->cur;
 		cpufreq_cpu_put(policy);
-- 
1.7.7.6
