From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES 5/5] core: include cleanup
Date: Sat, 29 Jan 2005 20:43:43 +0100
Message-ID: <20050129194343.GE9382@dominikbrodowski.de>
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

Move core-related declarations to the new cpufreq_core.h file
in drivers/cpufreq/.

Signed-off-by: Dominik Brodowski <linux@brodo.de>
---

 drivers/cpufreq/cpufreq_core.h  |    6 ++++++
 drivers/cpufreq/cpufreq_stats.c |    2 ++
 include/linux/cpufreq.h         |    8 --------
 3 files changed, 8 insertions(+), 8 deletions(-)

Index: 2.6.11-rc2+/drivers/cpufreq/cpufreq_core.h
===================================================================
--- 2.6.11-rc2+.orig/drivers/cpufreq/cpufreq_core.h	2005-01-29 20:34:49.000000000 +0100
+++ 2.6.11-rc2+/drivers/cpufreq/cpufreq_core.h	2005-01-29 20:35:45.000000000 +0100
@@ -15,7 +15,13 @@
 extern struct list_head			cpufreq_governor_list;
 extern struct semaphore			cpufreq_governor_sem;
 
+struct cpufreq_policy *cpufreq_cpu_get (unsigned int cpu);
+void cpufreq_cpu_put (struct cpufreq_policy *data);
+
 /* cpufreq_sysfs.c */
 extern struct kobj_type			ktype_cpufreq;
 extern struct freq_attr			cpuinfo_cur_freq;
 extern struct freq_attr			scaling_cur_freq;
+
+/* freq_table.c */
+struct cpufreq_frequency_table *cpufreq_frequency_get_table (unsigned int cpu);
Index: 2.6.11-rc2+/drivers/cpufreq/cpufreq_stats.c
===================================================================
--- 2.6.11-rc2+.orig/drivers/cpufreq/cpufreq_stats.c	2005-01-29 20:34:49.000000000 +0100
+++ 2.6.11-rc2+/drivers/cpufreq/cpufreq_stats.c	2005-01-29 20:35:45.000000000 +0100
@@ -20,6 +20,8 @@
 #include <linux/kobject.h>
 #include <linux/spinlock.h>
 
+#include "cpufreq_core.h"
+
 static spinlock_t cpufreq_stats_lock;
 
 #define CPUFREQ_STATDEVICE_ATTR(_name,_mode,_show) \
Index: 2.6.11-rc2+/include/linux/cpufreq.h
===================================================================
--- 2.6.11-rc2+.orig/include/linux/cpufreq.h	2005-01-29 20:34:49.000000000 +0100
+++ 2.6.11-rc2+/include/linux/cpufreq.h	2005-01-29 20:35:45.000000000 +0100
@@ -3,9 +3,6 @@
  *
  *  Copyright (C) 2001 Russell King
  *            (C) 2002 - 2003 Dominik Brodowski <linux@brodo.de>
- *            
- *
- * $Id: cpufreq.h,v 1.36 2003/01/20 17:31:48 db Exp $
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -292,11 +289,6 @@
 				   unsigned int relation,
 				   unsigned int *index);
 
-/* the following 3 funtions are for cpufreq core use only */
-struct cpufreq_frequency_table *cpufreq_frequency_get_table(unsigned int cpu);
-struct cpufreq_policy *cpufreq_cpu_get(unsigned int cpu);
-void   cpufreq_cpu_put (struct cpufreq_policy *data);
-
 /* the following are really really optional */
 extern struct freq_attr cpufreq_freq_attr_scaling_available_freqs;
