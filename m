From: Jean Delvare <khali@linux-fr.org>
Subject: [PATCH 2.6] cpufreq: two minor cleanups
Date: Tue, 28 Jun 2005 23:28:30 +0200
Message-ID: <20050628232830.6630c526.khali@linux-fr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel=40m.gmane.org-S261395AbVF1V2q@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk, LKML <linux-kernel@vger.kernel.org>

Hi Dave,

Here are two possible cleanups in cpufreq.c:
* ret has no need to be unsigned in cpufreq_driver_target()
* ret has no need to be initialized in __cpufreq_governor()

Thanks.

Signed-off-by: Jean Delvare <khali@linux-fr.org>

 drivers/cpufreq/cpufreq.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.12.orig/drivers/cpufreq/cpufreq.c	2005-06-21 21:25:31.000000000 +0200
+++ linux-2.6.12/drivers/cpufreq/cpufreq.c	2005-06-21 21:29:01.000000000 +0200
@@ -1130,7 +1130,7 @@
 			  unsigned int target_freq,
 			  unsigned int relation)
 {
-	unsigned int ret;
+	int ret;
 
 	policy = cpufreq_cpu_get(policy->cpu);
 	if (!policy)
@@ -1151,7 +1151,7 @@
 
 static int __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	if (!try_module_get(policy->governor->owner))
 		return -EINVAL;


-- 
Jean Delvare
