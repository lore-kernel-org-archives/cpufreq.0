From: Axel Lin <axel.lin@gmail.com>
Subject: [RFC][PATCH] cpufreq: db8500: remove unneeded for loop iteration
 over freq_table
Date: Tue, 27 Sep 2011 15:11:42 +0800
Message-ID: <1317107502.2327.4.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:to:cc:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=v5Dl8eGNsATRAxdAyY/Nwi9S/UxrPDoSQsqs+MNEXC0=;
        b=qR3ms8RLmEISnoStHE4jcKCJmgBblI6+mNjOMZ46wjrEsqxzeAQzorGIiafYh8zEWI
         HVkLKAP99ew+ir2h61LcpUbJTbJVdbvFEjH3ERhEuPdVrZzoq9a1WuR90fI1JsOwO0sv
         8LBBp2DB9MQcvEO7iwiRyxjCg/HNDXQktRRvA=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, cpufreq@vger.kernel.org

Don't know why to do the loop iteration here. It looks unneeded.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/cpufreq/db8500-cpufreq.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/db8500-cpufreq.c b/drivers/cpufreq/db8500-cpufreq.c
index d90456a..bdb349a 100644
--- a/drivers/cpufreq/db8500-cpufreq.c
+++ b/drivers/cpufreq/db8500-cpufreq.c
@@ -104,7 +104,6 @@ static unsigned int db8500_cpufreq_getspeed(unsigned int cpu)
 static int __cpuinit db8500_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int res;
-	int i;
 
 	BUILD_BUG_ON(ARRAY_SIZE(idx2opp) + 1 != ARRAY_SIZE(freq_table));
 
@@ -127,10 +126,6 @@ static int __cpuinit db8500_cpufreq_init(struct cpufreq_policy *policy)
 	policy->min = policy->cpuinfo.min_freq;
 	policy->max = policy->cpuinfo.max_freq;
 	policy->cur = db8500_cpufreq_getspeed(policy->cpu);
-
-	for (i = 0; freq_table[i].frequency != policy->cur; i++)
-		;
-
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	/*
-- 
1.7.4.1



