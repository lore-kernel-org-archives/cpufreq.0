From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 2/8]cpufreq:acpi: reorganize code to make MSR support
	addition easier
Date: Tue, 3 Oct 2006 12:29:15 -0700
Message-ID: <20061003122915.B31577@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>


Some clean up and redsign of the driver. Mainly making it easier to add
support for multiple sub-mechanisms of changing frequency. Currently this
driver supports only ACPI SYSTEM_IO address space. With the changes
below it is easier to add support for other address spaces like Intel 
Enhanced Speedstep which uses MSR (ACPI FIXED_FEATURE_HARDWARE) to do the 
transitions.

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>

Index: linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -1,9 +1,10 @@
 /*
- * acpi-cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.3 $)
+ * acpi-cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.4 $)
  *
  *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
  *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
  *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
+ *  Copyright (C) 2006       Denis Sadykov <denis.m.sadykov@intel.com>
  *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
@@ -27,19 +28,22 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/sched.h>
 #include <linux/cpufreq.h>
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
 #include <linux/compiler.h>
 #include <linux/sched.h>	/* current */
 #include <linux/dmi.h>
-#include <asm/io.h>
-#include <asm/delay.h>
-#include <asm/uaccess.h>
 
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 
+#include <asm/io.h>
+#include <asm/processor.h>
+#include <asm/cpufeature.h>
+#include <asm/delay.h>
+#include <asm/uaccess.h>
+
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "acpi-cpufreq", msg)
 
 MODULE_AUTHOR("Paul Diefenbaugh, Dominik Brodowski");
@@ -47,24 +51,35 @@ MODULE_DESCRIPTION("ACPI Processor P-Sta
 MODULE_LICENSE("GPL");
 
 
-struct cpufreq_acpi_io {
+struct acpi_cpufreq_data {
 	struct acpi_processor_performance	*acpi_data;
 	struct cpufreq_frequency_table		*freq_table;
 	unsigned int				resume;
 };
 
-static struct cpufreq_acpi_io	*acpi_io_data[NR_CPUS];
+static struct acpi_cpufreq_data	*drv_data[NR_CPUS];
 static struct acpi_processor_performance	*acpi_perf_data[NR_CPUS];
 
 static struct cpufreq_driver acpi_cpufreq_driver;
 
 static unsigned int acpi_pstate_strict;
 
-static int
-acpi_processor_write_port(
-	u16	port,
-	u8	bit_width,
-	u32	value)
+static unsigned extract_freq(u32 value, struct acpi_cpufreq_data *data)
+{
+	struct acpi_processor_performance       *perf;
+	int                                     i;
+
+	perf = data->acpi_data;
+
+	for (i = 0; i < perf->state_count; i++) {
+		if (value == perf->states[i].status)
+			return data->freq_table[i].frequency;
+	}
+	return 0;
+}
+
+
+static void wrport(u16 port, u8 bit_width, u32 value)
 {
 	if (bit_width <= 8) {
 		outb(value, port);
@@ -72,17 +87,10 @@ acpi_processor_write_port(
 		outw(value, port);
 	} else if (bit_width <= 32) {
 		outl(value, port);
-	} else {
-		return -ENODEV;
 	}
-	return 0;
 }
 
-static int
-acpi_processor_read_port(
-	u16	port,
-	u8	bit_width,
-	u32	*ret)
+static void rdport(u16 port, u8 bit_width, u32 *ret)
 {
 	*ret = 0;
 	if (bit_width <= 8) {
@@ -91,139 +99,141 @@ acpi_processor_read_port(
 		*ret = inw(port);
 	} else if (bit_width <= 32) {
 		*ret = inl(port);
-	} else {
-		return -ENODEV;
 	}
-	return 0;
 }
 
-static int
-acpi_processor_set_performance (
-	struct cpufreq_acpi_io	*data,
-	unsigned int		cpu,
-	int			state)
-{
-	u16			port = 0;
-	u8			bit_width = 0;
-	int			i = 0;
-	int			ret = 0;
-	u32			value = 0;
-	int			retval;
-	struct acpi_processor_performance	*perf;
+struct io_addr {
+	u16 port;
+	u8 bit_width;
+};
 
-	dprintk("acpi_processor_set_performance\n");
+struct drv_cmd {
+	cpumask_t mask;
+	struct io_addr addr;
+	u32 val;
+};
 
-	retval = 0;
-	perf = data->acpi_data;	
-	if (state == perf->state) {
-		if (unlikely(data->resume)) {
-			dprintk("Called after resume, resetting to P%d\n", state);
-			data->resume = 0;
-		} else {
-			dprintk("Already at target state (P%d)\n", state);
-			return (retval);
-		}
-	}
+static void do_drv_read(struct drv_cmd *cmd)
+{
+	rdport(cmd->addr.port, cmd->addr.bit_width, &cmd->val);
+	return;
+}
 
-	dprintk("Transitioning from P%d to P%d\n", perf->state, state);
+static void do_drv_write(struct drv_cmd *cmd)
+{
+	wrport(cmd->addr.port, cmd->addr.bit_width, cmd->val);
+	return;
+}
 
-	/*
-	 * First we write the target state's 'control' value to the
-	 * control_register.
-	 */
+static inline void drv_read(struct drv_cmd *cmd)
+{
+	cpumask_t	saved_mask = current->cpus_allowed;
+	cmd->val = 0;
 
-	port = perf->control_register.address;
-	bit_width = perf->control_register.bit_width;
-	value = (u32) perf->states[state].control;
-
-	dprintk("Writing 0x%08x to port 0x%04x\n", value, port);
-
-	ret = acpi_processor_write_port(port, bit_width, value);
-	if (ret) {
-		dprintk("Invalid port width 0x%04x\n", bit_width);
-		return (ret);
-	}
+	set_cpus_allowed(current, cmd->mask);
+	do_drv_read(cmd);
+	set_cpus_allowed(current, saved_mask);
 
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
+}
+
+static void drv_write(struct drv_cmd *cmd)
+{
+	cpumask_t	saved_mask = current->cpus_allowed;
+	unsigned int	i;
+
+	for_each_cpu_mask(i, cmd->mask) {
+		set_cpus_allowed(current, cpumask_of_cpu(i));
+		do_drv_write(cmd);
 	}
 
-	if (unlikely(value != (u32) perf->states[state].status)) {
-		printk(KERN_WARNING "acpi-cpufreq: Transition failed\n");
-		retval = -ENODEV;
-		return (retval);
+	set_cpus_allowed(current, saved_mask);
+	return;
+}
+
+static u32 get_cur_val(cpumask_t mask)
+{
+	struct acpi_processor_performance	*perf;
+	struct drv_cmd				cmd;
+
+	if (unlikely(cpus_empty(mask)))
+		return 0;
+
+	perf = drv_data[first_cpu(mask)]->acpi_data;
+	cmd.addr.port = perf->control_register.address;
+	cmd.addr.bit_width = perf->control_register.bit_width;
+	cmd.mask = mask;
+
+	drv_read(&cmd);
+
+	dprintk("get_cur_val = %u\n", cmd.val);
+
+	return cmd.val;
+}
+
+static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
+{
+	struct acpi_cpufreq_data		*data = drv_data[cpu];
+	unsigned int				freq;
+
+	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
+
+	if (unlikely(data == NULL ||
+	             data->acpi_data == NULL ||
+	             data->freq_table == NULL)) {
+		return 0;
 	}
 
-	dprintk("Transition successful after %d microseconds\n", i * 10);
+	freq = extract_freq(get_cur_val(cpumask_of_cpu(cpu)), data);
+	dprintk("cur freq = %u\n", freq);
 
-	perf->state = state;
-	return (retval);
+	return freq;
 }
 
+static unsigned int check_freqs(cpumask_t mask, unsigned int freq,
+		struct acpi_cpufreq_data *data)
+{
+	unsigned int	cur_freq;
+	unsigned int	i;
 
-static int
-acpi_cpufreq_target (
-	struct cpufreq_policy   *policy,
-	unsigned int target_freq,
-	unsigned int relation)
-{
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
-	struct cpufreq_acpi_io *cpudata;
-	struct acpi_processor_performance *perf;
-	struct cpufreq_freqs freqs;
-	cpumask_t online_policy_cpus;
-	cpumask_t saved_mask;
-	cpumask_t set_mask;
-	cpumask_t covered_cpus;
-	unsigned int cur_state = 0;
-	unsigned int next_state = 0;
-	unsigned int result = 0;
-	unsigned int j;
-	unsigned int tmp;
+	for (i = 0; i < 100; i++) {
+		cur_freq = extract_freq(get_cur_val(mask), data);
+		if (cur_freq == freq)
+			return 1;
+		udelay(10);
+	}
+	return 0;
+}
 
-	dprintk("acpi_cpufreq_setpolicy\n");
+static int acpi_cpufreq_target(struct cpufreq_policy *policy,
+				unsigned int target_freq,
+				unsigned int relation)
+{
+	struct acpi_cpufreq_data		*data = drv_data[policy->cpu];
+	struct acpi_processor_performance	*perf;
+	struct cpufreq_freqs			freqs;
+	cpumask_t				online_policy_cpus;
+	struct drv_cmd				cmd;
+	unsigned int				next_state = 0;
+	unsigned int				next_perf_state = 0;
+	unsigned int				i;
+	int					result = 0;
+
+	dprintk("acpi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
+
+	if (unlikely(data == NULL ||
+	             data->acpi_data == NULL ||
+	             data->freq_table == NULL)) {
+		return -ENODEV;
+	}
 
+	perf = data->acpi_data;
 	result = cpufreq_frequency_table_target(policy,
-			data->freq_table,
-			target_freq,
-			relation,
-			&next_state);
+	                                        data->freq_table,
+	                                        target_freq,
+	                                        relation,
+	                                        &next_state);
 	if (unlikely(result))
-		return (result);
-
-	perf = data->acpi_data;
-	cur_state = perf->state;
-	freqs.old = data->freq_table[cur_state].frequency;
-	freqs.new = data->freq_table[next_state].frequency;
+		return -ENODEV;
 
 #ifdef CONFIG_HOTPLUG_CPU
 	/* cpufreq holds the hotplug lock, so we are safe from here on */
@@ -232,85 +242,53 @@ acpi_cpufreq_target (
 	online_policy_cpus = policy->cpus;
 #endif
 
-	for_each_cpu_mask(j, online_policy_cpus) {
-		freqs.cpu = j;
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-	}
-
-	/*
-	 * We need to call driver->target() on all or any CPU in
-	 * policy->cpus, depending on policy->shared_type.
-	 */
-	saved_mask = current->cpus_allowed;
-	cpus_clear(covered_cpus);
-	for_each_cpu_mask(j, online_policy_cpus) {
-		/*
-		 * Support for SMP systems.
-		 * Make sure we are running on CPU that wants to change freq
-		 */
-		cpus_clear(set_mask);
-		if (policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
-			cpus_or(set_mask, set_mask, online_policy_cpus);
-		else
-			cpu_set(j, set_mask);
-
-		set_cpus_allowed(current, set_mask);
-		if (unlikely(!cpu_isset(smp_processor_id(), set_mask))) {
-			dprintk("couldn't limit to CPUs in this domain\n");
-			result = -EAGAIN;
-			break;
+	cmd.val = get_cur_val(online_policy_cpus);
+	freqs.old = extract_freq(cmd.val, data);
+	freqs.new = data->freq_table[next_state].frequency;
+	next_perf_state = data->freq_table[next_state].index;
+	if (freqs.new == freqs.old) {
+		if (unlikely(data->resume)) {
+			dprintk("Called after resume, resetting to P%d\n", next_perf_state);
+			data->resume = 0;
+		} else {
+			dprintk("Already at target state (P%d)\n", next_perf_state);
+			return 0;
 		}
+	}
 
-		cpudata = acpi_io_data[j];
-		result = acpi_processor_set_performance(cpudata, j, next_state);
-		if (result) {
-			result = -EAGAIN;
-			break;
-		}
+	cmd.addr.port = perf->control_register.address;
+	cmd.addr.bit_width = perf->control_register.bit_width;
+	cmd.val = (u32) perf->states[next_perf_state].control;
+
+	cpus_clear(cmd.mask);
+
+	if (policy->shared_type != CPUFREQ_SHARED_TYPE_ANY)
+		cmd.mask = online_policy_cpus;
+	else
+		cpu_set(policy->cpu, cmd.mask);
 
-		if (policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
-			break;
- 
-		cpu_set(j, covered_cpus);
+	for_each_cpu_mask(i, cmd.mask) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
 
-	for_each_cpu_mask(j, online_policy_cpus) {
-		freqs.cpu = j;
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	}
+	drv_write(&cmd);
 
-	if (unlikely(result)) {
-		/*
-		 * We have failed halfway through the frequency change.
-		 * We have sent callbacks to online_policy_cpus and
-		 * acpi_processor_set_performance() has been called on 
-		 * coverd_cpus. Best effort undo..
-		 */
-
-		if (!cpus_empty(covered_cpus)) {
-			for_each_cpu_mask(j, covered_cpus) {
-				cpus_clear(set_mask);
-				cpu_set(j, set_mask);
-				set_cpus_allowed(current, set_mask);
-				cpudata = acpi_io_data[j];
-				acpi_processor_set_performance(cpudata,
-						j, 
-						cur_state);
-			}
+	if (acpi_pstate_strict) {
+		if (!check_freqs(cmd.mask, freqs.new, data)) {
+			dprintk("acpi_cpufreq_target failed (%d)\n",
+					policy->cpu);
+			return -EAGAIN;
 		}
+	}
 
-		tmp = freqs.new;
-		freqs.new = freqs.old;
-		freqs.old = tmp;
-		for_each_cpu_mask(j, online_policy_cpus) {
-			freqs.cpu = j;
-			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-		}
+	for_each_cpu_mask(i, cmd.mask) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
+	perf->state = next_perf_state;
 
-	set_cpus_allowed(current, saved_mask);
-	return (result);
+	return result;
 }
 
 
@@ -318,21 +296,17 @@ static int
 acpi_cpufreq_verify (
 	struct cpufreq_policy   *policy)
 {
-	unsigned int result = 0;
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
 	dprintk("acpi_cpufreq_verify\n");
 
-	result = cpufreq_frequency_table_verify(policy, 
-			data->freq_table);
-
-	return (result);
+	return cpufreq_frequency_table_verify(policy, data->freq_table);
 }
 
 
 static unsigned long
 acpi_cpufreq_guess_freq (
-	struct cpufreq_acpi_io	*data,
+	struct acpi_cpufreq_data	*data,
 	unsigned int		cpu)
 {
 	struct acpi_processor_performance	*perf = data->acpi_data;
@@ -369,9 +343,10 @@ acpi_cpufreq_guess_freq (
  * do _PDC and _PSD and find out the processor dependency for the
  * actual init that will happen later...
  */
-static int acpi_cpufreq_early_init_acpi(void)
+static int acpi_cpufreq_early_init(void)
 {
 	struct acpi_processor_performance	*data;
+	cpumask_t				covered;
 	unsigned int				i, j;
 
 	dprintk("acpi_cpufreq_early_init\n");
@@ -380,17 +355,19 @@ static int acpi_cpufreq_early_init_acpi(
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
-	return acpi_processor_preregister_performance(acpi_perf_data);
+	acpi_processor_preregister_performance(acpi_perf_data);
+	return 0;
 }
 
 /*
@@ -424,11 +401,12 @@ static int
 acpi_cpufreq_cpu_init (
 	struct cpufreq_policy   *policy)
 {
-	unsigned int		i;
-	unsigned int		cpu = policy->cpu;
-	struct cpufreq_acpi_io	*data;
-	unsigned int		result = 0;
-	struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
+	unsigned int			i;
+	unsigned int			valid_states = 0;
+	unsigned int			cpu = policy->cpu;
+	struct acpi_cpufreq_data	*data;
+	unsigned int			result = 0;
+	struct cpuinfo_x86 		*c = &cpu_data[policy->cpu];
 	struct acpi_processor_performance	*perf;
 
 	dprintk("acpi_cpufreq_cpu_init\n");
@@ -436,15 +414,18 @@ acpi_cpufreq_cpu_init (
 	if (!acpi_perf_data[cpu])
 		return (-ENODEV);
 
-	data = kzalloc(sizeof(struct cpufreq_acpi_io), GFP_KERNEL);
+	data = kzalloc(sizeof(struct acpi_cpufreq_data), GFP_KERNEL);
 	if (!data)
 		return (-ENOMEM);
 
 	data->acpi_data = acpi_perf_data[cpu];
-	acpi_io_data[cpu] = data;
+	drv_data[cpu] = data;
 
-	result = acpi_processor_register_performance(data->acpi_data, cpu);
+	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
+		acpi_cpufreq_driver.flags |= CPUFREQ_CONST_LOOPS;
+	}
 
+	result = acpi_processor_register_performance(data->acpi_data, cpu);
 	if (result)
 		goto err_free;
 
@@ -467,10 +448,6 @@ acpi_cpufreq_cpu_init (
 	}
 #endif
 
-	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
-		acpi_cpufreq_driver.flags |= CPUFREQ_CONST_LOOPS;
-	}
-
 	/* capability check */
 	if (perf->state_count <= 1) {
 		dprintk("No P-States\n");
@@ -478,16 +455,22 @@ acpi_cpufreq_cpu_init (
 		goto err_unreg;
 	}
 
-	if ((perf->control_register.space_id != ACPI_ADR_SPACE_SYSTEM_IO) ||
-	    (perf->status_register.space_id != ACPI_ADR_SPACE_SYSTEM_IO)) {
-		dprintk("Unsupported address space [%d, %d]\n",
-			(u32) (perf->control_register.space_id),
-			(u32) (perf->status_register.space_id));
+	if (perf->control_register.space_id != perf->status_register.space_id) {
+		result = -ENODEV;
+		goto err_unreg;
+	}
+
+	switch (perf->control_register.space_id) {
+	    case ACPI_ADR_SPACE_SYSTEM_IO:
+		dprintk("SYSTEM IO addr space\n");
+		break;
+	    default:
+		dprintk("Unknown addr space %d\n",
+				(u32) (perf->control_register.space_id));
 		result = -ENODEV;
 		goto err_unreg;
 	}
 
-	/* alloc freq_table */
 	data->freq_table = kmalloc(sizeof(struct cpufreq_frequency_table) * (perf->state_count + 1), GFP_KERNEL);
 	if (!data->freq_table) {
 		result = -ENOMEM;
@@ -506,14 +489,18 @@ acpi_cpufreq_cpu_init (
 	policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
 
 	/* table init */
-	for (i=0; i<=perf->state_count; i++)
+	for (i=0; i<perf->state_count; i++)
 	{
-		data->freq_table[i].index = i;
-		if (i<perf->state_count)
-			data->freq_table[i].frequency = perf->states[i].core_frequency * 1000;
-		else
-			data->freq_table[i].frequency = CPUFREQ_TABLE_END;
+		if ( i > 0 && perf->states[i].core_frequency ==
+				perf->states[i - 1].core_frequency)
+			continue;
+
+		data->freq_table[valid_states].index = i;
+		data->freq_table[valid_states].frequency =
+			perf->states[i].core_frequency * 1000;
+		valid_states++;
 	}
+	data->freq_table[perf->state_count].frequency = CPUFREQ_TABLE_END;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, data->freq_table);
 	if (result) {
@@ -523,8 +510,7 @@ acpi_cpufreq_cpu_init (
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
 
-	printk(KERN_INFO "acpi-cpufreq: CPU%u - ACPI performance management activated.\n",
-	       cpu);
+	dprintk("CPU%u - ACPI performance management activated.\n", cpu);
 	for (i = 0; i < perf->state_count; i++)
 		dprintk("     %cP%d: %d MHz, %d mW, %d uS\n",
 			(i == perf->state?'*':' '), i,
@@ -540,7 +526,7 @@ acpi_cpufreq_cpu_init (
 	 */
 	data->resume = 1;
 	
-	return (result);
+	return result;
 
  err_freqfree:
 	kfree(data->freq_table);
@@ -548,7 +534,7 @@ acpi_cpufreq_cpu_init (
 	acpi_processor_unregister_performance(perf, cpu);
  err_free:
 	kfree(data);
-	acpi_io_data[cpu] = NULL;
+	drv_data[cpu] = NULL;
 
 	return (result);
 }
@@ -558,14 +544,14 @@ static int
 acpi_cpufreq_cpu_exit (
 	struct cpufreq_policy   *policy)
 {
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
 
 	dprintk("acpi_cpufreq_cpu_exit\n");
 
 	if (data) {
 		cpufreq_frequency_table_put_attr(policy->cpu);
-		acpi_io_data[policy->cpu] = NULL;
+		drv_data[policy->cpu] = NULL;
 		acpi_processor_unregister_performance(data->acpi_data, policy->cpu);
 		kfree(data);
 	}
@@ -577,7 +563,7 @@ static int
 acpi_cpufreq_resume (
 	struct cpufreq_policy   *policy)
 {
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
 
 	dprintk("acpi_cpufreq_resume\n");
@@ -596,6 +582,7 @@ static struct freq_attr* acpi_cpufreq_at
 static struct cpufreq_driver acpi_cpufreq_driver = {
 	.verify	= acpi_cpufreq_verify,
 	.target	= acpi_cpufreq_target,
+	.get    = get_cur_freq_on_cpu,
 	.init	= acpi_cpufreq_cpu_init,
 	.exit	= acpi_cpufreq_cpu_exit,
 	.resume	= acpi_cpufreq_resume,
@@ -610,7 +597,7 @@ acpi_cpufreq_init (void)
 {
 	dprintk("acpi_cpufreq_init\n");
 
-	acpi_cpufreq_early_init_acpi();
+	acpi_cpufreq_early_init();
 
 	return cpufreq_register_driver(&acpi_cpufreq_driver);
 }
