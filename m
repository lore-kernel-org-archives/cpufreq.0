From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix section of powernowk8_cpu_exit()
Date: Fri, 18 Jun 2004 14:38:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040618123801.GA5535@dominikbrodowski.de>
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

powernowk8_cpu_exit may not be __exit but can be __devexit. Thanks to Arjan
for noticing this bug.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-16 18:38:40.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-18 14:24:15.183836536 +0200
@@ -1024,7 +1024,7 @@
 	return -ENODEV;
 }
 
-static int __exit powernowk8_cpu_exit (struct cpufreq_policy *pol)
+static int __devexit powernowk8_cpu_exit (struct cpufreq_policy *pol)
 {
 	struct powernow_k8_data *data = powernow_data[pol->cpu];
 
@@ -1076,7 +1076,7 @@
 	.verify = powernowk8_verify,
 	.target = powernowk8_target,
 	.init = powernowk8_cpu_init,
-	.exit = powernowk8_cpu_exit,
+	.exit = __devexit_p(powernowk8_cpu_exit),
 	.get = powernowk8_get,
 	.name = "powernow-k8",
 	.owner = THIS_MODULE,
