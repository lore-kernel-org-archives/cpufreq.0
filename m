From: Venki Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] Eliminate cpufreq_userspace scaling_setspeed deadlock
Date: Fri, 26 Oct 2007 10:18:21 -0700
Message-ID: <20071026171821.GA20924@linux-os.sc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: Dave Jones <davej@redhat.com>
Cc: fenghua.yu@intel.com, luming.yu@intel.com, cpufreq <cpufreq@www.linux.org.uk>



Eliminate cpufreq_userspace scaling_setspeed deadlock.

Luming Yu recently uncovered yet another cpufreq related deadlock.
One thread that continuously switches the governors and the other thread that
repeatedly cats the contents of cpufreq directory causes both these threads to
go into a deadlock.

Detailed examination of the deadlock showed the exact flow before the deadlock
as:

Thread 1			Thread 2
________			________
				cats files under /sys/devices/.../cpufreq/
Set governor to userspace
  Adds a new sysfs entry for
  scaling_setspeed
				cats files under /sys/devices/.../cpufreq/

Set governor to performance
  Holds cpufreq_rw_sem in write
  mode
  Sends a STOP notify to
  userspace governor
				cat /sys/devices/.../cpufreq/scaling_setspeed
				  Gets a handle on the above sysfs entry with
				  sysfs_get_active
				  Blocks while trying to get cpufreq_rw_sem
				  in read mode
  Remove a sysfs entry for
  scaling_setspeed
    Blocks on sysfs_deactivate
    while waiting for earlier
    get_active (on other thread)
    to drain

At this point both threads go into deadlock and any other thread that tries to
do anything with sysfs cpufreq will also block.


There seems to be no easy way to avoid this deadlock as long as
cpufreq_userspace adds/removes the sysfs entry under same kobject as cpufreq.
Below patch moves scaling_setspeed to cpufreq.c, keeping it always and calling
back the governor on read/write. This is the cleanest fix I could think of,
even though adding two callbacks in governor structure just for this seems
unnecessary.

Note that the change makes scaling_setspeed under /sys/.../cpufreq permanent
and returns <unsupported> when governor is not userspace.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.24-rc-mm/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.24-rc-mm.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.24-rc-mm/drivers/cpufreq/cpufreq.c
@@ -601,6 +601,31 @@ static ssize_t show_affected_cpus (struc
 	return i;
 }
 
+static ssize_t store_scaling_setspeed(struct cpufreq_policy * policy,
+		const char *buf, size_t count)
+{
+	unsigned int freq = 0;
+	unsigned int ret;
+
+	if (!policy->governor->store_setspeed)
+		return -EINVAL;
+
+	ret = sscanf(buf, "%u", &freq);
+	if (ret != 1)
+		return -EINVAL;
+
+	policy->governor->store_setspeed(policy, freq);
+
+	return count;
+}
+
+static ssize_t show_scaling_setspeed(struct cpufreq_policy * policy, char *buf)
+{
+	if (!policy->governor->show_setspeed)
+		return sprintf (buf, "<unsupported>\n");
+
+	return policy->governor->show_setspeed(policy, buf);
+}
 
 #define define_one_ro(_name) \
 static struct freq_attr _name = \
@@ -624,6 +649,7 @@ define_one_ro(affected_cpus);
 define_one_rw(scaling_min_freq);
 define_one_rw(scaling_max_freq);
 define_one_rw(scaling_governor);
+define_one_rw(scaling_setspeed);
 
 static struct attribute * default_attrs[] = {
 	&cpuinfo_min_freq.attr,
@@ -634,6 +660,7 @@ static struct attribute * default_attrs[
 	&scaling_governor.attr,
 	&scaling_driver.attr,
 	&scaling_available_governors.attr,
+	&scaling_setspeed.attr,
 	NULL
 };
 
Index: linux-2.6.24-rc-mm/drivers/cpufreq/cpufreq_userspace.c
===================================================================
--- linux-2.6.24-rc-mm.orig/drivers/cpufreq/cpufreq_userspace.c
+++ linux-2.6.24-rc-mm/drivers/cpufreq/cpufreq_userspace.c
@@ -65,12 +65,12 @@ static struct notifier_block userspace_c
 
 /**
  * cpufreq_set - set the CPU frequency
+ * @policy: pointer to policy struct where freq is being set
  * @freq: target frequency in kHz
- * @cpu: CPU for which the frequency is to be set
  *
  * Sets the CPU frequency to freq.
  */
-static int cpufreq_set(unsigned int freq, struct cpufreq_policy *policy)
+static int cpufreq_set(struct cpufreq_policy *policy, unsigned int freq)
 {
 	int ret = -EINVAL;
 
@@ -102,34 +102,11 @@ static int cpufreq_set(unsigned int freq
 }
 
 
-/************************** sysfs interface ************************/
-static ssize_t show_speed (struct cpufreq_policy *policy, char *buf)
+static ssize_t show_speed(struct cpufreq_policy *policy, char *buf)
 {
-	return sprintf (buf, "%u\n", cpu_cur_freq[policy->cpu]);
+	return sprintf(buf, "%u\n", cpu_cur_freq[policy->cpu]);
 }
 
-static ssize_t
-store_speed (struct cpufreq_policy *policy, const char *buf, size_t count)
-{
-	unsigned int freq = 0;
-	unsigned int ret;
-
-	ret = sscanf (buf, "%u", &freq);
-	if (ret != 1)
-		return -EINVAL;
-
-	cpufreq_set(freq, policy);
-
-	return count;
-}
-
-static struct freq_attr freq_attr_scaling_setspeed =
-{
-	.attr = { .name = "scaling_setspeed", .mode = 0644 },
-	.show = show_speed,
-	.store = store_speed,
-};
-
 static int cpufreq_governor_userspace(struct cpufreq_policy *policy,
 				   unsigned int event)
 {
@@ -142,10 +119,6 @@ static int cpufreq_governor_userspace(st
 			return -EINVAL;
 		BUG_ON(!policy->cur);
 		mutex_lock(&userspace_mutex);
-		rc = sysfs_create_file (&policy->kobj,
-					&freq_attr_scaling_setspeed.attr);
-		if (rc)
-			goto start_out;
 
 		if (cpus_using_userspace_governor == 0) {
 			cpufreq_register_notifier(
@@ -160,7 +133,7 @@ static int cpufreq_governor_userspace(st
 		cpu_cur_freq[cpu] = policy->cur;
 		cpu_set_freq[cpu] = policy->cur;
 		dprintk("managing cpu %u started (%u - %u kHz, currently %u kHz)\n", cpu, cpu_min_freq[cpu], cpu_max_freq[cpu], cpu_cur_freq[cpu]);
-start_out:
+
 		mutex_unlock(&userspace_mutex);
 		break;
 	case CPUFREQ_GOV_STOP:
@@ -176,7 +149,6 @@ start_out:
 		cpu_min_freq[cpu] = 0;
 		cpu_max_freq[cpu] = 0;
 		cpu_set_freq[cpu] = 0;
-		sysfs_remove_file (&policy->kobj, &freq_attr_scaling_setspeed.attr);
 		dprintk("managing cpu %u stopped\n", cpu);
 		mutex_unlock(&userspace_mutex);
 		break;
@@ -211,6 +183,8 @@ start_out:
 struct cpufreq_governor cpufreq_gov_userspace = {
 	.name		= "userspace",
 	.governor	= cpufreq_governor_userspace,
+	.store_setspeed	= cpufreq_set,
+	.show_setspeed	= show_speed,
 	.owner		= THIS_MODULE,
 };
 EXPORT_SYMBOL(cpufreq_gov_userspace);
Index: linux-2.6.24-rc-mm/include/linux/cpufreq.h
===================================================================
--- linux-2.6.24-rc-mm.orig/include/linux/cpufreq.h
+++ linux-2.6.24-rc-mm/include/linux/cpufreq.h
@@ -167,6 +167,10 @@ struct cpufreq_governor {
 	char	name[CPUFREQ_NAME_LEN];
 	int 	(*governor)	(struct cpufreq_policy *policy,
 				 unsigned int event);
+	ssize_t	(*show_setspeed)	(struct cpufreq_policy *policy,
+					 char *buf);
+	int 	(*store_setspeed)	(struct cpufreq_policy *policy,
+					 unsigned int freq);
 	unsigned int max_transition_latency; /* HW must be able to switch to
 			next freq faster than this value in nano secs or we
 			will fallback to performance governor */
