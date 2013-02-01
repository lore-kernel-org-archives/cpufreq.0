From: dirk.brandewie@gmail.com
Subject: [PATCH 4/6] cpufreq_stats: Do not track policies without associated governors.
Date: Fri,  1 Feb 2013 10:45:41 -0800
Message-ID: <1359744343-18690-8-git-send-email-dirk.brandewie@gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=WRGSgSg+/27OoxkU+bDuyd39whbS/146bg51+pSUJEw=;
        b=JL8NmULoy87s4gEjhMKLSyiPySnf0T2p7scMfFTps+2u1j7kib3xzs8A8AjTwhyFtd
         vlI1csZ8R3PA0BgMsH4MTZ10by3ha5Fjtr6kj6U/RpdLx0WwCMsgEAgX2nlxW4KnGttw
         CBS6Pmcn10w7uNXGN497L34sCb/meMxgyMwn2fEKXSOZwxjgYxRjwSxTKvfxyVXcEzNF
         MrWfPwAGp8DVjPZGWg7NGNWRZRoIMQs9n2MXvsqHZRxmDf6a+rop6zaIJcP16r0WEQmi
         N0yTi5C5WJN/6qYtSHKZYfxBSUjSTT8nRoq+v8RIWz0AmsgUXmInc1lgeBEhXJJX5ZwB
         +NWg==
In-Reply-To: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Scaling drivers that implement internal governors do not have governor
sturctures associated with them.  Do not create/remove statisitcs
entries for polices that do not have governors associated with them.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq_stats.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 9d7732b..8a1daf4 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -183,7 +183,7 @@ static void cpufreq_stats_free_table(unsigned int cpu)
 static void cpufreq_stats_free_sysfs(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
-	if (policy && policy->cpu == cpu)
+	if (policy && policy->cpu == cpu && policy->governor)
 		sysfs_remove_group(&policy->kobj, &stats_attr_group);
 	if (policy)
 		cpufreq_cpu_put(policy);
@@ -271,6 +271,8 @@ static int cpufreq_stat_notifier_policy(struct notifier_block *nb,
 	unsigned int cpu = policy->cpu;
 	if (val != CPUFREQ_NOTIFY)
 		return 0;
+	if (!policy->governor)
+		return 0;
 	table = cpufreq_frequency_get_table(cpu);
 	if (!table)
 		return 0;
-- 
1.7.7.6
