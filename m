From: Andi Kleen <ak@muc.de>
Subject: [PATCH] Fix cosmetic issue in powernow-k8 error handling
Date: Mon, 09 Aug 2004 20:26:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <m3acx4tbfl.fsf@averell.firstfloor.org>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paul.devriendt@amd.com, cpufreq@www.linux.org.uk


I tried to load the new SMP capable powernow k8 driver on a machine
with an too old BIOS. I got a lot of cryptic "init not cpu 0"
messages until the "MP systems not supported by PSB ..." message.

This patch switches the order of the checks around to print the
other message first. It will be still printed multiple times
because the cpufreq setup will probe all CPUs, but that's probably
ok.

BTW I also looked at converting the code to smp_call_function 
(because Paul complained about the set_cpus_allowed in his OLS
presentation). But the code would have been more complicated with
this change so I left it like it is.

-Andi

diff -u linux-2.6.8rc3-amd64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c-o linux-2.6.8rc3-amd64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
--- linux-2.6.8rc3-amd64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c-o	2004-06-16 12:22:43.000000000 +0200
+++ linux-2.6.8rc3-amd64/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-08-09 19:52:17.000000000 +0200
@@ -948,13 +948,13 @@
 		 * an UP version, and is deprecated by AMD.
 		 */
 
-		if (pol->cpu != 0) {
-			printk(KERN_ERR PFX "init not cpu 0\n");
+		if ((num_online_cpus() != 1) || (num_possible_cpus() != 1)) {
+			printk(KERN_INFO PFX "MP systems not supported by PSB BIOS structure\n");
 			kfree(data);
 			return -ENODEV;
 		}
-		if ((num_online_cpus() != 1) || (num_possible_cpus() != 1)) {
-			printk(KERN_INFO PFX "MP systems not supported by PSB BIOS structure\n");
+		if (pol->cpu != 0) {
+			printk(KERN_ERR PFX "init not cpu 0\n");
 			kfree(data);
 			return -ENODEV;
 		}
