From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] nforce2: use unified cpufreq debug infrastructure
Date: Tue, 16 Nov 2004 23:04:55 +0100
Message-ID: <20041116220455.GA7721@dominikbrodowski.de>
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
To: se.witt@gmx.net
Cc: cpufreq@www.linux.org.uk

Use the unified cpufreq debug infrastructure in the cpufreq-nforce2 driver.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c linux/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c	2004-11-16 22:36:44.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c	2004-11-16 22:48:46.973931024 +0100
@@ -55,16 +55,7 @@
 MODULE_PARM_DESC(min_fsb,
                  "Minimum FSB to use, if not defined: current FSB - 50");
 
-/* DEBUG
- *   Define it if you want verbose debug output, e.g. for bug reporting
- */
-//#define NFORCE2_DEBUG
-
-#ifdef NFORCE2_DEBUG
-#define dprintk(msg...) printk(msg)
-#else
-#define dprintk(msg...) do { } while(0)
-#endif
+#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "cpufreq-nforce2", msg)
 
 /*
  * nforce2_calc_fsb - calculate FSB
