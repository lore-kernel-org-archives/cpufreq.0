From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 3/4] speedstep-centrino: add scaling_available_frequencies
	output
Date: Fri, 20 Feb 2004 09:44:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220084451.GC10473@dominikbrodowski.de>
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
To: davej@redhat.com, jeremy@goop.org
Cc: cpufreq@www.linux.org.uk

Export an array of available frequency settings of the centrino driver.

 arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-02-19 20:30:31.773949088 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-02-19 20:33:35.825968928 +0100
@@ -351,6 +351,7 @@
 {
 	unsigned freq;
 	unsigned l, h;
+	int ret;
 
 	if (policy->cpu != 0)
 		return -ENODEV;
@@ -386,7 +387,13 @@
 	dprintk(KERN_INFO PFX "centrino_cpu_init: policy=%d cur=%dkHz\n",
 		policy->policy, policy->cur);
 	
-	return cpufreq_frequency_table_cpuinfo(policy, centrino_model->op_points);
+	ret = cpufreq_frequency_table_cpuinfo(policy, centrino_model->op_points);
+	if (ret)
+		return (ret);
+
+	cpufreq_frequency_table_get_attr(centrino_model->op_points, policy->cpu);
+
+	return 0;
 }
 
 static int centrino_cpu_exit(struct cpufreq_policy *policy)
@@ -394,6 +401,8 @@
 	if (!centrino_model)
 		return -ENODEV;
 
+	cpufreq_frequency_table_put_attr(policy->cpu);
+
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
 	if (!centrino_model->model_name) {
 		acpi_processor_unregister_performance(&p, 0);
@@ -480,6 +489,11 @@
 	return 0;
 }
 
+static struct freq_attr* centrino_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
 static struct cpufreq_driver centrino_driver = {
 	.name		= "centrino", /* should be speedstep-centrino, 
 					 but there's a 16 char limit */
@@ -487,6 +501,7 @@
 	.exit		= centrino_cpu_exit,
 	.verify 	= centrino_verify,
 	.target 	= centrino_target,
+	.attr           = centrino_attr,
 	.owner		= THIS_MODULE,
 };
