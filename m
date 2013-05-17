From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Add additional supported CPU ID's
Date: Fri, 17 May 2013 07:38:17 -0700
Message-ID: <1368801497-13072-1-git-send-email-dirk.j.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=cwt5z6RAKP+W4U3g8FuId9matwdOFRG/NzGtoAwQGos=;
        b=IIqyUzGNjmO7ytFPPs1yZEAR6tl+IdifG1KhjXdpr5UAaWC6EnDCfziVHuHjvkBew4
         qloX+PZjKKnT+7WwqzeM2kXNNIThgttUrIf9xPVdr/+CPsvCPNmeLpPbgeu6w08I1mIJ
         60aoICTlkdYVbhzA476fXQN1pOSeHyjI7NHNehb1Sf9BAWHKI6Z33erN1rHYyQX+v0Fr
         5pGvKA0bWi4+x2PdcIYL1tTv3BubYbV3UkMwvepPO6KMbNL3SLzDtBEn/4KjYadlj4yo
         Wbsl0iEHUc5OpKL3s1eG27ZFCNw4Op+fG2J9nHiwmvfHi26T/HnauE0LjDaz/U9+A3KI
         vd0A==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, torvalds@linux-foundation.org

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Add CPU ID's for supported Sandybridge and Ivybrigde processors.

Cc: torvalds@linux-foundation.org
Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 1813311..85b1fd8 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -520,7 +520,9 @@ static void intel_pstate_timer_func(unsigned long __data)
 
 static const struct x86_cpu_id intel_pstate_cpu_ids[] = {
 	ICPU(0x2a, default_policy),
+	ICPU(0x25, default_policy),
 	ICPU(0x2d, default_policy),
+	ICPU(0x3a, default_policy),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, intel_pstate_cpu_ids);
-- 
1.7.7.6
