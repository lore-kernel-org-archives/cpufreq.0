From: paul.devriendt@amd.com
Subject: powernow-k8 patch - preempt fix by Pavel
Date: Fri, 4 Jun 2004 12:58:11 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1431B9C2@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: davej@redhat.com
Cc: mark.langsdorf@amd.com, Cpufreq@www.linux.org.uk, pavel@ucw.cz

Hi Dave,

Please can you apply Pavel's fix for preempt in the suspend scenario. The 
driver protects itself from multiple entry already, and it does not care if 
there is a long delay in the middle of a multi-step transition, so there 
really is no need for it to disable preempt.

Thanks. Paul.

--- clean/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-05-20 23:08:04.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-06-02 20:40:39.000000000 +0200
@@ -848,12 +882,9 @@
 
 	if (smp_processor_id() != pol->cpu) {
 		printk(KERN_ERR "limiting to cpu %u failed\n", pol->cpu);
-		goto sched_out;
+		goto err_out;
 	}
 
-	/* from this point, do not exit without restoring preempt and cpu */
-	preempt_disable();
-
 	if (pending_bit_stuck()) {
 		printk(KERN_ERR PFX "failing targ, change pending bit set\n");
 		goto err_out;
@@ -891,8 +922,6 @@
 	ret = 0;
 
 err_out:
-	preempt_enable_no_resched();
-sched_out:
 	set_cpus_allowed(current, oldmask);
 	schedule();
 
> 
