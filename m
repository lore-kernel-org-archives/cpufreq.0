From: dirk.brandewie@gmail.com
Subject: [PATCH 3/6] cpufreq: Do not track governor name for scaling drivers with internal governors.
Date: Fri,  1 Feb 2013 10:45:39 -0800
Message-ID: <1359744343-18690-6-git-send-email-dirk.brandewie@gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=V/xDQ+tYPytmz9I+f5DLZ9C/ns0J3Ru1JRRedU57SH8=;
        b=wP+1e1yHBknGqq31yj6HP3GsgT+LDc4mmvoJm6okGWQd0Py6U9QgAul65H2Vauu48P
         bjjlI0nHijUuSByV9ow54ANJ2bZYwty5Prf2gN3lB7fa2wvnFrr/5mDlbOAXc85GI28C
         d28wByoyhsRdrqGTvsGr/PfLBVgTfOsUBwKjMXGmoQ4Kw7ipLWVjDa210CSYvyv/iB2Y
         UIUOFUqkbppHKHSP78hqsqk8s3dd0sXZ39XBg9s4KQb4DDSwC6QTTY+deT5uLBN8RtBY
         hM2zVEwljVToP+EPmJZzoF/UAzDz0f2BoRn3nzLcmwN8lryf/QdiM7OCouRrxdnjqu2F
         RCiw==
In-Reply-To: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Scaling drivers that implement internal governors do not have governor
structures assocaited with them.  Only track the name of the governor
associated with the CPU if the driver does not implement
cpufreq_driver.setpolicy()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |   35 +++++++++++++++++++++--------------
 1 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 493cd50..a4fd51e 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -717,11 +717,13 @@ static int cpufreq_add_dev_policy(unsigned int cpu,
 #ifdef CONFIG_HOTPLUG_CPU
 	struct cpufreq_governor *gov;
 
-	gov = __find_governor(per_cpu(cpufreq_cpu_governor, cpu));
-	if (gov) {
-		policy->governor = gov;
-		pr_debug("Restoring governor %s for cpu %d\n",
-		       policy->governor->name, cpu);
+	if (!cpufreq_driver->setpolicy) {
+		gov = __find_governor(per_cpu(cpufreq_cpu_governor, cpu));
+		if (gov) {
+			policy->governor = gov;
+			pr_debug("Restoring governor %s for cpu %d\n",
+				policy->governor->name, cpu);
+		}
 	}
 #endif
 
@@ -1072,8 +1074,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 #ifdef CONFIG_SMP
 
 #ifdef CONFIG_HOTPLUG_CPU
-	strncpy(per_cpu(cpufreq_cpu_governor, cpu), data->governor->name,
-			CPUFREQ_NAME_LEN);
+	if (!cpufreq_driver->setpolicy)
+		strncpy(per_cpu(cpufreq_cpu_governor, cpu),
+			data->governor->name, CPUFREQ_NAME_LEN);
 #endif
 
 	/* if we have other CPUs still registered, we need to unlink them,
@@ -1097,8 +1100,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 				continue;
 			pr_debug("removing link for cpu %u\n", j);
 #ifdef CONFIG_HOTPLUG_CPU
-			strncpy(per_cpu(cpufreq_cpu_governor, j),
-				data->governor->name, CPUFREQ_NAME_LEN);
+			if (!cpufreq_driver->setpolicy)
+				strncpy(per_cpu(cpufreq_cpu_governor, j),
+					data->governor->name, CPUFREQ_NAME_LEN);
 #endif
 			cpu_dev = get_cpu_device(j);
 			kobj = &cpu_dev->kobj;
@@ -1628,11 +1632,14 @@ void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 		return;
 
 #ifdef CONFIG_HOTPLUG_CPU
-	for_each_present_cpu(cpu) {
-		if (cpu_online(cpu))
-			continue;
-		if (!strcmp(per_cpu(cpufreq_cpu_governor, cpu), governor->name))
-			strcpy(per_cpu(cpufreq_cpu_governor, cpu), "\0");
+	if (!cpufreq_driver->setpolicy)
+		for_each_present_cpu(cpu) {
+			if (cpu_online(cpu))
+				continue;
+			if (!strcmp(per_cpu(cpufreq_cpu_governor, cpu),
+					governor->name))
+				strcpy(per_cpu(cpufreq_cpu_governor, cpu),
+					"\0");
 	}
 #endif
 
-- 
1.7.7.6

