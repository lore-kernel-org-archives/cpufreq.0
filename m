From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES 3/5] core: split out sysfs interface to extra
	file
Date: Sat, 29 Jan 2005 20:43:13 +0100
Message-ID: <20050129194313.GC9382@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@lists.linux.org.uk

Move the sysfs interface to cpufreq to a different file. It splits
out quite nicely.

Signed-off-by: Dominik Brodowski <linux@brodo.de>
---

 drivers/cpufreq/Makefile        |    2
 drivers/cpufreq/cpufreq.c       |  288 -------------------------------------
 drivers/cpufreq/cpufreq_core.h  |   21 ++
 drivers/cpufreq/cpufreq_sysfs.c |  308 ++++++++++++++++++++++++++++++++++++++++ 4 files changed, 336 insertions(+), 283 deletions(-)

Index: 2.6.11-rc2+/drivers/cpufreq/Makefile
===================================================================
--- 2.6.11-rc2+.orig/drivers/cpufreq/Makefile	2005-01-29 19:39:50.000000000 +0100
+++ 2.6.11-rc2+/drivers/cpufreq/Makefile	2005-01-29 20:26:44.000000000 +0100
@@ -1,5 +1,5 @@
 # CPUfreq core
-obj-$(CONFIG_CPU_FREQ)			+= cpufreq.o
+obj-$(CONFIG_CPU_FREQ)			+= cpufreq.o cpufreq_sysfs.o
 # CPUfreq stats
 obj-$(CONFIG_CPU_FREQ_STAT)             += cpufreq_stats.o
 
Index: 2.6.11-rc2+/drivers/cpufreq/cpufreq.c
===================================================================
--- 2.6.11-rc2+.orig/drivers/cpufreq/cpufreq.c	2005-01-29 19:39:50.000000000 +0100
+++ 2.6.11-rc2+/drivers/cpufreq/cpufreq.c	2005-01-29 20:26:44.000000000 +0100
@@ -24,6 +24,8 @@
 #include <linux/cpu.h>
 #include <linux/completion.h>
 
+#include "cpufreq_core.h"
+
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_CORE, "cpufreq-core", msg)
 
 /**
@@ -31,7 +33,7 @@
  * level driver of CPUFreq support, and its spinlock. This lock
  * also protects the cpufreq_cpu_data array.
  */
-static struct cpufreq_driver   	*cpufreq_driver;
+struct cpufreq_driver   	*cpufreq_driver;
 static struct cpufreq_policy	*cpufreq_cpu_data[NR_CPUS];
 static DEFINE_SPINLOCK(cpufreq_driver_lock);
 
@@ -60,8 +62,9 @@
 static DECLARE_RWSEM		(cpufreq_notifier_rwsem);
 
 
-static LIST_HEAD(cpufreq_governor_list);
-static DECLARE_MUTEX		(cpufreq_governor_sem);
+LIST_HEAD(cpufreq_governor_list);
+DECLARE_MUTEX		(cpufreq_governor_sem);
+
 
 struct cpufreq_policy * cpufreq_cpu_get(unsigned int cpu)
 {
@@ -280,285 +283,6 @@
 
 
 
-/*********************************************************************
- *                          SYSFS INTERFACE                          *
- *********************************************************************/
-
-/**
- * cpufreq_parse_governor - parse a governor string
- */
-static int cpufreq_parse_governor (char *str_governor, unsigned int *policy,
-				struct cpufreq_governor **governor)
-{
-	if (!cpufreq_driver)
-		return -EINVAL;
-	if (cpufreq_driver->setpolicy) {
-		if (!strnicmp(str_governor, "performance", CPUFREQ_NAME_LEN)) {
-			*policy = CPUFREQ_POLICY_PERFORMANCE;
-			return 0;
-		} else if (!strnicmp(str_governor, "powersave", CPUFREQ_NAME_LEN)) {
-			*policy = CPUFREQ_POLICY_POWERSAVE;
-			return 0;
-		}
-		return -EINVAL;
-	} else {
-		struct cpufreq_governor *t;
-		down(&cpufreq_governor_sem);
-		if (!cpufreq_driver || !cpufreq_driver->target)
-			goto out;
-		list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
-			if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN)) {
-				*governor = t;
-				up(&cpufreq_governor_sem);
-				return 0;
-			}
-		}
-	out:
-		up(&cpufreq_governor_sem);
-	}
-	return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(cpufreq_parse_governor);
-
-
-/* drivers/base/cpu.c */
-extern struct sysdev_class cpu_sysdev_class;
-
-
-/**
- * cpufreq_per_cpu_attr_read() / show_##file_name() - print out cpufreq information
- *
- * Write out information from cpufreq_driver->policy[cpu]; object must be
- * "unsigned int".
- */
-
-#define show_one(file_name, object)		 			\
-static ssize_t show_##file_name 					\
-(struct cpufreq_policy * policy, char *buf)				\
-{									\
-	return sprintf (buf, "%u\n", policy->object);			\
-}
-
-show_one(cpuinfo_min_freq, cpuinfo.min_freq);
-show_one(cpuinfo_max_freq, cpuinfo.max_freq);
-show_one(scaling_min_freq, min);
-show_one(scaling_max_freq, max);
-show_one(scaling_cur_freq, cur);
-
-/**
- * cpufreq_per_cpu_attr_write() / store_##file_name() - sysfs write access
- */
-#define store_one(file_name, object)			\
-static ssize_t store_##file_name					\
-(struct cpufreq_policy * policy, const char *buf, size_t count)		\
-{									\
-	unsigned int ret = -EINVAL;					\
-	struct cpufreq_policy new_policy;				\
-									\
-	ret = cpufreq_get_policy(&new_policy, policy->cpu);		\
-	if (ret)							\
-		return -EINVAL;						\
-									\
-	ret = sscanf (buf, "%u", &new_policy.object);			\
-	if (ret != 1)							\
-		return -EINVAL;						\
-									\
-	ret = cpufreq_set_policy(&new_policy);				\
-									\
-	return ret ? ret : count;					\
-}
-
-store_one(scaling_min_freq,min);
-store_one(scaling_max_freq,max);
-
-/**
- * show_cpuinfo_cur_freq - current CPU frequency as detected by hardware
- */
-static ssize_t show_cpuinfo_cur_freq (struct cpufreq_policy * policy, char *buf)
-{
-	unsigned int cur_freq = cpufreq_get(policy->cpu);
-	if (!cur_freq)
-		return sprintf(buf, "<unknown>");
-	return sprintf(buf, "%u\n", cur_freq);
-}
-
-
-/**
- * show_scaling_governor - show the current policy for the specified CPU
- */
-static ssize_t show_scaling_governor (struct cpufreq_policy * policy, char *buf)
-{
-	if(policy->policy == CPUFREQ_POLICY_POWERSAVE)
-		return sprintf(buf, "powersave\n");
-	else if (policy->policy == CPUFREQ_POLICY_PERFORMANCE)
-		return sprintf(buf, "performance\n");
-	else if (policy->governor)
-		return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
-	return -EINVAL;
-}
-
-
-/**
- * store_scaling_governor - store policy for the specified CPU
- */
-static ssize_t store_scaling_governor (struct cpufreq_policy * policy, 
-				       const char *buf, size_t count) 
-{
-	unsigned int ret = -EINVAL;
-	char	str_governor[16];
-	struct cpufreq_policy new_policy;
-
-	ret = cpufreq_get_policy(&new_policy, policy->cpu);
-	if (ret)
-		return ret;
-
-	ret = sscanf (buf, "%15s", str_governor);
-	if (ret != 1)
-		return -EINVAL;
-
-	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
-		return -EINVAL;
-
-	ret = cpufreq_set_policy(&new_policy);
-
-	return ret ? ret : count;
-}
-
-/**
- * show_scaling_driver - show the cpufreq driver currently loaded
- */
-static ssize_t show_scaling_driver (struct cpufreq_policy * policy, char *buf)
-{
-	return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", cpufreq_driver->name);
-}
-
-/**
- * show_scaling_available_governors - show the available CPUfreq governors
- */
-static ssize_t show_scaling_available_governors (struct cpufreq_policy * policy,
-				char *buf)
-{
-	ssize_t i = 0;
-	struct cpufreq_governor *t;
-
-	if (!cpufreq_driver->target) {
-		i += sprintf(buf, "performance powersave");
-		goto out;
-	}
-
-	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
-		if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char)) - (CPUFREQ_NAME_LEN + 2)))
-			goto out;
-		i += scnprintf(&buf[i], CPUFREQ_NAME_LEN, "%s ", t->name);
-	}
- out:
-	i += sprintf(&buf[i], "\n");
-	return i;
-}
-/**
- * show_affected_cpus - show the CPUs affected by each transition
- */
-static ssize_t show_affected_cpus (struct cpufreq_policy * policy, char *buf)
-{
-	ssize_t i = 0;
-	unsigned int cpu;
-
-	for_each_cpu_mask(cpu, policy->cpus) {
-		if (i)
-			i += scnprintf(&buf[i], (PAGE_SIZE - i - 2), " ");
-		i += scnprintf(&buf[i], (PAGE_SIZE - i - 2), "%u", cpu);
-		if (i >= (PAGE_SIZE - 5))
-		    break;
-	}
-	i += sprintf(&buf[i], "\n");
-	return i;
-}
-
-
-#define define_one_ro(_name) \
-static struct freq_attr _name = \
-__ATTR(_name, 0444, show_##_name, NULL)
-
-#define define_one_ro0400(_name) \
-static struct freq_attr _name = \
-__ATTR(_name, 0400, show_##_name, NULL)
-
-#define define_one_rw(_name) \
-static struct freq_attr _name = \
-__ATTR(_name, 0644, show_##_name, store_##_name)
-
-define_one_ro0400(cpuinfo_cur_freq);
-define_one_ro(cpuinfo_min_freq);
-define_one_ro(cpuinfo_max_freq);
-define_one_ro(scaling_available_governors);
-define_one_ro(scaling_driver);
-define_one_ro(scaling_cur_freq);
-define_one_ro(affected_cpus);
-define_one_rw(scaling_min_freq);
-define_one_rw(scaling_max_freq);
-define_one_rw(scaling_governor);
-
-static struct attribute * default_attrs[] = {
-	&cpuinfo_min_freq.attr,
-	&cpuinfo_max_freq.attr,
-	&scaling_min_freq.attr,
-	&scaling_max_freq.attr,
-	&affected_cpus.attr,
-	&scaling_governor.attr,
-	&scaling_driver.attr,
-	&scaling_available_governors.attr,
-	NULL
-};
-
-#define to_policy(k) container_of(k,struct cpufreq_policy,kobj)
-#define to_attr(a) container_of(a,struct freq_attr,attr)
-
-static ssize_t show(struct kobject * kobj, struct attribute * attr ,char * buf)
-{
-	struct cpufreq_policy * policy = to_policy(kobj);
-	struct freq_attr * fattr = to_attr(attr);
-	ssize_t ret;
-	policy = cpufreq_cpu_get(policy->cpu);
-	if (!policy)
-		return -EINVAL;
-	ret = fattr->show ? fattr->show(policy,buf) : 0;
-	cpufreq_cpu_put(policy);
-	return ret;
-}
-
-static ssize_t store(struct kobject * kobj, struct attribute * attr, 
-		     const char * buf, size_t count)
-{
-	struct cpufreq_policy * policy = to_policy(kobj);
-	struct freq_attr * fattr = to_attr(attr);
-	ssize_t ret;
-	policy = cpufreq_cpu_get(policy->cpu);
-	if (!policy)
-		return -EINVAL;
-	ret = fattr->store ? fattr->store(policy,buf,count) : 0;
-	cpufreq_cpu_put(policy);
-	return ret;
-}
-
-static void cpufreq_sysfs_release(struct kobject * kobj)
-{
-	struct cpufreq_policy * policy = to_policy(kobj);
-	dprintk("last reference is dropped\n");
-	complete(&policy->kobj_unregister);
-}
-
-static struct sysfs_ops sysfs_ops = {
-	.show	= show,
-	.store	= store,
-};
-
-static struct kobj_type ktype_cpufreq = {
-	.sysfs_ops	= &sysfs_ops,
-	.default_attrs	= default_attrs,
-	.release	= cpufreq_sysfs_release,
-};
-
-
 /**
  * cpufreq_add_dev - add a CPU device
  *
Index: 2.6.11-rc2+/drivers/cpufreq/cpufreq_core.h
===================================================================
--- 2.6.11-rc2+.orig/drivers/cpufreq/cpufreq_core.h	2005-01-29 16:40:01.777254584 +0100
+++ 2.6.11-rc2+/drivers/cpufreq/cpufreq_core.h	2005-01-29 20:26:44.000000000 +0100
@@ -0,0 +1,21 @@
+/*
+ *  linux/drivers/cpufreq/cpufreq_core.h - header for cpufreq core files
+ *
+ *  Copyright (C) 2001 Russell King
+ *            (C) 2002 - 2005 Dominik Brodowski <linux@brodo.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+/* cpufreq.c */
+extern struct cpufreq_driver		*cpufreq_driver;
+extern struct list_head			cpufreq_governor_list;
+extern struct semaphore			cpufreq_governor_sem;
+
+/* cpufreq_sysfs.c */
+extern struct kobj_type			ktype_cpufreq;
+extern struct freq_attr			cpuinfo_cur_freq;
+extern struct freq_attr			scaling_cur_freq;
Index: 2.6.11-rc2+/drivers/cpufreq/cpufreq_sysfs.c
===================================================================
--- 2.6.11-rc2+.orig/drivers/cpufreq/cpufreq_sysfs.c	2005-01-29 16:40:01.777254584 +0100
+++ 2.6.11-rc2+/drivers/cpufreq/cpufreq_sysfs.c	2005-01-29 20:26:44.000000000 +0100
@@ -0,0 +1,308 @@
+/*
+ *  linux/drivers/cpufreq/cpufreq_sysfs.c - sysfs interface to cpufreq core
+ *
+ *  Copyright (C) 2001 Russell King
+ *            (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/cpufreq.h>
+#include <linux/device.h>
+#include <linux/completion.h>
+#include <linux/list.h>
+#include <linux/string.h>
+
+#include "cpufreq_core.h"
+
+#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_CORE, "cpufreq-sysfs", msg)
+
+/* drivers/base/cpu.c */
+extern struct sysdev_class cpu_sysdev_class;
+
+
+/**
+ * cpufreq_parse_governor - parse a governor string
+ */
+static int cpufreq_parse_governor (char *str_governor, unsigned int *policy,
+				   struct cpufreq_governor **governor)
+{
+	if (!cpufreq_driver)
+		return -EINVAL;
+	if (cpufreq_driver->setpolicy) {
+		/* hardcoded governors */
+		if (!strnicmp(str_governor, "performance", CPUFREQ_NAME_LEN)) {
+			*policy = CPUFREQ_POLICY_PERFORMANCE;
+			return 0;
+		} else if (!strnicmp(str_governor, "powersave", CPUFREQ_NAME_LEN)) {
+			*policy = CPUFREQ_POLICY_POWERSAVE;
+			return 0;
+		}
+		return -EINVAL;
+	} else {
+		struct cpufreq_governor *t;
+		down(&cpufreq_governor_sem);
+		if (!cpufreq_driver || !cpufreq_driver->target)
+			goto out;
+		list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
+			if (!strnicmp(str_governor,t->name,CPUFREQ_NAME_LEN)) {
+				*governor = t;
+				up(&cpufreq_governor_sem);
+				return 0;
+			}
+		}
+	out:
+		up(&cpufreq_governor_sem);
+	}
+	return -EINVAL;
+}
+
+
+
+/**
+ * cpufreq_per_cpu_attr_read() / show_##file_name() - print out cpufreq information
+ *
+ * Write out information from cpufreq_driver->policy[cpu]; object must be
+ * "unsigned int".
+ */
+
+#define show_one(file_name, object)		 			\
+static ssize_t show_##file_name 					\
+(struct cpufreq_policy * policy, char *buf)				\
+{									\
+	return sprintf (buf, "%u\n", policy->object);			\
+}
+show_one(cpuinfo_min_freq, cpuinfo.min_freq);
+show_one(cpuinfo_max_freq, cpuinfo.max_freq);
+show_one(scaling_min_freq, min);
+show_one(scaling_max_freq, max);
+show_one(scaling_cur_freq, cur);
+
+
+/**
+ * cpufreq_per_cpu_attr_write() / store_##file_name() - sysfs write access
+ */
+#define store_one(file_name, object)			\
+static ssize_t store_##file_name					\
+(struct cpufreq_policy * policy, const char *buf, size_t count)		\
+{									\
+	unsigned int ret = -EINVAL;					\
+	struct cpufreq_policy new_policy;				\
+									\
+	ret = cpufreq_get_policy(&new_policy, policy->cpu);		\
+	if (ret)							\
+		return -EINVAL;						\
+									\
+	ret = sscanf (buf, "%u", &new_policy.object);			\
+	if (ret != 1)							\
+		return -EINVAL;						\
+									\
+	ret = cpufreq_set_policy(&new_policy);				\
+									\
+	return ret ? ret : count;					\
+}
+store_one(scaling_min_freq,min);
+store_one(scaling_max_freq,max);
+
+
+/**
+ * show_cpuinfo_cur_freq - current CPU frequency as detected by hardware
+ */
+static ssize_t show_cpuinfo_cur_freq (struct cpufreq_policy * policy, char *buf)
+{
+	unsigned int cur_freq = cpufreq_get(policy->cpu);
+	if (!cur_freq)
+		return sprintf(buf, "<unknown>");
+	return sprintf(buf, "%u\n", cur_freq);
+}
+
+
+/**
+ * show_scaling_governor - show the current policy for the specified CPU
+ */
+static ssize_t show_scaling_governor (struct cpufreq_policy * policy, char *buf)
+{
+	if(policy->policy == CPUFREQ_POLICY_POWERSAVE)
+		return sprintf(buf, "powersave\n");
+	else if (policy->policy == CPUFREQ_POLICY_PERFORMANCE)
+		return sprintf(buf, "performance\n");
+	else if (policy->governor)
+		return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", policy->governor->name);
+	return -EINVAL;
+}
+
+
+/**
+ * store_scaling_governor - store policy for the specified CPU
+ */
+static ssize_t store_scaling_governor (struct cpufreq_policy * policy,
+				       const char *buf, size_t count)
+{
+	unsigned int ret = -EINVAL;
+	char	str_governor[16];
+	struct cpufreq_policy new_policy;
+
+	ret = cpufreq_get_policy(&new_policy, policy->cpu);
+	if (ret)
+		return ret;
+
+	ret = sscanf (buf, "%15s", str_governor);
+	if (ret != 1)
+		return -EINVAL;
+
+	if (cpufreq_parse_governor(str_governor, &new_policy.policy, &new_policy.governor))
+		return -EINVAL;
+
+	ret = cpufreq_set_policy(&new_policy);
+
+	return ret ? ret : count;
+}
+
+
+/**
+ * show_scaling_driver - show the cpufreq driver currently loaded
+ */
+static ssize_t show_scaling_driver (struct cpufreq_policy * policy, char *buf)
+{
+	return scnprintf(buf, CPUFREQ_NAME_LEN, "%s\n", cpufreq_driver->name);
+}
+
+
+/**
+ * show_scaling_available_governors - show the available CPUfreq governors
+ */
+static ssize_t show_scaling_available_governors (struct cpufreq_policy * policy,
+				char *buf)
+{
+	ssize_t i = 0;
+	struct cpufreq_governor *t;
+
+	if (!cpufreq_driver->target) {
+		i += sprintf(buf, "performance powersave");
+		goto out;
+	}
+
+	list_for_each_entry(t, &cpufreq_governor_list, governor_list) {
+		if (i >= (ssize_t) ((PAGE_SIZE / sizeof(char)) - (CPUFREQ_NAME_LEN + 2)))
+			goto out;
+		i += scnprintf(&buf[i], CPUFREQ_NAME_LEN, "%s ", t->name);
+	}
+ out:
+	i += sprintf(&buf[i], "\n");
+	return i;
+}
+
+
+/**
+ * show_affected_cpus - show the CPUs affected by each transition
+ */
+static ssize_t show_affected_cpus (struct cpufreq_policy * policy, char *buf)
+{
+	ssize_t i = 0;
+	unsigned int cpu;
+
+	for_each_cpu_mask(cpu, policy->cpus) {
+		if (i)
+			i += scnprintf(&buf[i], (PAGE_SIZE - i - 2), " ");
+		i += scnprintf(&buf[i], (PAGE_SIZE - i - 2), "%u", cpu);
+		if (i >= (PAGE_SIZE - 5))
+		    break;
+	}
+	i += sprintf(&buf[i], "\n");
+	return i;
+}
+
+
+#define define_one_ro(_name) \
+struct freq_attr _name = \
+__ATTR(_name, 0444, show_##_name, NULL)
+
+#define define_one_ro0400(_name) \
+struct freq_attr _name = \
+__ATTR(_name, 0400, show_##_name, NULL)
+
+#define define_one_rw(_name) \
+struct freq_attr _name = \
+__ATTR(_name, 0644, show_##_name, store_##_name)
+
+define_one_ro0400(cpuinfo_cur_freq);
+define_one_ro(scaling_cur_freq);
+static define_one_ro(cpuinfo_min_freq);
+static define_one_ro(cpuinfo_max_freq);
+static define_one_ro(scaling_available_governors);
+static define_one_ro(scaling_driver);
+static define_one_ro(affected_cpus);
+static define_one_rw(scaling_min_freq);
+static define_one_rw(scaling_max_freq);
+static define_one_rw(scaling_governor);
+
+static struct attribute * default_attrs[] = {
+	&cpuinfo_min_freq.attr,
+	&cpuinfo_max_freq.attr,
+	&scaling_min_freq.attr,
+	&scaling_max_freq.attr,
+	&affected_cpus.attr,
+	&scaling_governor.attr,
+	&scaling_driver.attr,
+	&scaling_available_governors.attr,
+	NULL
+};
+
+
+#define to_policy(k) container_of(k,struct cpufreq_policy,kobj)
+#define to_attr(a) container_of(a,struct freq_attr,attr)
+
+
+static ssize_t show(struct kobject * kobj, struct attribute * attr ,char * buf)
+{
+	struct cpufreq_policy * policy = to_policy(kobj);
+	struct freq_attr * fattr = to_attr(attr);
+	ssize_t ret;
+	policy = cpufreq_cpu_get(policy->cpu);
+	if (!policy)
+		return -EINVAL;
+	ret = fattr->show ? fattr->show(policy,buf) : 0;
+	cpufreq_cpu_put(policy);
+	return ret;
+}
+
+
+static ssize_t store(struct kobject * kobj, struct attribute * attr,
+		     const char * buf, size_t count)
+{
+	struct cpufreq_policy * policy = to_policy(kobj);
+	struct freq_attr * fattr = to_attr(attr);
+	ssize_t ret;
+	policy = cpufreq_cpu_get(policy->cpu);
+	if (!policy)
+		return -EINVAL;
+	ret = fattr->store ? fattr->store(policy,buf,count) : 0;
+	cpufreq_cpu_put(policy);
+	return ret;
+}
+
+
+static void cpufreq_sysfs_release(struct kobject * kobj)
+{
+	struct cpufreq_policy * policy = to_policy(kobj);
+	dprintk("last reference is dropped\n");
+	complete(&policy->kobj_unregister);
+}
+
+
+static struct sysfs_ops sysfs_ops = {
+	.show	= show,
+	.store	= store,
+};
+
+
+struct kobj_type ktype_cpufreq = {
+	.sysfs_ops	= &sysfs_ops,
+	.default_attrs	= default_attrs,
+	.release	= cpufreq_sysfs_release,
+};
