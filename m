From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 2.6.4] fix off-by-10 error in pentiumM_detect_frequency() in
	speedstep-lib
Date: Mon, 15 Mar 2004 15:15:21 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315141521.GH8636@dominikbrodowski.de>
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

Fix an off-by-10 error in the detection of the Pentium M processor frequency.

 arch/i386/kernel/cpu/cpufreq/speedstep-lib.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-15 14:36:10.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-15 15:05:41.530909272 +0100
@@ -127,7 +127,7 @@
 	msr_tmp = (msr_lo >> 22) & 0x1f;
 	dprintk(KERN_DEBUG "speedstep-lib: bits 22-26 are 0x%x\n", msr_tmp);
 
-	return (msr_tmp * 100 * 10000);
+	return (msr_tmp * 100 * 1000);
 }
