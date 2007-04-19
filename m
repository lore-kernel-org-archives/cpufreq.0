From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/2] Fix limited cpufreq when booted on battery
Date: Thu, 19 Apr 2007 15:48:34 +0200
Message-ID: <1176990514.1231.392.camel@queen.suse.de>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq <cpufreq@lists.linux.org.uk>
Cc: Dave Jones <davej@redhat.com>

Hi,

References:
https://bugzilla.novell.com/show_bug.cgi?id=231107
https://bugzilla.novell.com/show_bug.cgi?id=264077

I already posted this a while ago..., hopefully it's picked up for
2.6.22 now.

Thanks,

   Thomas

Fix limited cpufreq when booted on battery

If booted on battery:
cpufreq_set_policy (evil) is invoked which calls verify_within_limits.
max_freq gets lowered and therefore users_policy.max, which
is used to restore higher freqs via update_policy later is set to the
already limited frequency -> you can never go up again, even BIOS
allows higher freqs later.

Signed-off-by: Thomas Renninger <trenn@suse.de>

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
