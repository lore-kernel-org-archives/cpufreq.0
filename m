From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: deprecate proc_intf,
	and inform of removal ~2005-01-01
Date: Mon, 9 Aug 2004 21:53:58 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809195358.GB9397@dominikbrodowski.de>
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

The /proc/cpufreq interface was deprecated already when cpufreq was merged
into the kernel. With 2.7. not appearing soon, let's do the same what's
suggested for devfs and others: inform users of it being deprecated.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/proc_intf.c linux/drivers/cpufreq/proc_intf.c
--- linux-original/drivers/cpufreq/proc_intf.c	2004-08-05 17:41:41.000000000 +0200
+++ linux/drivers/cpufreq/proc_intf.c	2004-08-06 22:25:05.974785928 +0200
@@ -12,9 +12,12 @@
 #include <linux/proc_fs.h>
 #include <asm/uaccess.h>
 
+#warning This module will be removed from the 2.6. kernel series soon after 2005-01-01
 
 #define CPUFREQ_ALL_CPUS		((NR_CPUS))
 
+static unsigned int warning_print = 0;
+
 /**
  * cpufreq_parse_policy - parse a policy string
  * @input_string: the string to parse.
@@ -110,6 +113,11 @@
 	if (off != 0)
 		goto end;
 
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/cpufreq is deprecated and will be removed from (new) 2.6. kernels soon after 2005-01-01");
+	}
+
 	p += sprintf(p, "          minimum CPU frequency  -  maximum CPU frequency  -  policy\n");
 	for (i=0;i<NR_CPUS;i++) {
 		if (!cpu_online(i))
@@ -179,6 +187,11 @@
 	
 	if (copy_from_user(proc_string, buffer, count))
 		return -EFAULT;
+
+	if (!warning_print) {
+		warning_print++;
+		printk(KERN_INFO "Access to /proc/cpufreq is deprecated and will be removed from (new) 2.6. kernels soon after 2005-01-01");
+	}
 	
 	proc_string[count] = '\0';
