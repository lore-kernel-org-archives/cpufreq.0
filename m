From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 2/8] speedstep-smi: disable debug output
Date: Wed, 19 Nov 2003 19:30:58 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119183058.GC20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

speedstep-smi is getting more and more stable, so disable verbose debug 
output.

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:15:21.458121360 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:17:22.171770096 +0100
@@ -54,7 +54,7 @@
 /* DEBUG
  *   Define it if you want verbose debug output, e.g. for bug reporting
  */
-#define SPEEDSTEP_DEBUG
+//#define SPEEDSTEP_DEBUG
 
 #ifdef SPEEDSTEP_DEBUG
 #define dprintk(msg...) printk(msg)
