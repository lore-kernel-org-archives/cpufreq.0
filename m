From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq cpufreq.c,1.4,1.5
Date: Tue, 31 Aug 2004 09:29:20 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C2412-0001Nl-7q@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv5291/linux/drivers/cpufreq

Modified Files:
	cpufreq.c 
Log Message:
The SA1100 and SA1110 platforms can handle situations well where the
CPU frequency is different to the value the cpufreq (and timing) code
thinks it is, e.g. when resuming from sleep. So, remove the flags
noting the opposite.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.de>


Index: cpufreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/cpufreq.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- cpufreq.c	26 Aug 2004 13:25:20 -0000	1.4
+++ cpufreq.c	31 Aug 2004 08:29:17 -0000	1.5
@@ -157,9 +157,6 @@
 			    (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
 			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
 			{
-				if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
-					panic("CPU Frequency is out of sync.");
-
 				printk(KERN_WARNING "Warning: CPU frequency is %u, "
 				       "cpufreq assumed %u kHz.\n", freqs->old, cpufreq_cpu_data[freqs->cpu]->cur);
 				freqs->old = cpufreq_cpu_data[freqs->cpu]->cur;
@@ -603,9 +600,6 @@
 {
 	struct cpufreq_freqs freqs;
 
-	if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
-		panic("CPU Frequency is out of sync.");
-
 	printk(KERN_WARNING "Warning: CPU frequency out of sync: cpufreq and timing "
 	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
 
@@ -695,9 +689,6 @@
 
 		if (unlikely(cur_freq != cpu_policy->cur)) {
 			struct cpufreq_freqs freqs;
-
-			if (cpufreq_driver->flags & CPUFREQ_PANIC_RESUME_OUTOFSYNC)
-				panic("CPU Frequency is out of sync.");
 
 			printk(KERN_WARNING "Warning: CPU frequency is %u, "
 			       "cpufreq assumed %u kHz.\n", cur_freq, cpu_policy->cur);
