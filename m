From: dirk.brandewie@gmail.com
Subject: [PATCH 1/7] cpufreq: Don't remove sysfs link for policy->cpu
Date: Tue,  5 Feb 2013 10:24:00 -0800
Message-ID: <1360088646-19104-2-git-send-email-dirk.brandewie@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=6wa43JBwna8dkah1W+Zv6MkA5Yh/+x+n9qJdPu0n9eU=;
        b=yI/gko+rW5Ne6g/GWV/ixQK/CTVLoKKfkRhdmTY5jdEgvhFSXY31ThU/R0XVtyR/LZ
         Z5HfrUF4FNaEQci+YmwlSjqobuk/+79wDSpN0krcbdxD7qdvhn/pLxLVx1RGuwTFS/9f
         tAuts8iNbcwiRCOn/RoiVl8pUhgnqxPNKCly77cT5MlQEh+1ueIb9OGNqxDdt3mjj5ip
         XySfo84Licxm8+G9umNw3WQrBLwMg8mwC7FOV9oAEkPY87+f9MNkZXf7iv3EcDeI6b8w
         KAHJ34nQPnCURiDt1fNH/rQbcmE0OzG+Y/R59d9LU7w9E05xY1qYAK5Y24PRQLXa6cgC
         DEQg==
In-Reply-To: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

"cpufreq" directory in policy->cpu is never created using sysfs_create_link(),
but using kobject_init_and_add(). And so we shouldn't call sysfs_remove_link()
for policy->cpu(). sysfs stuff for policy->cpu is automatically removed when we
call kobject_put() for dying policy.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Tested-by: Dirk Brandewie <dirk.brandewie@gmail.com>
---
 drivers/cpufreq/cpufreq.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 9656420..2817c3c 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1058,7 +1058,9 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 	cpus = cpumask_weight(data->cpus);
 	cpumask_clear_cpu(cpu, data->cpus);
 
-	if (unlikely((cpu == data->cpu) && (cpus > 1))) {
+	if (cpu != data->cpu) {
+		sysfs_remove_link(&dev->kobj, "cpufreq");
+	} else if (cpus > 1) {
 		/* first sibling now owns the new sysfs dir */
 		cpu_dev = get_cpu_device(cpumask_first(data->cpus));
 		sysfs_remove_link(&cpu_dev->kobj, "cpufreq");
@@ -1083,7 +1085,6 @@ static int __cpufreq_remove_dev(struct device *dev, struct subsys_interface *sif
 	pr_debug("%s: removing link, cpu: %d\n", __func__, cpu);
 	cpufreq_cpu_put(data);
 	unlock_policy_rwsem_write(cpu);
-	sysfs_remove_link(&dev->kobj, "cpufreq");
 
 	/* If cpu is last user of policy, free policy */
 	if (cpus == 1) {
-- 
1.7.7.6
