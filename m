From: dirk.brandewie@gmail.com
Subject: [PATCH 1/6] cpufreq: Retrieve current frequency from scaling drivers with internal governors
Date: Fri,  1 Feb 2013 10:49:05 -0800
Message-ID: <1359744545-18825-1-git-send-email-dirk.brandewie@gmail.com>
References: <359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=NY518aWZ1hNZGoKvXS5dR+jMLQ97ZldLw3cqjCNMKCc=;
        b=eO2iGZLhznbLk0LHUoo/RkvmVo41BAOXKhYz15qtiCm9fPpEuUkg6VWVq65l6eG188
         5RPOX9mGFJdayiVcGeOG4LzJy2ZlMNwdHKXrH7ImMxwewE9yNpdyQnMjX8o2zSIlWyfB
         26MRcGtS0OSTVEruT4ZGY3Q+hSdWgOMD8AXBBzSMvs9uBE32/IgyE2QClG8wLwbalxxB
         jIJHKsYHziOwnCshnnf7/mR4EowoyB7Cjlm7v9V3VdT0NxJXMdTJe2RofovL3oq2CHPj
         umVX5WagYh4qAu/77HFeTaz48nggjQPq1pLzK2V11OwvnIRCUWjIHJvz/yix6xRBRdXN
         EutA==
In-Reply-To: <359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
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

