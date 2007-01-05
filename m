From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Subject: [PATCH 2.6.20-rc3] cpufreq: check sysfs_create_link return value
Date: Fri, 5 Jan 2007 05:44:54 +0200
Message-ID: <20070105034454.GA5974@Ahmed>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1030305AbXAEDpE@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

Trivial patch to check sysfs_create_link return values. Fail gracefully 
if needed.

Signed-off-by: Ahmed Darwish <darwish.07@gmail.com>

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index d913304..72ee576 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -722,8 +722,13 @@ static int cpufreq_add_dev (struct sys_device * sys_dev)
 			spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
 			dprintk("CPU already managed, adding link\n");
-			sysfs_create_link(&sys_dev->kobj,
-					  &managed_policy->kobj, "cpufreq");
+			ret = sysfs_create_link(&sys_dev->kobj,
+						&managed_policy->kobj, 
+						"cpufreq");
+			if (ret) {
+				mutex_unlock(&policy->lock);
+				goto err_out_driver_exit;
+			}
 
 			cpufreq_debug_enable_ratelimit();
 			mutex_unlock(&policy->lock);
@@ -770,8 +775,12 @@ static int cpufreq_add_dev (struct sys_device * sys_dev)
 		dprintk("CPU %u already managed, adding link\n", j);
 		cpufreq_cpu_get(cpu);
 		cpu_sys_dev = get_cpu_sysdev(j);
-		sysfs_create_link(&cpu_sys_dev->kobj, &policy->kobj,
-				  "cpufreq");
+		ret = sysfs_create_link(&cpu_sys_dev->kobj, &policy->kobj,
+					"cpufreq");
+		if (ret) {
+			mutex_unlock(&policy->lock);
+			goto err_out_unregister;
+		}
 	}
 
 	policy->governor = NULL; /* to assure that the starting sequence is


-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
