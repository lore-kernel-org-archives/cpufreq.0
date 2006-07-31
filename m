From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 3/8] acpi-cpufreq: merge acpi functionality of cpufreq
	drivers
Date: Mon, 31 Jul 2006 22:44:26 +0400
Message-ID: <44CE4F8A.5060600@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

 acpi-cpufreq.c |  157 +++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 141 insertions(+), 16 deletions(-)

merge acpi functionality of cpufreq drivers

Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-13 17:52:15.000000000 +0000
+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-13 18:15:30.000000000 +0000
@@ -49,9 +49,16 @@
 MODULE_DESCRIPTION("ACPI Processor P-States Driver");
 MODULE_LICENSE("GPL");
 
+enum {
+	UNDEFINED_CAPABLE = 0,
+	SYSTEM_MSR_CAPABLE,
+	SYSTEM_IO_CAPABLE,
+};
+
 struct acpi_cpufreq_data {
 	struct acpi_processor_performance	*acpi_data;
 	struct cpufreq_frequency_table		*freq_table;
+	unsigned int				cpu_fet;
 };
 
 static struct acpi_cpufreq_data			*drv_data[NR_CPUS];
@@ -59,7 +66,29 @@
 
 static struct cpufreq_driver			acpi_cpufreq_driver;
 
-static unsigned extract_freq(u32 value, struct acpi_cpufreq_data *data)
+static int check_speedstep_cpu(unsigned int cpuid)
+{
+	struct cpuinfo_x86 *cpu = &cpu_data[cpuid];
+
+	if (cpu->x86_vendor != X86_VENDOR_INTEL ||
+				!cpu_has(cpu, X86_FEATURE_EST))
+		return (0);
+	return (1);
+}
+
+static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
+{
+	int i;
+
+	msr &= 0xffff;
+	for (i = 0; data->freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
+		if (msr == data->freq_table[i].index)
+			return data->freq_table[i].frequency;
+	}
+	return (0);
+}
+
+static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
 {
 	struct acpi_processor_performance	*perf;
 	int					i;
@@ -74,6 +103,18 @@
 	return (0);
 }
 
+static unsigned extract_freq(u32 val, struct acpi_cpufreq_data *data)
+{
+	switch (data->cpu_fet) {
+	case SYSTEM_MSR_CAPABLE:
+		return extract_msr(val, data);
+	case SYSTEM_IO_CAPABLE:
+		return extract_io(val, data);
+	default:
+		return (0);
+	}
+}
+
 static void wrport(u16 port, u8 bit_width, u32 value)
 {
 	if (bit_width <= 8) {
@@ -97,33 +138,59 @@
 	return (0);
 }
 
+struct msr_addr {
+	u32	reg;
+};
+
 struct io_addr {
 	u16	port;
 	u8	bit_width;
 };
 
+typedef union {
+	struct msr_addr		msr;
+	struct io_addr		io;
+} drv_addr_union;
+
 struct drv_cmd {
+	unsigned int	type;
 	cpumask_t	mask;
-	struct io_addr	addr;
+	drv_addr_union	addr;
 	u32		val;
 };
 
 static void do_drv_read(void *cmd_block)
 {
 	struct drv_cmd	*cmd = (struct drv_cmd *)cmd_block;
+	u32		h;
 
-	cmd->val = rdport(cmd->addr.port, cmd->addr.bit_width);
-
-	return;
+	switch (cmd->type) {
+	case SYSTEM_MSR_CAPABLE:
+		rdmsr(cmd->addr.msr.reg, cmd->val, h);
+		return;
+	case SYSTEM_IO_CAPABLE:
+		cmd->val = rdport(cmd->addr.io.port, cmd->addr.io.bit_width);
+		return;
+	default:
+		return;
+	}
 }
 
 static void do_drv_write(void *cmd_block)
 {
 	struct drv_cmd	*cmd = (struct drv_cmd *)cmd_block;
+	u32		h = 0;
 
-	wrport(cmd->addr.port, cmd->addr.bit_width, cmd->val);
-
-	return;
+	switch (cmd->type) {
+	case SYSTEM_MSR_CAPABLE:
+		wrmsr(cmd->addr.msr.reg, cmd->val, h);
+		return;
+	case SYSTEM_IO_CAPABLE:
+		wrport(cmd->addr.io.port, cmd->addr.io.bit_width, cmd->val);
+		return;
+	default:
+		return;
+	}
 }
 
 static inline void drv_read(struct drv_cmd *cmd)
@@ -162,9 +229,20 @@
 		return (0);
 	}
 
-	perf = drv_data[first_cpu(mask)]->acpi_data;
-	cmd.addr.port = perf->control_register.address;
-	cmd.addr.bit_width = perf->control_register.bit_width;
+	switch (drv_data[first_cpu(mask)]->cpu_fet) {
+	case SYSTEM_MSR_CAPABLE:
+		cmd.type = SYSTEM_MSR_CAPABLE;
+		cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
+		break;
+	case SYSTEM_IO_CAPABLE:
+		cmd.type = SYSTEM_IO_CAPABLE;
+		perf = drv_data[first_cpu(mask)]->acpi_data;
+		cmd.addr.io.port = perf->control_register.address;
+		cmd.addr.io.bit_width = perf->control_register.bit_width;
+		break;
+	default:
+		return (0);
+	}
 	cmd.mask = mask;
 
 	drv_read(&cmd);
@@ -205,6 +283,7 @@
 	struct cpufreq_freqs			freqs;
 	cpumask_t				online_policy_cpus;
 	struct drv_cmd				cmd;
+	u32					msr;
 	unsigned int				next_state = 0;
 	unsigned int				i;
 	int					result = 0;
@@ -235,10 +314,22 @@
 	cmd.val = get_cur_val(online_policy_cpus);
 	freqs.old = extract_freq(cmd.val, data);
 
-	cmd.addr.port = perf->control_register.address;
-	cmd.addr.bit_width = perf->control_register.bit_width;
-	cmd.val = (u32) perf->states[next_state].control;
-	freqs.new = data->freq_table[next_state].frequency;
+	if (data->cpu_fet == SYSTEM_MSR_CAPABLE) {
+		cmd.type = SYSTEM_MSR_CAPABLE;
+		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
+		msr = data->freq_table[next_state].index & 0xffff;
+		cmd.val = (cmd.val & ~0xffff) | msr;
+		freqs.new = extract_msr(msr, data);
+	} else if (data->cpu_fet == SYSTEM_IO_CAPABLE) {
+		cmd.type = SYSTEM_IO_CAPABLE;
+		cmd.addr.io.port = perf->control_register.address;
+		cmd.addr.io.bit_width = perf->control_register.bit_width;
+		cmd.val = (u32) perf->states[next_state].control;
+		freqs.new = data->freq_table[next_state].frequency;
+	} else {
+		return -ENODEV;
+	}
+
 
 	if (freqs.new == freqs.old) {
 		return (0);
@@ -336,6 +427,15 @@
 	switch (perf->control_register.space_id) {
 		case ACPI_ADR_SPACE_SYSTEM_IO:
 			dprintk("SYSTEM IO addr space\n");
+			data->cpu_fet = SYSTEM_IO_CAPABLE;
+			break;
+		case ACPI_ADR_SPACE_FIXED_HARDWARE:
+			dprintk("HARDWARE addr space\n");
+			if (!check_speedstep_cpu(cpu)) {
+				result = -ENODEV;
+				goto err_unreg;
+			}
+			data->cpu_fet = SYSTEM_MSR_CAPABLE;
 			break;
 		default:
 			dprintk("unknown addr space\n");
@@ -351,7 +451,11 @@
 	}
 
 	for (i = 0; i < perf->state_count; i++) {
-		data->freq_table[i].index = i;
+		if (data->cpu_fet == SYSTEM_MSR_CAPABLE) {
+			data->freq_table[i].index = perf->states[i].control;
+		} else {
+			data->freq_table[i].index = i;
+		}
 		data->freq_table[i].frequency =
 			perf->states[i].core_frequency * 1000;
 	}
@@ -371,6 +475,7 @@
 	unsigned int			cpu = policy->cpu;
 	struct cpuinfo_x86		*c = &cpu_data[policy->cpu];
 	struct acpi_cpufreq_data	*data;
+	struct drv_cmd			cmd;
 	unsigned int			result = 0;
 	unsigned int			i;
 
@@ -393,6 +498,26 @@
 		goto err_free;
 	}
 
+	if (data->cpu_fet == SYSTEM_MSR_CAPABLE) {
+	/* Check to see if Enhanced SpeedStep is enabled, and try to
+	   enable it if not. */
+		cmd.mask = cpumask_of_cpu(cpu);
+		cmd.type = SYSTEM_MSR_CAPABLE;
+		cmd.addr.msr.reg = MSR_IA32_MISC_ENABLE;
+		drv_read(&cmd);
+
+		if (!(cmd.val & (1 << 16))) {
+			cmd.val |= (1 << 16);
+			drv_write(&cmd);
+			/* check to see if it stuck */
+			drv_read(&cmd);
+			if (!(cmd.val & ( 1<< 16))) {
+				result = -ENODEV;
+				goto err_free;
+			}
+		}
+	}
+
 	policy->cpus = data->acpi_data->shared_cpu_map;
 	for_each_cpu_mask(i, policy->cpus) {
 		drv_data[i] = data;
