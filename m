From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/2] Remove deprecated /proc/acpi/processor/performance
	write support
Date: Thu, 19 Apr 2007 15:49:09 +0200
Message-ID: <1176990549.1231.393.camel@queen.suse.de>
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

I also sent this a while ago and got a ok from Dominik.
Don't know how to provide a link to the archive, the link added at each
mail posted to the cpufreq list at the end:
http://lists.linux.org.uk/mailman/listinfo/cpufreq
seems to be dead.

The message was:
-----------------------------------------------------------
Mon, 2 Oct 2006 20:29
Re: [PATCH] Disallow writing to /proc/acpi/processor/xy/performance

On Thu, Aug 17, 2006 at 05:01:26PM +0200, Thomas Renninger wrote:
> On Thu, 2006-08-17 at 16:51 +0200, Thomas Renninger wrote:
> > Makes the cpufreq stuff at least a bit easier...
> > 
> > Compile tested, patched against 2.6.18-rc2

Somehow I like this patch. What's the status on it?

Thanks,
        Dominik
-----------------------------------------------------------

So here it is again, can it please be added in 2.6.22.

Thanks,

    Thomas

Remove deprecated /proc/acpi/processor/performance write support

Writing to /proc/acpi/processor/xy/performance interferes with sysfs
cpufreq interface. Also removes buggy cpufreq_set_policy exported symbol.

Signed-off-by: Thomas Renninger <trenn@suse.de>

---
 drivers/acpi/processor_perflib.c |   45 ---------------------------------------
 drivers/cpufreq/cpufreq.c        |   37 --------------------------------
 include/linux/cpufreq.h          |    1 
 3 files changed, 1 insertion(+), 82 deletions(-)

Index: linux-2.6.20/drivers/cpufreq/cpufreq.c
===================================================================
--- linux-2.6.20.orig/drivers/cpufreq/cpufreq.c
+++ linux-2.6.20/drivers/cpufreq/cpufreq.c
@@ -1626,43 +1626,6 @@ error_out:
 }
 
 /**
- *	cpufreq_set_policy - set a new CPUFreq policy
- *	@policy: policy to be set.
- *
- *	Sets a new CPU frequency and voltage scaling policy.
- */
-int cpufreq_set_policy(struct cpufreq_policy *policy)
-{
-	int ret = 0;
-	struct cpufreq_policy *data;
-
-	if (!policy)
-		return -EINVAL;
-
-	data = cpufreq_cpu_get(policy->cpu);
-	if (!data)
-		return -EINVAL;
-
-	if (unlikely(lock_policy_rwsem_write(policy->cpu)))
-		return -EINVAL;
-
-
-	ret = __cpufreq_set_policy(data, policy);
-	data->user_policy.min = data->min;
-	data->user_policy.max = data->max;
-	data->user_policy.policy = data->policy;
-	data->user_policy.governor = data->governor;
-
-	unlock_policy_rwsem_write(policy->cpu);
-
-	cpufreq_cpu_put(data);
-
-	return ret;
-}
-EXPORT_SYMBOL(cpufreq_set_policy);
-
-
-/**
  *	cpufreq_update_policy - re-evaluate an existing cpufreq policy
  *	@cpu: CPU which shall be re-evaluated
  *
Index: linux-2.6.20/include/linux/cpufreq.h
===================================================================
--- linux-2.6.20.orig/include/linux/cpufreq.h
+++ linux-2.6.20/include/linux/cpufreq.h
@@ -257,7 +257,6 @@ struct freq_attr {
 /*********************************************************************
  *                        CPUFREQ 2.6. INTERFACE                     *
  *********************************************************************/
-int cpufreq_set_policy(struct cpufreq_policy *policy);
 int cpufreq_get_policy(struct cpufreq_policy *policy, unsigned int cpu);
 int cpufreq_update_policy(unsigned int cpu);
 
Index: linux-2.6.20/drivers/acpi/processor_perflib.c
===================================================================
--- linux-2.6.20.orig/drivers/acpi/processor_perflib.c
+++ linux-2.6.20/drivers/acpi/processor_perflib.c
@@ -433,49 +433,6 @@ static int acpi_processor_perf_open_fs(s
 			   PDE(inode)->data);
 }
 
-static ssize_t
-acpi_processor_write_performance(struct file *file,
-				 const char __user * buffer,
-				 size_t count, loff_t * data)
-{
-	int result = 0;
-	struct seq_file *m = file->private_data;
-	struct acpi_processor *pr = m->private;
-	struct acpi_processor_performance *perf;
-	char state_string[12] = { '\0' };
-	unsigned int new_state = 0;
-	struct cpufreq_policy policy;
-
-
-	if (!pr || (count > sizeof(state_string) - 1))
-		return -EINVAL;
-
-	perf = pr->performance;
-	if (!perf)
-		return -EINVAL;
-
-	if (copy_from_user(state_string, buffer, count))
-		return -EFAULT;
-
-	state_string[count] = '\0';
-	new_state = simple_strtoul(state_string, NULL, 0);
-
-	if (new_state >= perf->state_count)
-		return -EINVAL;
-
-	cpufreq_get_policy(&policy, pr->id);
-
-	policy.cpu = pr->id;
-	policy.min = perf->states[new_state].core_frequency * 1000;
-	policy.max = perf->states[new_state].core_frequency * 1000;
-
-	result = cpufreq_set_policy(&policy);
-	if (result)
-		return result;
-
-	return count;
-}
-
 static void acpi_cpufreq_add_file(struct acpi_processor *pr)
 {
 	struct proc_dir_entry *entry = NULL;
@@ -487,7 +444,7 @@ static void acpi_cpufreq_add_file(struct
 
 	/* add file 'performance' [R/W] */
 	entry = create_proc_entry(ACPI_PROCESSOR_FILE_PERFORMANCE,
-				  S_IFREG | S_IRUGO | S_IWUSR,
+				  S_IFREG | S_IRUGO,
 				  acpi_device_dir(device));
 	if (entry){
 		acpi_processor_perf_fops.write = acpi_processor_write_performance;
