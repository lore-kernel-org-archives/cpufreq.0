From: David Moore <dcm@acm.org>
Subject: [PATCH] Bugfixes for 2.5.73 cpufreq/acpi.c
Date: 24 Jun 2003 15:11:39 -0700
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <1056492699.3979.32.camel@aldebaran.caltech.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq list <cpufreq@www.linux.org.uk>

Here are a few bug fixes to the ACPI cpufreq driver in 2.5.73.  The
first two hunks, I am fairly confident that the fix is correct.  The
first fixes a NULL dereference occurs when
/proc/acpi/processor/.../performance is written to.  The second fixes a
bug that causes cpufreq to set the wrong frequencies if the platform
limit is non-zero.  The third applies the platform limit to be the
performance limit for ACPI.  This should probably be initialized by a
call to acpi_processor_apply_limit(), but there is no convenient way to
call that from cpufreq/acpi.c.  If someone else has a better fix in
mind, please do that instead.

Regards,

David

--- linux-2.5.73/arch/i386/kernel/cpu/cpufreq/acpi.c.orig	2003-06-23 21:11:19.000000000 -0700
+++ linux-2.5.73/arch/i386/kernel/cpu/cpufreq/acpi.c	2003-06-24 14:29:34.000000000 -0700
@@ -385,7 +385,8 @@
         loff_t			*data)
 {
 	int			result = 0;
-	struct acpi_processor	*pr = (struct acpi_processor *) data;
+	struct seq_file		*m = (struct seq_file *) file->private_data;
+	struct acpi_processor	*pr = (struct acpi_processor *) m->private;
 	char			state_string[12] = {'\0'};
 	unsigned int            new_state = 0;
 	struct cpufreq_policy   policy;
@@ -484,7 +485,8 @@
 	if (result)
 		return_VALUE(result);
 
-	result = acpi_processor_set_performance (perf, next_state);
+	result = acpi_processor_set_performance (perf,
+		next_state + perf->pr->limit.state.px);
 
 	return_VALUE(result);
 }
@@ -680,6 +682,8 @@
 	goto err0;
 
  found_capable_cpu:
+
+	pr->limit.state.px = pr->performance_platform_limit;
 	
  	result = cpufreq_register_driver(&acpi_cpufreq_driver);
 	if (result) 
