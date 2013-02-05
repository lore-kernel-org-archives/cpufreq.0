From: dirk.brandewie@gmail.com
Subject: [PATCH 6/7] cpufreq_stats: do not remove sysfs files if frequency table is not present
Date: Tue,  5 Feb 2013 10:24:05 -0800
Message-ID: <1360088646-19104-7-git-send-email-dirk.brandewie@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=1CUQP8N+gIkLWJ5dRS0qRO+pKpC41S/wowz5iAeGf4I=;
        b=x8VrW+gro/oUMbWW8zraXm1oYaOE9FNoWvzO6lOI+kIQk5l+xJLmKNL+VbLF3xaLL1
         md7ICDzEL7S8hBEBHMBdc1T0kQEYVMMYTybGGnilX94TMcL7XQYAQnpwIvAj+acHDyvZ
         ZZf757K4OUX+cIDefJMqIDZ5M0ihzjVits03pfAaFEaL2t1a3z+cIc1x3C5ih5XJfTTj
         23IkECnHCIilxpsGm9zgQI74qhh3vOPUMqvExbCp2ig8G3D3aDFB3kk8WEQMWvqa67KM
         +6e+vnQc2UFN/jaPZQy9qPUCCYEdwQPEjIXrluEfJg5xDsyq/is8cOZ5aCa04DXGmMI0
         8DiA==
In-Reply-To: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

The sysfs files for cpufreq_stats are created in cpufreq_stats_create_table()
called from cpufreq_stat_notifier_policy() when a policy is added to
the cpu. cpufreq_stats_create_table() will not be called if the
scaling driver does not export a frequency table to cpufreq.  Use the
same fence on tear down.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq_stats.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_stats.c b/drivers/cpufreq/cpufreq_stats.c
index 572124c..fb001e2 100644
--- a/drivers/cpufreq/cpufreq_stats.c
+++ b/drivers/cpufreq/cpufreq_stats.c
@@ -185,6 +185,11 @@ static void cpufreq_stats_free_table(unsigned int cpu)
 static void cpufreq_stats_free_sysfs(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
+	struct cpufreq_frequency_table *table;
+
+	table = cpufreq_frequency_get_table(cpu);
+	if (!table)
+		return;
 	if (policy && !policy_is_shared(policy)) {
 		pr_debug("%s: Free sysfs stat\n", __func__);
 		sysfs_remove_group(&policy->kobj, &stats_attr_group);
-- 
1.7.7.6
