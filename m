From: dirk.brandewie@gmail.com
Subject: [PATCH 1/5] cpufreq: Retrieve current frequency from scaling drivers with internal governors
Date: Wed,  6 Feb 2013 09:02:08 -0800
Message-ID: <1360170133-5066-2-git-send-email-dirk.brandewie@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=4fDkupKqV0paVb/rbvgO1mwpofIQKBE9FuMhvkHWwI4=;
        b=wCGqTgkfgd4OkPoNuLSJ5uYLxVbQyFB58uQ+F+mGvmwlDCHbYsPnvp5RsrDYO9yQCn
         bXkPTvm09l68gTYIf7JoeObVSkr8b/rnW2GDdH6qro6FIV45DHr6EoddnlNXEqasP8pb
         9hlrjmkiMQrwK+1V3GQsjRFrSDLtZAhBglFtAU+0fRjLx8P2Iof5ZdB/tq12IDXTYFYz
         hAKHHPywvSzF7+qZwcLopE9yMe3g1IPumLWKZMmzRJAZRYTfjnIyhC8AADo7p6G4fEZG
         tTFfv8MaDez/wVWc7H0qptYLictD6Cyyw3eD4OvTI0cARHunupBMdj97haF+wicl3EXM
         eFHw==
In-Reply-To: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Scaling drivers that implement the cpufreq_driver.setpolicy() versus
the cpufreq_driver.target() interface do not set policy->cur.

Normally policy->cur is set during the call to cpufreq_driver.target()
when the frequnecy request is made by the governor.

If the scaling driver implements cpufreq_driver.setpolicy() and
cpufreq_driver.get() interfaces use cpufreq_driver.get() to retrieve
the current frequency.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index ccc598a..bb45f93 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1177,9 +1177,14 @@ static void cpufreq_out_of_sync(unsigned int cpu, unsigned int old_freq,
  */
 unsigned int cpufreq_quick_get(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	struct cpufreq_policy *policy;
 	unsigned int ret_freq = 0;
 
+	if (cpufreq_driver && cpufreq_driver->setpolicy &&
+			cpufreq_driver->get)
+			return cpufreq_driver->get(cpu);
+
+	policy = cpufreq_cpu_get(cpu);
 	if (policy) {
 		ret_freq = policy->cur;
 		cpufreq_cpu_put(policy);
-- 
1.7.7.6
