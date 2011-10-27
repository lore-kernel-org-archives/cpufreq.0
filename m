From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH RESEND] cpufreq: db8500: remove unneeded for loop iteration
 for freq_table
Date: Thu, 27 Oct 2011 11:05:44 +0800
Message-ID: <1319684744.4598.1.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:subject:from:to:cc:date:content-type:x-mailer
         :content-transfer-encoding:mime-version;
        bh=zv8m37Oz4WW++iyJTPWFWf+/aUoqOUlzHubYk+cqqGo=;
        b=xIiIoDYaOu/hpr96zGL1dSJjTbAwY7bjTFhy7fx9J0ZOJ++5G6wpJLDSNzD9EeJnwO
         Nb34D1aFnEjqrdIrnMIU70wC8CxfJQHfiwNGRXg3uYqkeunwR839Dwog3o2KnmP4zVfS
         /qZbeStQuFzYuX/Ba8OoFM1TReGjYVPzWUqbU=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Dave Jones <davej@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, cpufreq@vger.kernel.org

We alread did policy->cur = db8500_cpufreq_getspeed(policy->cpu);
Don't know why to do the loop iteration here. It looks useless.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/cpufreq/db8500-cpufreq.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/db8500-cpufreq.c b/drivers/cpufreq/db8500-cpufreq.c
index 0da1625..5713f70 100644
--- a/drivers/cpufreq/db8500-cpufreq.c
+++ b/drivers/cpufreq/db8500-cpufreq.c
@@ -105,7 +105,6 @@ static unsigned int db8500_cpufreq_getspeed(unsigned int cpu)
 static int __cpuinit db8500_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int res;
-	int i;
 
 	BUILD_BUG_ON(ARRAY_SIZE(idx2opp) + 1 != ARRAY_SIZE(freq_table));
 
@@ -128,10 +127,6 @@ static int __cpuinit db8500_cpufreq_init(struct cpufreq_policy *policy)
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
1.7.5.4



