From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] speedstep-smi: only allow it to run on mobile Intel Pentium
	III
Date: Fri, 3 Sep 2004 18:00:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040903160043.GA8523@dominikbrodowski.de>
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

speedstep-smi only makes sense on Intel mobile Pentium III systems.
So, unify the distributed checks for speedstep_processor there,
and disallow P4s.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   25 ++++++++++++-------------
 1 files changed, 12 insertions(+), 13 deletions(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-08-30 22:50:56.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-09-03 17:56:57.460143128 +0200
@@ -260,12 +260,6 @@
 	if (result) {
 		/* fall back to speedstep_lib.c dection mechanism: try both states out */
 		dprintk(KERN_INFO PFX "could not detect low and high frequencies by SMI call.\n");
-		if (!speedstep_processor)
-			speedstep_processor = speedstep_detect_processor();
-
-		if (!speedstep_processor)
-			return -ENODEV;
-
 		result = speedstep_get_freqs(speedstep_processor,
 				&speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				&speedstep_freqs[SPEEDSTEP_HIGH].frequency,
@@ -310,10 +304,6 @@
 {
 	if (cpu)
 		return -ENODEV;
-	if (!speedstep_processor)
-		speedstep_processor = speedstep_detect_processor();
-	if (!speedstep_processor)
-		return 0;
 	return speedstep_get_processor_frequency(speedstep_processor);
 }
 
@@ -354,10 +344,19 @@
  */
 static int __init speedstep_init(void)
 {
-    struct cpuinfo_x86 *c = cpu_data;
+	speedstep_processor = speedstep_detect_processor();
+
+	switch (speedstep_processor) {
+	case SPEEDSTEP_PROCESSOR_PIII_T:
+        case SPEEDSTEP_PROCESSOR_PIII_C:
+        case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
+		break;
+	default:
+		speedstep_processor = 0;
+	}
 
-    if (c->x86_vendor != X86_VENDOR_INTEL) {
-		printk (KERN_INFO PFX "No Intel CPU detected.\n");
+	if (!speedstep_processor) {
+		dprintk (KERN_INFO PFX "No supported Intel CPU detected.\n");
 		return -ENODEV;
 	}
