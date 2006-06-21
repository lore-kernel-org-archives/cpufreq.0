From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH] redirect speedstep-centrino maintainer mail to cpufreq list
Date: Wed, 21 Jun 2006 13:15:48 -0700
Message-ID: <4499A8F4.6020101@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

I haven't really maintained this driver for a while, and I'm not
keeping up with the latest in Intel power management.  I get a steady
stream of mail which I don't really do anything useful with; the
cpufreq list seems like a better destination, unless someone wants to
get the mail directly.

Also clean up a couple of ancient comments which don't really apply
anymore (as far as I know, nobody has ever damaged a CPU with this
driver).

Signed-off-by: Jeremy Fitzhardinge <jeremy@goop.org>

diff -r 97ce6298318c arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	Wed Jun 21 12:34:16 2006 -0700
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	Wed Jun 21 13:07:45 2006 -0700
@@ -2,19 +2,15 @@
  * cpufreq driver for Enhanced SpeedStep, as found in Intel's Pentium
  * M (part of the Centrino chipset).
  *
+ * Since the original Pentium M, most new Intel CPUs support Enhanced
+ * SpeedStep.
+ *
  * Despite the "SpeedStep" in the name, this is almost entirely unlike
  * traditional SpeedStep.
  *
  * Modelled on speedstep.c
  *
  * Copyright (C) 2003 Jeremy Fitzhardinge <jeremy@goop.org>
- *
- * WARNING WARNING WARNING
- *
- * This driver manipulates the PERF_CTL MSR, which is only somewhat
- * documented.  While it seems to work on my laptop, it has not been
- * tested anywhere else, and it may not work for you, do strange
- * things or simply crash.
  */
 
 #include <linux/kernel.h>
@@ -36,7 +32,7 @@
 #include <asm/cpufeature.h>
 
 #define PFX		"speedstep-centrino: "
-#define MAINTAINER	"Jeremy Fitzhardinge <jeremy@goop.org>"
+#define MAINTAINER	"cpufreq@lists.linux.org.uk"
 
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "speedstep-centrino", msg)
