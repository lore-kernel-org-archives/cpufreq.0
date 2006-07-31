From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 1/8] acpi-cpufreq: fix multicore bug
Date: Mon, 31 Jul 2006 22:38:03 +0400
Message-ID: <44CE4E0B.608@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

 acpi-cpufreq.c |   98 +++++++++------------------------------------------------
 1 file changed, 17 insertions(+), 81 deletions(-)

Fix a problem on a multicore processors. 

Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-13 17:38:50.000000000 +0000
+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-13 17:41:59.000000000 +0000
@@ -57,8 +57,6 @@
 
 static struct cpufreq_driver acpi_cpufreq_driver;
 
-static unsigned int acpi_pstate_strict;
-
 static int
 acpi_processor_write_port(
 	u16	port,
@@ -78,25 +76,6 @@
 }
 
 static int
-acpi_processor_read_port(
-	u16	port,
-	u8	bit_width,
-	u32	*ret)
-{
-	*ret = 0;
-	if (bit_width <= 8) {
-		*ret = inb(port);
-	} else if (bit_width <= 16) {
-		*ret = inw(port);
-	} else if (bit_width <= 32) {
-		*ret = inl(port);
-	} else {
-		return -ENODEV;
-	}
-	return 0;
-}
-
-static int
 acpi_processor_set_performance (
 	struct cpufreq_acpi_io	*data,
 	unsigned int		cpu,
@@ -104,25 +83,13 @@
 {
 	u16			port = 0;
 	u8			bit_width = 0;
-	int			i = 0;
 	int			ret = 0;
 	u32			value = 0;
-	int			retval;
 	struct acpi_processor_performance	*perf;
 
 	dprintk("acpi_processor_set_performance\n");
 
-	retval = 0;
 	perf = data->acpi_data;	
-	if (state == perf->state) {
-		if (unlikely(data->resume)) {
-			dprintk("Called after resume, resetting to P%d\n", state);
-			data->resume = 0;
-		} else {
-			dprintk("Already at target state (P%d)\n", state);
-			return (retval);
-		}
-	}
 
 	dprintk("Transitioning from P%d to P%d\n", perf->state, state);
 
@@ -143,49 +110,7 @@
 		return (ret);
 	}
 
-	/*
-	 * Assume the write went through when acpi_pstate_strict is not used.
-	 * As read status_register is an expensive operation and there 
-	 * are no specific error cases where an IO port write will fail.
-	 */
-	if (acpi_pstate_strict) {
-		/* Then we read the 'status_register' and compare the value 
-		 * with the target state's 'status' to make sure the 
-		 * transition was successful.
-		 * Note that we'll poll for up to 1ms (100 cycles of 10us) 
-		 * before giving up.
-		 */
-
-		port = perf->status_register.address;
-		bit_width = perf->status_register.bit_width;
-
-		dprintk("Looking for 0x%08x from port 0x%04x\n",
-			(u32) perf->states[state].status, port);
-
-		for (i = 0; i < 100; i++) {
-			ret = acpi_processor_read_port(port, bit_width, &value);
-			if (ret) {	
-				dprintk("Invalid port width 0x%04x\n", bit_width);
-				return (ret);
-			}
-			if (value == (u32) perf->states[state].status)
-				break;
-			udelay(10);
-		}
-	} else {
-		value = (u32) perf->states[state].status;
-	}
-
-	if (unlikely(value != (u32) perf->states[state].status)) {
-		printk(KERN_WARNING "acpi-cpufreq: Transition failed\n");
-		retval = -ENODEV;
-		return (retval);
-	}
-
-	dprintk("Transition successful after %d microseconds\n", i * 10);
-
-	perf->state = state;
-	return (retval);
+	return (0);
 }
 
 
@@ -223,6 +148,16 @@
 	freqs.old = data->freq_table[cur_state].frequency;
 	freqs.new = data->freq_table[next_state].frequency;
 
+	if (freqs.old == freqs.new) {
+		if (unlikely(data->resume)) {
+			dprintk("Called after resume\n");
+			data->resume = 0;
+		} else {
+			dprintk("Already at target state (P%d)\n", next_state);
+			return (0);
+		}
+	}
+
 #ifdef CONFIG_HOTPLUG_CPU
 	/* cpufreq holds the hotplug lock, so we are safe from here on */
 	cpus_and(online_policy_cpus, cpu_online_map, policy->cpus);
@@ -301,6 +236,8 @@
 			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 		}
+	} else {
+		perf->state = next_state;
 	}
 
 	set_cpus_allowed(current, saved_mask);
@@ -366,6 +303,7 @@
 static int acpi_cpufreq_early_init_acpi(void)
 {
 	struct acpi_processor_performance	*data;
+	cpumask_t				covered;
 	unsigned int				i, j;
 
 	dprintk("acpi_cpufreq_early_init\n");
@@ -374,13 +312,14 @@
 		data = kzalloc(sizeof(struct acpi_processor_performance), 
 			GFP_KERNEL);
 		if (!data) {
-			for_each_possible_cpu(j) {
+			for_each_cpu_mask(j, covered) {
 				kfree(acpi_perf_data[j]);
 				acpi_perf_data[j] = NULL;
 			}
 			return (-ENOMEM);
 		}
 		acpi_perf_data[i] = data;
+		cpu_set(i, covered);
 	}
 
 	/* Do initialization in ACPI core */
@@ -482,7 +421,7 @@
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
 
-	printk(KERN_INFO "acpi-cpufreq: CPU%u - ACPI performance management activated.\n",
+	dprintk(KERN_INFO "acpi-cpufreq: CPU%u - ACPI performance management activated.\n",
 	       cpu);
 	for (i = 0; i < perf->state_count; i++)
 		dprintk("     %cP%d: %d MHz, %d mW, %d uS\n",
@@ -596,9 +535,6 @@
 	return;
 }
 
-module_param(acpi_pstate_strict, uint, 0644);
-MODULE_PARM_DESC(acpi_pstate_strict, "value 0 or non-zero. non-zero -> strict ACPI checks are performed during frequency changes.");
-
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
