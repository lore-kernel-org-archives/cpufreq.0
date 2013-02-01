From: dirk.brandewie@gmail.com
Subject: [PATCH 1/6] cpufreq: Retrieve current frequency from scaling drivers with internal governors
Date: Fri,  1 Feb 2013 10:45:35 -0800
Message-ID: <1359744343-18690-2-git-send-email-dirk.brandewie@gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=XmBVLhZjuGSYrxzyMYNQYxnbu5FNPydzRJOTr8PdW7k=;
        b=b7WGIEomMchbH24vvYTjXhh6qdteR1Jdz1bv6kUn/1C61RMtyvgZcv3AdjFvc+Pan9
         4BW/gipaQRMIWjdUiA8ZQ1vrKBE23j7czQj49LH3/rcwosh5DyHmZhZvOdjjSahIphPj
         hAAVC0ilBA1fIWG17RTBYrnl9hJvFXI77Los29BQKWP0q50l1RtIL1jFCRWZ6/Nk2pLO
         oWBRXWz5NXvcJa9lFHAmfOCJCg+4+5mvLMoD1ZbYLsulf8zeaQAZoEkvkQGF0d5qOhBM
         hSzwXQ9+OUgLAHoXBstE3kZM9HxRVFdvKdYIzvXNSd3YHnwJMluGcx2gsuIXx0Vw4sUV
         USiw==
In-Reply-To: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Scaling drivers that implement the cpufreq_driver.setpolicy() versus
the cpufreq_driver.target() interface do not set policy->cur.

Normally policy->cur is set during the call to cpufreq_driver.target()
when the frequnecy request is made by the governor.

If the scaling driver implements cpufreq_driver.setpolicy() and
cpufreq_driver.get() interfaces use cpufreq_driver.get() to retrieve
the current frequency.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1f93dbd..1c037f0 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1219,6 +1219,9 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
 	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
 	unsigned int ret_freq = 0;
 
+	if (cpufreq_driver && cpufreq_driver->setpolicy && cpufreq_driver->get)
+		return cpufreq_driver->get(cpu);
+
 	if (policy) {
 		ret_freq = policy->cur;
 		cpufreq_cpu_put(policy);
-- 
1.7.7.6

