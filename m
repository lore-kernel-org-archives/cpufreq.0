From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] new Dothan variant for speedstep-centrino
Date: Wed, 16 Jun 2004 18:32:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040616163201.GB16878@dominikbrodowski.de>
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

Add support for new Dothan variant (CPUID 0x6d6) to speedstep-centrino.
Noted to be missing and tested by Athul Acharya.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-06-14 18:20:27.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-06-14 21:35:18.943828848 +0200
@@ -60,6 +60,13 @@
 	.x86_mask = 1,
 };
 
+static const struct cpu_id cpu_id_dothan_b0 = {
+	.x86_vendor = X86_VENDOR_INTEL,
+	.x86 = 6,
+	.x86_model = 13,
+	.x86_mask = 6,
+};
+
 struct cpu_model
 {
 	const struct cpu_id *cpu_id;
@@ -400,7 +407,8 @@
 		return -ENODEV;
 
 	if ((centrino_verify_cpu_id(cpu, &cpu_id_banias)) &&
-	    (centrino_verify_cpu_id(cpu, &cpu_id_dothan_a1))) {
+	    (centrino_verify_cpu_id(cpu, &cpu_id_dothan_a1)) &&
+	    (centrino_verify_cpu_id(cpu, &cpu_id_dothan_b0))) {
 		printk(KERN_INFO PFX "found unsupported CPU with Enhanced SpeedStep: "
 		       "send /proc/cpuinfo to " MAINTAINER "\n");
 		return -ENODEV;
