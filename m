From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6] cpufreq: single-line KERN_WARNING messages in
	p4-clockmod
Date: Fri, 20 Feb 2004 09:41:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040220084148.GD10215@dominikbrodowski.de>
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
To: davej@redhat.com, cpufreq@www.linux.org.uk

Use KERN_WARNING for warning. Thanks to Dave Jones, Pavel Machel and Russell 
King for their help getting this patch right.

 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   17 ++++++++++-------
 1 files changed, 10 insertions(+), 7 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-18 10:22:09.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004-02-18 22:25:23.650935208 +0100
@@ -181,21 +181,24 @@
 {
 	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
 		/* Pentium M */
-		printk(KERN_DEBUG PFX "Warning: Pentium M detected. The speedstep_centrino module\n");
-		printk(KERN_DEBUG PFX "offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use that instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
+		       "The speedstep_centrino module offers voltage scaling"
+		       " in addition of frequency scaling. You should use "
+		       "that instead of p4-clockmod, if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_DEBUG PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
 		return 0;
 	}
 
 	if (speedstep_detect_processor() == SPEEDSTEP_PROCESSOR_P4M) {
-		printk(KERN_DEBUG PFX "Warning: Pentium 4-M detected. The speedstep-ich or acpi cpufreq \n");
-		printk(KERN_DEBUG PFX "modules offers voltage scaling in addition of frequency scaling. You\n");
-		printk(KERN_DEBUG PFX "should use either one instead of p4-clockmod, if possible.\n");
+		printk(KERN_WARNING PFX "Warning: Pentium 4-M detected. "
+		       "The speedstep-ich or acpi cpufreq modules offers "
+		       "voltage scaling in addition of frequency scaling. "
+		       "You should use either one instead of p4-clockmod, "
+		       "if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_P4M);
 	}
