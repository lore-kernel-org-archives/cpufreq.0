From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 3/8] speedstep-smi: spelling fix
Date: Wed, 19 Nov 2003 19:31:20 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031119183120.GD20576@brodo.de>
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

The reporter of bug 1422 noted this spelling fix -- thanks!

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:19:57.384174224 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-19 17:20:34.328557824 +0100
@@ -174,7 +174,7 @@
 	local_irq_restore(flags);
 
 	if (new_state == state) {
-		dprintk(KERN_INFO "cpufreq: change to %u MHz succeded\n", (freqs.new / 1000));
+		dprintk(KERN_INFO "cpufreq: change to %u MHz succeeded\n", (freqs.new / 1000));
 	} else {
 		printk(KERN_ERR "cpufreq: change failed\n");
 	}
