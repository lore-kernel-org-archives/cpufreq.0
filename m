From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 1/2] cpufreq: add __find_governor helper and clean up some
 error handling
Date: Thu, 06 Jul 2006 12:30:26 -0700
Message-ID: <44AD64D2.5070504@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750741AbWGFTaZ@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Adds a __find_governor() helper function to look up a governor by
name.  Also restructures some error handling to conform to the
"single-exit" model which is generally preferred for kernel code.

Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>

---
 drivers/cpufreq/cpufreq.c |   59 ++++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 24 deletions(-)


diff -r 46ca283d1fe1 drivers/cpufreq/cpufreq.c
--- a/drivers/cpufreq/cpufreq.c	Mon Jul 03 13:37:39 2006 -0700
+++ b/drivers/cpufreq/cpufreq.c	Wed Jul 05 22:26:52 2006 -0700
@@ -284,39 +284,52 @@ EXPORT_SYMBOL_GPL(cpufreq_notify_transit
  *                          SYSFS INTERFACE                          *
  *********************************************************************/
 
+static struct cpufreq_governor *__find_governor(const char *str_governor)
+{
+	struct cpufreq_governor *t;
+	
+	list_for_each_entry(t, &cpufreq_governor_list, governor_list)
+		if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN))
+			return t;
+
+	return NULL;
+}
+
 /**
  * cpufreq_parse_governor - parse a governor string
  */
 static int cpufreq_parse_governor (char *str_governor, unsigned int *policy,
 				struct cpufreq_governor **governor)
 {
+	int err = -EINVAL;
+
 	if (!cpufreq_driver)
-		return -EINVAL;
+		goto out;
+
 	if (cpufreq_driver->setpolicy) {
 		if (!strnicmp(str_governor, "performance", CPUFREQ_NAME_LEN)) {
 			*policy = CPUFREQ_POLICY_PERFORMANCE;
-			return 0;
+			err = 0;
 		} else if (!strnicmp(str_governor, "powersave", CPUFREQ_NAME_LEN)) {
 			*policy = CPUFREQ_POLICY_POWERSAVE;
-			return 0;
+			err = 0;
 		}
-		return -EINVAL;
-	} else {
+	} else if (cpufreq_driver->target) {
 		struct cpufreq_governor *t;
+
 		mutex_lock(&cpufreq_governor_mutex);
-		if (!cpufreq_driver || !cpufreq_driver->target)
-			goto out;
-		list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
-			if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN)) {
-				*governor = t;
-				mutex_unlock(&cpufreq_governor_mutex);
-				return 0;
-			}
+
+		t = __find_governor(str_governor);
+
+		if (t != NULL) {
+			*governor = t;
+			err = 0;
 		}
-out:
+
 		mutex_unlock(&cpufreq_governor_mutex);
 	}
-	return -EINVAL;
+  out:
+	return err;
 }
 
 
@@ -1273,23 +1286,21 @@ EXPORT_SYMBOL_GPL(cpufreq_governor);
 
 int cpufreq_register_governor(struct cpufreq_governor *governor)
 {
-	struct cpufreq_governor *t;
+	int err;
 
 	if (!governor)
 		return -EINVAL;
 
 	mutex_lock(&cpufreq_governor_mutex);
 
-	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
-		if (!strnicmp(governor->name,t->name,CPUFREQ_NAME_LEN)) {
-			mutex_unlock(&cpufreq_governor_mutex);
-			return -EBUSY;
-		}
-	}
-	list_add(&governor->governor_list, &cpufreq_governor_list);
+	err = -EBUSY;
+	if (__find_governor(governor->name) == NULL) {
+		err = 0;
+		list_add(&governor->governor_list, &cpufreq_governor_list);
+	}
 
 	mutex_unlock(&cpufreq_governor_mutex);
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(cpufreq_register_governor);
 
