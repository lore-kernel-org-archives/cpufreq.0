From: Bernard Blackham <b-lkml@blackham.com.au>
Subject: [PATCH]: cpufreq: Fix u32 vs pm_message_t confusion
Date: Wed, 22 Jun 2005 12:25:14 +0800
Message-ID: <20050622042514.GA11081@blackham.com.au>
Mime-Version: 1.0
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, pavel@ucw.cz

Hi Dave,

With the new pm_message_t being introduced into the driver model,
cpufreq needs to be updated. As cpufreq doesn't actually look at the
state passed to the suspend() function, this patch doesn't change
any code, just declarations. It applies against 2.6.12.

Patches that switch the pm_message_t to a struct will soon be
stirring in -mm, so it really just fixes a future compilation bug :)

Thanks,

Bernard.



Fix u32 vs pm_message_t confusion in cpufreq.

Signed-off-by: Bernard Blackham <bernard@blackham.com.au>
Acked-by: Pavel Machek <pavel@ucw.cz>

Index: linux-2.6.12-brb/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.12-brb.orig/drivers/cpufreq/cpufreq.c	2005-06-22 03:06:44.000000000 +0800
+++ linux-2.6.12-brb/drivers/cpufreq/cpufreq.c	2005-06-22 03:07:49.000000000 +0800
@@ -869,7 +869,7 @@
  *	cpufreq_suspend - let the low level driver prepare for suspend
  */
 
-static int cpufreq_suspend(struct sys_device * sysdev, u32 state)
+static int cpufreq_suspend(struct sys_device * sysdev, pm_message_t pmsg)
 {
 	int cpu = sysdev->id;
 	unsigned int ret = 0;
@@ -897,7 +897,7 @@
 	}
 
 	if (cpufreq_driver->suspend) {
-		ret = cpufreq_driver->suspend(cpu_policy, state);
+		ret = cpufreq_driver->suspend(cpu_policy, pmsg);
 		if (ret) {
 			printk(KERN_ERR "cpufreq: suspend failed in ->suspend "
 					"step on CPU %u\n", cpu_policy->cpu);
Index: linux-2.6.12-brb/include/linux/cpufreq.h
===================================================================
--- linux-2.6.12-brb.orig/include/linux/cpufreq.h	2005-06-22 03:06:44.000000000 +0800
+++ linux-2.6.12-brb/include/linux/cpufreq.h	2005-06-22 03:07:49.000000000 +0800
@@ -201,7 +201,7 @@
 
 	/* optional */
 	int	(*exit)		(struct cpufreq_policy *policy);
-	int	(*suspend)	(struct cpufreq_policy *policy, u32 state);
+	int	(*suspend)	(struct cpufreq_policy *policy, pm_message_t pmsg);
 	int	(*resume)	(struct cpufreq_policy *policy);
 	struct freq_attr	**attr;
 };
Index: linux-2.6.12-brb/arch/ppc/platforms/pmac_cpufreq.c
===================================================================
--- linux-2.6.12-brb.orig/arch/ppc/platforms/pmac_cpufreq.c	2005-06-22 03:06:44.000000000 +0800
+++ linux-2.6.12-brb/arch/ppc/platforms/pmac_cpufreq.c	2005-06-22 03:07:49.000000000 +0800
@@ -452,7 +452,7 @@
 	return offset;
 }
 
-static int __pmac pmac_cpufreq_suspend(struct cpufreq_policy *policy, u32 state)
+static int __pmac pmac_cpufreq_suspend(struct cpufreq_policy *policy, pm_message_t pmsg)
 {
 	/* Ok, this could be made a bit smarter, but let's be robust for now. We
 	 * always force a speed change to high speed before sleep, to make sure
