From: Mark Langsdorf <mark.langsdorf@amd.com>
Subject: [PATCH] powernow-k8: improve error messages
Date: Tue, 18 Mar 2008 15:24:32 -0500
Message-ID: <200803181524.32397.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

The most common error with powernow-k8 is an ACPI _PSS error
caused either by failure to load the ACPI processor module
or a bad parse of the _PSS object.  Make the error message
returned to the user in these situations more straightforward
and easier to understand.

-Mark Langsdorf
Operating System Research Center
AMD

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>

diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index c99d59d..7dbafe5 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -1127,12 +1127,23 @@ static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
 		 * an UP version, and is deprecated by AMD.
 		 */
 		if (num_online_cpus() != 1) {
-			printk(KERN_ERR PFX "MP systems not supported by PSB BIOS structure\n");
+#ifndef CONFIG_ACPI_PROCESSOR
+			printk(KERN_ERR PFX "ACPI Processor support is required "
+			       "for SMP systems but is absent. Please load the "
+			       "ACPI Processor module before starting this "
+			       "driver.\n");
+#else
+			printk(KERN_ERR PFX "Your BIOS does not provide ACPI "
+			       "_PSS objects in a way that Linux understands. "
+			       "Please report this to the Linux ACPI maintainers"
+			       " and complain to your BIOS vendor.\n");
+#endif
 			kfree(data);
 			return -ENODEV;
 		}
 		if (pol->cpu != 0) {
-			printk(KERN_ERR PFX "No _PSS objects for CPU other than CPU0\n");
+			printk(KERN_ERR PFX "No ACPI _PSS objects for CPU other than "
+			       "CPU0. Complain to your BIOS vendor.\n");
 			kfree(data);
 			return -ENODEV;
 		}
