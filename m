From: dirk.brandewie@gmail.com
Subject: [PATCH 5/6] cpufreq: balance out cpufreq_cpu_{get,put} for scaling drivers using setpolicy
Date: Fri,  1 Feb 2013 10:45:42 -0800
Message-ID: <1359744343-18690-9-git-send-email-dirk.brandewie@gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=7efZNiFNuExNyEiZEd/NUPGHT54X1zCYls5WNRajcPw=;
        b=rTZ2HefZwqHY1QZqK13gs35z43YxSjiW2RJYmlFnmvipL09xjPh0ZvBunbg8nYJF1Q
         RzTl4rVoT3mOvbSLso0IGd03l06Dl/w6cDjWSCbOLuSHMBj1ivF+jj/1O0tAbN/CxDGZ
         PIYPKVLTgvRZerNJK9KVMHswf3zproPURQctBHPCzilxgtbRPx783peCv5MRE/lAeyMB
         ujDuSVLDNv36KMPlN+3psUchAOobB93t+/jyV6bCius9+kg2y9np924ly9XJa1WnegTg
         LnJjDpSQO3v/lteSqbLI8BLNept/IBnhMe7xo6pB5p1YyA2fiEYZJXhPF2ZiMlAWsUqm
         /Usw==
In-Reply-To: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

There is an additional reference added to the driver in
cpufreq_add_dev_policy() that is removed in__cpufreq_governor() if the
driver implements target().  Remove the last reference when the driver
implements setpolicy()

Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
---
 drivers/cpufreq/cpufreq.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index a4fd51e..ec103bf 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1119,6 +1119,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 	if (cpufreq_driver->target)
 		__cpufreq_governor(data, CPUFREQ_GOV_STOP);
 
+	if (cpufreq_driver->setpolicy)
+		cpufreq_cpu_put(data);
+
 	kobj = &data->kobj;
 	cmp = &data->kobj_unregister;
 	unlock_policy_rwsem_write(cpu);
-- 
1.7.7.6

