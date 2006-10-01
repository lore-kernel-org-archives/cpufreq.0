From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 3/8]cpufreq: acpi-cpufreq: Pull in MSR based transition
	support
Date: Sun, 1 Oct 2006 07:10:40 -0700
Message-ID: <20061001071040.C16392@unix-os.sc.intel.com>
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
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, cpufreq <cpufreq@www.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>


Add in the support for Intel Enhanced Speedstep - MSR based transitions.
With this change, the ACPI based support in speedstep-centrino can be
deprecated and duplicate code in that driver can be marked for removal.
Much easier to maintain and support this way. This also reduces the
user misconfigurations and questions on which driver is to be used
under which CPUs to support Enhanced Speedstep.

Signed-off-by: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>

Index: linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
===================================================================
--- linux-2.6.18.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -40,6 +40,7 @@
 #include <acpi/processor.h>
 
 #include <asm/io.h>
+#include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
 #include <asm/delay.h>
@@ -52,10 +53,19 @@ MODULE_DESCRIPTION("ACPI Processor P-Sta
 MODULE_LICENSE("GPL");
 
 
+enum {
+	UNDEFINED_CAPABLE = 0,
+	SYSTEM_INTEL_MSR_CAPABLE,
+	SYSTEM_IO_CAPABLE,
+};
+
+#define INTEL_MSR_RANGE		(0xffff)
+
 struct acpi_cpufreq_data {
 	struct acpi_processor_performance	*acpi_data;
 	struct cpufreq_frequency_table		*freq_table;
 	unsigned int				resume;
+	unsigned int				cpu_feature;
 };
 
 static struct acpi_cpufreq_data	*drv_data[NR_CPUS];
@@ -65,7 +75,20 @@ static struct cpufreq_driver acpi_cpufre
 
 static unsigned int acpi_pstate_strict;
 
-static unsigned extract_freq(u32 value, struct acpi_cpufreq_data *data)
+
+static int check_est_cpu(unsigned int cpuid)
+{
+	struct cpuinfo_x86 *cpu = &cpu_data[cpuid];
+
+	if (cpu->x86_vendor != X86_VENDOR_INTEL ||
+			!cpu_has(cpu, X86_FEATURE_EST))
+		return 0;
+
+	return 1;
+}
+
+
+static unsigned extract_io(u32 value, struct acpi_cpufreq_data *data)
 {
 	struct acpi_processor_performance       *perf;
 	int                                     i;
@@ -80,6 +103,31 @@ static unsigned extract_freq(u32 value, 
 }
 
 
+static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
+{
+	int i;
+
+	msr &= INTEL_MSR_RANGE;
+	for (i = 0; data->freq_table[i].frequency != CPUFREQ_TABLE_END; i++) {
+		if (msr == data->freq_table[i].index)
+			return data->freq_table[i].frequency;
+	}
+	return data->freq_table[0].frequency;
+}
+
+
+static unsigned extract_freq(u32 val, struct acpi_cpufreq_data *data)
+{
+	switch (data->cpu_feature) {
+	    case SYSTEM_INTEL_MSR_CAPABLE:
+		return extract_msr(val, data);
+	    case SYSTEM_IO_CAPABLE:
+		return extract_io(val, data);
+	    default:
+		return 0;
+	}
+}
+
 static void wrport(u16 port, u8 bit_width, u32 value)
 {
 	if (bit_width <= 8) {
@@ -103,27 +151,57 @@ static void rdport(u16 port, u8 bit_widt
 	}
 }
 
+struct msr_addr {
+	u32 reg;
+};
+
 struct io_addr {
 	u16 port;
 	u8 bit_width;
 };
 
+typedef union {
+	struct msr_addr msr;
+	struct io_addr io;
+} drv_addr_union;
+
 struct drv_cmd {
+	unsigned int type;
 	cpumask_t mask;
-	struct io_addr addr;
+	drv_addr_union addr;
 	u32 val;
 };
 
 static void do_drv_read(struct drv_cmd *cmd)
 {
-	rdport(cmd->addr.port, cmd->addr.bit_width, &cmd->val);
-	return;
+	u32 h;
+
+	switch (cmd->type) {
+	    case SYSTEM_INTEL_MSR_CAPABLE:
+		rdmsr(cmd->addr.msr.reg, cmd->val, h);
+		break;
+	    case SYSTEM_IO_CAPABLE:
+		rdport(cmd->addr.io.port, cmd->addr.io.bit_width, &cmd->val);
+		break;
+	    default:
+		break;
+	}
 }
 
 static void do_drv_write(struct drv_cmd *cmd)
 {
-	wrport(cmd->addr.port, cmd->addr.bit_width, cmd->val);
-	return;
+	u32 h = 0;
+
+	switch (cmd->type) {
+	    case SYSTEM_INTEL_MSR_CAPABLE:
+		wrmsr(cmd->addr.msr.reg, cmd->val, h);
+		break;
+	    case SYSTEM_IO_CAPABLE:
+		wrport(cmd->addr.io.port, cmd->addr.io.bit_width, cmd->val);
+		break;
+	    default:
+		break;
+	}
 }
 
 static inline void drv_read(struct drv_cmd *cmd)
@@ -159,9 +237,21 @@ static u32 get_cur_val(cpumask_t mask)
 	if (unlikely(cpus_empty(mask)))
 		return 0;
 
-	perf = drv_data[first_cpu(mask)]->acpi_data;
-	cmd.addr.port = perf->control_register.address;
-	cmd.addr.bit_width = perf->control_register.bit_width;
+	switch (drv_data[first_cpu(mask)]->cpu_feature) {
+	case SYSTEM_INTEL_MSR_CAPABLE:
+		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
+		cmd.addr.msr.reg = MSR_IA32_PERF_STATUS;
+		break;
+	case SYSTEM_IO_CAPABLE:
+		cmd.type = SYSTEM_IO_CAPABLE;
+		perf = drv_data[first_cpu(mask)]->acpi_data;
+		cmd.addr.io.port = perf->control_register.address;
+		cmd.addr.io.bit_width = perf->control_register.bit_width;
+		break;
+	default:
+		return 0;
+	}
+
 	cmd.mask = mask;
 
 	drv_read(&cmd);
@@ -214,6 +304,7 @@ static int acpi_cpufreq_target(struct cp
 	struct cpufreq_freqs			freqs;
 	cpumask_t				online_policy_cpus;
 	struct drv_cmd				cmd;
+	unsigned int				msr;
 	unsigned int				next_state = 0;
 	unsigned int				next_perf_state = 0;
 	unsigned int				i;
@@ -257,9 +348,22 @@ static int acpi_cpufreq_target(struct cp
 		}
 	}
 
-	cmd.addr.port = perf->control_register.address;
-	cmd.addr.bit_width = perf->control_register.bit_width;
-	cmd.val = (u32) perf->states[next_perf_state].control;
+ 	switch (data->cpu_feature) {
+ 	    case SYSTEM_INTEL_MSR_CAPABLE:
+ 		cmd.type = SYSTEM_INTEL_MSR_CAPABLE;
+ 		cmd.addr.msr.reg = MSR_IA32_PERF_CTL;
+		msr = (u32) perf->states[next_perf_state].control & INTEL_MSR_RANGE;
+ 		cmd.val = (cmd.val & ~INTEL_MSR_RANGE) | msr;
+ 		break;
+ 	    case SYSTEM_IO_CAPABLE:
+ 		cmd.type = SYSTEM_IO_CAPABLE;
+ 		cmd.addr.io.port = perf->control_register.address;
+ 		cmd.addr.io.bit_width = perf->control_register.bit_width;
+ 		cmd.val = (u32) perf->states[next_perf_state].control;
+ 		break;
+ 	    default:
+ 		return -ENODEV;
+ 	}
 
 	cpus_clear(cmd.mask);
 
@@ -406,6 +510,7 @@ acpi_cpufreq_cpu_init (
 	unsigned int			valid_states = 0;
 	unsigned int			cpu = policy->cpu;
 	struct acpi_cpufreq_data	*data;
+	unsigned int			l, h;
 	unsigned int			result = 0;
 	struct cpuinfo_x86 		*c = &cpu_data[policy->cpu];
 	struct acpi_processor_performance	*perf;
@@ -464,6 +569,15 @@ acpi_cpufreq_cpu_init (
 	switch (perf->control_register.space_id) {
 	    case ACPI_ADR_SPACE_SYSTEM_IO:
 		dprintk("SYSTEM IO addr space\n");
+		data->cpu_feature = SYSTEM_IO_CAPABLE;
+		break;
+	    case ACPI_ADR_SPACE_FIXED_HARDWARE:
+		dprintk("HARDWARE addr space\n");
+		if (!check_est_cpu(cpu)) {
+			result = -ENODEV;
+			goto err_unreg;
+		}
+		data->cpu_feature = SYSTEM_INTEL_MSR_CAPABLE;
 		break;
 	    default:
 		dprintk("Unknown addr space %d\n",
@@ -486,9 +600,6 @@ acpi_cpufreq_cpu_init (
 	}
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	/* The current speed is unknown and not detectable by ACPI...  */
-	policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
-
 	/* table init */
 	for (i=0; i<perf->state_count; i++)
 	{
@@ -508,6 +619,18 @@ acpi_cpufreq_cpu_init (
 		goto err_freqfree;
 	}
 
+	switch (data->cpu_feature) {
+	    case ACPI_ADR_SPACE_SYSTEM_IO:
+		/* Current speed is unknown and not detectable by IO port */
+		policy->cur = acpi_cpufreq_guess_freq(data, policy->cpu);
+		break;
+	    case ACPI_ADR_SPACE_FIXED_HARDWARE:
+		get_cur_freq_on_cpu(cpu);
+		break;
+	    default:
+		break;
+	}
+
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
