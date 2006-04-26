From: "Jan Beulich" <jbeulich@novell.com>
Subject: [PATCH] dprintk adjustments to cpufreq-nforce2
Date: Wed, 26 Apr 2006 15:40:02 +0200
Message-ID: <444F9452.76E4.0078.0@novell.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: linux-kernel@vger.kernel.org

Remove KERN_* suffixes from some NForce2 cpufreq driver's dprintk-s.

Signed-off-by: Jan Beulich <jbeulich@novell.com>

diff -Npru /home/jbeulich/tmp/linux-2.6.17-rc2/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
2.6.17-rc2-i386-cpufreq-nforce2-dprintk/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c
--- /home/jbeulich/tmp/linux-2.6.17-rc2/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c	2006-04-26 10:55:10.000000000
+0200
+++ 2.6.17-rc2-i386-cpufreq-nforce2-dprintk/arch/i386/kernel/cpu/cpufreq/cpufreq-nforce2.c	2006-04-24
12:28:36.000000000 +0200
@@ -266,7 +266,7 @@ static int nforce2_target(struct cpufreq
 	if (freqs.old == freqs.new)
 		return 0;
 
-	dprintk(KERN_INFO "cpufreq: Old CPU frequency %d kHz, new %d kHz\n",
+	dprintk("Old CPU frequency %d kHz, new %d kHz\n",
 	       freqs.old, freqs.new);
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -278,7 +278,7 @@ static int nforce2_target(struct cpufreq
 		printk(KERN_ERR "cpufreq: Changing FSB to %d failed\n",
                        target_fsb);
 	else
-		dprintk(KERN_INFO "cpufreq: Changed FSB successfully to %d\n",
+		dprintk("Changed FSB successfully to %d\n",
                        target_fsb);
 
 	/* Enable IRQs */
