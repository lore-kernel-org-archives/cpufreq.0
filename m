From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [RFC][PATCH] cpufreq-core: add affected_cpus
Date: Wed, 29 Sep 2004 23:46:37 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040929214637.GE18564@dominikbrodowski.de>
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

Show the CPUs which can only change frequencies at the same time
in a sysfs file named "affected_cpus". The usefulness of such a file
was first noted by Zwane Mwaikambo.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-09-29 17:18:24.232382032 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-09-29 17:21:06.694684008 +0200
@@ -453,6 +453,24 @@
 	i += sprintf(&buf[i], "\n");
 	return i;
 }
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
 
 
 #define define_one_ro(_name) \
@@ -480,6 +498,7 @@
 define_one_ro(scaling_available_governors);
 define_one_ro(scaling_driver);
 define_one_ro(scaling_cur_freq);
+define_one_ro(affected_cpus);
 define_one_rw(scaling_min_freq);
 define_one_rw(scaling_max_freq);
 define_one_rw(scaling_governor);
@@ -489,6 +508,7 @@
 	&cpuinfo_max_freq.attr,
 	&scaling_min_freq.attr,
 	&scaling_max_freq.attr,
+	&affected_cpus.attr,
 	&scaling_governor.attr,
 	&scaling_driver.attr,
 	&scaling_available_governors.attr,
