From: Matt Domsch <Matt_Domsch@dell.com>
Subject: [PATCH 2.6.11-rc3] cpufreq-core: reduce warning messages
Date: Thu, 3 Feb 2005 11:53:52 -0600
Message-ID: <20050203175352.GA27123@lists.us.dell.com>
Mime-Version: 1.0
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@brodo.de>
Cc: akpm@osdl.org, linux-kernel@vger.kernel.org

cpufreq core is printing out messages at KERN_WARNING level that the
core recovers from without intervention, and that the system
administrator can do nothing about.  Patch below reduces the severity
of these messages to debug.

Signed-off-by: Matt Domsch <Matt_Domsch@dell.com>

-- 
Matt Domsch
Software Architect
Dell Linux Solutions linux.dell.com & www.dell.com/linux
Linux on Dell mailing lists @ http://lists.us.dell.com

===== cpufreq.c 1.94 vs edited =====
--- 1.94/drivers/cpufreq/cpufreq.c	2005-01-20 23:02:15 -06:00
+++ edited/cpufreq.c	2005-02-03 11:16:16 -06:00
@@ -258,7 +258,7 @@ void cpufreq_notify_transition(struct cp
 			    (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
 			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
 			{
-				printk(KERN_WARNING "Warning: CPU frequency is %u, "
+				dprintk("CPU frequency is %u, "
 				       "cpufreq assumed %u kHz.\n", freqs->old, cpufreq_cpu_data[freqs->cpu]->cur);
 				freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
 			}
@@ -814,7 +814,7 @@ static void cpufreq_out_of_sync(unsigned
 {
 	struct cpufreq_freqs freqs;
 
-	printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
+	dprintk("CPU frequency out of sync: cpufreq and timing "
 	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
 
 	freqs.cpu = cpu;
@@ -919,7 +919,7 @@ static int cpufreq_resume(struct sys_dev
 		if (unlikely(cur_freq != cpu_policy->cur)) {
 			struct cpufreq_freqs freqs;
 
-			printk(KERN_WARNING "Warning: CPU frequency is %u, "
+			dprintk("CPU frequency is %u, "
 			       "cpufreq assumed %u kHz.\n", cur_freq, cpu_policy->cur);
 
 			freqs.cpu = cpu;
