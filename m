From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] userspace: clarify deprecation of cpufreq_set(),
	cpufreq_setmax()
Date: Wed, 29 Sep 2004 23:43:58 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040929214358.GC18564@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Clarify that cpufreq_set() and cpufreq_setmax() are parts of the 2.4. API 
to the userspace governor which will be removed soon after 2005-01-01.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-09-23 19:07:34.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-09-26 22:24:49.000000000 +0200
@@ -94,13 +94,13 @@
 
 
 /** 
- * cpufreq_set - set the CPU frequency
+ * _cpufreq_set - set the CPU frequency
  * @freq: target frequency in kHz
  * @cpu: CPU for which the frequency is to be set
  *
  * Sets the CPU frequency to freq.
  */
-int cpufreq_set(unsigned int freq, unsigned int cpu)
+static int _cpufreq_set(unsigned int freq, unsigned int cpu)
 {
 	int ret = -EINVAL;
 
@@ -129,6 +129,18 @@
 	up(&userspace_sem);
 	return ret;
 }
+
+
+#ifdef CONFIG_CPU_FREQ_24_API
+
+#warning The /proc/sys/cpu/ and sysctl interface to cpufreq will be removed from the 2.6. kernel series soon after 2005-01-01
+
+static unsigned int warning_print = 0;
+
+int __deprecated cpufreq_set(unsigned int freq, unsigned int cpu)
+{
+	return _cpufreq_set(freq, cpu);
+}
 EXPORT_SYMBOL_GPL(cpufreq_set);
 
 
@@ -139,21 +151,14 @@
  * Sets the CPU frequency to the maximum frequency supported by
  * this CPU.
  */
-int cpufreq_setmax(unsigned int cpu)
+int __deprecated cpufreq_setmax(unsigned int cpu)
 {
 	if (!cpu_is_managed[cpu] || !cpu_online(cpu))
 		return -EINVAL;
-	return cpufreq_set(cpu_max_freq[cpu], cpu);
+	return _cpufreq_set(cpu_max_freq[cpu], cpu);
 }
 EXPORT_SYMBOL_GPL(cpufreq_setmax);
 
-
-#ifdef CONFIG_CPU_FREQ_24_API
-
-#warning The /proc/sys/cpu/ and sysctl interface to cpufreq will be removed from the 2.6. kernel series soon after 2005-01-01
-
-static unsigned int warning_print = 0;
-
 /*********************** cpufreq_sysctl interface ********************/
 static int
 cpufreq_procctl(ctl_table *ctl, int write, struct file *filp,
@@ -186,7 +191,7 @@
 		buf[sizeof(buf) - 1] = '\0';
 
 		freq = simple_strtoul(buf, &p, 0);
-		cpufreq_set(freq, cpu);
+		_cpufreq_set(freq, cpu);
 	} else {
 		len = sprintf(buf, "%d\n", cpufreq_get(cpu));
 		if (len > left)
@@ -239,7 +244,7 @@
 		if (get_user(freq, (unsigned int __user *)newval))
 			return -EFAULT;
 
-		cpufreq_set(freq, cpu);
+		_cpufreq_set(freq, cpu);
 	}
 	return 1;
 }
@@ -494,7 +499,7 @@
 	if (ret != 1)
 		return -EINVAL;
 
-	cpufreq_set(freq, policy->cpu);
+	_cpufreq_set(freq, policy->cpu);
 
 	return count;
 }
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2004-09-19 13:48:35.000000000 +0200
+++ linux/include/linux/cpufreq.h	2004-09-26 22:21:15.000000000 +0200
@@ -261,8 +261,8 @@
  *********************************************************************/
 #ifdef CONFIG_CPU_FREQ_24_API
 
-int cpufreq_setmax(unsigned int cpu);
-int cpufreq_set(unsigned int kHz, unsigned int cpu);
+int __deprecated cpufreq_setmax(unsigned int cpu);
+int __deprecated cpufreq_set(unsigned int kHz, unsigned int cpu);
 
 
 /* /proc/sys/cpu */
