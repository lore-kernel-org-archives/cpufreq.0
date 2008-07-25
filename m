From: Julia Lawall <julia@diku.dk>
Subject: [PATCH] drivers/cpufreq/cpufreq.c: Adjust error handling code
 involving cpufreq_cpu_put
Date: Fri, 25 Jul 2008 22:44:53 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807252243510.1602@ask.diku.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756748AbYGYUpT@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

After calling cpufreq_cpu_get, error handling code should call
cpufreq_cpu_put.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
expression x,E;
statement S;
position p1,p2,p3;
@@

(
if ((x = cpufreq_cpu_get@p1(...)) == NULL || ...) S
|
x = cpufreq_cpu_get@p1(...)
... when != x
if (x == NULL || ...) S
)
<...
if@p3 (...) { ... when != cpufreq_cpu_put(x)
                  when != if (x) { ... cpufreq_cpu_put(x); ...}
    return@p2 ...;
}
...>
(
return x;
|
return 0;
|
x = E
|
E = x
|
cpufreq_cpu_put(x)
)

@exists@
position r.p1,r.p2,r.p3;
expression x;
int ret != 0;
statement S;
@@

* x = cpufreq_cpu_get@p1(...)
  <...
* if@p3 (...)
  S
  ...>
* return@p2 \(NULL\|ret\);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/cpufreq/cpufreq.c     |   24 +++++++++++++------
 1 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 8d6a3ff..d4de015 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1464,20 +1464,22 @@ int cpufreq_driver_target(struct cpufreq_policy *policy,
 			  unsigned int target_freq,
 			  unsigned int relation)
 {
-	int ret;
+	int ret = -EINVAL;
 
 	policy = cpufreq_cpu_get(policy->cpu);
 	if (!policy)
-		return -EINVAL;
+		goto no_policy;
 
 	if (unlikely(lock_policy_rwsem_write(policy->cpu)))
-		return -EINVAL;
+		goto fail;
 
 	ret = __cpufreq_driver_target(policy, target_freq, relation);
 
 	unlock_policy_rwsem_write(policy->cpu);
 
+fail:
 	cpufreq_cpu_put(policy);
+no_policy:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(cpufreq_driver_target);
@@ -1714,13 +1716,17 @@ int cpufreq_update_policy(unsigned int cpu)
 {
 	struct cpufreq_policy *data = cpufreq_cpu_get(cpu);
 	struct cpufreq_policy policy;
-	int ret = 0;
+	int ret;
 
-	if (!data)
-		return -ENODEV;
+	if (!data) {
+		ret = -ENODEV;
+		goto no_policy;
+	}
 
-	if (unlikely(lock_policy_rwsem_write(cpu)))
-		return -EINVAL;
+	if (unlikely(lock_policy_rwsem_write(cpu))) {
+		ret = -EINVAL;
+		goto fail;
+	}
 
 	dprintk("updating policy for CPU %u\n", cpu);
 	memcpy(&policy, data, sizeof(struct cpufreq_policy));
@@ -1747,7 +1753,9 @@ int cpufreq_update_policy(unsigned int cpu)
 
 	unlock_policy_rwsem_write(cpu);
 
+fail:
 	cpufreq_cpu_put(data);
+no_policy:
 	return ret;
 }
 EXPORT_SYMBOL(cpufreq_update_policy);
