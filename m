From: Jiri Slaby <jslaby@suse.cz>
Subject: [PATCH 1/1] CPUFREQ: fix BUG on cpufreq policy init failure
Date: Tue,  1 Mar 2011 17:41:10 +0100
Message-ID: <1298997670-5866-1-git-send-email-jslaby@suse.cz>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@vger.kernel.org, jirislaby@gmail.com

cpufreq_register_driver sets cpufreq_driver to a structure owned (and
placed) in the caller's memory. If cpufreq policy fails in its ->init
function, sysdev_driver_register returns nonzero in
cpufreq_register_driver. Now, cpufreq_register_driver returns an error
without setting cpufreq_driver back to NULL.

Usually cpufreq policy modules are unloaded because they propagate the
error to the module init function and return that.

So a later access to any member of cpufreq_driver causes bugs like:
BUG: unable to handle kernel paging request at ffffffffa00270a0
IP: [<ffffffff8145eca3>] cpufreq_cpu_get+0x53/0xe0
PGD 1805067 PUD 1809063 PMD 1c3f90067 PTE 0
Oops: 0000 [#1] SMP
last sysfs file: /sys/devices/virtual/net/tun0/statistics/collisions
CPU 0
Modules linked in: ...
Pid: 5677, comm: thunderbird-bin Tainted: G        W   2.6.38-rc4-mm1_64+ #1389 To be filled by O.E.M./To Be Filled By O.E.M.
RIP: 0010:[<ffffffff8145eca3>]  [<ffffffff8145eca3>] cpufreq_cpu_get+0x53/0xe0
RSP: 0018:ffff8801aec37d98  EFLAGS: 00010086
RAX: 0000000000000202 RBX: 0000000000000000 RCX: 0000000000000001
RDX: ffffffffa00270a0 RSI: 0000000000001000 RDI: ffffffff8199ece8
...
Call Trace:
 [<ffffffff8145f490>] cpufreq_quick_get+0x10/0x30
 [<ffffffff8103f12b>] show_cpuinfo+0x2ab/0x300
 [<ffffffff81136292>] seq_read+0xf2/0x3f0
 [<ffffffff8126c5d3>] ? __strncpy_from_user+0x33/0x60
 [<ffffffff8116850d>] proc_reg_read+0x6d/0xa0
 [<ffffffff81116e53>] vfs_read+0xc3/0x180
 [<ffffffff81116f5c>] sys_read+0x4c/0x90
 [<ffffffff81030dbb>] system_call_fastpath+0x16/0x1b
...

It's all cause by weird fail path handling in cpufreq_register_driver.
To fix that, shuffle the code to do proper handling with gotos.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Dave Jones <davej@redhat.com>
---
 drivers/cpufreq/cpufreq.c |   27 +++++++++++++++------------
 1 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1109f68..5cb4d09 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1919,8 +1919,10 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 
 	ret = sysdev_driver_register(&cpu_sysdev_class,
 					&cpufreq_sysdev_driver);
+	if (ret)
+		goto err_null_driver;
 
-	if ((!ret) && !(cpufreq_driver->flags & CPUFREQ_STICKY)) {
+	if (!(cpufreq_driver->flags & CPUFREQ_STICKY)) {
 		int i;
 		ret = -ENODEV;
 
@@ -1935,21 +1937,22 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 		if (ret) {
 			dprintk("no CPU initialized for driver %s\n",
 							driver_data->name);
-			sysdev_driver_unregister(&cpu_sysdev_class,
-						&cpufreq_sysdev_driver);
-
-			spin_lock_irqsave(&cpufreq_driver_lock, flags);
-			cpufreq_driver = NULL;
-			spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
+			goto err_sysdev_unreg;
 		}
 	}
 
-	if (!ret) {
-		register_hotcpu_notifier(&cpufreq_cpu_notifier);
-		dprintk("driver %s up and running\n", driver_data->name);
-		cpufreq_debug_enable_ratelimit();
-	}
+	register_hotcpu_notifier(&cpufreq_cpu_notifier);
+	dprintk("driver %s up and running\n", driver_data->name);
+	cpufreq_debug_enable_ratelimit();
 
+	return 0;
+err_sysdev_unreg:
+	sysdev_driver_unregister(&cpu_sysdev_class,
+			&cpufreq_sysdev_driver);
+err_null_driver:
+	spin_lock_irqsave(&cpufreq_driver_lock, flags);
+	cpufreq_driver = NULL;
+	spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_driver);
-- 
1.7.4.1


