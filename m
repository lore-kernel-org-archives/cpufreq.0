From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/drivers/cpufreq cpufreq.c,1.1,1.2
Date: Wed, 03 Sep 2003 10:20:04 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E19uTo4-0005dq-2h@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq
In directory flint:/tmp/cvs-serv21659/linux/drivers/cpufreq

Modified Files:
	cpufreq.c 
Log Message:
* add speedstep-smi driver (Hiroshi Miura)
* clean up speedstep-smi driver (Dominik Brodowski)
        - fixes a couple of warnings
        - to run as a module, we need to export ist_info. Also, only show the
          IST_INFO line in dmesg if speedstep_smi is enabled.
        - Use  a new ->resume callback in the cpufreq core.
        - let's call this driver "speedstep-smi" in cpufreq_driver also
        - if the smi_get_freqs call fails, fall back to the "let's try it out
          and see what frequency we are at" mechanism. Needed on my notebook (at
          least).
* update driver/cpufreq/cpufreq.c


Index: cpufreq.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/drivers/cpufreq/cpufreq.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- cpufreq.c	27 Aug 2003 10:42:19 -0000	1.1
+++ cpufreq.c	3 Sep 2003 09:20:00 -0000	1.2
@@ -467,29 +467,50 @@
 }
 
 /**
- *	cpufreq_restore - restore the CPU clock frequency after resume
+ *	cpufreq_resume - restore the CPU clock frequency after resume
  *
  *	Restore the CPU clock frequency so that our idea of the current
  *	frequency reflects the actual hardware.
  */
-static int cpufreq_restore(struct sys_device * sysdev)
+static int cpufreq_resume(struct sys_device * sysdev)
 {
 	int cpu = sysdev->id;
 	unsigned int ret = 0;
-	struct cpufreq_policy policy;
 	struct cpufreq_policy *cpu_policy;
 
 	if (!cpu_online(cpu))
 		return 0;
 
+	/* we may be lax here as interrupts are off. Nonetheless
+	 * we need to grab the correct cpu policy, as to check
+	 * whether we really run on this CPU.
+	 */
+
 	cpu_policy = cpufreq_cpu_get(cpu);
+	if (!cpu_policy)
+		return -EINVAL;
 
-	down(&cpu_policy->lock);
-	memcpy(&policy, cpu_policy, sizeof(struct cpufreq_policy));
-	up(&cpu_policy->lock);
+	if (cpufreq_driver->resume)
+		ret = cpufreq_driver->resume(cpu_policy);
+	if (ret) {
+		printk(KERN_ERR "cpufreq: resume failed in ->resume step on CPU %u\n", cpu_policy->cpu);
+		goto out;
+	}
 
-	ret = cpufreq_set_policy(&policy);
+	if (cpufreq_driver->setpolicy)
+		ret = cpufreq_driver->setpolicy(cpu_policy);
+	else
+	/* CPUFREQ_RELATION_H or CPUFREQ_RELATION_L have the same effect here, as cpu_policy->cur is known
+	 * to be a valid and exact target frequency
+	 */
+		ret = cpufreq_driver->target(cpu_policy, cpu_policy->cur, CPUFREQ_RELATION_H);
 
+	if (ret) {
+		printk(KERN_ERR "cpufreq: resume failed in ->setpolicy/target step on CPU %u\n", cpu_policy->cpu);
+		goto out;
+	}
+
+ out:
 	cpufreq_cpu_put(cpu_policy);
 
 	return ret;
@@ -498,7 +519,7 @@
 static struct sysdev_driver cpufreq_sysdev_driver = {
 	.add		= cpufreq_add_dev,
 	.remove		= cpufreq_remove_dev,
-	.restore	= cpufreq_restore,
+	.resume		= cpufreq_resume,
 };
 
 
@@ -870,6 +891,10 @@
  */
 void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
 {
+	if (irqs_disabled())
+		return;   /* Only valid if we're in the resume process where
+			   * everyone knows what CPU frequency we are at */
+
 	down_read(&cpufreq_notifier_rwsem);
 	switch (state) {
 	case CPUFREQ_PRECHANGE:
