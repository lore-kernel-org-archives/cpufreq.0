From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH][BUG #1422] avoid hang with speedstep-smi on Dell Latitude
	C600
Date: Wed, 12 Nov 2003 18:58:49 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031112175849.GA5946@brodo.de>
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

[ http://bugme.osdl.org/show_bug.cgi?id=1422 ]

The speedstep_smi_get_freqs call caused a hang on a Dell C600. On
some other systems, the speedstep_smi_get_freqs call fails even though
this cpufreq driver works fine otherwise. All these systems have one
thing in common: ist_info.event is either 0x00000000 or 0x00ff0000. So,
don't call speedstep_smi_get_freqs on these systems.

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-11 22:32:49.847042344 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-11 22:38:01.990589312 +0100
@@ -86,6 +86,9 @@
 /**
  * speedstep_smi_get_freqs - get SpeedStep preferred & current freq.
  *
+ * Only available on later SpeedStep-enabled systems, returns false results or
+ * even hangs [cf. bugme.osdl.org # 1422] on earlier systems. Empirical testing
+ * shows that the latter occurs if !(ist_info.event & 0xFFFF).
  */
 static int speedstep_smi_get_freqs (unsigned int *low, unsigned int *high)
 {
@@ -226,17 +229,23 @@
 
 	result = speedstep_smi_ownership();
 
-	if (result)
+	if (result) {
 		dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interface.\n");
+		return -EINVAL;
+	}
 
 	/* detect low and high frequency */
-	result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
+	if (ist_info.event & 0xFFFF) {
+		result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				&speedstep_freqs[SPEEDSTEP_HIGH].frequency);
-	if (result) {
+		if (result) {
+			dprintk(KERN_INFO PFX "could not detect low and high frequencies by SMI call.\n");
+		}
+	}
+	if ((result) || !(ist_info.event & 0xFFFF)) {
 		/* fall back to speedstep_lib.c dection mechanism: try both states out */
 		unsigned int speedstep_processor = speedstep_detect_processor();
 
-		dprintk(KERN_INFO PFX "could not detect low and high frequencies by SMI call.\n");
 		if (!speedstep_processor)
 			return -ENODEV;
 
@@ -248,8 +257,7 @@
 		if (result) {
 			dprintk(KERN_INFO PFX "could not detect two different speeds -- aborting.\n");
 			return result;
-		} else
-			dprintk(KERN_INFO PFX "workaround worked.\n");
+		}
 	}
 
 	/* get current speed setting */
