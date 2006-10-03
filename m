From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 5/8]cpufreq:acpi-cpufreq: lindent acpi-cpufreq.c
Date: Tue, 3 Oct 2006 12:35:23 -0700
Message-ID: <20061003123523.C31827@unix-os.sc.intel.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>


Lindent acpi-cpufreq. Additional changes replacing "return (..)" by "return ..".
No functionality changes in this patch.

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>

Index: linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -51,7 +51,6 @@ MODULE_AUTHOR("Paul Diefenbaugh, Dominik
 MODULE_DESCRIPTION("ACPI Processor P-States Driver");
 MODULE_LICENSE("GPL");
 
-
 enum {
 	UNDEFINED_CAPABLE = 0,
 	SYSTEM_INTEL_MSR_CAPABLE,
@@ -61,36 +60,34 @@ enum {
 #define INTEL_MSR_RANGE		(0xffff)
 
 struct acpi_cpufreq_data {
-	struct acpi_processor_performance	*acpi_data;
-	struct cpufreq_frequency_table		*freq_table;
-	unsigned int				resume;
-	unsigned int				cpu_feature;
+	struct acpi_processor_performance *acpi_data;
+	struct cpufreq_frequency_table *freq_table;
+	unsigned int resume;
+	unsigned int cpu_feature;
 };
 
-static struct acpi_cpufreq_data	*drv_data[NR_CPUS];
-static struct acpi_processor_performance	*acpi_perf_data[NR_CPUS];
+static struct acpi_cpufreq_data *drv_data[NR_CPUS];
+static struct acpi_processor_performance *acpi_perf_data[NR_CPUS];
 
 static struct cpufreq_driver acpi_cpufreq_driver;
 
 static unsigned int acpi_pstate_strict;
 
-
 static int check_est_cpu(unsigned int cpuid)
 {
 	struct cpuinfo_x86 *cpu = &cpu_data[cpuid];
 
 	if (cpu->x86_vendor != X86_VENDOR_INTEL ||
-			!cpu_has(cpu, X86_FEATURE_EST))
+	    !cpu_has(cpu, X86_FEATURE_EST))
 		return 0;
 
 	return 1;
 }
 
-
 static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
 {
-	struct acpi_processor_performance       *perf;
-	int                                     i;
+	struct acpi_processor_performance *perf;
+	int i;
 
 	perf = data->acpi_data;
 
@@ -101,7 +98,6 @@ static unsigned extract_io(u32 value, st
 	return 0;
 }
 
-
 static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
 {
 	int i;
@@ -114,15 +110,14 @@ static unsigned extract_msr(u32 msr, str
 	return data->freq_table[0].frequency;
 }
 
-
 static unsigned extract_freq(u32 val, struct acpi_cpufreq_data *data)
 {
 	switch (data->cpu_feature) {
-	    case SYSTEM_INTEL_MSR_CAPABLE:
+	case SYSTEM_INTEL_MSR_CAPABLE:
 		return extract_msr(val, data);
-	    case SYSTEM_IO_CAPABLE:
+	case SYSTEM_IO_CAPABLE:
 		return extract_io(val, data);
-	    default:
+	default:
 		return 0;
 	}
 }
@@ -138,7 +133,7 @@ static void wrport(u16 port, u8 bit_widt
 	}
 }
 
-static void rdport(u16 port, u8 bit_width, u32 *ret)
+static void rdport(u16 port, u8 bit_width, u32 * ret)
 {
 	*ret = 0;
 	if (bit_width <= 8) {
@@ -176,13 +171,13 @@ static void do_drv_read(struct drv_cmd *
 	u32 h;
 
 	switch (cmd->type) {
-	    case SYSTEM_INTEL_MSR_CAPABLE:
+	case SYSTEM_INTEL_MSR_CAPABLE:
 		rdmsr(cmd->addr.msr.reg, cmd->val, h);
 		break;
-	    case SYSTEM_IO_CAPABLE:
+	case SYSTEM_IO_CAPABLE:
 		rdport(cmd->addr.io.port, cmd->addr.io.bit_width, &cmd->val);
 		break;
-	    default:
+	default:
 		break;
 	}
 }
@@ -192,20 +187,20 @@ static void do_drv_write(struct drv_cmd 
 	u32 h = 0;
 
 	switch (cmd->type) {
-	    case SYSTEM_INTEL_MSR_CAPABLE:
+	case SYSTEM_INTEL_MSR_CAPABLE:
 		wrmsr(cmd->addr.msr.reg, cmd->val, h);
 		break;
-	    case SYSTEM_IO_CAPABLE:
+	case SYSTEM_IO_CAPABLE:
 		wrport(cmd->addr.io.port, cmd->addr.io.bit_width, cmd->val);
 		break;
-	    default:
+	default:
 		break;
 	}
 }
 
 static inline void drv_read(struct drv_cmd *cmd)
 {
-	cpumask_t	saved_mask = current->cpus_allowed;
+	cpumask_t saved_mask = current->cpus_allowed;
 	cmd->val = 0;
 
 	set_cpus_allowed(current, cmd->mask);
@@ -216,8 +211,8 @@ static inline void drv_read(struct drv_c
 
 static void drv_write(struct drv_cmd *cmd)
 {
-	cpumask_t	saved_mask = current->cpus_allowed;
-	unsigned int	i;
+	cpumask_t saved_mask = current->cpus_allowed;
+	unsigned int i;
 
 	for_each_cpu_mask(i, cmd->mask) {
 		set_cpus_allowed(current, cpumask_of_cpu(i));
@@ -230,8 +225,8 @@ static void drv_write(struct drv_cmd *cm
 
 static u32 get_cur_val(cpumask_t mask)
 {
-	struct acpi_processor_performance	*perf;
-	struct drv_cmd				cmd;
+	struct acpi_processor_performance *perf;
+	struct drv_cmd cmd;
 
 	if (unlikely(cpus_empty(mask)))
 		return 0;
@@ -262,14 +257,13 @@ static u32 get_cur_val(cpumask_t mask)
 
 static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
 {
-	struct acpi_cpufreq_data		*data = drv_data[cpu];
-	unsigned int				freq;
+	struct acpi_cpufreq_data *data = drv_data[cpu];
+	unsigned int freq;
 
 	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
 
 	if (unlikely(data == NULL ||
-	             data->acpi_data == NULL ||
-	             data->freq_table == NULL)) {
+		     data->acpi_data == NULL || data->freq_table == NULL)) {
 		return 0;
 	}
 
@@ -280,10 +274,10 @@ static unsigned int get_cur_freq_on_cpu(
 }
 
 static unsigned int check_freqs(cpumask_t mask, unsigned int freq,
-		struct acpi_cpufreq_data *data)
+				struct acpi_cpufreq_data *data)
 {
-	unsigned int	cur_freq;
-	unsigned int	i;
+	unsigned int cur_freq;
+	unsigned int i;
 
 	for (i = 0; i < 100; i++) {
 		cur_freq = extract_freq(get_cur_val(mask), data);
@@ -295,34 +289,31 @@ static unsigned int check_freqs(cpumask_
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
-	unsigned int				msr;
-	unsigned int				next_state = 0;
-	unsigned int				next_perf_state = 0;
-	unsigned int				i;
-	int					result = 0;
+	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
+	struct acpi_processor_performance *perf;
+	struct cpufreq_freqs freqs;
+	cpumask_t online_policy_cpus;
+	struct drv_cmd cmd;
+	unsigned int msr;
+	unsigned int next_state = 0;
+	unsigned int next_perf_state = 0;
+	unsigned int i;
+	int result = 0;
 
 	dprintk("acpi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
 
 	if (unlikely(data == NULL ||
-	             data->acpi_data == NULL ||
-	             data->freq_table == NULL)) {
+		     data->acpi_data == NULL || data->freq_table == NULL)) {
 		return -ENODEV;
 	}
 
 	perf = data->acpi_data;
 	result = cpufreq_frequency_table_target(policy,
-	                                        data->freq_table,
-	                                        target_freq,
-	                                        relation,
-	                                        &next_state);
+						data->freq_table,
+						target_freq,
+						relation, &next_state);
 	if (unlikely(result))
 		return -ENODEV;
 
@@ -339,30 +330,34 @@ static int acpi_cpufreq_target(struct cp
 	next_perf_state = data->freq_table[next_state].index;
 	if (freqs.new == freqs.old) {
 		if (unlikely(data->resume)) {
-			dprintk("Called after resume, resetting to P%d\n", next_perf_state);
+			dprintk("Called after resume, resetting to P%d\n",
+				next_perf_state);
 			data->resume = 0;
 		} else {
-			dprintk("Already at target state (P%d)\n", next_perf_state);
+			dprintk("Already at target state (P%d)\n",
+				next_perf_state);
 			return 0;
 		}
 	}
 
- 	switch (data->cpu_feature) {
- 	    case SYSTEM_INTEL_MSR_CAPABLE:
- 		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
- 		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
-		msr = (u32) perf->states[next_perf_state].control & INTEL_MSR_RANGE;
- 		cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
- 		break;
- 	    case SYSTEM_IO_CAPABLE:
- 		cmd.type = SYSTEM_IO_CAPABLE;
- 		cmd.addr.io.port = perf->control_register.address;
- 		cmd.addr.io.bit_width = perf->control_register.bit_width;
- 		cmd.val = (u32) perf->states[next_perf_state].control;
- 		break;
- 	    default:
- 		return -ENODEV;
- 	}
+	switch (data->cpu_feature) {
+	case SYSTEM_INTEL_MSR_CAPABLE:
+		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
+		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
+		msr =
+		    (u32) perf->states[next_perf_state].
+		    control & INTEL_MSR_RANGE;
+		cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
+		break;
+	case SYSTEM_IO_CAPABLE:
+		cmd.type = SYSTEM_IO_CAPABLE;
+		cmd.addr.io.port = perf->control_register.address;
+		cmd.addr.io.bit_width = perf->control_register.bit_width;
+		cmd.val = (u32) perf->states[next_perf_state].control;
+		break;
+	default:
+		return -ENODEV;
+	}
 
 	cpus_clear(cmd.mask);
 
@@ -381,7 +376,7 @@ static int acpi_cpufreq_target(struct cp
 	if (acpi_pstate_strict) {
 		if (!check_freqs(cmd.mask, freqs.new, data)) {
 			dprintk("acpi_cpufreq_target failed (%d)\n",
-					policy->cpu);
+				policy->cpu);
 			return -EAGAIN;
 		}
 	}
@@ -395,10 +390,7 @@ static int acpi_cpufreq_target(struct cp
 	return result;
 }
 
-
-static int
-acpi_cpufreq_verify (
-	struct cpufreq_policy   *policy)
+static int acpi_cpufreq_verify(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
@@ -407,13 +399,10 @@ acpi_cpufreq_verify (
 	return cpufreq_frequency_table_verify(policy, data->freq_table);
 }
 
-
 static unsigned long
-acpi_cpufreq_guess_freq (
-	struct acpi_cpufreq_data	*data,
-	unsigned int		cpu)
+acpi_cpufreq_guess_freq(struct acpi_cpufreq_data *data, unsigned int cpu)
 {
-	struct acpi_processor_performance	*perf = data->acpi_data;
+	struct acpi_processor_performance *perf = data->acpi_data;
 
 	if (cpu_khz) {
 		/* search the closest match to cpu_khz */
@@ -423,14 +412,14 @@ acpi_cpufreq_guess_freq (
 
 		for (i = 0; i < (perf->state_count - 1); i++) {
 			freq = freqn;
-			freqn = perf->states[i+1].core_frequency * 1000;
+			freqn = perf->states[i + 1].core_frequency * 1000;
 			if ((2 * cpu_khz) > (freqn + freq)) {
 				perf->state = i;
-				return (freq);
+				return freq;
 			}
 		}
 		perf->state = perf->state_count - 1;
-		return (freqn);
+		return freqn;
 	} else {
 		/* assume CPU is at P0... */
 		perf->state = 0;
@@ -438,7 +427,6 @@ acpi_cpufreq_guess_freq (
 	}
 }
 
-
 /*
  * acpi_cpufreq_early_init - initialize ACPI P-States library
  *
@@ -449,21 +437,21 @@ acpi_cpufreq_guess_freq (
  */
 static int acpi_cpufreq_early_init(void)
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
 				acpi_perf_data[j] = NULL;
 			}
-			return (-ENOMEM);
+			return -ENOMEM;
 		}
 		acpi_perf_data[i] = data;
 		cpu_set(i, covered);
@@ -501,27 +489,25 @@ static struct dmi_system_id sw_any_bug_d
 	{ }
 };
 
-static int
-acpi_cpufreq_cpu_init (
-	struct cpufreq_policy   *policy)
-{
-	unsigned int			i;
-	unsigned int			valid_states = 0;
-	unsigned int			cpu = policy->cpu;
-	struct acpi_cpufreq_data	*data;
-	unsigned int			l, h;
-	unsigned int			result = 0;
-	struct cpuinfo_x86 		*c = &cpu_data[policy->cpu];
-	struct acpi_processor_performance	*perf;
+static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+	unsigned int i;
+	unsigned int valid_states = 0;
+	unsigned int cpu = policy->cpu;
+	struct acpi_cpufreq_data *data;
+	unsigned int l, h;
+	unsigned int result = 0;
+	struct cpuinfo_x86 *c = &cpu_data[policy->cpu];
+	struct acpi_processor_performance *perf;
 
 	dprintk("acpi_cpufreq_cpu_init\n");
 
 	if (!acpi_perf_data[cpu])
-		return (-ENODEV);
+		return -ENODEV;
 
 	data = kzalloc(sizeof(struct acpi_cpufreq_data), GFP_KERNEL);
 	if (!data)
-		return (-ENOMEM);
+		return -ENOMEM;
 
 	data->acpi_data = acpi_perf_data[cpu];
 	drv_data[cpu] = data;
@@ -566,11 +552,11 @@ acpi_cpufreq_cpu_init (
 	}
 
 	switch (perf->control_register.space_id) {
-	    case ACPI_ADR_SPACE_SYSTEM_IO:
+	case ACPI_ADR_SPACE_SYSTEM_IO:
 		dprintk("SYSTEM IO addr space\n");
 		data->cpu_feature = SYSTEM_IO_CAPABLE;
 		break;
-	    case ACPI_ADR_SPACE_FIXED_HARDWARE:
+	case ACPI_ADR_SPACE_FIXED_HARDWARE:
 		dprintk("HARDWARE addr space\n");
 		if (!check_est_cpu(cpu)) {
 			result = -ENODEV;
@@ -578,14 +564,16 @@ acpi_cpufreq_cpu_init (
 		}
 		data->cpu_feature = SYSTEM_INTEL_MSR_CAPABLE;
 		break;
-	    default:
+	default:
 		dprintk("Unknown addr space %d\n",
-				(u32) (perf->control_register.space_id));
+			(u32) (perf->control_register.space_id));
 		result = -ENODEV;
 		goto err_unreg;
 	}
 
-	data->freq_table = kmalloc(sizeof(struct cpufreq_frequency_table) * (perf->state_count + 1), GFP_KERNEL);
+	data->freq_table =
+	    kmalloc(sizeof(struct cpufreq_frequency_table) *
+		    (perf->state_count + 1), GFP_KERNEL);
 	if (!data->freq_table) {
 		result = -ENOMEM;
 		goto err_unreg;
@@ -593,22 +581,23 @@ acpi_cpufreq_cpu_init (
 
 	/* detect transition latency */
 	policy->cpuinfo.transition_latency = 0;
-	for (i=0; i<perf->state_count; i++) {
-		if ((perf->states[i].transition_latency * 1000) > policy->cpuinfo.transition_latency)
-			policy->cpuinfo.transition_latency = perf->states[i].transition_latency * 1000;
+	for (i = 0; i < perf->state_count; i++) {
+		if ((perf->states[i].transition_latency * 1000) >
+		    policy->cpuinfo.transition_latency)
+			policy->cpuinfo.transition_latency =
+			    perf->states[i].transition_latency * 1000;
 	}
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
 	/* table init */
-	for (i=0; i<perf->state_count; i++)
-	{
-		if ( i > 0 && perf->states[i].core_frequency ==
-				perf->states[i - 1].core_frequency)
+	for (i = 0; i < perf->state_count; i++) {
+		if (i > 0 && perf->states[i].core_frequency ==
+		    perf->states[i - 1].core_frequency)
 			continue;
 
 		data->freq_table[valid_states].index = i;
 		data->freq_table[valid_states].frequency =
-			perf->states[i].core_frequency * 1000;
+		    perf->states[i].core_frequency * 1000;
 		valid_states++;
 	}
 	data->freq_table[perf->state_count].frequency = CPUFREQ_TABLE_END;
@@ -619,14 +608,14 @@ acpi_cpufreq_cpu_init (
 	}
 
 	switch (data->cpu_feature) {
-	    case ACPI_ADR_SPACE_SYSTEM_IO:
+	case ACPI_ADR_SPACE_SYSTEM_IO:
 		/* Current speed is unknown and not detectable by IO port */
 		policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
 		break;
-	    case ACPI_ADR_SPACE_FIXED_HARDWARE:
+	case ACPI_ADR_SPACE_FIXED_HARDWARE:
 		get_cur_freq_on_cpu(cpu);
 		break;
-	    default:
+	default:
 		break;
 	}
 
@@ -636,100 +625,89 @@ acpi_cpufreq_cpu_init (
 	dprintk("CPU%u - ACPI performance management activated.\n", cpu);
 	for (i = 0; i < perf->state_count; i++)
 		dprintk("     %cP%d: %d MHz, %d mW, %d uS\n",
-			(i == perf->state?'*':' '), i,
+			(i == perf->state ? '*' : ' '), i,
 			(u32) perf->states[i].core_frequency,
 			(u32) perf->states[i].power,
 			(u32) perf->states[i].transition_latency);
 
 	cpufreq_frequency_table_get_attr(data->freq_table, policy->cpu);
-	
+
 	/*
 	 * the first call to ->target() should result in us actually
 	 * writing something to the appropriate registers.
 	 */
 	data->resume = 1;
-	
+
 	return result;
 
- err_freqfree:
+      err_freqfree:
 	kfree(data->freq_table);
- err_unreg:
+      err_unreg:
 	acpi_processor_unregister_performance(perf, cpu);
- err_free:
+      err_free:
 	kfree(data);
 	drv_data[cpu] = NULL;
 
-	return (result);
+	return result;
 }
 
-
-static int
-acpi_cpufreq_cpu_exit (
-	struct cpufreq_policy   *policy)
+static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
-
 	dprintk("acpi_cpufreq_cpu_exit\n");
 
 	if (data) {
 		cpufreq_frequency_table_put_attr(policy->cpu);
 		drv_data[policy->cpu] = NULL;
-		acpi_processor_unregister_performance(data->acpi_data, policy->cpu);
+		acpi_processor_unregister_performance(data->acpi_data,
+						      policy->cpu);
 		kfree(data);
 	}
 
-	return (0);
+	return 0;
 }
 
-static int
-acpi_cpufreq_resume (
-	struct cpufreq_policy   *policy)
+static int acpi_cpufreq_resume(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = drv_data[policy->cpu];
 
-
 	dprintk("acpi_cpufreq_resume\n");
 
 	data->resume = 1;
 
-	return (0);
+	return 0;
 }
 
-
-static struct freq_attr* acpi_cpufreq_attr[] = {
+static struct freq_attr *acpi_cpufreq_attr[] = {
 	&cpufreq_freq_attr_scaling_available_freqs,
 	NULL,
 };
 
 static struct cpufreq_driver acpi_cpufreq_driver = {
-	.verify	= acpi_cpufreq_verify,
-	.target	= acpi_cpufreq_target,
-	.get    = get_cur_freq_on_cpu,
-	.init	= acpi_cpufreq_cpu_init,
-	.exit	= acpi_cpufreq_cpu_exit,
-	.resume	= acpi_cpufreq_resume,
-	.name	= "acpi-cpufreq",
-	.owner	= THIS_MODULE,
-	.attr	= acpi_cpufreq_attr,
+	.verify = acpi_cpufreq_verify,
+	.target = acpi_cpufreq_target,
+	.get = get_cur_freq_on_cpu,
+	.init = acpi_cpufreq_cpu_init,
+	.exit = acpi_cpufreq_cpu_exit,
+	.resume = acpi_cpufreq_resume,
+	.name = "acpi-cpufreq",
+	.owner = THIS_MODULE,
+	.attr = acpi_cpufreq_attr,
 };
 
-
-static int __init
-acpi_cpufreq_init (void)
+static int __init acpi_cpufreq_init(void)
 {
 	dprintk("acpi_cpufreq_init\n");
 
 	acpi_cpufreq_early_init();
 
- 	return cpufreq_register_driver(&acpi_cpufreq_driver);
+	return cpufreq_register_driver(&acpi_cpufreq_driver);
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
@@ -742,7 +720,8 @@ acpi_cpufreq_exit (void)
 }
 
 module_param(acpi_pstate_strict, uint, 0644);
-MODULE_PARM_DESC(acpi_pstate_strict, "value 0 or non-zero. non-zero -> strict ACPI checks are performed during frequency changes.");
+MODULE_PARM_DESC(acpi_pstate_strict,
+		 "value 0 or non-zero. non-zero -> strict ACPI checks are performed during frequency changes.");
 
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
