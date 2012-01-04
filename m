From: Afzal Mohammed <afzal@ti.com>
Subject: [PATCH 1/2] cpufreq:userspace: fix cpu_cur_freq updation
Date: Wed, 4 Jan 2012 10:52:31 +0530
Message-ID: <1325654551-14169-1-git-send-email-afzal@ti.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: nsekhar@ti.com, hvaibhav@ti.com, Afzal Mohammed <afzal@ti.com>

CPU frequency is guranteed to be changed on notifier callback with
CPUFREQ_POSTCHANGE. Notifier callback with CPUFREQ_PRECHANGE does
not gurantee a change in frequency; after it, if cpufreq driver is
unable to change CPU to new frequency. This results in wrong
information being fed to user (if setting CPU frequency fails)
upon doing like,

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed

Hence in userspace governer update cpu_cur_freq only if notifier
has been called with POSTCHANGE.

Signed-off-by: Afzal Mohammed <afzal@ti.com>
---
 drivers/cpufreq/cpufreq_userspace.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_userspace.c b/drivers/cpufreq/cpufreq_userspace.c
index f231015..bedac1a 100644
--- a/drivers/cpufreq/cpufreq_userspace.c
+++ b/drivers/cpufreq/cpufreq_userspace.c
@@ -47,9 +47,11 @@ userspace_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
 	if (!per_cpu(cpu_is_managed, freq->cpu))
 		return 0;
 
-	pr_debug("saving cpu_cur_freq of cpu %u to be %u kHz\n",
-			freq->cpu, freq->new);
-	per_cpu(cpu_cur_freq, freq->cpu) = freq->new;
+	if (val == CPUFREQ_POSTCHANGE) {
+		pr_debug("saving cpu_cur_freq of cpu %u to be %u kHz\n",
+				freq->cpu, freq->new);
+		per_cpu(cpu_cur_freq, freq->cpu) = freq->new;
+	}
 
 	return 0;
 }
-- 
1.7.1

