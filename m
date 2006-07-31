From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 7/8] acpi-cpufreq: lindent acpi-cpufreq
Date: Mon, 31 Jul 2006 22:55:56 +0400
Message-ID: <44CE523C.7030008@linux.intel.com>
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

 acpi-cpufreq.c |  230 +++++++++++++++++++++++++++------------------------------
 1 file changed, 111 insertions(+), 119 deletions(-)

Lindent the acpi-cpufreq.c driver

Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.15.1.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-31 21:22:32.000000000 +0400
+++ linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-31 21:23:47.000000000 +0400
@@ -56,25 +56,25 @@
 };
 
 struct acpi_cpufreq_data {
-	struct acpi_processor_performance	*acpi_data;
-	struct cpufreq_frequency_table		*freq_table;
-	unsigned int				cpu_fet;
+	struct acpi_processor_performance *acpi_data;
+	struct cpufreq_frequency_table *freq_table;
+	unsigned int cpu_fet;
 };
 
-static struct acpi_cpufreq_data			*drv_data[NR_CPUS];
-static struct acpi_processor_performance	*acpi_perf_data[NR_CPUS];
+static struct acpi_cpufreq_data *drv_data[NR_CPUS];
+static struct acpi_processor_performance *acpi_perf_data[NR_CPUS];
 
-static struct cpufreq_driver			acpi_cpufreq_driver;
+static struct cpufreq_driver acpi_cpufreq_driver;
 
 /* module params */
-static unsigned int	use_acpi_strict;
+static unsigned int use_acpi_strict;
 
 static int check_speedstep_cpu(unsigned int cpuid)
 {
 	struct cpuinfo_x86 *cpu = &cpu_data[cpuid];
 
 	if (cpu->x86_vendor != X86_VENDOR_INTEL ||
-				!cpu_has(cpu, X86_FEATURE_EST))
+	    !cpu_has(cpu, X86_FEATURE_EST))
 		return (0);
 	return (1);
 }
@@ -93,8 +93,8 @@
 
 static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
 {
-	struct acpi_processor_performance	*perf;
-	int					i;
+	struct acpi_processor_performance *perf;
+	int i;
 
 	perf = data->acpi_data;
 
@@ -142,30 +142,30 @@
 }
 
 struct msr_addr {
-	u32	reg;
+	u32 reg;
 };
 
 struct io_addr {
-	u16	port;
-	u8	bit_width;
+	u16 port;
+	u8 bit_width;
 };
 
 typedef union {
-	struct msr_addr		msr;
-	struct io_addr		io;
+	struct msr_addr msr;
+	struct io_addr io;
 } drv_addr_union;
 
 struct drv_cmd {
-	unsigned int	type;
-	cpumask_t	mask;
-	drv_addr_union	addr;
-	u32		val;
+	unsigned int type;
+	cpumask_t mask;
+	drv_addr_union addr;
+	u32 val;
 };
 
 static void do_drv_read(void *cmd_block)
 {
-	struct drv_cmd	*cmd = (struct drv_cmd *)cmd_block;
-	u32		h;
+	struct drv_cmd *cmd = (struct drv_cmd *)cmd_block;
+	u32 h;
 
 	switch (cmd->type) {
 	case SYSTEM_MSR_CAPABLE:
@@ -181,8 +181,8 @@
 
 static void do_drv_write(void *cmd_block)
 {
-	struct drv_cmd	*cmd = (struct drv_cmd *)cmd_block;
-	u32		h = 0;
+	struct drv_cmd *cmd = (struct drv_cmd *)cmd_block;
+	u32 h = 0;
 
 	switch (cmd->type) {
 	case SYSTEM_MSR_CAPABLE:
@@ -198,7 +198,7 @@
 
 static inline void drv_read(struct drv_cmd *cmd)
 {
-	cpumask_t	saved_mask = current->cpus_allowed;
+	cpumask_t saved_mask = current->cpus_allowed;
 
 	cmd->val = 0;
 
@@ -211,8 +211,8 @@
 
 static void drv_write(struct drv_cmd *cmd)
 {
-	cpumask_t	saved_mask = current->cpus_allowed;
-	unsigned int	i;
+	cpumask_t saved_mask = current->cpus_allowed;
+	unsigned int i;
 
 	for_each_cpu_mask(i, cmd->mask) {
 		set_cpus_allowed(current, cpumask_of_cpu(i));
@@ -225,8 +225,8 @@
 
 u32 get_cur_val(cpumask_t mask)
 {
-	struct acpi_processor_performance	*perf;
-	struct drv_cmd				cmd;
+	struct acpi_processor_performance *perf;
+	struct drv_cmd cmd;
 
 	if (unlikely(cpus_empty(mask))) {
 		return (0);
@@ -257,16 +257,15 @@
 
 static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
 {
-	struct acpi_cpufreq_data		*data = drv_data[cpu];
-	unsigned int				freq;
+	struct acpi_cpufreq_data *data = drv_data[cpu];
+	unsigned int freq;
 
 	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
 
 	if (unlikely(data == NULL)) {
 		return (0);
 	}
-	if (unlikely(data->acpi_data == NULL ||
-				data->freq_table == NULL)) {
+	if (unlikely(data->acpi_data == NULL || data->freq_table == NULL)) {
 		return (0);
 	}
 
@@ -279,8 +278,8 @@
 static unsigned int check_freqs(cpumask_t mask, unsigned int freq,
 				struct acpi_cpufreq_data *data)
 {
-	unsigned int		cur_freq;
-	unsigned int		i;
+	unsigned int cur_freq;
+	unsigned int i;
 
 	for (i = 0; i < 100; i++) {
 		cur_freq = extract_freq(get_cur_val(mask), data);
@@ -292,18 +291,17 @@
 }
 
 static int acpi_cpufreq_target(struct cpufreq_policy *policy,
-				unsigned int target_freq,
-				unsigned int relation)
+			       unsigned int target_freq, unsigned int relation)
 {
-	struct acpi_cpufreq_data		*data = drv_data[policy->cpu];
-	struct acpi_processor_performance	*perf;
-	struct cpufreq_freqs			freqs;
-	cpumask_t				online_policy_cpus;
-	struct drv_cmd				cmd;
-	u32					msr;
-	unsigned int				next_state = 0;
-	unsigned int				i;
-	int					result = 0;
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
+	struct acpi_processor_performance *perf;
+	struct cpufreq_freqs freqs;
+	cpumask_t online_policy_cpus;
+	struct drv_cmd cmd;
+	u32 msr;
+	unsigned int next_state = 0;
+	unsigned int i;
+	int result = 0;
 
 	dprintk("acpi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
 
@@ -311,22 +309,20 @@
 		return -ENODEV;
 	}
 	if (unlikely((perf = data->acpi_data) == NULL ||
-			data->freq_table == NULL)) {
+		     data->freq_table == NULL)) {
 		return -ENODEV;
 	}
 	if (unlikely(cpufreq_frequency_table_target(policy,
-						data->freq_table,
-						target_freq,
-						relation,
-						&next_state))) {
+						    data->freq_table,
+						    target_freq,
+						    relation, &next_state))) {
 		return -EINVAL;
 	}
-
 #ifdef CONFIG_SMP
 	cpus_and(online_policy_cpus, cpu_online_map, policy->cpus);
 #else
 	online_policy_cpus = policy->cpus;
-#endif /* CONFIG_SMP */
+#endif				/* CONFIG_SMP */
 
 	cmd.val = get_cur_val(online_policy_cpus);
 	freqs.old = extract_freq(cmd.val, data);
@@ -347,7 +343,6 @@
 		return -ENODEV;
 	}
 
-
 	if (freqs.new == freqs.old) {
 		return (0);
 	}
@@ -366,9 +361,10 @@
 
 	drv_write(&cmd);
 
-	if (use_acpi_strict) {	
+	if (use_acpi_strict) {
 		if (!check_freqs(cmd.mask, freqs.new, data)) {
-			dprintk("acpi_cpufreq_target failed (%d)\n", policy->cpu);
+			dprintk("acpi_cpufreq_target failed (%d)\n",
+				policy->cpu);
 			return -EAGAIN;
 		}
 	}
@@ -383,7 +379,7 @@
 
 static int acpi_cpufreq_verify(struct cpufreq_policy *policy)
 {
-	struct acpi_cpufreq_data	*data = drv_data[policy->cpu];
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
 	dprintk("acpi_cpufreq_verify (%d)\n", policy->cpu);
 
@@ -400,15 +396,15 @@
  */
 static int acpi_cpufreq_early_init_acpi(void)
 {
-	struct acpi_processor_performance	*data;
-	cpumask_t				covered;
-	unsigned int				i, j;
+	struct acpi_processor_performance *data;
+	cpumask_t covered;
+	unsigned int i, j;
 
 	dprintk("acpi_cpufreq_early_init\n");
 
 	for_each_possible_cpu(i) {
-		data = kzalloc(sizeof(struct acpi_processor_performance), 
-			GFP_KERNEL);
+		data = kzalloc(sizeof(struct acpi_processor_performance),
+			       GFP_KERNEL);
 		if (!data) {
 			for_each_cpu_mask(j, covered) {
 				kfree(acpi_perf_data[j]);
@@ -427,11 +423,11 @@
 
 static int acpi_cpufreq_cpu_init_acpi(struct cpufreq_policy *policy)
 {
-	unsigned int				i;
-	unsigned int				cpu = policy->cpu;
-	struct acpi_cpufreq_data		*data = drv_data[cpu];
-	struct acpi_processor_performance	*perf;
-	int					result = 0;
+	unsigned int i;
+	unsigned int cpu = policy->cpu;
+	struct acpi_cpufreq_data *data = drv_data[cpu];
+	struct acpi_processor_performance *perf;
+	int result = 0;
 
 	if (acpi_processor_register_performance(data->acpi_data, cpu)) {
 		return -EIO;
@@ -449,26 +445,26 @@
 		goto err_unreg;
 	}
 	switch (perf->control_register.space_id) {
-		case ACPI_ADR_SPACE_SYSTEM_IO:
-			dprintk("SYSTEM IO addr space\n");
-			data->cpu_fet = SYSTEM_IO_CAPABLE;
-			break;
-		case ACPI_ADR_SPACE_FIXED_HARDWARE:
-			dprintk("HARDWARE addr space\n");
-			if (!check_speedstep_cpu(cpu)) {
-				result = -ENODEV;
-				goto err_unreg;
-			}
-			data->cpu_fet = SYSTEM_MSR_CAPABLE;
-			break;
-		default:
-			dprintk("unknown addr space\n");
+	case ACPI_ADR_SPACE_SYSTEM_IO:
+		dprintk("SYSTEM IO addr space\n");
+		data->cpu_fet = SYSTEM_IO_CAPABLE;
+		break;
+	case ACPI_ADR_SPACE_FIXED_HARDWARE:
+		dprintk("HARDWARE addr space\n");
+		if (!check_speedstep_cpu(cpu)) {
 			result = -ENODEV;
 			goto err_unreg;
+		}
+		data->cpu_fet = SYSTEM_MSR_CAPABLE;
+		break;
+	default:
+		dprintk("unknown addr space\n");
+		result = -ENODEV;
+		goto err_unreg;
 	}
 
 	data->freq_table = kmalloc(sizeof(struct cpufreq_frequency_table) *
-				(perf->state_count + 1), GFP_KERNEL);
+				   (perf->state_count + 1), GFP_KERNEL);
 	if (!data->freq_table) {
 		result = -ENOMEM;
 		goto err_unreg;
@@ -481,7 +477,7 @@
 			data->freq_table[i].index = i;
 		}
 		data->freq_table[i].frequency =
-			perf->states[i].core_frequency * 1000;
+		    perf->states[i].core_frequency * 1000;
 	}
 	data->freq_table[perf->state_count].frequency = CPUFREQ_TABLE_END;
 
@@ -489,19 +485,19 @@
 	acpi_processor_notify_smm(THIS_MODULE);
 	return (0);
 
- err_unreg:
+      err_unreg:
 	acpi_processor_unregister_performance(perf, cpu);
 	return (result);
 }
 
 static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 {
-	unsigned int			cpu = policy->cpu;
-	struct cpuinfo_x86		*c = &cpu_data[policy->cpu];
-	struct acpi_cpufreq_data	*data;
-	struct drv_cmd			cmd;
-	unsigned int			result = 0;
-	unsigned int			i;
+	unsigned int cpu = policy->cpu;
+	struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
+	struct acpi_cpufreq_data *data;
+	struct drv_cmd cmd;
+	unsigned int result = 0;
+	unsigned int i;
 
 	dprintk("acpi_cpufreq_cpu_init (%d)\n", cpu);
 
@@ -523,8 +519,8 @@
 	}
 
 	if (data->cpu_fet == SYSTEM_MSR_CAPABLE) {
-	/* Check to see if Enhanced SpeedStep is enabled, and try to
-	   enable it if not. */
+		/* Check to see if Enhanced SpeedStep is enabled, and try to
+		   enable it if not. */
 		cmd.mask = cpumask_of_cpu(cpu);
 		cmd.type = SYSTEM_MSR_CAPABLE;
 		cmd.addr.msr.reg = MSR_IA32_MISC_ENABLE;
@@ -535,7 +531,7 @@
 			drv_write(&cmd);
 			/* check to see if it stuck */
 			drv_read(&cmd);
-			if (!(cmd.val & ( 1<< 16))) {
+			if (!(cmd.val & (1 << 16))) {
 				result = -ENODEV;
 				goto err_free;
 			}
@@ -551,7 +547,7 @@
 	policy->cpus = cpu_core_map[cpu];
 #else
 	policy->cpus = cpumask_of_cpu(cpu);
-#endif /* CONFIG_SMP */
+#endif				/* CONFIG_SMP */
 	for_each_cpu_mask(i, policy->cpus) {
 		drv_data[i] = data;
 	}
@@ -564,9 +560,10 @@
 	policy->cpuinfo.transition_latency = 0;
 	for (i = 0; i < data->acpi_data->state_count; i++) {
 		if ((data->acpi_data->states[i].transition_latency * 1000) >
-					policy->cpuinfo.transition_latency)
+		    policy->cpuinfo.transition_latency)
 			policy->cpuinfo.transition_latency =
-			  data->acpi_data->states[i].transition_latency * 1000;
+			    data->acpi_data->states[i].transition_latency *
+			    1000;
 	}
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
@@ -578,17 +575,16 @@
 	cpufreq_frequency_table_get_attr(data->freq_table, cpu);
 
 	return (0);
- err_free:
+      err_free:
 	kfree(data);
 	drv_data[cpu] = NULL;
 	return (result);
 }
 
-
 static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-	struct acpi_cpufreq_data	*data = drv_data[policy->cpu];
-	unsigned int			i;
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
+	unsigned int i;
 
 	dprintk("acpi_cpufreq_cpu_exit (%d)\n", policy->cpu);
 
@@ -598,50 +594,46 @@
 			drv_data[policy->cpu] = NULL;
 		}
 		acpi_processor_unregister_performance(data->acpi_data,
-							policy->cpu);
+						      policy->cpu);
 		kfree(data);
 	}
 
 	return (0);
 }
 
-static struct freq_attr* acpi_cpufreq_attr[] = {
+static struct freq_attr *acpi_cpufreq_attr[] = {
 	&cpufreq_freq_attr_scaling_available_freqs,
 	NULL,
 };
 
 static struct cpufreq_driver acpi_cpufreq_driver = {
-	.verify 	= acpi_cpufreq_verify,
-	.target 	= acpi_cpufreq_target,
-	.get		= get_cur_freq_on_cpu,
-	.init		= acpi_cpufreq_cpu_init,
-	.exit		= acpi_cpufreq_cpu_exit,
-	.name		= "acpi-cpufreq",
-	.owner		= THIS_MODULE,
-	.attr           = acpi_cpufreq_attr,
+	.verify = acpi_cpufreq_verify,
+	.target = acpi_cpufreq_target,
+	.get = get_cur_freq_on_cpu,
+	.init = acpi_cpufreq_cpu_init,
+	.exit = acpi_cpufreq_cpu_exit,
+	.name = "acpi-cpufreq",
+	.owner = THIS_MODULE,
+	.attr = acpi_cpufreq_attr,
 };
 
-
-static int __init
-acpi_cpufreq_init (void)
+static int __init acpi_cpufreq_init(void)
 {
-	int                     result = 0;
+	int result = 0;
 
 	dprintk("acpi_cpufreq_init\n");
 
 	result = acpi_cpufreq_early_init_acpi();
 
 	if (!result)
- 		result = cpufreq_register_driver(&acpi_cpufreq_driver);
-	
+		result = cpufreq_register_driver(&acpi_cpufreq_driver);
+
 	return (result);
 }
 
-
-static void __exit
-acpi_cpufreq_exit (void)
+static void __exit acpi_cpufreq_exit(void)
 {
-	unsigned int	i;
+	unsigned int i;
 	dprintk("acpi_cpufreq_exit\n");
 
 	cpufreq_unregister_driver(&acpi_cpufreq_driver);
