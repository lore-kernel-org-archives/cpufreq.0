From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] re-add  call to cpufreq_driver->resume()
Date: Tue, 2 Nov 2004 18:19:46 +0100
Message-ID: <20041102171946.GA28981@dominikbrodowski.de>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

(if anyone has a brown spare paper bag, feel free to send it to me:)

The call to cpufreq_driver->resume() got lost in 2.6.6. Re-add it at the
proper place.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-10-29 17:16:44.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-10-31 16:15:55.900925872 +0100
@@ -893,6 +893,13 @@
 		return 0;
 	}
 
+	if (cpufreq_driver->resume) {
+		ret = cpufreq_driver->resume(cpu_policy);
+		printk(KERN_ERR "cpufreq: resume failed in ->resume step on CPU %u\n", cpu_policy->cpu);
+		cpufreq_cpu_put(cpu_policy);
+		return (ret);
+	}
+
 	if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
 		unsigned int cur_freq = 0;
