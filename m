From: Dominik Brodowski <linux@brodo.de>
Subject: [RFC] cpufreq_driver->resume
Date: Tue, 2 Sep 2003 10:32:27 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030902083227.GB3958@brodo.de>
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

diff -ruN linux-original/Documentation/cpu-freq/cpu-drivers.txt linux/Documentation/cpu-freq/cpu-drivers.txt
--- linux-original/Documentation/cpu-freq/cpu-drivers.txt	2003-09-02 08:55:01.896637296 +0200
+++ linux/Documentation/cpu-freq/cpu-drivers.txt	2003-09-02 08:53:16.908597904 +0200
@@ -64,6 +64,12 @@
 
 cpufreq_driver.exit -		A pointer to a per-CPU cleanup function.
 
+cpufreq_driver.resume -		A pointer to a per-CPU resume function
+				which is called with interrupts disabled
+				and _before_ the pre-suspend frequency
+				and/or policy is restored by a call to
+				->target or ->setpolicy.
+
 cpufreq_driver.attr -		A pointer to a NULL-terminated list of
 				"struct freq_attr" which allow to
 				export values to sysfs.
diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2003-09-02 08:55:01.897637144 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2003-09-02 08:55:44.440169696 +0200
@@ -493,6 +493,13 @@
 	if (!cpu_policy)
 		return -EINVAL;
 
+	if (cpufreq_driver->resume)
+		ret = cpufreq_driver->resume(cpu_policy);
+	if (ret) {
+		printk(KERN_ERR "cpufreq: resume failed in ->resume step on CPU %u\n", cpu_policy->cpu);
+		goto out;
+	}
+
 	if (cpufreq_driver->setpolicy)
 		ret = cpufreq_driver->setpolicy(cpu_policy);
 	else
@@ -501,6 +508,12 @@
 	 */
 		ret = cpufreq_driver->target(cpu_policy, cpu_policy->cur, CPUFREQ_RELATION_H);
 
+	if (ret) {
+		printk(KERN_ERR "cpufreq: resume failed in ->setpolicy/target step on CPU %u\n", cpu_policy->cpu);
+		goto out;
+	}
+
+ out:
 	cpufreq_cpu_put(cpu_policy);
 
 	return ret;
diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-09-02 08:55:01.897637144 +0200
+++ linux/include/linux/cpufreq.h	2003-09-02 08:50:16.363045000 +0200
@@ -179,6 +179,7 @@
 
 	/* optional */
 	int	(*exit)		(struct cpufreq_policy *policy);
+	int	(*resume)	(struct cpufreq_policy *policy);
 	struct freq_attr	**attr;
 };
