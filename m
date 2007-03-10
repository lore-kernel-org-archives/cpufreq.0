From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] fix limited (_PPC) freq machines to get all freqs when
	booted on battery
Date: Sat, 10 Mar 2007 17:20:04 +0100
Message-ID: <1173543604.7690.27.camel@linux-8rt8.site>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-mAcvXy6UPNg18pi4qC6d"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@www.linux.org.uk
Cc: f.alabas@ttnet.net.tr


--=-mAcvXy6UPNg18pi4qC6d
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

on machines that limit frequency on battery you will get stuck to
limited frequency if cpufreq driver is loaded when running on battery
and (real) max frequency will never be reached again, even when AC is
plugged in.

That is because cpufreq_set_policy() calls verify(within_limits) where
policy->max gets limited. Then policy->user_policy.max (the value that
is
used to restore to real max_freq later) gets overridden with the limited
freq value.

This one should fix it. 
I couldn't find where policy->policy gets initialized (a bad name
for grepping in cpufreq dir) therefore I just added:
+       policy->user_policy.policy = policy->policy;
after
__cpufreq_set_policy(policy, &new_policy);

It would be great if someone could verify this working,
as I only had access to such a machine for some time
(all machines that limit freq when running on battery should be
affected)...

What about throwing out cpufreq_set_policy totally?
It will always mess up max freq if called in limited condition and
should
not get exported (but just deleted).
The last func accessing it, is acpi_processor_write_performance() in
drivers/acpi/processor_perflib.c
This interface (/proc/acpi/processor/*/performance) is deprecated
and interferes with rest of cpufreq core...
Any chance this still can get removed for 2.6.21?

Thanks,

    Thomas

Fix limited (_PPC) freq machines to get all freqs when booted on battery

On machines that limit frequency on battery you will get stuck to
limited frequency if cpufreq driver is loaded when running on battery
and (real) max frequency will never be reached again, even when AC is
plugged in.

---
 drivers/cpufreq/cpufreq.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

Index: linux-2.6.21-rc3/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.21-rc3.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.21-rc3/drivers/cpufreq/cpufreq.c
@@ -768,7 +768,10 @@ static int cpufreq_add_dev (struct sys_d
 		unlock_policy_rwsem_write(cpu);
 		goto err_out;
 	}
-
+	policy->user_policy.min = policy->cpuinfo.min_freq;
+	policy->user_policy.max = policy->cpuinfo.max_freq;
+	policy->user_policy.governor = policy->governor;
+	
 #ifdef CONFIG_SMP
 	for_each_cpu_mask(j, policy->cpus) {
 		if (cpu == j)
@@ -858,10 +861,13 @@ static int cpufreq_add_dev (struct sys_d
 
 	policy->governor = NULL; /* to assure that the starting sequence is
 				  * run in cpufreq_set_policy */
-	unlock_policy_rwsem_write(cpu);
 
 	/* set default policy */
-	ret = cpufreq_set_policy(&new_policy);
+	ret = __cpufreq_set_policy(policy, &new_policy);
+	policy->user_policy.policy = policy->policy;
+
+	unlock_policy_rwsem_write(cpu);
+
 	if (ret) {
 		dprintk("setting policy failed\n");
 		goto err_out_unregister;


--=-mAcvXy6UPNg18pi4qC6d
Content-Disposition: attachment; filename=cpufreq_fix_ppc_onbattery_init.patch
Content-Type: text/x-patch; name=cpufreq_fix_ppc_onbattery_init.patch;
	charset=UTF-8
Content-Transfer-Encoding: 7bit

Fix limited (_PPC) freq machines to get all freqs when booted on battery

On machines that limit frequency on battery you will get stuck to
limited frequency if cpufreq driver is loaded when running on battery
and (real) max frequency will never be reached again, even when AC is
plugged in.

---
 drivers/cpufreq/cpufreq.c |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

Index: linux-2.6.21-rc3/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.21-rc3.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.21-rc3/drivers/cpufreq/cpufreq.c
@@ -768,7 +768,10 @@ static int cpufreq_add_dev (struct sys_d
 		unlock_policy_rwsem_write(cpu);
 		goto err_out;
 	}
-
+	policy->user_policy.min = policy->cpuinfo.min_freq;
+	policy->user_policy.max = policy->cpuinfo.max_freq;
+	policy->user_policy.governor = policy->governor;
+	
 #ifdef CONFIG_SMP
 	for_each_cpu_mask(j, policy->cpus) {
 		if (cpu == j)
@@ -858,10 +861,13 @@ static int cpufreq_add_dev (struct sys_d
 
 	policy->governor = NULL; /* to assure that the starting sequence is
 				  * run in cpufreq_set_policy */
-	unlock_policy_rwsem_write(cpu);
 
 	/* set default policy */
-	ret = cpufreq_set_policy(&new_policy);
+	ret = __cpufreq_set_policy(policy, &new_policy);
+	policy->user_policy.policy = policy->policy;
+
+	unlock_policy_rwsem_write(cpu);
+
 	if (ret) {
 		dprintk("setting policy failed\n");
 		goto err_out_unregister;

--=-mAcvXy6UPNg18pi4qC6d
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=-mAcvXy6UPNg18pi4qC6d--


