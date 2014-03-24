From: dirk.brandewie@gmail.com
Subject: [PATCH] intel_pstate:  Use del_timer_sync in intel_pstate_cpu_stop
Date: Mon, 24 Mar 2014 07:41:29 -0700
Message-ID: <1395672089-19336-1-git-send-email-dirk.j.brandewie@intel.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=3i9apTmFf/0aBMyUdCVD8DHHLE+pz86H+uOVLOJki2U=;
        b=ZdLUn7oSe2BdNvNSrNJ7kRzqdSw3UEusELsoAL+pEc/zGEzPMDSQ50Atu/iaKgQ4Lz
         wZWTkKidQSv5uahF20tMZjC8mJGEmS4h1GAYhPcc7QJWZIXPFdOzUSPvlIc4M3x4EOvq
         oo7ALIvCuc3nm56L9snfpLganzTLatm/eZehov0QnXkLoapzfsRhO7/tTNrZzDdui2bI
         2uB8s1XbA1QCWbqRtqbyTSZWAbASjd1aeag3gtHtnRXkuP9bVGC/LYHzf0+zO0jHUTmh
         WG0pq+nV4K4IyoNmh3Mh0Ss7/z/tHQmH5LpufrkE8noyE1B03KO97T8XHd3S3WgtA/Oo
         5ihg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq <cpufreq@vger.kernel.org>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Ensure that no timer callback is running since we are about to free
the timer structure.  We cannot guarantee that the call back is called
on the CPU where the timer is running.

Reported-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: cpufreq <cpufreq@vger.kernel.org>
---
 drivers/cpufreq/intel_pstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index e9092fd..a4a9ba5 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -780,7 +780,7 @@ static int intel_pstate_cpu_stop(struct cpufreq_policy *policy)
 
 	pr_info("intel_pstate CPU %d exiting\n", cpu_num);
 
-	del_timer(&all_cpu_data[cpu_num]->timer);
+	del_timer_sync(&all_cpu_data[cpu_num]->timer);
 	intel_pstate_set_pstate(cpu, cpu->pstate.min_pstate);
 	kfree(all_cpu_data[cpu_num]);
 	all_cpu_data[cpu_num] = NULL;
-- 
1.8.3.1

