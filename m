From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: deprecate proc_sys_intf,
	and inform users of removal ~2005-01-01
Date: Mon, 9 Aug 2004 21:54:17 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809195417.GC9397@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@redhat.com

The /proc/sys/cpu/ interface was deprecated already when cpufreq was merged
into the kernel. With 2.7. not appearing soon, let's do the same what's
suggested for devfs and others: inform users of it being deprecated.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-08-05 17:41:41.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-08-06 22:27:17.315819056 +0200
@@ -154,6 +154,9 @@
 
 #ifdef CONFIG_CPU_FREQ_24_API
 
+#warning The /proc/sys/cpu/ and sysctl interface to cpufreq will be removed from the 2.6. kernel series soon after 2005-01-01
+
+static unsigned int warning_print = 0;
 
 /*********************** cpufreq_sysctl interface ********************/
 static int
@@ -169,6 +172,11 @@
 		return 0;
 	}
 
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/sys/cpu/ is deprecated and will be removed from (new) 2.6. kernels soon after 2005-01-01");
+	}
+
 	if (write) {
 		unsigned int freq;
 
@@ -204,6 +212,11 @@
 	if (!cpu_online(cpu))
 		return -EINVAL;
 
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/sys/cpu/ is deprecated and will be removed from (new) 2.6. kernels soon after 2005-01-01");
+	}
+
 	if (oldval && oldlenp) {
 		size_t oldlen;
