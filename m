From: dirk.brandewie@gmail.com
Subject: [PATCH 4/5] cpufreq_stats: do not remove sysfs files if frequency table is not present
Date: Wed,  6 Feb 2013 09:02:12 -0800
Message-ID: <1360170133-5066-6-git-send-email-dirk.brandewie@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=48SGUF9xZQtL1lhAkTTKU/GShqqrHK+28hHM3kG0FD8=;
        b=zsOpm27hvJ4vMvybS1SVJbXrPfxMfzt194SrIkYimObgEW5eTOAsy8dYUpFs6XzPTd
         BbeJD/46YdPKos2hZC4zG7TBa49b+0DGVcLydcULky1Co0cRfG+YBoyTIkd2uXMQ0N+i
         uBXEhSLiRxoa2LNq4P3Q6iKuucqiOHRHzVMKOEToy7HH4pURelmqbxkfvdMNF3TcQLko
         LpeFwhBPFdTjcLIUq05hPRGUrAOs45/Fn2DroYj7qDjO0zkXCWhBh2b7BRy8R33rC3kX
         Esx0DvK7RKRkQgkRWtVp5QbDJu1M5vIa4Ac2H7lfhCYkcQHRl/vn3e/B4K6BJWB4WTnN
         CAVA==
In-Reply-To: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

The sysfs files for cpufreq_stats are created in cpufreq_stats_create_table()
called from cpufreq_stat_notifier_policy() when a policy is added to
the cpu. cpufreq_stats_create_table() will not be called if the
scaling driver does not export a frequency table to cpufreq.  Use the
same fence on tear down.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq_stats.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index a2dee4c..2fd779e 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -179,6 +179,10 @@ static void cpufreq_stats_free_table(unsigned int cpu)
 static void cpufreq_stats_free_sysfs(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+
+	if (!cpufreq_frequency_get_table(cpu))
+		return;
+
 	if (policy && !policy_is_shared(policy)) {
 		pr_debug("%s: Free sysfs stat\n", __func__);
 		sysfs_remove_group(&policy->kobj, &stats_attr_group);
-- 
1.7.7.6
