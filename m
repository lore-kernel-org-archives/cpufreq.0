From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: remove double calls to moudle_get/put in userspace
	governor
Date: Sun, 5 Sep 2004 14:15:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040905121559.GA8623@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

The cpufreq core properly gets and puts the modules it calls, including
governors. So there's no need to keep the racy in-module calls in 
cpufreq_userspace denoting otherwise.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq_userspace.c linux/drivers/cpufreq/cpufreq_userspace.c
--- linux-original/drivers/cpufreq/cpufreq_userspace.c	2004-09-05 09:16:59.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq_userspace.c	2004-09-05 14:08:45.452259000 +0200
@@ -515,7 +515,7 @@
 	unsigned int cpu = policy->cpu;
 	switch (event) {
 	case CPUFREQ_GOV_START:
-		if ((!cpu_online(cpu)) || (!try_module_get(THIS_MODULE)))
+		if (!cpu_online(cpu))
 			return -EINVAL;
 		BUG_ON(!policy->cur);
 		down(&userspace_sem);
@@ -534,7 +534,6 @@
 		cpu_max_freq[cpu] = 0;
 		sysfs_remove_file (&policy->kobj, &freq_attr_scaling_setspeed.attr);
 		up(&userspace_sem);
-		module_put(THIS_MODULE);
 		break;
 	case CPUFREQ_GOV_LIMITS:
 		down(&userspace_sem);
