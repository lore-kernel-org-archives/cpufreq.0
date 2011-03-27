From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 2/2] cpufreq: use pr_debug() consistently
Date: Sun, 27 Mar 2011 15:05:20 +0200
Message-ID: <20110327130520.GB6759@comet.dominikbrodowski.net>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@codemonkey.org.uk>, cpufreq@vger.kernel.org

Consistently use pr_debug() as the debug printk statement, so that we
can get rid of the now-obsolete cpufreq_debug_printk() re-directions.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 arch/arm/mach-davinci/cpufreq.c                  |    4 +-
 arch/blackfin/mach-common/dpmc.c                 |    3 -
 arch/ia64/kernel/cpufreq/acpi-cpufreq.c          |   44 +++++-----
 arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c       |   45 +++++-----
 arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c    |    6 +-
 arch/x86/kernel/cpu/cpufreq/gx-suspmod.c         |   21 ++---
 arch/x86/kernel/cpu/cpufreq/longhaul.c           |    9 +--
 arch/x86/kernel/cpu/cpufreq/longrun.c            |   17 ++--
 arch/x86/kernel/cpu/cpufreq/p4-clockmod.c        |   10 +--
 arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c        |   43 +++++-----
 arch/x86/kernel/cpu/cpufreq/powernow-k7.c        |   31 +++----
 arch/x86/kernel/cpu/cpufreq/powernow-k8.c        |  100 +++++++++++-----------
 arch/x86/kernel/cpu/cpufreq/powernow-k8.h        |    2 -
 arch/x86/kernel/cpu/cpufreq/sc520_freq.c         |    6 +-
 arch/x86/kernel/cpu/cpufreq/speedstep-centrino.c |   23 ++---
 arch/x86/kernel/cpu/cpufreq/speedstep-ich.c      |   28 +++----
 arch/x86/kernel/cpu/cpufreq/speedstep-lib.c      |   43 +++++-----
 arch/x86/kernel/cpu/cpufreq/speedstep-smi.c      |   39 ++++-----
 drivers/acpi/processor_perflib.c                 |    6 +-
 drivers/cpufreq/cpufreq.c                        |   75 ++++++++---------
 drivers/cpufreq/cpufreq_performance.c            |    5 +-
 drivers/cpufreq/cpufreq_powersave.c              |    5 +-
 drivers/cpufreq/cpufreq_userspace.c              |   13 +--
 drivers/cpufreq/freq_table.c                     |   19 ++---
 include/linux/cpufreq.h                          |   10 --
 25 files changed, 266 insertions(+), 341 deletions(-)

diff --git a/arch/arm/mach-davinci/cpufreq.c b/arch/arm/mach-davinci/cpufreq.c
index 4a68c2b..5f05e74 100644
--- a/arch/arm/mach-davinci/cpufreq.c
+++ b/arch/arm/mach-davinci/cpufreq.c
@@ -94,9 +94,7 @@ static int davinci_target(struct cpufreq_policy *policy,
 	if (freqs.old == freqs.new)
 		return ret;
 
-	cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER,
-			dev_driver_string(cpufreq.dev),
-			"transition: %u --> %u\n", freqs.old, freqs.new);
+	dev_dbg(&cpufreq.dev, "transition: %u --> %u\n", freqs.old, freqs.new);
 
 	ret = cpufreq_frequency_table_target(policy, pdata->freq_table,
 						freqs.new, relation, &idx);
diff --git a/arch/blackfin/mach-common/dpmc.c b/arch/blackfin/mach-common/dpmc.c
index 382099f..5e4112e 100644
--- a/arch/blackfin/mach-common/dpmc.c
+++ b/arch/blackfin/mach-common/dpmc.c
@@ -19,9 +19,6 @@
 
 #define DRIVER_NAME "bfin dpmc"
 
-#define dprintk(msg...) \
-	cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, DRIVER_NAME, msg)
-
 struct bfin_dpmc_platform_data *pdata;
 
 /**
diff --git a/arch/ia64/kernel/cpufreq/acpi-cpufreq.c b/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
index 22f6152..f09b174 100644
--- a/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
+++ b/arch/ia64/kernel/cpufreq/acpi-cpufreq.c
@@ -23,8 +23,6 @@
 #include <linux/acpi.h>
 #include <acpi/processor.h>
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "acpi-cpufreq", msg)
-
 MODULE_AUTHOR("Venkatesh Pallipadi");
 MODULE_DESCRIPTION("ACPI Processor P-States Driver");
 MODULE_LICENSE("GPL");
@@ -47,12 +45,12 @@ processor_set_pstate (
 {
 	s64 retval;
 
-	dprintk("processor_set_pstate\n");
+	pr_debug("processor_set_pstate\n");
 
 	retval = ia64_pal_set_pstate((u64)value);
 
 	if (retval) {
-		dprintk("Failed to set freq to 0x%x, with error 0x%lx\n",
+		pr_debug("Failed to set freq to 0x%x, with error 0x%lx\n",
 		        value, retval);
 		return -ENODEV;
 	}
@@ -67,14 +65,14 @@ processor_get_pstate (
 	u64	pstate_index = 0;
 	s64 	retval;
 
-	dprintk("processor_get_pstate\n");
+	pr_debug("processor_get_pstate\n");
 
 	retval = ia64_pal_get_pstate(&pstate_index,
 	                             PAL_GET_PSTATE_TYPE_INSTANT);
 	*value = (u32) pstate_index;
 
 	if (retval)
-		dprintk("Failed to get current freq with "
+		pr_debug("Failed to get current freq with "
 			"error 0x%lx, idx 0x%x\n", retval, *value);
 
 	return (int)retval;
@@ -90,7 +88,7 @@ extract_clock (
 {
 	unsigned long i;
 
-	dprintk("extract_clock\n");
+	pr_debug("extract_clock\n");
 
 	for (i = 0; i < data->acpi_data.state_count; i++) {
 		if (value == data->acpi_data.states[i].status)
@@ -110,7 +108,7 @@ processor_get_freq (
 	cpumask_t		saved_mask;
 	unsigned long 		clock_freq;
 
-	dprintk("processor_get_freq\n");
+	pr_debug("processor_get_freq\n");
 
 	saved_mask = current->cpus_allowed;
 	set_cpus_allowed_ptr(current, cpumask_of(cpu));
@@ -148,7 +146,7 @@ processor_set_freq (
 	cpumask_t		saved_mask;
 	int			retval;
 
-	dprintk("processor_set_freq\n");
+	pr_debug("processor_set_freq\n");
 
 	saved_mask = current->cpus_allowed;
 	set_cpus_allowed_ptr(current, cpumask_of(cpu));
@@ -159,16 +157,16 @@ processor_set_freq (
 
 	if (state == data->acpi_data.state) {
 		if (unlikely(data->resume)) {
-			dprintk("Called after resume, resetting to P%d\n", state);
+			pr_debug("Called after resume, resetting to P%d\n", state);
 			data->resume = 0;
 		} else {
-			dprintk("Already at target state (P%d)\n", state);
+			pr_debug("Already at target state (P%d)\n", state);
 			retval = 0;
 			goto migrate_end;
 		}
 	}
 
-	dprintk("Transitioning from P%d to P%d\n",
+	pr_debug("Transitioning from P%d to P%d\n",
 		data->acpi_data.state, state);
 
 	/* cpufreq frequency struct */
@@ -186,7 +184,7 @@ processor_set_freq (
 
 	value = (u32) data->acpi_data.states[state].control;
 
-	dprintk("Transitioning to state: 0x%08x\n", value);
+	pr_debug("Transitioning to state: 0x%08x\n", value);
 
 	ret = processor_set_pstate(value);
 	if (ret) {
@@ -219,7 +217,7 @@ acpi_cpufreq_get (
 {
 	struct cpufreq_acpi_io *data = acpi_io_data[cpu];
 
-	dprintk("acpi_cpufreq_get\n");
+	pr_debug("acpi_cpufreq_get\n");
 
 	return processor_get_freq(data, cpu);
 }
@@ -235,7 +233,7 @@ acpi_cpufreq_target (
 	unsigned int next_state = 0;
 	unsigned int result = 0;
 
-	dprintk("acpi_cpufreq_setpolicy\n");
+	pr_debug("acpi_cpufreq_setpolicy\n");
 
 	result = cpufreq_frequency_table_target(policy,
 			data->freq_table, target_freq, relation, &next_state);
@@ -255,7 +253,7 @@ acpi_cpufreq_verify (
 	unsigned int result = 0;
 	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
 
-	dprintk("acpi_cpufreq_verify\n");
+	pr_debug("acpi_cpufreq_verify\n");
 
 	result = cpufreq_frequency_table_verify(policy,
 			data->freq_table);
@@ -273,7 +271,7 @@ acpi_cpufreq_cpu_init (
 	struct cpufreq_acpi_io	*data;
 	unsigned int		result = 0;
 
-	dprintk("acpi_cpufreq_cpu_init\n");
+	pr_debug("acpi_cpufreq_cpu_init\n");
 
 	data = kzalloc(sizeof(struct cpufreq_acpi_io), GFP_KERNEL);
 	if (!data)
@@ -288,7 +286,7 @@ acpi_cpufreq_cpu_init (
 
 	/* capability check */
 	if (data->acpi_data.state_count <= 1) {
-		dprintk("No P-States\n");
+		pr_debug("No P-States\n");
 		result = -ENODEV;
 		goto err_unreg;
 	}
@@ -297,7 +295,7 @@ acpi_cpufreq_cpu_init (
 					ACPI_ADR_SPACE_FIXED_HARDWARE) ||
 	    (data->acpi_data.status_register.space_id !=
 					ACPI_ADR_SPACE_FIXED_HARDWARE)) {
-		dprintk("Unsupported address space [%d, %d]\n",
+		pr_debug("Unsupported address space [%d, %d]\n",
 			(u32) (data->acpi_data.control_register.space_id),
 			(u32) (data->acpi_data.status_register.space_id));
 		result = -ENODEV;
@@ -348,7 +346,7 @@ acpi_cpufreq_cpu_init (
 	       "activated.\n", cpu);
 
 	for (i = 0; i < data->acpi_data.state_count; i++)
-		dprintk("     %cP%d: %d MHz, %d mW, %d uS, %d uS, 0x%x 0x%x\n",
+		pr_debug("     %cP%d: %d MHz, %d mW, %d uS, %d uS, 0x%x 0x%x\n",
 			(i == data->acpi_data.state?'*':' '), i,
 			(u32) data->acpi_data.states[i].core_frequency,
 			(u32) data->acpi_data.states[i].power,
@@ -383,7 +381,7 @@ acpi_cpufreq_cpu_exit (
 {
 	struct cpufreq_acpi_io *data = acpi_io_data[policy->cpu];
 
-	dprintk("acpi_cpufreq_cpu_exit\n");
+	pr_debug("acpi_cpufreq_cpu_exit\n");
 
 	if (data) {
 		cpufreq_frequency_table_put_attr(policy->cpu);
@@ -418,7 +416,7 @@ static struct cpufreq_driver acpi_cpufreq_driver = {
 static int __init
 acpi_cpufreq_init (void)
 {
-	dprintk("acpi_cpufreq_init\n");
+	pr_debug("acpi_cpufreq_init\n");
 
  	return cpufreq_register_driver(&acpi_cpufreq_driver);
 }
@@ -427,7 +425,7 @@ acpi_cpufreq_init (void)
 static void __exit
 acpi_cpufreq_exit (void)
 {
-	dprintk("acpi_cpufreq_exit\n");
+	pr_debug("acpi_cpufreq_exit\n");
 
 	cpufreq_unregister_driver(&acpi_cpufreq_driver);
 	return;
diff --git a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
index a2baafb..4e04e12 100644
--- a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
@@ -47,9 +47,6 @@
 #include <asm/cpufeature.h>
 #include "mperf.h"
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"acpi-cpufreq", msg)
-
 MODULE_AUTHOR("Paul Diefenbaugh, Dominik Brodowski");
 MODULE_DESCRIPTION("ACPI Processor P-States Driver");
 MODULE_LICENSE("GPL");
@@ -233,7 +230,7 @@ static u32 get_cur_val(const struct cpumask *mask)
 	cmd.mask = mask;
 	drv_read(&cmd);
 
-	dprintk("get_cur_val = %u\n", cmd.val);
+	pr_debug("get_cur_val = %u\n", cmd.val);
 
 	return cmd.val;
 }
@@ -244,7 +241,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
 	unsigned int freq;
 	unsigned int cached_freq;
 
-	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
+	pr_debug("get_cur_freq_on_cpu (%d)\n", cpu);
 
 	if (unlikely(data == NULL ||
 		     data->acpi_data == NULL || data->freq_table == NULL)) {
@@ -261,7 +258,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
 		data->resume = 1;
 	}
 
-	dprintk("cur freq = %u\n", freq);
+	pr_debug("cur freq = %u\n", freq);
 
 	return freq;
 }
@@ -293,7 +290,7 @@ static int acpi_cpufreq_target(struct cpufreq_policy *policy,
 	unsigned int i;
 	int result = 0;
 
-	dprintk("acpi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
+	pr_debug("acpi_cpufreq_target %d (%d)\n", target_freq, policy->cpu);
 
 	if (unlikely(data == NULL ||
 	     data->acpi_data == NULL || data->freq_table == NULL)) {
@@ -313,11 +310,11 @@ static int acpi_cpufreq_target(struct cpufreq_policy *policy,
 	next_perf_state = data->freq_table[next_state].index;
 	if (perf->state == next_perf_state) {
 		if (unlikely(data->resume)) {
-			dprintk("Called after resume, resetting to P%d\n",
+			pr_debug("Called after resume, resetting to P%d\n",
 				next_perf_state);
 			data->resume = 0;
 		} else {
-			dprintk("Already at target state (P%d)\n",
+			pr_debug("Already at target state (P%d)\n",
 				next_perf_state);
 			goto out;
 		}
@@ -357,7 +354,7 @@ static int acpi_cpufreq_target(struct cpufreq_policy *policy,
 
 	if (acpi_pstate_strict) {
 		if (!check_freqs(cmd.mask, freqs.new, data)) {
-			dprintk("acpi_cpufreq_target failed (%d)\n",
+			pr_debug("acpi_cpufreq_target failed (%d)\n",
 				policy->cpu);
 			result = -EAGAIN;
 			goto out;
@@ -378,7 +375,7 @@ static int acpi_cpufreq_verify(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = per_cpu(acfreq_data, policy->cpu);
 
-	dprintk("acpi_cpufreq_verify\n");
+	pr_debug("acpi_cpufreq_verify\n");
 
 	return cpufreq_frequency_table_verify(policy, data->freq_table);
 }
@@ -433,11 +430,11 @@ static void free_acpi_perf_data(void)
 static int __init acpi_cpufreq_early_init(void)
 {
 	unsigned int i;
-	dprintk("acpi_cpufreq_early_init\n");
+	pr_debug("acpi_cpufreq_early_init\n");
 
 	acpi_perf_data = alloc_percpu(struct acpi_processor_performance);
 	if (!acpi_perf_data) {
-		dprintk("Memory allocation error for acpi_perf_data.\n");
+		pr_debug("Memory allocation error for acpi_perf_data.\n");
 		return -ENOMEM;
 	}
 	for_each_possible_cpu(i) {
@@ -519,7 +516,7 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	static int blacklisted;
 #endif
 
-	dprintk("acpi_cpufreq_cpu_init\n");
+	pr_debug("acpi_cpufreq_cpu_init\n");
 
 #ifdef CONFIG_SMP
 	if (blacklisted)
@@ -566,7 +563,7 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 	/* capability check */
 	if (perf->state_count <= 1) {
-		dprintk("No P-States\n");
+		pr_debug("No P-States\n");
 		result = -ENODEV;
 		goto err_unreg;
 	}
@@ -578,11 +575,11 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 	switch (perf->control_register.space_id) {
 	case ACPI_ADR_SPACE_SYSTEM_IO:
-		dprintk("SYSTEM IO addr space\n");
+		pr_debug("SYSTEM IO addr space\n");
 		data->cpu_feature = SYSTEM_IO_CAPABLE;
 		break;
 	case ACPI_ADR_SPACE_FIXED_HARDWARE:
-		dprintk("HARDWARE addr space\n");
+		pr_debug("HARDWARE addr space\n");
 		if (!check_est_cpu(cpu)) {
 			result = -ENODEV;
 			goto err_unreg;
@@ -590,7 +587,7 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 		data->cpu_feature = SYSTEM_INTEL_MSR_CAPABLE;
 		break;
 	default:
-		dprintk("Unknown addr space %d\n",
+		pr_debug("Unknown addr space %d\n",
 			(u32) (perf->control_register.space_id));
 		result = -ENODEV;
 		goto err_unreg;
@@ -661,9 +658,9 @@ static int acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	if (cpu_has(c, X86_FEATURE_APERFMPERF))
 		acpi_cpufreq_driver.getavg = cpufreq_get_measured_perf;
 
-	dprintk("CPU%u - ACPI performance management activated.\n", cpu);
+	pr_debug("CPU%u - ACPI performance management activated.\n", cpu);
 	for (i = 0; i < perf->state_count; i++)
-		dprintk("     %cP%d: %d MHz, %d mW, %d uS\n",
+		pr_debug("     %cP%d: %d MHz, %d mW, %d uS\n",
 			(i == perf->state ? '*' : ' '), i,
 			(u32) perf->states[i].core_frequency,
 			(u32) perf->states[i].power,
@@ -694,7 +691,7 @@ static int acpi_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = per_cpu(acfreq_data, policy->cpu);
 
-	dprintk("acpi_cpufreq_cpu_exit\n");
+	pr_debug("acpi_cpufreq_cpu_exit\n");
 
 	if (data) {
 		cpufreq_frequency_table_put_attr(policy->cpu);
@@ -712,7 +709,7 @@ static int acpi_cpufreq_resume(struct cpufreq_policy *policy)
 {
 	struct acpi_cpufreq_data *data = per_cpu(acfreq_data, policy->cpu);
 
-	dprintk("acpi_cpufreq_resume\n");
+	pr_debug("acpi_cpufreq_resume\n");
 
 	data->resume = 1;
 
@@ -743,7 +740,7 @@ static int __init acpi_cpufreq_init(void)
 	if (acpi_disabled)
 		return 0;
 
-	dprintk("acpi_cpufreq_init\n");
+	pr_debug("acpi_cpufreq_init\n");
 
 	ret = acpi_cpufreq_early_init();
 	if (ret)
@@ -758,7 +755,7 @@ static int __init acpi_cpufreq_init(void)
 
 static void __exit acpi_cpufreq_exit(void)
 {
-	dprintk("acpi_cpufreq_exit\n");
+	pr_debug("acpi_cpufreq_exit\n");
 
 	cpufreq_unregister_driver(&acpi_cpufreq_driver);
 
diff --git a/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c b/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c
index 141abeb..7bac808 100644
--- a/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c
+++ b/arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c
@@ -57,8 +57,6 @@ MODULE_PARM_DESC(min_fsb,
 		"Minimum FSB to use, if not defined: current FSB - 50");
 
 #define PFX "cpufreq-nforce2: "
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"cpufreq-nforce2", msg)
 
 /**
  * nforce2_calc_fsb - calculate FSB
@@ -270,7 +268,7 @@ static int nforce2_target(struct cpufreq_policy *policy,
 	if (freqs.old == freqs.new)
 		return 0;
 
-	dprintk("Old CPU frequency %d kHz, new %d kHz\n",
+	pr_debug("Old CPU frequency %d kHz, new %d kHz\n",
 	       freqs.old, freqs.new);
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -282,7 +280,7 @@ static int nforce2_target(struct cpufreq_policy *policy,
 		printk(KERN_ERR PFX "Changing FSB to %d failed\n",
 			target_fsb);
 	else
-		dprintk("Changed FSB successfully to %d\n",
+		pr_debug("Changed FSB successfully to %d\n",
 			target_fsb);
 
 	/* Enable IRQs */
diff --git a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
index 32974cf..ffe1f2c 100644
--- a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
@@ -142,9 +142,6 @@ module_param(max_duration, int, 0444);
 #define POLICY_MIN_DIV 20
 
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"gx-suspmod", msg)
-
 /**
  * we can detect a core multipiler from dir0_lsb
  * from GX1 datasheet p.56,
@@ -191,7 +188,7 @@ static __init struct pci_dev *gx_detect_chipset(void)
 	/* check if CPU is a MediaGX or a Geode. */
 	if ((boot_cpu_data.x86_vendor != X86_VENDOR_NSC) &&
 	    (boot_cpu_data.x86_vendor != X86_VENDOR_CYRIX)) {
-		dprintk("error: no MediaGX/Geode processor found!\n");
+		pr_debug("error: no MediaGX/Geode processor found!\n");
 		return NULL;
 	}
 
@@ -201,7 +198,7 @@ static __init struct pci_dev *gx_detect_chipset(void)
 			return gx_pci;
 	}
 
-	dprintk("error: no supported chipset found!\n");
+	pr_debug("error: no supported chipset found!\n");
 	return NULL;
 }
 
@@ -305,14 +302,14 @@ static void gx_set_cpuspeed(unsigned int khz)
 			break;
 		default:
 			local_irq_restore(flags);
-			dprintk("fatal: try to set unknown chipset.\n");
+			pr_debug("fatal: try to set unknown chipset.\n");
 			return;
 		}
 	} else {
 		suscfg = gx_params->pci_suscfg & ~(SUSMOD);
 		gx_params->off_duration = 0;
 		gx_params->on_duration = 0;
-		dprintk("suspend modulation disabled: cpu runs 100%% speed.\n");
+		pr_debug("suspend modulation disabled: cpu runs 100%% speed.\n");
 	}
 
 	gx_write_byte(PCI_MODOFF, gx_params->off_duration);
@@ -327,9 +324,9 @@ static void gx_set_cpuspeed(unsigned int khz)
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
-	dprintk("suspend modulation w/ duration of ON:%d us, OFF:%d us\n",
+	pr_debug("suspend modulation w/ duration of ON:%d us, OFF:%d us\n",
 		gx_params->on_duration * 32, gx_params->off_duration * 32);
-	dprintk("suspend modulation w/ clock speed: %d kHz.\n", freqs.new);
+	pr_debug("suspend modulation w/ clock speed: %d kHz.\n", freqs.new);
 }
 
 /****************************************************************
@@ -428,8 +425,8 @@ static int cpufreq_gx_cpu_init(struct cpufreq_policy *policy)
 	stock_freq = maxfreq;
 	curfreq = gx_get_cpuspeed(0);
 
-	dprintk("cpu max frequency is %d.\n", maxfreq);
-	dprintk("cpu current frequency is %dkHz.\n", curfreq);
+	pr_debug("cpu max frequency is %d.\n", maxfreq);
+	pr_debug("cpu current frequency is %dkHz.\n", curfreq);
 
 	/* setup basic struct for cpufreq API */
 	policy->cpu = 0;
@@ -475,7 +472,7 @@ static int __init cpufreq_gx_init(void)
 	if (max_duration > 0xff)
 		max_duration = 0xff;
 
-	dprintk("geode suspend modulation available.\n");
+	pr_debug("geode suspend modulation available.\n");
 
 	params = kzalloc(sizeof(struct gxfreq_params), GFP_KERNEL);
 	if (params == NULL)
diff --git a/arch/x86/kernel/cpu/cpufreq/longhaul.c b/arch/x86/kernel/cpu/cpufreq/longhaul.c
index cf48cdd..03dfc33 100644
--- a/arch/x86/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/x86/kernel/cpu/cpufreq/longhaul.c
@@ -77,9 +77,6 @@ static int scale_voltage;
 static int disable_acpi_c3;
 static int revid_errata;
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"longhaul", msg)
-
 
 /* Clock ratios multiplied by 10 */
 static int mults[32];
@@ -275,7 +272,7 @@ static void longhaul_setstate(unsigned int table_index)
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
+	pr_debug("Setting to FSB:%dMHz Mult:%d.%dx (%s)\n",
 			fsb, mult/10, mult%10, print_speed(speed/1000));
 retry_loop:
 	preempt_disable();
@@ -460,12 +457,12 @@ static int __cpuinit longhaul_get_ranges(void)
 		break;
 	}
 
-	dprintk("MinMult:%d.%dx MaxMult:%d.%dx\n",
+	pr_debug("MinMult:%d.%dx MaxMult:%d.%dx\n",
 		 minmult/10, minmult%10, maxmult/10, maxmult%10);
 
 	highest_speed = calc_speed(maxmult);
 	lowest_speed = calc_speed(minmult);
-	dprintk("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
+	pr_debug("FSB:%dMHz  Lowest speed: %s   Highest speed:%s\n", fsb,
 		 print_speed(lowest_speed/1000),
 		 print_speed(highest_speed/1000));
 
diff --git a/arch/x86/kernel/cpu/cpufreq/longrun.c b/arch/x86/kernel/cpu/cpufreq/longrun.c
index d9f5136..34ea359 100644
--- a/arch/x86/kernel/cpu/cpufreq/longrun.c
+++ b/arch/x86/kernel/cpu/cpufreq/longrun.c
@@ -15,9 +15,6 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"longrun", msg)
-
 static struct cpufreq_driver	longrun_driver;
 
 /**
@@ -40,14 +37,14 @@ static void __cpuinit longrun_get_policy(struct cpufreq_policy *policy)
 	u32 msr_lo, msr_hi;
 
 	rdmsr(MSR_TMTA_LONGRUN_FLAGS, msr_lo, msr_hi);
-	dprintk("longrun flags are %x - %x\n", msr_lo, msr_hi);
+	pr_debug("longrun flags are %x - %x\n", msr_lo, msr_hi);
 	if (msr_lo & 0x01)
 		policy->policy = CPUFREQ_POLICY_PERFORMANCE;
 	else
 		policy->policy = CPUFREQ_POLICY_POWERSAVE;
 
 	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
-	dprintk("longrun ctrl is %x - %x\n", msr_lo, msr_hi);
+	pr_debug("longrun ctrl is %x - %x\n", msr_lo, msr_hi);
 	msr_lo &= 0x0000007F;
 	msr_hi &= 0x0000007F;
 
@@ -150,7 +147,7 @@ static unsigned int longrun_get(unsigned int cpu)
 		return 0;
 
 	cpuid(0x80860007, &eax, &ebx, &ecx, &edx);
-	dprintk("cpuid eax is %u\n", eax);
+	pr_debug("cpuid eax is %u\n", eax);
 
 	return eax * 1000;
 }
@@ -196,7 +193,7 @@ static int __cpuinit longrun_determine_freqs(unsigned int *low_freq,
 		rdmsr(MSR_TMTA_LRTI_VOLT_MHZ, msr_lo, msr_hi);
 		*high_freq = msr_lo * 1000; /* to kHz */
 
-		dprintk("longrun table interface told %u - %u kHz\n",
+		pr_debug("longrun table interface told %u - %u kHz\n",
 				*low_freq, *high_freq);
 
 		if (*low_freq > *high_freq)
@@ -207,7 +204,7 @@ static int __cpuinit longrun_determine_freqs(unsigned int *low_freq,
 	/* set the upper border to the value determined during TSC init */
 	*high_freq = (cpu_khz / 1000);
 	*high_freq = *high_freq * 1000;
-	dprintk("high frequency is %u kHz\n", *high_freq);
+	pr_debug("high frequency is %u kHz\n", *high_freq);
 
 	/* get current borders */
 	rdmsr(MSR_TMTA_LONGRUN_CTRL, msr_lo, msr_hi);
@@ -233,7 +230,7 @@ static int __cpuinit longrun_determine_freqs(unsigned int *low_freq,
 		/* restore values */
 		wrmsr(MSR_TMTA_LONGRUN_CTRL, save_lo, save_hi);
 	}
-	dprintk("percentage is %u %%, freq is %u MHz\n", ecx, eax);
+	pr_debug("percentage is %u %%, freq is %u MHz\n", ecx, eax);
 
 	/* performance_pctg = (current_freq - low_freq)/(high_freq - low_freq)
 	 * eqals
@@ -249,7 +246,7 @@ static int __cpuinit longrun_determine_freqs(unsigned int *low_freq,
 	edx = ((eax - ebx) * 100) / (100 - ecx);
 	*low_freq = edx * 1000; /* back to kHz */
 
-	dprintk("low frequency is %u kHz\n", *low_freq);
+	pr_debug("low frequency is %u kHz\n", *low_freq);
 
 	if (*low_freq > *high_freq)
 		*low_freq = *high_freq;
diff --git a/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c b/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
index 52c9364..6be3e07 100644
--- a/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
@@ -35,8 +35,6 @@
 #include "speedstep-lib.h"
 
 #define PFX	"p4-clockmod: "
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"p4-clockmod", msg)
 
 /*
  * Duty Cycle (3bits), note DC_DISABLE is not specified in
@@ -66,7 +64,7 @@ static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 	rdmsr_on_cpu(cpu, MSR_IA32_THERM_STATUS, &l, &h);
 
 	if (l & 0x01)
-		dprintk("CPU#%d currently thermal throttled\n", cpu);
+		pr_debug("CPU#%d currently thermal throttled\n", cpu);
 
 	if (has_N44_O17_errata[cpu] &&
 	    (newstate == DC_25PT || newstate == DC_DFLT))
@@ -74,10 +72,10 @@ static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 
 	rdmsr_on_cpu(cpu, MSR_IA32_THERM_CONTROL, &l, &h);
 	if (newstate == DC_DISABLE) {
-		dprintk("CPU#%d disabling modulation\n", cpu);
+		pr_debug("CPU#%d disabling modulation\n", cpu);
 		wrmsr_on_cpu(cpu, MSR_IA32_THERM_CONTROL, l & ~(1<<4), h);
 	} else {
-		dprintk("CPU#%d setting duty cycle to %d%%\n",
+		pr_debug("CPU#%d setting duty cycle to %d%%\n",
 			cpu, ((125 * newstate) / 10));
 		/* bits 63 - 5	: reserved
 		 * bit  4	: enable/disable
@@ -217,7 +215,7 @@ static int cpufreq_p4_cpu_init(struct cpufreq_policy *policy)
 	case 0x0f11:
 	case 0x0f12:
 		has_N44_O17_errata[policy->cpu] = 1;
-		dprintk("has errata -- disabling low frequencies\n");
+		pr_debug("has errata -- disabling low frequencies\n");
 	}
 
 	if (speedstep_detect_processor() == SPEEDSTEP_CPU_P4D &&
diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
index 755a31e..5ef04a8 100644
--- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
@@ -48,9 +48,6 @@
 
 #define BUF_SZ		4
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER,	\
-					     "pcc-cpufreq", msg)
-
 struct pcc_register_resource {
 	u8 descriptor;
 	u16 length;
@@ -152,7 +149,7 @@ static unsigned int pcc_get_freq(unsigned int cpu)
 
 	spin_lock(&pcc_lock);
 
-	dprintk("get: get_freq for CPU %d\n", cpu);
+	pr_debug("get: get_freq for CPU %d\n", cpu);
 	pcc_cpu_data = per_cpu_ptr(pcc_cpu_info, cpu);
 
 	input_buffer = 0x1;
@@ -170,7 +167,7 @@ static unsigned int pcc_get_freq(unsigned int cpu)
 
 	status = ioread16(&pcch_hdr->status);
 	if (status != CMD_COMPLETE) {
-		dprintk("get: FAILED: for CPU %d, status is %d\n",
+		pr_debug("get: FAILED: for CPU %d, status is %d\n",
 			cpu, status);
 		goto cmd_incomplete;
 	}
@@ -178,14 +175,14 @@ static unsigned int pcc_get_freq(unsigned int cpu)
 	curr_freq = (((ioread32(&pcch_hdr->nominal) * (output_buffer & 0xff))
 			/ 100) * 1000);
 
-	dprintk("get: SUCCESS: (virtual) output_offset for cpu %d is "
+	pr_debug("get: SUCCESS: (virtual) output_offset for cpu %d is "
 		"0x%x, contains a value of: 0x%x. Speed is: %d MHz\n",
 		cpu, (pcch_virt_addr + pcc_cpu_data->output_offset),
 		output_buffer, curr_freq);
 
 	freq_limit = (output_buffer >> 8) & 0xff;
 	if (freq_limit != 0xff) {
-		dprintk("get: frequency for cpu %d is being temporarily"
+		pr_debug("get: frequency for cpu %d is being temporarily"
 			" capped at %d\n", cpu, curr_freq);
 	}
 
@@ -212,7 +209,7 @@ static int pcc_cpufreq_target(struct cpufreq_policy *policy,
 	cpu = policy->cpu;
 	pcc_cpu_data = per_cpu_ptr(pcc_cpu_info, cpu);
 
-	dprintk("target: CPU %d should go to target freq: %d "
+	pr_debug("target: CPU %d should go to target freq: %d "
 		"(virtual) input_offset is 0x%x\n",
 		cpu, target_freq,
 		(pcch_virt_addr + pcc_cpu_data->input_offset));
@@ -234,14 +231,14 @@ static int pcc_cpufreq_target(struct cpufreq_policy *policy,
 
 	status = ioread16(&pcch_hdr->status);
 	if (status != CMD_COMPLETE) {
-		dprintk("target: FAILED for cpu %d, with status: 0x%x\n",
+		pr_debug("target: FAILED for cpu %d, with status: 0x%x\n",
 			cpu, status);
 		goto cmd_incomplete;
 	}
 	iowrite16(0, &pcch_hdr->status);
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	dprintk("target: was SUCCESSFUL for cpu %d\n", cpu);
+	pr_debug("target: was SUCCESSFUL for cpu %d\n", cpu);
 	spin_unlock(&pcc_lock);
 
 	return 0;
@@ -293,7 +290,7 @@ static int pcc_get_offset(int cpu)
 	memset_io((pcch_virt_addr + pcc_cpu_data->input_offset), 0, BUF_SZ);
 	memset_io((pcch_virt_addr + pcc_cpu_data->output_offset), 0, BUF_SZ);
 
-	dprintk("pcc_get_offset: for CPU %d: pcc_cpu_data "
+	pr_debug("pcc_get_offset: for CPU %d: pcc_cpu_data "
 		"input_offset: 0x%x, pcc_cpu_data output_offset: 0x%x\n",
 		cpu, pcc_cpu_data->input_offset, pcc_cpu_data->output_offset);
 out_free:
@@ -410,7 +407,7 @@ static int __init pcc_cpufreq_probe(void)
 	if (ACPI_SUCCESS(status)) {
 		ret = pcc_cpufreq_do_osc(&osc_handle);
 		if (ret)
-			dprintk("probe: _OSC evaluation did not succeed\n");
+			pr_debug("probe: _OSC evaluation did not succeed\n");
 		/* Firmware's use of _OSC is optional */
 		ret = 0;
 	}
@@ -433,7 +430,7 @@ static int __init pcc_cpufreq_probe(void)
 
 	mem_resource = (struct pcc_memory_resource *)member->buffer.pointer;
 
-	dprintk("probe: mem_resource descriptor: 0x%x,"
+	pr_debug("probe: mem_resource descriptor: 0x%x,"
 		" length: %d, space_id: %d, resource_usage: %d,"
 		" type_specific: %d, granularity: 0x%llx,"
 		" minimum: 0x%llx, maximum: 0x%llx,"
@@ -453,13 +450,13 @@ static int __init pcc_cpufreq_probe(void)
 	pcch_virt_addr = ioremap_nocache(mem_resource->minimum,
 					mem_resource->address_length);
 	if (pcch_virt_addr == NULL) {
-		dprintk("probe: could not map shared mem region\n");
+		pr_debug("probe: could not map shared mem region\n");
 		goto out_free;
 	}
 	pcch_hdr = pcch_virt_addr;
 
-	dprintk("probe: PCCH header (virtual) addr: 0x%p\n", pcch_hdr);
-	dprintk("probe: PCCH header is at physical address: 0x%llx,"
+	pr_debug("probe: PCCH header (virtual) addr: 0x%p\n", pcch_hdr);
+	pr_debug("probe: PCCH header is at physical address: 0x%llx,"
 		" signature: 0x%x, length: %d bytes, major: %d, minor: %d,"
 		" supported features: 0x%x, command field: 0x%x,"
 		" status field: 0x%x, nominal latency: %d us\n",
@@ -469,7 +466,7 @@ static int __init pcc_cpufreq_probe(void)
 		ioread16(&pcch_hdr->command), ioread16(&pcch_hdr->status),
 		ioread32(&pcch_hdr->latency));
 
-	dprintk("probe: min time between commands: %d us,"
+	pr_debug("probe: min time between commands: %d us,"
 		" max time between commands: %d us,"
 		" nominal CPU frequency: %d MHz,"
 		" minimum CPU frequency: %d MHz,"
@@ -494,7 +491,7 @@ static int __init pcc_cpufreq_probe(void)
 	doorbell.access_width = 64;
 	doorbell.address = reg_resource->address;
 
-	dprintk("probe: doorbell: space_id is %d, bit_width is %d, "
+	pr_debug("probe: doorbell: space_id is %d, bit_width is %d, "
 		"bit_offset is %d, access_width is %d, address is 0x%llx\n",
 		doorbell.space_id, doorbell.bit_width, doorbell.bit_offset,
 		doorbell.access_width, reg_resource->address);
@@ -515,7 +512,7 @@ static int __init pcc_cpufreq_probe(void)
 
 	doorbell_write = member->integer.value;
 
-	dprintk("probe: doorbell_preserve: 0x%llx,"
+	pr_debug("probe: doorbell_preserve: 0x%llx,"
 		" doorbell_write: 0x%llx\n",
 		doorbell_preserve, doorbell_write);
 
@@ -550,7 +547,7 @@ static int pcc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 	result = pcc_get_offset(cpu);
 	if (result) {
-		dprintk("init: PCCP evaluation failed\n");
+		pr_debug("init: PCCP evaluation failed\n");
 		goto out;
 	}
 
@@ -561,12 +558,12 @@ static int pcc_cpufreq_cpu_init(struct cpufreq_policy *policy)
 	policy->cur = pcc_get_freq(cpu);
 
 	if (!policy->cur) {
-		dprintk("init: Unable to get current CPU frequency\n");
+		pr_debug("init: Unable to get current CPU frequency\n");
 		result = -EINVAL;
 		goto out;
 	}
 
-	dprintk("init: policy->max is %d, policy->min is %d\n",
+	pr_debug("init: policy->max is %d, policy->min is %d\n",
 		policy->max, policy->min);
 out:
 	return result;
@@ -597,7 +594,7 @@ static int __init pcc_cpufreq_init(void)
 
 	ret = pcc_cpufreq_probe();
 	if (ret) {
-		dprintk("pcc_cpufreq_init: PCCH evaluation failed\n");
+		pr_debug("pcc_cpufreq_init: PCCH evaluation failed\n");
 		return ret;
 	}
 
diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k7.c b/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
index 4a45fd6..c93f927 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k7.c
@@ -103,9 +103,6 @@ static unsigned int fsb;
 static unsigned int latency;
 static char have_a0;
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"powernow-k7", msg)
-
 static int check_fsb(unsigned int fsbspeed)
 {
 	int delta;
@@ -209,7 +206,7 @@ static int get_ranges(unsigned char *pst)
 		vid = *pst++;
 		powernow_table[j].index |= (vid << 8); /* upper 8 bits */
 
-		dprintk("   FID: 0x%x (%d.%dx [%dMHz])  "
+		pr_debug("   FID: 0x%x (%d.%dx [%dMHz])  "
 			 "VID: 0x%x (%d.%03dV)\n", fid, fid_codes[fid] / 10,
 			 fid_codes[fid] % 10, speed/1000, vid,
 			 mobile_vid_table[vid]/1000,
@@ -367,7 +364,7 @@ static int powernow_acpi_init(void)
 		unsigned int speed, speed_mhz;
 
 		pc.val = (unsigned long) state->control;
-		dprintk("acpi:  P%d: %d MHz %d mW %d uS control %08x SGTC %d\n",
+		pr_debug("acpi:  P%d: %d MHz %d mW %d uS control %08x SGTC %d\n",
 			 i,
 			 (u32) state->core_frequency,
 			 (u32) state->power,
@@ -401,7 +398,7 @@ static int powernow_acpi_init(void)
 				invalidate_entry(i);
 		}
 
-		dprintk("   FID: 0x%x (%d.%dx [%dMHz])  "
+		pr_debug("   FID: 0x%x (%d.%dx [%dMHz])  "
 			 "VID: 0x%x (%d.%03dV)\n", fid, fid_codes[fid] / 10,
 			 fid_codes[fid] % 10, speed_mhz, vid,
 			 mobile_vid_table[vid]/1000,
@@ -409,7 +406,7 @@ static int powernow_acpi_init(void)
 
 		if (state->core_frequency != speed_mhz) {
 			state->core_frequency = speed_mhz;
-			dprintk("   Corrected ACPI frequency to %d\n",
+			pr_debug("   Corrected ACPI frequency to %d\n",
 				speed_mhz);
 		}
 
@@ -453,8 +450,8 @@ static int powernow_acpi_init(void)
 
 static void print_pst_entry(struct pst_s *pst, unsigned int j)
 {
-	dprintk("PST:%d (@%p)\n", j, pst);
-	dprintk(" cpuid: 0x%x  fsb: %d  maxFID: 0x%x  startvid: 0x%x\n",
+	pr_debug("PST:%d (@%p)\n", j, pst);
+	pr_debug(" cpuid: 0x%x  fsb: %d  maxFID: 0x%x  startvid: 0x%x\n",
 		pst->cpuid, pst->fsbspeed, pst->maxfid, pst->startvid);
 }
 
@@ -474,20 +471,20 @@ static int powernow_decode_bios(int maxfid, int startvid)
 		p = phys_to_virt(i);
 
 		if (memcmp(p, "AMDK7PNOW!",  10) == 0) {
-			dprintk("Found PSB header at %p\n", p);
+			pr_debug("Found PSB header at %p\n", p);
 			psb = (struct psb_s *) p;
-			dprintk("Table version: 0x%x\n", psb->tableversion);
+			pr_debug("Table version: 0x%x\n", psb->tableversion);
 			if (psb->tableversion != 0x12) {
 				printk(KERN_INFO PFX "Sorry, only v1.2 tables"
 						" supported right now\n");
 				return -ENODEV;
 			}
 
-			dprintk("Flags: 0x%x\n", psb->flags);
+			pr_debug("Flags: 0x%x\n", psb->flags);
 			if ((psb->flags & 1) == 0)
-				dprintk("Mobile voltage regulator\n");
+				pr_debug("Mobile voltage regulator\n");
 			else
-				dprintk("Desktop voltage regulator\n");
+				pr_debug("Desktop voltage regulator\n");
 
 			latency = psb->settlingtime;
 			if (latency < 100) {
@@ -497,9 +494,9 @@ static int powernow_decode_bios(int maxfid, int startvid)
 						"Correcting.\n", latency);
 				latency = 100;
 			}
-			dprintk("Settling Time: %d microseconds.\n",
+			pr_debug("Settling Time: %d microseconds.\n",
 					psb->settlingtime);
-			dprintk("Has %d PST tables. (Only dumping ones "
+			pr_debug("Has %d PST tables. (Only dumping ones "
 					"relevant to this CPU).\n",
 					psb->numpst);
 
@@ -650,7 +647,7 @@ static int __cpuinit powernow_cpu_init(struct cpufreq_policy *policy)
 		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 		return -EINVAL;
 	}
-	dprintk("FSB: %3dMHz\n", fsb/1000);
+	pr_debug("FSB: %3dMHz\n", fsb/1000);
 
 	if (dmi_check_system(powernow_dmi_table) || acpi_force) {
 		printk(KERN_INFO PFX "PSB/PST known to be broken.  "
diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
index 2368e38..5453cbc 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
@@ -139,7 +139,7 @@ static int query_current_values_with_pending_wait(struct powernow_k8_data *data)
 	}
 	do {
 		if (i++ > 10000) {
-			dprintk("detected change pending stuck\n");
+			pr_debug("detected change pending stuck\n");
 			return 1;
 		}
 		rdmsr(MSR_FIDVID_STATUS, lo, hi);
@@ -176,7 +176,7 @@ static void fidvid_msr_init(void)
 	fid = lo & MSR_S_LO_CURRENT_FID;
 	lo = fid | (vid << MSR_C_LO_VID_SHIFT);
 	hi = MSR_C_HI_STP_GNT_BENIGN;
-	dprintk("cpu%d, init lo 0x%x, hi 0x%x\n", smp_processor_id(), lo, hi);
+	pr_debug("cpu%d, init lo 0x%x, hi 0x%x\n", smp_processor_id(), lo, hi);
 	wrmsr(MSR_FIDVID_CTL, lo, hi);
 }
 
@@ -196,7 +196,7 @@ static int write_new_fid(struct powernow_k8_data *data, u32 fid)
 	lo |= (data->currvid << MSR_C_LO_VID_SHIFT);
 	lo |= MSR_C_LO_INIT_FID_VID;
 
-	dprintk("writing fid 0x%x, lo 0x%x, hi 0x%x\n",
+	pr_debug("writing fid 0x%x, lo 0x%x, hi 0x%x\n",
 		fid, lo, data->plllock * PLL_LOCK_CONVERSION);
 
 	do {
@@ -244,7 +244,7 @@ static int write_new_vid(struct powernow_k8_data *data, u32 vid)
 	lo |= (vid << MSR_C_LO_VID_SHIFT);
 	lo |= MSR_C_LO_INIT_FID_VID;
 
-	dprintk("writing vid 0x%x, lo 0x%x, hi 0x%x\n",
+	pr_debug("writing vid 0x%x, lo 0x%x, hi 0x%x\n",
 		vid, lo, STOP_GRANT_5NS);
 
 	do {
@@ -325,7 +325,7 @@ static int transition_fid_vid(struct powernow_k8_data *data,
 		return 1;
 	}
 
-	dprintk("transitioned (cpu%d): new fid 0x%x, vid 0x%x\n",
+	pr_debug("transitioned (cpu%d): new fid 0x%x, vid 0x%x\n",
 		smp_processor_id(), data->currfid, data->currvid);
 
 	return 0;
@@ -339,7 +339,7 @@ static int core_voltage_pre_transition(struct powernow_k8_data *data,
 	u32 savefid = data->currfid;
 	u32 maxvid, lo, rvomult = 1;
 
-	dprintk("ph1 (cpu%d): start, currfid 0x%x, currvid 0x%x, "
+	pr_debug("ph1 (cpu%d): start, currfid 0x%x, currvid 0x%x, "
 		"reqvid 0x%x, rvo 0x%x\n",
 		smp_processor_id(),
 		data->currfid, data->currvid, reqvid, data->rvo);
@@ -349,12 +349,12 @@ static int core_voltage_pre_transition(struct powernow_k8_data *data,
 	rvosteps *= rvomult;
 	rdmsr(MSR_FIDVID_STATUS, lo, maxvid);
 	maxvid = 0x1f & (maxvid >> 16);
-	dprintk("ph1 maxvid=0x%x\n", maxvid);
+	pr_debug("ph1 maxvid=0x%x\n", maxvid);
 	if (reqvid < maxvid) /* lower numbers are higher voltages */
 		reqvid = maxvid;
 
 	while (data->currvid > reqvid) {
-		dprintk("ph1: curr 0x%x, req vid 0x%x\n",
+		pr_debug("ph1: curr 0x%x, req vid 0x%x\n",
 			data->currvid, reqvid);
 		if (decrease_vid_code_by_step(data, reqvid, data->vidmvs))
 			return 1;
@@ -365,7 +365,7 @@ static int core_voltage_pre_transition(struct powernow_k8_data *data,
 		if (data->currvid == maxvid) {
 			rvosteps = 0;
 		} else {
-			dprintk("ph1: changing vid for rvo, req 0x%x\n",
+			pr_debug("ph1: changing vid for rvo, req 0x%x\n",
 				data->currvid - 1);
 			if (decrease_vid_code_by_step(data, data->currvid-1, 1))
 				return 1;
@@ -382,7 +382,7 @@ static int core_voltage_pre_transition(struct powernow_k8_data *data,
 		return 1;
 	}
 
-	dprintk("ph1 complete, currfid 0x%x, currvid 0x%x\n",
+	pr_debug("ph1 complete, currfid 0x%x, currvid 0x%x\n",
 		data->currfid, data->currvid);
 
 	return 0;
@@ -400,7 +400,7 @@ static int core_frequency_transition(struct powernow_k8_data *data, u32 reqfid)
 		return 0;
 	}
 
-	dprintk("ph2 (cpu%d): starting, currfid 0x%x, currvid 0x%x, "
+	pr_debug("ph2 (cpu%d): starting, currfid 0x%x, currvid 0x%x, "
 		"reqfid 0x%x\n",
 		smp_processor_id(),
 		data->currfid, data->currvid, reqfid);
@@ -457,7 +457,7 @@ static int core_frequency_transition(struct powernow_k8_data *data, u32 reqfid)
 		return 1;
 	}
 
-	dprintk("ph2 complete, currfid 0x%x, currvid 0x%x\n",
+	pr_debug("ph2 complete, currfid 0x%x, currvid 0x%x\n",
 		data->currfid, data->currvid);
 
 	return 0;
@@ -470,7 +470,7 @@ static int core_voltage_post_transition(struct powernow_k8_data *data,
 	u32 savefid = data->currfid;
 	u32 savereqvid = reqvid;
 
-	dprintk("ph3 (cpu%d): starting, currfid 0x%x, currvid 0x%x\n",
+	pr_debug("ph3 (cpu%d): starting, currfid 0x%x, currvid 0x%x\n",
 		smp_processor_id(),
 		data->currfid, data->currvid);
 
@@ -498,17 +498,17 @@ static int core_voltage_post_transition(struct powernow_k8_data *data,
 		return 1;
 
 	if (savereqvid != data->currvid) {
-		dprintk("ph3 failed, currvid 0x%x\n", data->currvid);
+		pr_debug("ph3 failed, currvid 0x%x\n", data->currvid);
 		return 1;
 	}
 
 	if (savefid != data->currfid) {
-		dprintk("ph3 failed, currfid changed 0x%x\n",
+		pr_debug("ph3 failed, currfid changed 0x%x\n",
 			data->currfid);
 		return 1;
 	}
 
-	dprintk("ph3 complete, currfid 0x%x, currvid 0x%x\n",
+	pr_debug("ph3 complete, currfid 0x%x, currvid 0x%x\n",
 		data->currfid, data->currvid);
 
 	return 0;
@@ -707,7 +707,7 @@ static int fill_powernow_table(struct powernow_k8_data *data,
 		return -EIO;
 	}
 
-	dprintk("cfid 0x%x, cvid 0x%x\n", data->currfid, data->currvid);
+	pr_debug("cfid 0x%x, cvid 0x%x\n", data->currfid, data->currvid);
 	data->powernow_table = powernow_table;
 	if (cpumask_first(cpu_core_mask(data->cpu)) == data->cpu)
 		print_basics(data);
@@ -717,7 +717,7 @@ static int fill_powernow_table(struct powernow_k8_data *data,
 		    (pst[j].vid == data->currvid))
 			return 0;
 
-	dprintk("currfid/vid do not match PST, ignoring\n");
+	pr_debug("currfid/vid do not match PST, ignoring\n");
 	return 0;
 }
 
@@ -739,36 +739,36 @@ static int find_psb_table(struct powernow_k8_data *data)
 		if (memcmp(psb, PSB_ID_STRING, PSB_ID_STRING_LEN) != 0)
 			continue;
 
-		dprintk("found PSB header at 0x%p\n", psb);
+		pr_debug("found PSB header at 0x%p\n", psb);
 
-		dprintk("table vers: 0x%x\n", psb->tableversion);
+		pr_debug("table vers: 0x%x\n", psb->tableversion);
 		if (psb->tableversion != PSB_VERSION_1_4) {
 			printk(KERN_ERR FW_BUG PFX "PSB table is not v1.4\n");
 			return -ENODEV;
 		}
 
-		dprintk("flags: 0x%x\n", psb->flags1);
+		pr_debug("flags: 0x%x\n", psb->flags1);
 		if (psb->flags1) {
 			printk(KERN_ERR FW_BUG PFX "unknown flags\n");
 			return -ENODEV;
 		}
 
 		data->vstable = psb->vstable;
-		dprintk("voltage stabilization time: %d(*20us)\n",
+		pr_debug("voltage stabilization time: %d(*20us)\n",
 				data->vstable);
 
-		dprintk("flags2: 0x%x\n", psb->flags2);
+		pr_debug("flags2: 0x%x\n", psb->flags2);
 		data->rvo = psb->flags2 & 3;
 		data->irt = ((psb->flags2) >> 2) & 3;
 		mvs = ((psb->flags2) >> 4) & 3;
 		data->vidmvs = 1 << mvs;
 		data->batps = ((psb->flags2) >> 6) & 3;
 
-		dprintk("ramp voltage offset: %d\n", data->rvo);
-		dprintk("isochronous relief time: %d\n", data->irt);
-		dprintk("maximum voltage step: %d - 0x%x\n", mvs, data->vidmvs);
+		pr_debug("ramp voltage offset: %d\n", data->rvo);
+		pr_debug("isochronous relief time: %d\n", data->irt);
+		pr_debug("maximum voltage step: %d - 0x%x\n", mvs, data->vidmvs);
 
-		dprintk("numpst: 0x%x\n", psb->num_tables);
+		pr_debug("numpst: 0x%x\n", psb->num_tables);
 		cpst = psb->num_tables;
 		if ((psb->cpuid == 0x00000fc0) ||
 		    (psb->cpuid == 0x00000fe0)) {
@@ -783,13 +783,13 @@ static int find_psb_table(struct powernow_k8_data *data)
 		}
 
 		data->plllock = psb->plllocktime;
-		dprintk("plllocktime: 0x%x (units 1us)\n", psb->plllocktime);
-		dprintk("maxfid: 0x%x\n", psb->maxfid);
-		dprintk("maxvid: 0x%x\n", psb->maxvid);
+		pr_debug("plllocktime: 0x%x (units 1us)\n", psb->plllocktime);
+		pr_debug("maxfid: 0x%x\n", psb->maxfid);
+		pr_debug("maxvid: 0x%x\n", psb->maxvid);
 		maxvid = psb->maxvid;
 
 		data->numps = psb->numps;
-		dprintk("numpstates: 0x%x\n", data->numps);
+		pr_debug("numpstates: 0x%x\n", data->numps);
 		return fill_powernow_table(data,
 				(struct pst_s *)(psb+1), maxvid);
 	}
@@ -834,13 +834,13 @@ static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
 	u64 control, status;
 
 	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
-		dprintk("register performance failed: bad ACPI data\n");
+		pr_debug("register performance failed: bad ACPI data\n");
 		return -EIO;
 	}
 
 	/* verify the data contained in the ACPI structures */
 	if (data->acpi_data.state_count <= 1) {
-		dprintk("No ACPI P-States\n");
+		pr_debug("No ACPI P-States\n");
 		goto err_out;
 	}
 
@@ -849,7 +849,7 @@ static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
 
 	if ((control != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
 	    (status != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
-		dprintk("Invalid control/status registers (%x - %x)\n",
+		pr_debug("Invalid control/status registers (%x - %x)\n",
 			control, status);
 		goto err_out;
 	}
@@ -858,7 +858,7 @@ static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table)
 		* (data->acpi_data.state_count + 1)), GFP_KERNEL);
 	if (!powernow_table) {
-		dprintk("powernow_table memory alloc failure\n");
+		pr_debug("powernow_table memory alloc failure\n");
 		goto err_out;
 	}
 
@@ -928,7 +928,7 @@ static int fill_powernow_table_pstate(struct powernow_k8_data *data,
 		}
 		rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
 		if (!(hi & HW_PSTATE_VALID_MASK)) {
-			dprintk("invalid pstate %d, ignoring\n", index);
+			pr_debug("invalid pstate %d, ignoring\n", index);
 			invalidate_entry(powernow_table, i);
 			continue;
 		}
@@ -968,7 +968,7 @@ static int fill_powernow_table_fidvid(struct powernow_k8_data *data,
 			vid = (control >> VID_SHIFT) & VID_MASK;
 		}
 
-		dprintk("   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
+		pr_debug("   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
 
 		index = fid | (vid<<8);
 		powernow_table[i].index = index;
@@ -978,7 +978,7 @@ static int fill_powernow_table_fidvid(struct powernow_k8_data *data,
 
 		/* verify frequency is OK */
 		if ((freq > (MAX_FREQ * 1000)) || (freq < (MIN_FREQ * 1000))) {
-			dprintk("invalid freq %u kHz, ignoring\n", freq);
+			pr_debug("invalid freq %u kHz, ignoring\n", freq);
 			invalidate_entry(powernow_table, i);
 			continue;
 		}
@@ -986,7 +986,7 @@ static int fill_powernow_table_fidvid(struct powernow_k8_data *data,
 		/* verify voltage is OK -
 		 * BIOSs are using "off" to indicate invalid */
 		if (vid == VID_OFF) {
-			dprintk("invalid vid %u, ignoring\n", vid);
+			pr_debug("invalid vid %u, ignoring\n", vid);
 			invalidate_entry(powernow_table, i);
 			continue;
 		}
@@ -1047,7 +1047,7 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
 	int res, i;
 	struct cpufreq_freqs freqs;
 
-	dprintk("cpu %d transition to index %u\n", smp_processor_id(), index);
+	pr_debug("cpu %d transition to index %u\n", smp_processor_id(), index);
 
 	/* fid/vid correctness check for k8 */
 	/* fid are the lower 8 bits of the index we stored into
@@ -1057,18 +1057,18 @@ static int transition_frequency_fidvid(struct powernow_k8_data *data,
 	fid = data->powernow_table[index].index & 0xFF;
 	vid = (data->powernow_table[index].index & 0xFF00) >> 8;
 
-	dprintk("table matched fid 0x%x, giving vid 0x%x\n", fid, vid);
+	pr_debug("table matched fid 0x%x, giving vid 0x%x\n", fid, vid);
 
 	if (query_current_values_with_pending_wait(data))
 		return 1;
 
 	if ((data->currvid == vid) && (data->currfid == fid)) {
-		dprintk("target matches current values (fid 0x%x, vid 0x%x)\n",
+		pr_debug("target matches current values (fid 0x%x, vid 0x%x)\n",
 			fid, vid);
 		return 0;
 	}
 
-	dprintk("cpu %d, changing to fid 0x%x, vid 0x%x\n",
+	pr_debug("cpu %d, changing to fid 0x%x, vid 0x%x\n",
 		smp_processor_id(), fid, vid);
 	freqs.old = find_khz_freq_from_fid(data->currfid);
 	freqs.new = find_khz_freq_from_fid(fid);
@@ -1096,7 +1096,7 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
 	int res, i;
 	struct cpufreq_freqs freqs;
 
-	dprintk("cpu %d transition to index %u\n", smp_processor_id(), index);
+	pr_debug("cpu %d transition to index %u\n", smp_processor_id(), index);
 
 	/* get MSR index for hardware pstate transition */
 	pstate = index & HW_PSTATE_MASK;
@@ -1156,14 +1156,14 @@ static int powernowk8_target(struct cpufreq_policy *pol,
 		goto err_out;
 	}
 
-	dprintk("targ: cpu %d, %d kHz, min %d, max %d, relation %d\n",
+	pr_debug("targ: cpu %d, %d kHz, min %d, max %d, relation %d\n",
 		pol->cpu, targfreq, pol->min, pol->max, relation);
 
 	if (query_current_values_with_pending_wait(data))
 		goto err_out;
 
 	if (cpu_family != CPU_HW_PSTATE) {
-		dprintk("targ: curr fid 0x%x, vid 0x%x\n",
+		pr_debug("targ: curr fid 0x%x, vid 0x%x\n",
 		data->currfid, data->currvid);
 
 		if ((checkvid != data->currvid) ||
@@ -1319,7 +1319,7 @@ static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
 				data->currpstate);
 	else
 		pol->cur = find_khz_freq_from_fid(data->currfid);
-	dprintk("policy current frequency %d kHz\n", pol->cur);
+	pr_debug("policy current frequency %d kHz\n", pol->cur);
 
 	/* min/max the cpu is capable of */
 	if (cpufreq_frequency_table_cpuinfo(pol, data->powernow_table)) {
@@ -1337,10 +1337,10 @@ static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
 	cpufreq_frequency_table_get_attr(data->powernow_table, pol->cpu);
 
 	if (cpu_family == CPU_HW_PSTATE)
-		dprintk("cpu_init done, current pstate 0x%x\n",
+		pr_debug("cpu_init done, current pstate 0x%x\n",
 				data->currpstate);
 	else
-		dprintk("cpu_init done, current fid 0x%x, vid 0x%x\n",
+		pr_debug("cpu_init done, current fid 0x%x, vid 0x%x\n",
 			data->currfid, data->currvid);
 
 	per_cpu(powernow_data, pol->cpu) = data;
@@ -1586,7 +1586,7 @@ static int __cpuinit powernowk8_init(void)
 /* driver entry point for term */
 static void __exit powernowk8_exit(void)
 {
-	dprintk("exit\n");
+	pr_debug("exit\n");
 
 	if (boot_cpu_has(X86_FEATURE_CPB)) {
 		msrs_free(msrs);
diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.h b/arch/x86/kernel/cpu/cpufreq/powernow-k8.h
index df3529b..3744d26 100644
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.h
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.h
@@ -211,8 +211,6 @@ struct pst_s {
 	u8 vid;
 };
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "powernow-k8", msg)
-
 static int core_voltage_pre_transition(struct powernow_k8_data *data,
 	u32 reqvid, u32 regfid);
 static int core_voltage_post_transition(struct powernow_k8_data *data, u32 reqvid);
diff --git a/arch/x86/kernel/cpu/cpufreq/sc520_freq.c b/arch/x86/kernel/cpu/cpufreq/sc520_freq.c
index 435a996..1e205e6 100644
--- a/arch/x86/kernel/cpu/cpufreq/sc520_freq.c
+++ b/arch/x86/kernel/cpu/cpufreq/sc520_freq.c
@@ -29,8 +29,6 @@
 
 static __u8 __iomem *cpuctl;
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"sc520_freq", msg)
 #define PFX "sc520_freq: "
 
 static struct cpufreq_frequency_table sc520_freq_table[] = {
@@ -66,7 +64,7 @@ static void sc520_freq_set_cpu_state(unsigned int state)
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	dprintk("attempting to set frequency to %i kHz\n",
+	pr_debug("attempting to set frequency to %i kHz\n",
 			sc520_freq_table[state].frequency);
 
 	local_irq_disable();
@@ -161,7 +159,7 @@ static int __init sc520_freq_init(void)
 	/* Test if we have the right hardware */
 	if (c->x86_vendor != X86_VENDOR_AMD ||
 	    c->x86 != 4 || c->x86_model != 9) {
-		dprintk("no Elan SC520 processor found!\n");
+		pr_debug("no Elan SC520 processor found!\n");
 		return -ENODEV;
 	}
 	cpuctl = ioremap((unsigned long)(MMCR_BASE + OFFS_CPUCTL), 1);
diff --git a/arch/x86/kernel/cpu/cpufreq/speedstep-centrino.c b/arch/x86/kernel/cpu/cpufreq/speedstep-centrino.c
index 9b1ff37..6ea3455 100644
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-centrino.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-centrino.c
@@ -29,9 +29,6 @@
 #define PFX		"speedstep-centrino: "
 #define MAINTAINER	"cpufreq@vger.kernel.org"
 
-#define dprintk(msg...) \
-	cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "speedstep-centrino", msg)
-
 #define INTEL_MSR_RANGE	(0xffff)
 
 struct cpu_id
@@ -244,7 +241,7 @@ static int centrino_cpu_init_table(struct cpufreq_policy *policy)
 
 	if (model->cpu_id == NULL) {
 		/* No match at all */
-		dprintk("no support for CPU model \"%s\": "
+		pr_debug("no support for CPU model \"%s\": "
 		       "send /proc/cpuinfo to " MAINTAINER "\n",
 		       cpu->x86_model_id);
 		return -ENOENT;
@@ -252,15 +249,15 @@ static int centrino_cpu_init_table(struct cpufreq_policy *policy)
 
 	if (model->op_points == NULL) {
 		/* Matched a non-match */
-		dprintk("no table support for CPU model \"%s\"\n",
+		pr_debug("no table support for CPU model \"%s\"\n",
 		       cpu->x86_model_id);
-		dprintk("try using the acpi-cpufreq driver\n");
+		pr_debug("try using the acpi-cpufreq driver\n");
 		return -ENOENT;
 	}
 
 	per_cpu(centrino_model, policy->cpu) = model;
 
-	dprintk("found \"%s\": max frequency: %dkHz\n",
+	pr_debug("found \"%s\": max frequency: %dkHz\n",
 	       model->model_name, model->max_freq);
 
 	return 0;
@@ -369,7 +366,7 @@ static int centrino_cpu_init(struct cpufreq_policy *policy)
 		per_cpu(centrino_cpu, policy->cpu) = &cpu_ids[i];
 
 	if (!per_cpu(centrino_cpu, policy->cpu)) {
-		dprintk("found unsupported CPU with "
+		pr_debug("found unsupported CPU with "
 		"Enhanced SpeedStep: send /proc/cpuinfo to "
 		MAINTAINER "\n");
 		return -ENODEV;
@@ -385,7 +382,7 @@ static int centrino_cpu_init(struct cpufreq_policy *policy)
 
 	if (!(l & MSR_IA32_MISC_ENABLE_ENHANCED_SPEEDSTEP)) {
 		l |= MSR_IA32_MISC_ENABLE_ENHANCED_SPEEDSTEP;
-		dprintk("trying to enable Enhanced SpeedStep (%x)\n", l);
+		pr_debug("trying to enable Enhanced SpeedStep (%x)\n", l);
 		wrmsr(MSR_IA32_MISC_ENABLE, l, h);
 
 		/* check to see if it stuck */
@@ -402,7 +399,7 @@ static int centrino_cpu_init(struct cpufreq_policy *policy)
 						/* 10uS transition latency */
 	policy->cur = freq;
 
-	dprintk("centrino_cpu_init: cur=%dkHz\n", policy->cur);
+	pr_debug("centrino_cpu_init: cur=%dkHz\n", policy->cur);
 
 	ret = cpufreq_frequency_table_cpuinfo(policy,
 		per_cpu(centrino_model, policy->cpu)->op_points);
@@ -498,7 +495,7 @@ static int centrino_target (struct cpufreq_policy *policy,
 			good_cpu = j;
 
 		if (good_cpu >= nr_cpu_ids) {
-			dprintk("couldn't limit to CPUs in this domain\n");
+			pr_debug("couldn't limit to CPUs in this domain\n");
 			retval = -EAGAIN;
 			if (first_cpu) {
 				/* We haven't started the transition yet. */
@@ -512,7 +509,7 @@ static int centrino_target (struct cpufreq_policy *policy,
 		if (first_cpu) {
 			rdmsr_on_cpu(good_cpu, MSR_IA32_PERF_CTL, &oldmsr, &h);
 			if (msr == (oldmsr & 0xffff)) {
-				dprintk("no change needed - msr was and needs "
+				pr_debug("no change needed - msr was and needs "
 					"to be %x\n", oldmsr);
 				retval = 0;
 				goto out;
@@ -521,7 +518,7 @@ static int centrino_target (struct cpufreq_policy *policy,
 			freqs.old = extract_clock(oldmsr, cpu, 0);
 			freqs.new = extract_clock(msr, cpu, 0);
 
-			dprintk("target=%dkHz old=%d new=%d msr=%04x\n",
+			pr_debug("target=%dkHz old=%d new=%d msr=%04x\n",
 				target_freq, freqs.old, freqs.new, msr);
 
 			for_each_cpu(k, policy->cpus) {
diff --git a/arch/x86/kernel/cpu/cpufreq/speedstep-ich.c b/arch/x86/kernel/cpu/cpufreq/speedstep-ich.c
index 561758e..a748ce7 100644
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-ich.c
@@ -53,10 +53,6 @@ static struct cpufreq_frequency_table speedstep_freqs[] = {
 };
 
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"speedstep-ich", msg)
-
-
 /**
  * speedstep_find_register - read the PMBASE address
  *
@@ -80,7 +76,7 @@ static int speedstep_find_register(void)
 		return -ENODEV;
 	}
 
-	dprintk("pmbase is 0x%x\n", pmbase);
+	pr_debug("pmbase is 0x%x\n", pmbase);
 	return 0;
 }
 
@@ -106,13 +102,13 @@ static void speedstep_set_state(unsigned int state)
 	/* read state */
 	value = inb(pmbase + 0x50);
 
-	dprintk("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
+	pr_debug("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
 
 	/* write new state */
 	value &= 0xFE;
 	value |= state;
 
-	dprintk("writing 0x%x to pmbase 0x%x + 0x50\n", value, pmbase);
+	pr_debug("writing 0x%x to pmbase 0x%x + 0x50\n", value, pmbase);
 
 	/* Disable bus master arbitration */
 	pm2_blk = inb(pmbase + 0x20);
@@ -132,10 +128,10 @@ static void speedstep_set_state(unsigned int state)
 	/* Enable IRQs */
 	local_irq_restore(flags);
 
-	dprintk("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
+	pr_debug("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
 
 	if (state == (value & 0x1))
-		dprintk("change to %u MHz succeeded\n",
+		pr_debug("change to %u MHz succeeded\n",
 			speedstep_get_frequency(speedstep_processor) / 1000);
 	else
 		printk(KERN_ERR "cpufreq: change failed - I/O error\n");
@@ -165,7 +161,7 @@ static int speedstep_activate(void)
 	pci_read_config_word(speedstep_chipset_dev, 0x00A0, &value);
 	if (!(value & 0x08)) {
 		value |= 0x08;
-		dprintk("activating SpeedStep (TM) registers\n");
+		pr_debug("activating SpeedStep (TM) registers\n");
 		pci_write_config_word(speedstep_chipset_dev, 0x00A0, value);
 	}
 
@@ -218,7 +214,7 @@ static unsigned int speedstep_detect_chipset(void)
 			return 2; /* 2-M */
 
 		if (hostbridge->revision < 5) {
-			dprintk("hostbridge does not support speedstep\n");
+			pr_debug("hostbridge does not support speedstep\n");
 			speedstep_chipset_dev = NULL;
 			pci_dev_put(hostbridge);
 			return 0;
@@ -246,7 +242,7 @@ static unsigned int speedstep_get(unsigned int cpu)
 	if (smp_call_function_single(cpu, get_freq_data, &speed, 1) != 0)
 		BUG();
 
-	dprintk("detected %u kHz as current frequency\n", speed);
+	pr_debug("detected %u kHz as current frequency\n", speed);
 	return speed;
 }
 
@@ -276,7 +272,7 @@ static int speedstep_target(struct cpufreq_policy *policy,
 	freqs.new = speedstep_freqs[newstate].frequency;
 	freqs.cpu = policy->cpu;
 
-	dprintk("transiting from %u to %u kHz\n", freqs.old, freqs.new);
+	pr_debug("transiting from %u to %u kHz\n", freqs.old, freqs.new);
 
 	/* no transition necessary */
 	if (freqs.old == freqs.new)
@@ -351,7 +347,7 @@ static int speedstep_cpu_init(struct cpufreq_policy *policy)
 	if (!speed)
 		return -EIO;
 
-	dprintk("currently at %s speed setting - %i MHz\n",
+	pr_debug("currently at %s speed setting - %i MHz\n",
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency)
 		? "low" : "high",
 		(speed / 1000));
@@ -405,14 +401,14 @@ static int __init speedstep_init(void)
 	/* detect processor */
 	speedstep_processor = speedstep_detect_processor();
 	if (!speedstep_processor) {
-		dprintk("Intel(R) SpeedStep(TM) capable processor "
+		pr_debug("Intel(R) SpeedStep(TM) capable processor "
 				"not found\n");
 		return -ENODEV;
 	}
 
 	/* detect chipset */
 	if (!speedstep_detect_chipset()) {
-		dprintk("Intel(R) SpeedStep(TM) for this chipset not "
+		pr_debug("Intel(R) SpeedStep(TM) for this chipset not "
 				"(yet) available.\n");
 		return -ENODEV;
 	}
diff --git a/arch/x86/kernel/cpu/cpufreq/speedstep-lib.c b/arch/x86/kernel/cpu/cpufreq/speedstep-lib.c
index a94ec6b..8af2d2f 100644
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-lib.c
@@ -18,9 +18,6 @@
 #include <asm/tsc.h>
 #include "speedstep-lib.h"
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"speedstep-lib", msg)
-
 #define PFX "speedstep-lib: "
 
 #ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
@@ -75,7 +72,7 @@ static unsigned int pentium3_get_frequency(enum speedstep_processor processor)
 
 	/* read MSR 0x2a - we only need the low 32 bits */
 	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
-	dprintk("P3 - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
+	pr_debug("P3 - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
 	msr_tmp = msr_lo;
 
 	/* decode the FSB */
@@ -89,7 +86,7 @@ static unsigned int pentium3_get_frequency(enum speedstep_processor processor)
 
 	/* decode the multiplier */
 	if (processor == SPEEDSTEP_CPU_PIII_C_EARLY) {
-		dprintk("workaround for early PIIIs\n");
+		pr_debug("workaround for early PIIIs\n");
 		msr_lo &= 0x03c00000;
 	} else
 		msr_lo &= 0x0bc00000;
@@ -100,7 +97,7 @@ static unsigned int pentium3_get_frequency(enum speedstep_processor processor)
 		j++;
 	}
 
-	dprintk("speed is %u\n",
+	pr_debug("speed is %u\n",
 		(msr_decode_mult[j].ratio * msr_decode_fsb[i].value * 100));
 
 	return msr_decode_mult[j].ratio * msr_decode_fsb[i].value * 100;
@@ -112,7 +109,7 @@ static unsigned int pentiumM_get_frequency(void)
 	u32 msr_lo, msr_tmp;
 
 	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
-	dprintk("PM - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
+	pr_debug("PM - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n", msr_lo, msr_tmp);
 
 	/* see table B-2 of 24547212.pdf */
 	if (msr_lo & 0x00040000) {
@@ -122,7 +119,7 @@ static unsigned int pentiumM_get_frequency(void)
 	}
 
 	msr_tmp = (msr_lo >> 22) & 0x1f;
-	dprintk("bits 22-26 are 0x%x, speed is %u\n",
+	pr_debug("bits 22-26 are 0x%x, speed is %u\n",
 			msr_tmp, (msr_tmp * 100 * 1000));
 
 	return msr_tmp * 100 * 1000;
@@ -160,11 +157,11 @@ static unsigned int pentium_core_get_frequency(void)
 	}
 
 	rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_tmp);
-	dprintk("PCORE - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n",
+	pr_debug("PCORE - MSR_IA32_EBL_CR_POWERON: 0x%x 0x%x\n",
 			msr_lo, msr_tmp);
 
 	msr_tmp = (msr_lo >> 22) & 0x1f;
-	dprintk("bits 22-26 are 0x%x, speed is %u\n",
+	pr_debug("bits 22-26 are 0x%x, speed is %u\n",
 			msr_tmp, (msr_tmp * fsb));
 
 	ret = (msr_tmp * fsb);
@@ -190,7 +187,7 @@ static unsigned int pentium4_get_frequency(void)
 
 	rdmsr(0x2c, msr_lo, msr_hi);
 
-	dprintk("P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
+	pr_debug("P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, msr_hi);
 
 	/* decode the FSB: see IA-32 Intel (C) Architecture Software
 	 * Developer's Manual, Volume 3: System Prgramming Guide,
@@ -217,7 +214,7 @@ static unsigned int pentium4_get_frequency(void)
 	/* Multiplier. */
 	mult = msr_lo >> 24;
 
-	dprintk("P4 - FSB %u kHz; Multiplier %u; Speed %u kHz\n",
+	pr_debug("P4 - FSB %u kHz; Multiplier %u; Speed %u kHz\n",
 			fsb, mult, (fsb * mult));
 
 	ret = (fsb * mult);
@@ -257,7 +254,7 @@ unsigned int speedstep_detect_processor(void)
 	struct cpuinfo_x86 *c = &cpu_data(0);
 	u32 ebx, msr_lo, msr_hi;
 
-	dprintk("x86: %x, model: %x\n", c->x86, c->x86_model);
+	pr_debug("x86: %x, model: %x\n", c->x86, c->x86_model);
 
 	if ((c->x86_vendor != X86_VENDOR_INTEL) ||
 	    ((c->x86 != 6) && (c->x86 != 0xF)))
@@ -272,7 +269,7 @@ unsigned int speedstep_detect_processor(void)
 		ebx = cpuid_ebx(0x00000001);
 		ebx &= 0x000000FF;
 
-		dprintk("ebx value is %x, x86_mask is %x\n", ebx, c->x86_mask);
+		pr_debug("ebx value is %x, x86_mask is %x\n", ebx, c->x86_mask);
 
 		switch (c->x86_mask) {
 		case 4:
@@ -327,7 +324,7 @@ unsigned int speedstep_detect_processor(void)
 		/* cpuid_ebx(1) is 0x04 for desktop PIII,
 		 * 0x06 for mobile PIII-M */
 		ebx = cpuid_ebx(0x00000001);
-		dprintk("ebx is %x\n", ebx);
+		pr_debug("ebx is %x\n", ebx);
 
 		ebx &= 0x000000FF;
 
@@ -344,7 +341,7 @@ unsigned int speedstep_detect_processor(void)
 		/* all mobile PIII Coppermines have FSB 100 MHz
 		 * ==> sort out a few desktop PIIIs. */
 		rdmsr(MSR_IA32_EBL_CR_POWERON, msr_lo, msr_hi);
-		dprintk("Coppermine: MSR_IA32_EBL_CR_POWERON is 0x%x, 0x%x\n",
+		pr_debug("Coppermine: MSR_IA32_EBL_CR_POWERON is 0x%x, 0x%x\n",
 				msr_lo, msr_hi);
 		msr_lo &= 0x00c0000;
 		if (msr_lo != 0x0080000)
@@ -357,12 +354,12 @@ unsigned int speedstep_detect_processor(void)
 		 * bit 56 or 57 is set
 		 */
 		rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
-		dprintk("Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n",
+		pr_debug("Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n",
 				msr_lo, msr_hi);
 		if ((msr_hi & (1<<18)) &&
 		    (relaxed_check ? 1 : (msr_hi & (3<<24)))) {
 			if (c->x86_mask == 0x01) {
-				dprintk("early PIII version\n");
+				pr_debug("early PIII version\n");
 				return SPEEDSTEP_CPU_PIII_C_EARLY;
 			} else
 				return SPEEDSTEP_CPU_PIII_C;
@@ -393,14 +390,14 @@ unsigned int speedstep_get_freqs(enum speedstep_processor processor,
 	if ((!processor) || (!low_speed) || (!high_speed) || (!set_state))
 		return -EINVAL;
 
-	dprintk("trying to determine both speeds\n");
+	pr_debug("trying to determine both speeds\n");
 
 	/* get current speed */
 	prev_speed = speedstep_get_frequency(processor);
 	if (!prev_speed)
 		return -EIO;
 
-	dprintk("previous speed is %u\n", prev_speed);
+	pr_debug("previous speed is %u\n", prev_speed);
 
 	local_irq_save(flags);
 
@@ -412,7 +409,7 @@ unsigned int speedstep_get_freqs(enum speedstep_processor processor,
 		goto out;
 	}
 
-	dprintk("low speed is %u\n", *low_speed);
+	pr_debug("low speed is %u\n", *low_speed);
 
 	/* start latency measurement */
 	if (transition_latency)
@@ -431,7 +428,7 @@ unsigned int speedstep_get_freqs(enum speedstep_processor processor,
 		goto out;
 	}
 
-	dprintk("high speed is %u\n", *high_speed);
+	pr_debug("high speed is %u\n", *high_speed);
 
 	if (*low_speed == *high_speed) {
 		ret = -ENODEV;
@@ -445,7 +442,7 @@ unsigned int speedstep_get_freqs(enum speedstep_processor processor,
 	if (transition_latency) {
 		*transition_latency = (tv2.tv_sec - tv1.tv_sec) * USEC_PER_SEC +
 			tv2.tv_usec - tv1.tv_usec;
-		dprintk("transition latency is %u uSec\n", *transition_latency);
+		pr_debug("transition latency is %u uSec\n", *transition_latency);
 
 		/* convert uSec to nSec and add 20% for safety reasons */
 		*transition_latency *= 1200;
diff --git a/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c b/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
index 91bc25b..1e1fafd 100644
--- a/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
+++ b/arch/x86/kernel/cpu/cpufreq/speedstep-smi.c
@@ -55,9 +55,6 @@ static struct cpufreq_frequency_table speedstep_freqs[] = {
  * of DMA activity going on? */
 #define SMI_TRIES 5
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, \
-		"speedstep-smi", msg)
-
 /**
  * speedstep_smi_ownership
  */
@@ -70,7 +67,7 @@ static int speedstep_smi_ownership(void)
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 	magic = virt_to_phys(magic_data);
 
-	dprintk("trying to obtain ownership with command %x at port %x\n",
+	pr_debug("trying to obtain ownership with command %x at port %x\n",
 			command, smi_port);
 
 	__asm__ __volatile__(
@@ -85,7 +82,7 @@ static int speedstep_smi_ownership(void)
 		: "memory"
 	);
 
-	dprintk("result is %x\n", result);
+	pr_debug("result is %x\n", result);
 
 	return result;
 }
@@ -106,13 +103,13 @@ static int speedstep_smi_get_freqs(unsigned int *low, unsigned int *high)
 	u32 function = GET_SPEEDSTEP_FREQS;
 
 	if (!(ist_info.event & 0xFFFF)) {
-		dprintk("bug #1422 -- can't read freqs from BIOS\n");
+		pr_debug("bug #1422 -- can't read freqs from BIOS\n");
 		return -ENODEV;
 	}
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
-	dprintk("trying to determine frequencies with command %x at port %x\n",
+	pr_debug("trying to determine frequencies with command %x at port %x\n",
 			command, smi_port);
 
 	__asm__ __volatile__(
@@ -129,7 +126,7 @@ static int speedstep_smi_get_freqs(unsigned int *low, unsigned int *high)
 		  "d" (smi_port), "S" (0), "D" (0)
 	);
 
-	dprintk("result %x, low_freq %u, high_freq %u\n",
+	pr_debug("result %x, low_freq %u, high_freq %u\n",
 			result, low_mhz, high_mhz);
 
 	/* abort if results are obviously incorrect... */
@@ -154,7 +151,7 @@ static int speedstep_get_state(void)
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
-	dprintk("trying to determine current setting with command %x "
+	pr_debug("trying to determine current setting with command %x "
 		"at port %x\n", command, smi_port);
 
 	__asm__ __volatile__(
@@ -168,7 +165,7 @@ static int speedstep_get_state(void)
 		  "d" (smi_port), "S" (0), "D" (0)
 	);
 
-	dprintk("state is %x, result is %x\n", state, result);
+	pr_debug("state is %x, result is %x\n", state, result);
 
 	return state & 1;
 }
@@ -194,13 +191,13 @@ static void speedstep_set_state(unsigned int state)
 
 	command = (smi_sig & 0xffffff00) | (smi_cmd & 0xff);
 
-	dprintk("trying to set frequency to state %u "
+	pr_debug("trying to set frequency to state %u "
 		"with command %x at port %x\n",
 		state, command, smi_port);
 
 	do {
 		if (retry) {
-			dprintk("retry %u, previous result %u, waiting...\n",
+			pr_debug("retry %u, previous result %u, waiting...\n",
 					retry, result);
 			mdelay(retry * 50);
 		}
@@ -221,7 +218,7 @@ static void speedstep_set_state(unsigned int state)
 	local_irq_restore(flags);
 
 	if (new_state == state)
-		dprintk("change to %u MHz succeeded after %u tries "
+		pr_debug("change to %u MHz succeeded after %u tries "
 			"with result %u\n",
 			(speedstep_freqs[new_state].frequency / 1000),
 			retry, result);
@@ -292,7 +289,7 @@ static int speedstep_cpu_init(struct cpufreq_policy *policy)
 
 	result = speedstep_smi_ownership();
 	if (result) {
-		dprintk("fails in acquiring ownership of a SMI interface.\n");
+		pr_debug("fails in acquiring ownership of a SMI interface.\n");
 		return -EINVAL;
 	}
 
@@ -304,7 +301,7 @@ static int speedstep_cpu_init(struct cpufreq_policy *policy)
 	if (result) {
 		/* fall back to speedstep_lib.c dection mechanism:
 		 * try both states out */
-		dprintk("could not detect low and high frequencies "
+		pr_debug("could not detect low and high frequencies "
 				"by SMI call.\n");
 		result = speedstep_get_freqs(speedstep_processor,
 				low, high,
@@ -312,18 +309,18 @@ static int speedstep_cpu_init(struct cpufreq_policy *policy)
 				&speedstep_set_state);
 
 		if (result) {
-			dprintk("could not detect two different speeds"
+			pr_debug("could not detect two different speeds"
 					" -- aborting.\n");
 			return result;
 		} else
-			dprintk("workaround worked.\n");
+			pr_debug("workaround worked.\n");
 	}
 
 	/* get current speed setting */
 	state = speedstep_get_state();
 	speed = speedstep_freqs[state].frequency;
 
-	dprintk("currently at %s speed setting - %i MHz\n",
+	pr_debug("currently at %s speed setting - %i MHz\n",
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency)
 		? "low" : "high",
 		(speed / 1000));
@@ -360,7 +357,7 @@ static int speedstep_resume(struct cpufreq_policy *policy)
 	int result = speedstep_smi_ownership();
 
 	if (result)
-		dprintk("fails in re-acquiring ownership of a SMI interface.\n");
+		pr_debug("fails in re-acquiring ownership of a SMI interface.\n");
 
 	return result;
 }
@@ -403,11 +400,11 @@ static int __init speedstep_init(void)
 	}
 
 	if (!speedstep_processor) {
-		dprintk("No supported Intel CPU detected.\n");
+		pr_debug("No supported Intel CPU detected.\n");
 		return -ENODEV;
 	}
 
-	dprintk("signature:0x%.8lx, command:0x%.8lx, "
+	pr_debug("signature:0x%.8lx, command:0x%.8lx, "
 		"event:0x%.8lx, perf_level:0x%.8lx.\n",
 		ist_info.signature, ist_info.command,
 		ist_info.event, ist_info.perf_level);
diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 3a73a93..85b3237 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -49,10 +49,6 @@ ACPI_MODULE_NAME("processor_perflib");
 
 static DEFINE_MUTEX(performance_mutex);
 
-/* Use cpufreq debug layer for _PPC changes. */
-#define cpufreq_printk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_CORE, \
-						"cpufreq-core", msg)
-
 /*
  * _PPC support is implemented as a CPUfreq policy notifier:
  * This means each time a CPUfreq driver registered also with
@@ -145,7 +141,7 @@ static int acpi_processor_get_platform_limit(struct acpi_processor *pr)
 		return -ENODEV;
 	}
 
-	cpufreq_printk("CPU %d: _PPC is %d - frequency %s limited\n", pr->id,
+	pr_debug("CPU %d: _PPC is %d - frequency %s limited\n", pr->id,
 		       (int)ppc, ppc ? "" : "not");
 
 	pr->performance_platform_limit = (int)ppc;
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index b6ed7df..385f2fd 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -32,9 +32,6 @@
 
 #include <trace/events/power.h>
 
-#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_CORE, \
-						"cpufreq-core", msg)
-
 /**
  * The "cpufreq driver" - the arch- or hardware-dependent low
  * level driver of CPUFreq support, and its spinlock. This lock
@@ -204,7 +201,7 @@ static void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
 	if (!l_p_j_ref_freq) {
 		l_p_j_ref = loops_per_jiffy;
 		l_p_j_ref_freq = ci->old;
-		dprintk("saving %lu as reference value for loops_per_jiffy; "
+		pr_debug("saving %lu as reference value for loops_per_jiffy; "
 			"freq is %u kHz\n", l_p_j_ref, l_p_j_ref_freq);
 	}
 	if ((val == CPUFREQ_PRECHANGE  && ci->old < ci->new) ||
@@ -212,7 +209,7 @@ static void adjust_jiffies(unsigned long val, struct cpufreq_freqs *ci)
 	    (val == CPUFREQ_RESUMECHANGE || val == CPUFREQ_SUSPENDCHANGE)) {
 		loops_per_jiffy = cpufreq_scale(l_p_j_ref, l_p_j_ref_freq,
 								ci->new);
-		dprintk("scaling loops_per_jiffy to %lu "
+		pr_debug("scaling loops_per_jiffy to %lu "
 			"for frequency %u kHz\n", loops_per_jiffy, ci->new);
 	}
 }
@@ -239,7 +236,7 @@ void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
 	BUG_ON(irqs_disabled());
 
 	freqs->flags = cpufreq_driver->flags;
-	dprintk("notification %u of frequency transition to %u kHz\n",
+	pr_debug("notification %u of frequency transition to %u kHz\n",
 		state, freqs->new);
 
 	policy = per_cpu(cpufreq_cpu_data, freqs->cpu);
@@ -253,7 +250,7 @@ void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
 		if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
 			if ((policy) && (policy->cpu == freqs->cpu) &&
 			    (policy->cur) && (policy->cur != freqs->old)) {
-				dprintk("Warning: CPU frequency is"
+				pr_debug("Warning: CPU frequency is"
 					" %u, cpufreq assumed %u kHz.\n",
 					freqs->old, policy->cur);
 				freqs->old = policy->cur;
@@ -266,7 +263,7 @@ void cpufreq_notify_transition(struct cpufreq_freqs *freqs, unsigned int state)
 
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
-		dprintk("FREQ: %lu - CPU: %lu", (unsigned long)freqs->new,
+		pr_debug("FREQ: %lu - CPU: %lu", (unsigned long)freqs->new,
 			(unsigned long)freqs->cpu);
 		trace_power_frequency(POWER_PSTATE, freqs->new, freqs->cpu);
 		trace_cpu_frequency(freqs->new, freqs->cpu);
@@ -666,7 +663,7 @@ no_policy:
 static void cpufreq_sysfs_release(struct kobject *kobj)
 {
 	struct cpufreq_policy *policy = to_policy(kobj);
-	dprintk("last reference is dropped\n");
+	pr_debug("last reference is dropped\n");
 	complete(&policy->kobj_unregister);
 }
 
@@ -701,7 +698,7 @@ static int cpufreq_add_dev_policy(unsigned int cpu,
 	gov = __find_governor(per_cpu(cpufreq_cpu_governor, cpu));
 	if (gov) {
 		policy->governor = gov;
-		dprintk("Restoring governor %s for cpu %d\n",
+		pr_debug("Restoring governor %s for cpu %d\n",
 		       policy->governor->name, cpu);
 	}
 #endif
@@ -737,7 +734,7 @@ static int cpufreq_add_dev_policy(unsigned int cpu,
 			per_cpu(cpufreq_cpu_data, cpu) = managed_policy;
 			spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 
-			dprintk("CPU already managed, adding link\n");
+			pr_debug("CPU already managed, adding link\n");
 			ret = sysfs_create_link(&sys_dev->kobj,
 						&managed_policy->kobj,
 						"cpufreq");
@@ -778,7 +775,7 @@ static int cpufreq_add_dev_symlink(unsigned int cpu,
 		if (!cpu_online(j))
 			continue;
 
-		dprintk("CPU %u already managed, adding link\n", j);
+		pr_debug("CPU %u already managed, adding link\n", j);
 		managed_policy = cpufreq_cpu_get(cpu);
 		cpu_sys_dev = get_cpu_sysdev(j);
 		ret = sysfs_create_link(&cpu_sys_dev->kobj, &policy->kobj,
@@ -854,7 +851,7 @@ static int cpufreq_add_dev_interface(unsigned int cpu,
 	policy->user_policy.governor = policy->governor;
 
 	if (ret) {
-		dprintk("setting policy failed\n");
+		pr_debug("setting policy failed\n");
 		if (cpufreq_driver->exit)
 			cpufreq_driver->exit(policy);
 	}
@@ -890,7 +887,7 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	if (cpu_is_offline(cpu))
 		return 0;
 
-	dprintk("adding CPU %u\n", cpu);
+	pr_debug("adding CPU %u\n", cpu);
 
 #ifdef CONFIG_SMP
 	/* check whether a different CPU already registered this
@@ -948,7 +945,7 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	 */
 	ret = cpufreq_driver->init(policy);
 	if (ret) {
-		dprintk("initialization failed\n");
+		pr_debug("initialization failed\n");
 		goto err_unlock_policy;
 	}
 	policy->user_policy.min = policy->min;
@@ -974,7 +971,7 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 
 	kobject_uevent(&policy->kobj, KOBJ_ADD);
 	module_put(cpufreq_driver->owner);
-	dprintk("initialization complete\n");
+	pr_debug("initialization complete\n");
 
 	return 0;
 
@@ -1021,7 +1018,7 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 	unsigned int j;
 #endif
 
-	dprintk("unregistering CPU %u\n", cpu);
+	pr_debug("unregistering CPU %u\n", cpu);
 
 	spin_lock_irqsave(&cpufreq_driver_lock, flags);
 	data = per_cpu(cpufreq_cpu_data, cpu);
@@ -1039,7 +1036,7 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 	 * only need to unlink, put and exit
 	 */
 	if (unlikely(cpu != data->cpu)) {
-		dprintk("removing link\n");
+		pr_debug("removing link\n");
 		cpumask_clear_cpu(cpu, data->cpus);
 		spin_unlock_irqrestore(&cpufreq_driver_lock, flags);
 		kobj = &sys_dev->kobj;
@@ -1076,7 +1073,7 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 		for_each_cpu(j, data->cpus) {
 			if (j == cpu)
 				continue;
-			dprintk("removing link for cpu %u\n", j);
+			pr_debug("removing link for cpu %u\n", j);
 #ifdef CONFIG_HOTPLUG_CPU
 			strncpy(per_cpu(cpufreq_cpu_governor, j),
 				data->governor->name, CPUFREQ_NAME_LEN);
@@ -1105,9 +1102,9 @@ static int __cpufreq_remove_dev(struct sys_device *sys_dev)
 	 * not referenced anymore by anybody before we proceed with
 	 * unloading.
 	 */
-	dprintk("waiting for dropping of refcount\n");
+	pr_debug("waiting for dropping of refcount\n");
 	wait_for_completion(cmp);
-	dprintk("wait complete\n");
+	pr_debug("wait complete\n");
 
 	lock_policy_rwsem_write(cpu);
 	if (cpufreq_driver->exit)
@@ -1144,7 +1141,7 @@ static void handle_update(struct work_struct *work)
 	struct cpufreq_policy *policy =
 		container_of(work, struct cpufreq_policy, update);
 	unsigned int cpu = policy->cpu;
-	dprintk("handle_update for cpu %u called\n", cpu);
+	pr_debug("handle_update for cpu %u called\n", cpu);
 	cpufreq_update_policy(cpu);
 }
 
@@ -1162,7 +1159,7 @@ static void cpufreq_out_of_sync(unsigned int cpu, unsigned int old_freq,
 {
 	struct cpufreq_freqs freqs;
 
-	dprintk("Warning: CPU frequency out of sync: cpufreq and timing "
+	pr_debug("Warning: CPU frequency out of sync: cpufreq and timing "
 	       "core thinks of %u, is %u kHz.\n", old_freq, new_freq);
 
 	freqs.cpu = cpu;
@@ -1265,7 +1262,7 @@ static int cpufreq_bp_suspend(void)
 	int cpu = smp_processor_id();
 	struct cpufreq_policy *cpu_policy;
 
-	dprintk("suspending cpu %u\n", cpu);
+	pr_debug("suspending cpu %u\n", cpu);
 
 	/* If there's no policy for the boot CPU, we have nothing to do. */
 	cpu_policy = cpufreq_cpu_get(cpu);
@@ -1303,7 +1300,7 @@ static void cpufreq_bp_resume(void)
 	int cpu = smp_processor_id();
 	struct cpufreq_policy *cpu_policy;
 
-	dprintk("resuming cpu %u\n", cpu);
+	pr_debug("resuming cpu %u\n", cpu);
 
 	/* If there's no policy for the boot CPU, we have nothing to do. */
 	cpu_policy = cpufreq_cpu_get(cpu);
@@ -1415,7 +1412,7 @@ int __cpufreq_driver_target(struct cpufreq_policy *policy,
 {
 	int retval = -EINVAL;
 
-	dprintk("target for CPU %u: %u kHz, relation %u\n", policy->cpu,
+	pr_debug("target for CPU %u: %u kHz, relation %u\n", policy->cpu,
 		target_freq, relation);
 	if (cpu_online(policy->cpu) && cpufreq_driver->target)
 		retval = cpufreq_driver->target(policy, target_freq, relation);
@@ -1501,7 +1498,7 @@ static int __cpufreq_governor(struct cpufreq_policy *policy,
 	if (!try_module_get(policy->governor->owner))
 		return -EINVAL;
 
-	dprintk("__cpufreq_governor for CPU %u, event %u\n",
+	pr_debug("__cpufreq_governor for CPU %u, event %u\n",
 						policy->cpu, event);
 	ret = policy->governor->governor(policy, event);
 
@@ -1602,7 +1599,7 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 {
 	int ret = 0;
 
-	dprintk("setting new policy for CPU %u: %u - %u kHz\n", policy->cpu,
+	pr_debug("setting new policy for CPU %u: %u - %u kHz\n", policy->cpu,
 		policy->min, policy->max);
 
 	memcpy(&policy->cpuinfo, &data->cpuinfo,
@@ -1639,19 +1636,19 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 	data->min = policy->min;
 	data->max = policy->max;
 
-	dprintk("new min and max freqs are %u - %u kHz\n",
+	pr_debug("new min and max freqs are %u - %u kHz\n",
 					data->min, data->max);
 
 	if (cpufreq_driver->setpolicy) {
 		data->policy = policy->policy;
-		dprintk("setting range\n");
+		pr_debug("setting range\n");
 		ret = cpufreq_driver->setpolicy(policy);
 	} else {
 		if (policy->governor != data->governor) {
 			/* save old, working values */
 			struct cpufreq_governor *old_gov = data->governor;
 
-			dprintk("governor switch\n");
+			pr_debug("governor switch\n");
 
 			/* end old governor */
 			if (data->governor)
@@ -1661,7 +1658,7 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 			data->governor = policy->governor;
 			if (__cpufreq_governor(data, CPUFREQ_GOV_START)) {
 				/* new governor failed, so re-start old one */
-				dprintk("starting governor %s failed\n",
+				pr_debug("starting governor %s failed\n",
 							data->governor->name);
 				if (old_gov) {
 					data->governor = old_gov;
@@ -1673,7 +1670,7 @@ static int __cpufreq_set_policy(struct cpufreq_policy *data,
 			}
 			/* might be a policy change, too, so fall through */
 		}
-		dprintk("governor: change or update limits\n");
+		pr_debug("governor: change or update limits\n");
 		__cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 	}
 
@@ -1704,7 +1701,7 @@ int cpufreq_update_policy(unsigned int cpu)
 		goto fail;
 	}
 
-	dprintk("updating policy for CPU %u\n", cpu);
+	pr_debug("updating policy for CPU %u\n", cpu);
 	memcpy(&policy, data, sizeof(struct cpufreq_policy));
 	policy.min = data->user_policy.min;
 	policy.max = data->user_policy.max;
@@ -1716,7 +1713,7 @@ int cpufreq_update_policy(unsigned int cpu)
 	if (cpufreq_driver->get) {
 		policy.cur = cpufreq_driver->get(cpu);
 		if (!data->cur) {
-			dprintk("Driver did not initialize current freq");
+			pr_debug("Driver did not initialize current freq");
 			data->cur = policy.cur;
 		} else {
 			if (data->cur != policy.cur)
@@ -1792,7 +1789,7 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
 
-	dprintk("trying to register driver %s\n", driver_data->name);
+	pr_debug("trying to register driver %s\n", driver_data->name);
 
 	if (driver_data->setpolicy)
 		driver_data->flags |= CPUFREQ_CONST_LOOPS;
@@ -1823,14 +1820,14 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 
 		/* if all ->init() calls failed, unregister */
 		if (ret) {
-			dprintk("no CPU initialized for driver %s\n",
+			pr_debug("no CPU initialized for driver %s\n",
 							driver_data->name);
 			goto err_sysdev_unreg;
 		}
 	}
 
 	register_hotcpu_notifier(&cpufreq_cpu_notifier);
-	dprintk("driver %s up and running\n", driver_data->name);
+	pr_debug("driver %s up and running\n", driver_data->name);
 
 	return 0;
 err_sysdev_unreg:
@@ -1860,7 +1857,7 @@ int cpufreq_unregister_driver(struct cpufreq_driver *driver)
 	if (!cpufreq_driver || (driver != cpufreq_driver))
 		return -EINVAL;
 
-	dprintk("unregistering driver %s\n", driver->name);
+	pr_debug("unregistering driver %s\n", driver->name);
 
 	sysdev_driver_unregister(&cpu_sysdev_class, &cpufreq_sysdev_driver);
 	unregister_hotcpu_notifier(&cpufreq_cpu_notifier);
diff --git a/drivers/cpufreq/cpufreq_performance.c b/drivers/cpufreq/cpufreq_performance.c
index 7e2e515..f13a8a9 100644
--- a/drivers/cpufreq/cpufreq_performance.c
+++ b/drivers/cpufreq/cpufreq_performance.c
@@ -15,9 +15,6 @@
 #include <linux/cpufreq.h>
 #include <linux/init.h>
 
-#define dprintk(msg...) \
-	cpufreq_debug_printk(CPUFREQ_DEBUG_GOVERNOR, "performance", msg)
-
 
 static int cpufreq_governor_performance(struct cpufreq_policy *policy,
 					unsigned int event)
@@ -25,7 +22,7 @@ static int cpufreq_governor_performance(struct cpufreq_policy *policy,
 	switch (event) {
 	case CPUFREQ_GOV_START:
 	case CPUFREQ_GOV_LIMITS:
-		dprintk("setting to %u kHz because of event %u\n",
+		pr_debug("setting to %u kHz because of event %u\n",
 						policy->max, event);
 		__cpufreq_driver_target(policy, policy->max,
 						CPUFREQ_RELATION_H);
diff --git a/drivers/cpufreq/cpufreq_powersave.c b/drivers/cpufreq/cpufreq_powersave.c
index e6db5fa..4c2eb51 100644
--- a/drivers/cpufreq/cpufreq_powersave.c
+++ b/drivers/cpufreq/cpufreq_powersave.c
@@ -15,16 +15,13 @@
 #include <linux/cpufreq.h>
 #include <linux/init.h>
 
-#define dprintk(msg...) \
-	cpufreq_debug_printk(CPUFREQ_DEBUG_GOVERNOR, "powersave", msg)
-
 static int cpufreq_governor_powersave(struct cpufreq_policy *policy,
 					unsigned int event)
 {
 	switch (event) {
 	case CPUFREQ_GOV_START:
 	case CPUFREQ_GOV_LIMITS:
-		dprintk("setting to %u kHz because of event %u\n",
+		pr_debug("setting to %u kHz because of event %u\n",
 							policy->min, event);
 		__cpufreq_driver_target(policy, policy->min,
 						CPUFREQ_RELATION_L);
diff --git a/drivers/cpufreq/cpufreq_userspace.c b/drivers/cpufreq/cpufreq_userspace.c
index 66d2d1d..f231015 100644
--- a/drivers/cpufreq/cpufreq_userspace.c
+++ b/drivers/cpufreq/cpufreq_userspace.c
@@ -37,9 +37,6 @@ static DEFINE_PER_CPU(unsigned int, cpu_is_managed);
 static DEFINE_MUTEX(userspace_mutex);
 static int cpus_using_userspace_governor;
 
-#define dprintk(msg...) \
-	cpufreq_debug_printk(CPUFREQ_DEBUG_GOVERNOR, "userspace", msg)
-
 /* keep track of frequency transitions */
 static int
 userspace_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
@@ -50,7 +47,7 @@ userspace_cpufreq_notifier(struct notifier_block *nb, unsigned long val,
 	if (!per_cpu(cpu_is_managed, freq->cpu))
 		return 0;
 
-	dprintk("saving cpu_cur_freq of cpu %u to be %u kHz\n",
+	pr_debug("saving cpu_cur_freq of cpu %u to be %u kHz\n",
 			freq->cpu, freq->new);
 	per_cpu(cpu_cur_freq, freq->cpu) = freq->new;
 
@@ -73,7 +70,7 @@ static int cpufreq_set(struct cpufreq_policy *policy, unsigned int freq)
 {
 	int ret = -EINVAL;
 
-	dprintk("cpufreq_set for cpu %u, freq %u kHz\n", policy->cpu, freq);
+	pr_debug("cpufreq_set for cpu %u, freq %u kHz\n", policy->cpu, freq);
 
 	mutex_lock(&userspace_mutex);
 	if (!per_cpu(cpu_is_managed, policy->cpu))
@@ -134,7 +131,7 @@ static int cpufreq_governor_userspace(struct cpufreq_policy *policy,
 		per_cpu(cpu_max_freq, cpu) = policy->max;
 		per_cpu(cpu_cur_freq, cpu) = policy->cur;
 		per_cpu(cpu_set_freq, cpu) = policy->cur;
-		dprintk("managing cpu %u started "
+		pr_debug("managing cpu %u started "
 			"(%u - %u kHz, currently %u kHz)\n",
 				cpu,
 				per_cpu(cpu_min_freq, cpu),
@@ -156,12 +153,12 @@ static int cpufreq_governor_userspace(struct cpufreq_policy *policy,
 		per_cpu(cpu_min_freq, cpu) = 0;
 		per_cpu(cpu_max_freq, cpu) = 0;
 		per_cpu(cpu_set_freq, cpu) = 0;
-		dprintk("managing cpu %u stopped\n", cpu);
+		pr_debug("managing cpu %u stopped\n", cpu);
 		mutex_unlock(&userspace_mutex);
 		break;
 	case CPUFREQ_GOV_LIMITS:
 		mutex_lock(&userspace_mutex);
-		dprintk("limit event for cpu %u: %u - %u kHz, "
+		pr_debug("limit event for cpu %u: %u - %u kHz, "
 			"currently %u kHz, last set to %u kHz\n",
 			cpu, policy->min, policy->max,
 			per_cpu(cpu_cur_freq, cpu),
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 0543221..90431cb 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -14,9 +14,6 @@
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 
-#define dprintk(msg...) \
-	cpufreq_debug_printk(CPUFREQ_DEBUG_CORE, "freq-table", msg)
-
 /*********************************************************************
  *                     FREQUENCY TABLE HELPERS                       *
  *********************************************************************/
@@ -31,11 +28,11 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 	for (i = 0; (table[i].frequency != CPUFREQ_TABLE_END); i++) {
 		unsigned int freq = table[i].frequency;
 		if (freq == CPUFREQ_ENTRY_INVALID) {
-			dprintk("table entry %u is invalid, skipping\n", i);
+			pr_debug("table entry %u is invalid, skipping\n", i);
 
 			continue;
 		}
-		dprintk("table entry %u: %u kHz, %u index\n",
+		pr_debug("table entry %u: %u kHz, %u index\n",
 					i, freq, table[i].index);
 		if (freq < min_freq)
 			min_freq = freq;
@@ -61,7 +58,7 @@ int cpufreq_frequency_table_verify(struct cpufreq_policy *policy,
 	unsigned int i;
 	unsigned int count = 0;
 
-	dprintk("request for verification of policy (%u - %u kHz) for cpu %u\n",
+	pr_debug("request for verification of policy (%u - %u kHz) for cpu %u\n",
 					policy->min, policy->max, policy->cpu);
 
 	if (!cpu_online(policy->cpu))
@@ -86,7 +83,7 @@ int cpufreq_frequency_table_verify(struct cpufreq_policy *policy,
 	cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq,
 				     policy->cpuinfo.max_freq);
 
-	dprintk("verification lead to (%u - %u kHz) for cpu %u\n",
+	pr_debug("verification lead to (%u - %u kHz) for cpu %u\n",
 				policy->min, policy->max, policy->cpu);
 
 	return 0;
@@ -110,7 +107,7 @@ int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
 	};
 	unsigned int i;
 
-	dprintk("request for target %u kHz (relation: %u) for cpu %u\n",
+	pr_debug("request for target %u kHz (relation: %u) for cpu %u\n",
 					target_freq, relation, policy->cpu);
 
 	switch (relation) {
@@ -167,7 +164,7 @@ int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
 	} else
 		*index = optimal.index;
 
-	dprintk("target is %u (%u kHz, %u)\n", *index, table[*index].frequency,
+	pr_debug("target is %u (%u kHz, %u)\n", *index, table[*index].frequency,
 		table[*index].index);
 
 	return 0;
@@ -216,14 +213,14 @@ EXPORT_SYMBOL_GPL(cpufreq_freq_attr_scaling_available_freqs);
 void cpufreq_frequency_table_get_attr(struct cpufreq_frequency_table *table,
 				      unsigned int cpu)
 {
-	dprintk("setting show_table for cpu %u to %p\n", cpu, table);
+	pr_debug("setting show_table for cpu %u to %p\n", cpu, table);
 	per_cpu(cpufreq_show_table, cpu) = table;
 }
 EXPORT_SYMBOL_GPL(cpufreq_frequency_table_get_attr);
 
 void cpufreq_frequency_table_put_attr(unsigned int cpu)
 {
-	dprintk("clearing show_table for cpu %u\n", cpu);
+	pr_debug("clearing show_table for cpu %u\n", cpu);
 	per_cpu(cpufreq_show_table, cpu) = NULL;
 }
 EXPORT_SYMBOL_GPL(cpufreq_frequency_table_put_attr);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index adb10ea..2845f6e 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -397,14 +397,4 @@ void cpufreq_frequency_table_get_attr(struct cpufreq_frequency_table *table,
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
 
 
-/*********************************************************************
- *                     UNIFIED DEBUG HELPERS                         *
- *********************************************************************/
-
-#define CPUFREQ_DEBUG_CORE	1
-#define CPUFREQ_DEBUG_DRIVER	2
-#define CPUFREQ_DEBUG_GOVERNOR	4
-
-#define cpufreq_debug_printk(type, msg...) pr_debug(msg)
-
 #endif /* _LINUX_CPUFREQ_H */
-- 
1.7.1

