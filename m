From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 8/8] speedstep-smi: reduce failures
Date: Wed, 19 Nov 2003 19:34:06 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031119183406.GI20576@brodo.de>
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
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

Transitions initiated by speedstep-smi currently fail often if system load 
is high. Bruno Ducrot and I have found out that the failures disappear if 
DMA is disabled. As disabling (U)DMA isn't something nice, here's a 
workaround which (almost) always works: retrying the SMI call up to five 
times, and waiting some time before doing so. Please note that this will 
completely mess up real-time-critical tasks or dynamic scaling. But 
speedstep-smi (1st generation of speedstep) wasn't meant to be used
for that anyway.

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |   32 +++++++++++++++++++--------
 1 files changed, 23 insertions(+), 9 deletions(-)


diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:22:33.657417080 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 19:14:44.153226192 +0100
@@ -19,6 +19,7 @@
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 #include <asm/ist.h>
 
 #include "speedstep-lib.h"
@@ -51,6 +52,10 @@
 #define SET_SPEEDSTEP_STATE 2
 #define GET_SPEEDSTEP_FREQS 4
 
+/* how often shall the SMI call be tried if it failed, e.g. because
+ * of DMA activity going on? */
+#define SMI_TRIES 5
+
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
@@ -140,10 +145,11 @@
  */
 static void speedstep_set_state (unsigned int state, unsigned int notify)
 {
-	unsigned int old_state, result, command, new_state;
+	unsigned int old_state, result = 0, command, new_state;
 	unsigned long flags;
 	struct cpufreq_freqs freqs;
 	unsigned int function=SET_SPEEDSTEP_STATE;
+	unsigned int retry = 0;
 
 	if (state > 0x1)
 		return;
@@ -163,20 +169,28 @@
 	local_irq_save(flags);
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
-	__asm__ __volatile__(
-		"movl $0, %%edi\n"
-		"out %%al, (%%dx)\n"
-		: "=b" (new_state), "=D" (result)
-		: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
-	);
+
+	do {
+		if (retry) {
+			dprintk(KERN_INFO "cpufreq: retry %u, previous result %u\n", retry, result);
+			mdelay(retry * 50);
+		}
+		retry++;
+		__asm__ __volatile__(
+			"movl $0, %%edi\n"
+			"out %%al, (%%dx)\n"
+			: "=b" (new_state), "=D" (result)
+			: "a" (command), "b" (function), "c" (state), "d" (smi_port), "S" (0)
+			);
+	} while ((new_state != state) && (retry <= SMI_TRIES));
 
 	/* enable IRQs */
 	local_irq_restore(flags);
 
 	if (new_state == state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded\n", (freqs.new / 1000));
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded after %u tries with result %u\n", (freqs.new / 1000), retry, result);
 	} else {
-		printk(KERN_ERR "cpufreq: change failed\n");
+		printk(KERN_ERR "cpufreq: change failed with new_state %u and result %u\n", new_state, result);
 	}
 
 	if (notify)
