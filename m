From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 2/8] acpi-cpufreq: some clean up and redesign
Date: Mon, 31 Jul 2006 22:41:40 +0400
Message-ID: <44CE4EE4.4070605@linux.intel.com>
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

 acpi-cpufreq.c |  602 ++++++++++++++++++++++++++-------------------------------
 1 file changed, 281 insertions(+), 321 deletions(-)

Some clean up and redesign 

Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-13 17:41:59.000000000 +0000
+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-13 17:52:15.000000000 +0000
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
@@ -21,47 +22,59 @@
  *  with this program; if not, write to the Free Software Foundation, Inc.,
  *  59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
  *
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
  */
 
+#include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/smp.h>
+#include <linux/sched.h>
 #include <linux/cpufreq.h>
-#include <linux/proc_fs.h>
-#include <linux/seq_file.h>
 #include <linux/compiler.h>
-#include <linux/sched.h>	/* current */
-#include <asm/io.h>
-#include <asm/delay.h>
-#include <asm/uaccess.h>
 
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 
+#include <asm/io.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
+#include <asm/cpufeature.h>
+#include <asm/delay.h>
+
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "acpi-cpufreq", msg)
 
 MODULE_AUTHOR("Paul Diefenbaugh, Dominik Brodowski");
 MODULE_DESCRIPTION("ACPI Processor P-States Driver");
 MODULE_LICENSE("GPL");
 
-
-struct cpufreq_acpi_io {
+struct acpi_cpufreq_data {
 	struct acpi_processor_performance	*acpi_data;
 	struct cpufreq_frequency_table		*freq_table;
-	unsigned int				resume;
 };
 
-static struct cpufreq_acpi_io	*acpi_io_data[NR_CPUS];
+static struct acpi_cpufreq_data			*drv_data[NR_CPUS];
 static struct acpi_processor_performance	*acpi_perf_data[NR_CPUS];
 
-static struct cpufreq_driver acpi_cpufreq_driver;
+static struct cpufreq_driver			acpi_cpufreq_driver;
 
-static int
-acpi_processor_write_port(
-	u16	port,
-	u8	bit_width,
-	u32	value)
+static unsigned extract_freq(u32 value, struct acpi_cpufreq_data *data)
+{
+	struct acpi_processor_performance	*perf;
+	int					i;
+
+	perf = data->acpi_data;
+
+	for (i = 0; i < perf->state_count; i++) {
+		if (value == perf->states[i].status) {
+			return data->freq_table[i].frequency;
+		}
+	}
+	return (0);
+}
+
+static void wrport(u16 port, u8 bit_width, u32 value)
 {
 	if (bit_width <= 8) {
 		outb(value, port);
@@ -69,228 +82,198 @@
 		outw(value, port);
 	} else if (bit_width <= 32) {
 		outl(value, port);
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
-	int			ret = 0;
-	u32			value = 0;
-	struct acpi_processor_performance	*perf;
+static u32 rdport(u16 port, u8 bit_width)
+{
+	if (bit_width <= 8) {
+		return inb(port);
+	} else if (bit_width <= 16) {
+		return inw(port);
+	} else if (bit_width <= 32) {
+		return inl(port);
+	}
+	return (0);
+}
 
-	dprintk("acpi_processor_set_performance\n");
+struct io_addr {
+	u16	port;
+	u8	bit_width;
+};
 
-	perf = data->acpi_data;	
+struct drv_cmd {
+	cpumask_t	mask;
+	struct io_addr	addr;
+	u32		val;
+};
 
-	dprintk("Transitioning from P%d to P%d\n", perf->state, state);
+static void do_drv_read(void *cmd_block)
+{
+	struct drv_cmd	*cmd = (struct drv_cmd *)cmd_block;
 
-	/*
-	 * First we write the target state's 'control' value to the
-	 * control_register.
-	 */
+	cmd->val = rdport(cmd->addr.port, cmd->addr.bit_width);
 
-	port = perf->control_register.address;
-	bit_width = perf->control_register.bit_width;
-	value = (u32) perf->states[state].control;
+	return;
+}
 
-	dprintk("Writing 0x%08x to port 0x%04x\n", value, port);
+static void do_drv_write(void *cmd_block)
+{
+	struct drv_cmd	*cmd = (struct drv_cmd *)cmd_block;
 
-	ret = acpi_processor_write_port(port, bit_width, value);
-	if (ret) {
-		dprintk("Invalid port width 0x%04x\n", bit_width);
-		return (ret);
-	}
+	wrport(cmd->addr.port, cmd->addr.bit_width, cmd->val);
 
-	return (0);
+	return;
 }
 
+static inline void drv_read(struct drv_cmd *cmd)
+{
+	cpumask_t	saved_mask = current->cpus_allowed;
 
-static int
-acpi_cpufreq_target (
-	struct cpufreq_policy   *policy,
-	unsigned int target_freq,
-	unsigned int relation)
-{
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
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
-
-	dprintk("acpi_cpufreq_setpolicy\n");
-
-	result = cpufreq_frequency_table_target(policy,
-			data->freq_table,
-			target_freq,
-			relation,
-			&next_state);
-	if (unlikely(result))
-		return (result);
+	cmd->val = 0;
 
-	perf = data->acpi_data;
-	cur_state = perf->state;
-	freqs.old = data->freq_table[cur_state].frequency;
-	freqs.new = data->freq_table[next_state].frequency;
+	set_cpus_allowed(current, cmd->mask);
+	do_drv_read(cmd);
+	set_cpus_allowed(current, saved_mask);
 
-	if (freqs.old == freqs.new) {
-		if (unlikely(data->resume)) {
-			dprintk("Called after resume\n");
-			data->resume = 0;
-		} else {
-			dprintk("Already at target state (P%d)\n", next_state);
-			return (0);
-		}
-	}
+	return;
+}
 
-#ifdef CONFIG_HOTPLUG_CPU
-	/* cpufreq holds the hotplug lock, so we are safe from here on */
-	cpus_and(online_policy_cpus, cpu_online_map, policy->cpus);
-#else
-	online_policy_cpus = policy->cpus;
-#endif
+static void drv_write(struct drv_cmd *cmd)
+{
+	cpumask_t	saved_mask = current->cpus_allowed;
+	unsigned int	i;
 
-	for_each_cpu_mask(j, online_policy_cpus) {
-		freqs.cpu = j;
-		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	for_each_cpu_mask(i, cmd->mask) {
+		set_cpus_allowed(current, cpumask_of_cpu(i));
+		do_drv_write(cmd);
 	}
 
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
-		}
+	set_cpus_allowed(current, saved_mask);
+	return;
+}
 
-		result = acpi_processor_set_performance (data, j, next_state);
-		if (result) {
-			result = -EAGAIN;
-			break;
-		}
+u32 get_cur_val(cpumask_t mask)
+{
+	struct acpi_processor_performance	*perf;
+	struct drv_cmd				cmd;
 
-		if (policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
-			break;
- 
-		cpu_set(j, covered_cpus);
+	if (unlikely(cpus_empty(mask))) {
+		return (0);
 	}
 
-	for_each_cpu_mask(j, online_policy_cpus) {
-		freqs.cpu = j;
-		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	}
+	perf = drv_data[first_cpu(mask)]->acpi_data;
+	cmd.addr.port = perf->control_register.address;
+	cmd.addr.bit_width = perf->control_register.bit_width;
+	cmd.mask = mask;
 
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
-				policy->cpu = j;
-				acpi_processor_set_performance (data, 
-						j, 
-						cur_state);
-			}
-		}
+	drv_read(&cmd);
 
-		tmp = freqs.new;
-		freqs.new = freqs.old;
-		freqs.old = tmp;
-		for_each_cpu_mask(j, online_policy_cpus) {
-			freqs.cpu = j;
-			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-		}
-	} else {
-		perf->state = next_state;
+	dprintk("get_cur_val = %u\n", cmd.val);
+
+	return (cmd.val);
+}
+
+static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
+{
+	struct acpi_cpufreq_data		*data = drv_data[cpu];
+	unsigned int				freq;
+
+	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
+
+	if (unlikely(data == NULL)) {
+		return (0);
+	}
+	if (unlikely(data->acpi_data == NULL ||
+				data->freq_table == NULL)) {
+		return (0);
 	}
 
-	set_cpus_allowed(current, saved_mask);
-	return (result);
+	freq = extract_freq(get_cur_val(cpumask_of_cpu(cpu)), data);
+	dprintk("cur freq = %u\n", freq);
+
+	return (freq);
 }
 
 
-static int
-acpi_cpufreq_verify (
-	struct cpufreq_policy   *policy)
+static int acpi_cpufreq_target(struct cpufreq_policy *policy,
+				unsigned int target_freq,
+				unsigned int relation)
 {
-	unsigned int result = 0;
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct acpi_cpufreq_data		*data = drv_data[policy->cpu];
+	struct acpi_processor_performance	*perf;
+	struct cpufreq_freqs			freqs;
+	cpumask_t				online_policy_cpus;
+	struct drv_cmd				cmd;
+	unsigned int				next_state = 0;
+	unsigned int				i;
+	int					result = 0;
+
+	dprintk("acpi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
 
-	dprintk("acpi_cpufreq_verify\n");
+	if (unlikely(data == NULL)) {
+		return -ENODEV;
+	}
+	if (unlikely((perf = data->acpi_data) == NULL ||
+			data->freq_table == NULL)) {
+		return -ENODEV;
+	}
+	if (unlikely(cpufreq_frequency_table_target(policy,
+						data->freq_table,
+						target_freq,
+						relation,
+						&next_state))) {
+		return -EINVAL;
+	}
 
-	result = cpufreq_frequency_table_verify(policy, 
-			data->freq_table);
+#ifdef CONFIG_SMP
+	cpus_and(online_policy_cpus, cpu_online_map, policy->cpus);
+#else
+	online_policy_cpus = policy->cpus;
+#endif /* CONFIG_SMP */
 
-	return (result);
-}
+	cmd.val = get_cur_val(online_policy_cpus);
+	freqs.old = extract_freq(cmd.val, data);
 
+	cmd.addr.port = perf->control_register.address;
+	cmd.addr.bit_width = perf->control_register.bit_width;
+	cmd.val = (u32) perf->states[next_state].control;
+	freqs.new = data->freq_table[next_state].frequency;
 
-static unsigned long
-acpi_cpufreq_guess_freq (
-	struct cpufreq_acpi_io	*data,
-	unsigned int		cpu)
-{
-	struct acpi_processor_performance	*perf = data->acpi_data;
-
-	if (cpu_khz) {
-		/* search the closest match to cpu_khz */
-		unsigned int i;
-		unsigned long freq;
-		unsigned long freqn = perf->states[0].core_frequency * 1000;
-
-		for (i = 0; i < (perf->state_count - 1); i++) {
-			freq = freqn;
-			freqn = perf->states[i+1].core_frequency * 1000;
-			if ((2 * cpu_khz) > (freqn + freq)) {
-				perf->state = i;
-				return (freq);
-			}
-		}
-		perf->state = perf->state_count - 1;
-		return (freqn);
-	} else {
-		/* assume CPU is at P0... */
-		perf->state = 0;
-		return perf->states[0].core_frequency * 1000;
+	if (freqs.new == freqs.old) {
+		return (0);
 	}
+
+	cpus_clear(cmd.mask);
+
+	if (policy->shared_type != CPUFREQ_SHARED_TYPE_ANY)
+		cmd.mask = online_policy_cpus;
+	else
+		cpu_set(policy->cpu, cmd.mask);
+
+	for_each_cpu_mask(i, cmd.mask) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	}
+
+	drv_write(&cmd);
+
+	for_each_cpu_mask(i, cmd.mask) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+	}
+
+	return (result);
 }
 
+static int acpi_cpufreq_verify(struct cpufreq_policy *policy)
+{
+	struct acpi_cpufreq_data	*data = drv_data[policy->cpu];
+
+	dprintk("acpi_cpufreq_verify (%d)\n", policy->cpu);
+
+	return cpufreq_frequency_table_verify(policy, data->freq_table);
+}
 
 /*
  * acpi_cpufreq_early_init - initialize ACPI P-States library
@@ -327,180 +310,157 @@
 	return 0;
 }
 
-static int
-acpi_cpufreq_cpu_init (
-	struct cpufreq_policy   *policy)
-{
-	unsigned int		i;
-	unsigned int		cpu = policy->cpu;
-	struct cpufreq_acpi_io	*data;
-	unsigned int		result = 0;
-	struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
+static int acpi_cpufreq_cpu_init_acpi(struct cpufreq_policy *policy)
+{
+	unsigned int				i;
+	unsigned int				cpu = policy->cpu;
+	struct acpi_cpufreq_data		*data = drv_data[cpu];
 	struct acpi_processor_performance	*perf;
+	int					result = 0;
 
-	dprintk("acpi_cpufreq_cpu_init\n");
-
-	if (!acpi_perf_data[cpu])
-		return (-ENODEV);
-
-	data = kzalloc(sizeof(struct cpufreq_acpi_io), GFP_KERNEL);
-	if (!data)
-		return (-ENOMEM);
-
-	data->acpi_data = acpi_perf_data[cpu];
-	acpi_io_data[cpu] = data;
-
-	result = acpi_processor_register_performance(data->acpi_data, cpu);
-
-	if (result)
-		goto err_free;
-
-	perf = data->acpi_data;
-	policy->shared_type = perf->shared_type;
-	/*
-	 * Will let policy->cpus know about dependency only when software 
-	 * coordination is required.
-	 */
-	if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
-	    policy->shared_type == CPUFREQ_SHARED_TYPE_ANY)
-		policy->cpus = perf->shared_cpu_map;
-
-	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
-		acpi_cpufreq_driver.flags |= CPUFREQ_CONST_LOOPS;
+	if (acpi_processor_register_performance(data->acpi_data, cpu)) {
+		return -EIO;
 	}
+	perf = data->acpi_data;
 
-	/* capability check */
 	if (perf->state_count <= 1) {
 		dprintk("No P-States\n");
 		result = -ENODEV;
 		goto err_unreg;
 	}
 
-	if ((perf->control_register.space_id != ACPI_ADR_SPACE_SYSTEM_IO) ||
-	    (perf->status_register.space_id != ACPI_ADR_SPACE_SYSTEM_IO)) {
-		dprintk("Unsupported address space [%d, %d]\n",
-			(u32) (perf->control_register.space_id),
-			(u32) (perf->status_register.space_id));
+	if (perf->control_register.space_id != perf->status_register.space_id) {
 		result = -ENODEV;
 		goto err_unreg;
 	}
+	switch (perf->control_register.space_id) {
+		case ACPI_ADR_SPACE_SYSTEM_IO:
+			dprintk("SYSTEM IO addr space\n");
+			break;
+		default:
+			dprintk("unknown addr space\n");
+			result = -ENODEV;
+			goto err_unreg;
+	}
 
-	/* alloc freq_table */
-	data->freq_table = kmalloc(sizeof(struct cpufreq_frequency_table) * (perf->state_count + 1), GFP_KERNEL);
+	data->freq_table = kmalloc(sizeof(struct cpufreq_frequency_table) *
+				(perf->state_count + 1), GFP_KERNEL);
 	if (!data->freq_table) {
 		result = -ENOMEM;
 		goto err_unreg;
 	}
 
-	/* detect transition latency */
-	policy->cpuinfo.transition_latency = 0;
-	for (i=0; i<perf->state_count; i++) {
-		if ((perf->states[i].transition_latency * 1000) > policy->cpuinfo.transition_latency)
-			policy->cpuinfo.transition_latency = perf->states[i].transition_latency * 1000;
+	for (i = 0; i < perf->state_count; i++) {
+		data->freq_table[i].index = i;
+		data->freq_table[i].frequency =
+			perf->states[i].core_frequency * 1000;
 	}
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+	data->freq_table[perf->state_count].frequency = CPUFREQ_TABLE_END;
 
-	/* The current speed is unknown and not detectable by ACPI...  */
-	policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+	return (0);
 
-	/* table init */
-	for (i=0; i<=perf->state_count; i++)
-	{
-		data->freq_table[i].index = i;
-		if (i<perf->state_count)
-			data->freq_table[i].frequency = perf->states[i].core_frequency * 1000;
-		else
-			data->freq_table[i].frequency = CPUFREQ_TABLE_END;
+ err_unreg:
+	acpi_processor_unregister_performance(perf, cpu);
+	return (result);
+}
+
+static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+	unsigned int			cpu = policy->cpu;
+	struct cpuinfo_x86		*c = &cpu_data[policy->cpu];
+	struct acpi_cpufreq_data	*data;
+	unsigned int			result = 0;
+	unsigned int			i;
+
+	dprintk("acpi_cpufreq_cpu_init (%d)\n", cpu);
+
+	data = kzalloc(sizeof(struct acpi_cpufreq_data), GFP_KERNEL);
+	if (!data)
+		return (-ENOMEM);
+
+	data->acpi_data = acpi_perf_data[cpu];
+	drv_data[cpu] = data;
+
+	if (cpu_has(c, X86_FEATURE_CONSTANT_TSC)) {
+		acpi_cpufreq_driver.flags |= CPUFREQ_CONST_LOOPS;
 	}
 
-	result = cpufreq_frequency_table_cpuinfo(policy, data->freq_table);
+	result = acpi_cpufreq_cpu_init_acpi(policy);
 	if (result) {
-		goto err_freqfree;
+		printk("acpi_cpufreq_cpu_init_acpi failed\n");
+		goto err_free;
 	}
 
-	/* notify BIOS that we exist */
-	acpi_processor_notify_smm(THIS_MODULE);
+	policy->cpus = data->acpi_data->shared_cpu_map;
+	for_each_cpu_mask(i, policy->cpus) {
+		drv_data[i] = data;
+	}
+	policy->cur = get_cur_freq_on_cpu(cpu);
+	if (policy->cur == 0) {
+		result = -ENODEV;
+		goto err_free;
+	}
+	/* detect transition latency */
+	policy->cpuinfo.transition_latency = 0;
+	for (i = 0; i < data->acpi_data->state_count; i++) {
+		if ((data->acpi_data->states[i].transition_latency * 1000) >
+					policy->cpuinfo.transition_latency)
+			policy->cpuinfo.transition_latency =
+			  data->acpi_data->states[i].transition_latency * 1000;
+	}
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	dprintk(KERN_INFO "acpi-cpufreq: CPU%u - ACPI performance management activated.\n",
-	       cpu);
-	for (i = 0; i < perf->state_count; i++)
-		dprintk("     %cP%d: %d MHz, %d mW, %d uS\n",
-			(i == perf->state?'*':' '), i,
-			(u32) perf->states[i].core_frequency,
-			(u32) perf->states[i].power,
-			(u32) perf->states[i].transition_latency);
+	result = cpufreq_frequency_table_cpuinfo(policy, data->freq_table);
+	if (result) {
+		goto err_free;
+	}
 
-	cpufreq_frequency_table_get_attr(data->freq_table, policy->cpu);
-	
-	/*
-	 * the first call to ->target() should result in us actually
-	 * writing something to the appropriate registers.
-	 */
-	data->resume = 1;
-	
-	return (result);
+	cpufreq_frequency_table_get_attr(data->freq_table, cpu);
 
- err_freqfree:
-	kfree(data->freq_table);
- err_unreg:
-	acpi_processor_unregister_performance(perf, cpu);
+	return (0);
  err_free:
 	kfree(data);
-	acpi_io_data[cpu] = NULL;
-
+	drv_data[cpu] = NULL;
 	return (result);
 }
 
 
-static int
-acpi_cpufreq_cpu_exit (
-	struct cpufreq_policy   *policy)
+static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
+	struct acpi_cpufreq_data	*data = drv_data[policy->cpu];
+	unsigned int			i;
 
-
-	dprintk("acpi_cpufreq_cpu_exit\n");
+	dprintk("acpi_cpufreq_cpu_exit (%d)\n", policy->cpu);
 
 	if (data) {
 		cpufreq_frequency_table_put_attr(policy->cpu);
-		acpi_io_data[policy->cpu] = NULL;
-		acpi_processor_unregister_performance(data->acpi_data, policy->cpu);
+		for_each_cpu_mask(i, policy->cpus) {
+			drv_data[policy->cpu] = NULL;
+		}
+		acpi_processor_unregister_performance(data->acpi_data,
+							policy->cpu);
 		kfree(data);
 	}
 
 	return (0);
 }
 
-static int
-acpi_cpufreq_resume (
-	struct cpufreq_policy   *policy)
-{
-	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
-
-
-	dprintk("acpi_cpufreq_resume\n");
-
-	data->resume = 1;
-
-	return (0);
-}
-
-
 static struct freq_attr* acpi_cpufreq_attr[] = {
 	&cpufreq_freq_attr_scaling_available_freqs,
 	NULL,
 };
 
 static struct cpufreq_driver acpi_cpufreq_driver = {
-	.verify	= acpi_cpufreq_verify,
-	.target	= acpi_cpufreq_target,
-	.init	= acpi_cpufreq_cpu_init,
-	.exit	= acpi_cpufreq_cpu_exit,
-	.resume	= acpi_cpufreq_resume,
-	.name	= "acpi-cpufreq",
-	.owner	= THIS_MODULE,
-	.attr	= acpi_cpufreq_attr,
-	.flags	= CPUFREQ_STICKY,
+	.verify 	= acpi_cpufreq_verify,
+	.target 	= acpi_cpufreq_target,
+	.get		= get_cur_freq_on_cpu,
+	.init		= acpi_cpufreq_cpu_init,
+	.exit		= acpi_cpufreq_cpu_exit,
+	.name		= "acpi-cpufreq",
+	.owner		= THIS_MODULE,
+	.attr           = acpi_cpufreq_attr,
 };
