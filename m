From: Mark Langsdorf <mark.langsdorf@amd.com>
Subject: [PATCH][2/2] 2.6.26 preregister support for powernow-k8
Date: Thu, 31 Jul 2008 12:39:12 -0500
Message-ID: <200807311239.13048.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@lists.linux.org.uk

This patch provides support for the _PSD ACPI object in the Powernow-k8
driver.  Although it looks like an invasive patch, most of it is
simply the consequence of turning the static acpi_performance_data
structure into a pointer.

AMD has tested it on several machines over the past few days without
issue.

-Mark Langsdorf
Operating System Research Center
AMD

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
Tested-by: Frank Arnold <frank.arnold@amd.com>


diff -r 88e9f029362d arch/x86/kernel/cpu/cpufreq/powernow-k8.c
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	Mon Jul 28 08:47:53 2008 -0500
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	Mon Jul 28 08:45:38 2008 -0500
@@ -737,44 +737,63 @@
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, unsigned int index)
 {
-	if (!data->acpi_data.state_count || (cpu_family == CPU_HW_PSTATE))
+	if (!data->acpi_data->state_count || (cpu_family == CPU_HW_PSTATE))
 		return;
 
-	data->irt = (data->acpi_data.states[index].control >> IRT_SHIFT) & IRT_MASK;
-	data->rvo = (data->acpi_data.states[index].control >> RVO_SHIFT) & RVO_MASK;
-	data->exttype = (data->acpi_data.states[index].control >> EXT_TYPE_SHIFT) & EXT_TYPE_MASK;
-	data->plllock = (data->acpi_data.states[index].control >> PLL_L_SHIFT) & PLL_L_MASK;
-	data->vidmvs = 1 << ((data->acpi_data.states[index].control >> MVS_SHIFT) & MVS_MASK);
-	data->vstable = (data->acpi_data.states[index].control >> VST_SHIFT) & VST_MASK;
+	data->irt = (data->acpi_data->states[index].control >> IRT_SHIFT) & IRT_MASK;
+	data->rvo = (data->acpi_data->states[index].control >> RVO_SHIFT) & RVO_MASK;
+	data->exttype = (data->acpi_data->states[index].control >> EXT_TYPE_SHIFT) & EXT_TYPE_MASK;
+	data->plllock = (data->acpi_data->states[index].control >> PLL_L_SHIFT) & PLL_L_MASK;
+	data->vidmvs = 1 << ((data->acpi_data->states[index].control >> MVS_SHIFT) & MVS_MASK);
+	data->vstable = (data->acpi_data->states[index].control >> VST_SHIFT) & VST_MASK;
+}
+
+
+static struct acpi_processor_performance *acpi_perf_data;
+static int preregister_valid = 0;
+
+static int powernow_k8_cpu_preinit_acpi(void)
+{
+	acpi_perf_data = alloc_percpu(struct acpi_processor_performance);	
+	if (!acpi_perf_data) 
+		return -ENODEV;
+	
+	if (acpi_processor_preregister_performance(acpi_perf_data))
+		return -ENODEV;
+	else
+		preregister_valid = 1;
+	return 0;
 }
 
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
 {
 	struct cpufreq_frequency_table *powernow_table;
 	int ret_val;
+	int cpu = 0;
 
-	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
+	data->acpi_data = percpu_ptr(acpi_perf_data, cpu);
+	if (acpi_processor_register_performance(data->acpi_data, data->cpu)) {
 		dprintk("register performance failed: bad ACPI data\n");
 		return -EIO;
 	}
 
 	/* verify the data contained in the ACPI structures */
-	if (data->acpi_data.state_count <= 1) {
+	if (data->acpi_data->state_count <= 1) {
 		dprintk("No ACPI P-States\n");
 		goto err_out;
 	}
 
-	if ((data->acpi_data.control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
-		(data->acpi_data.status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
+	if ((data->acpi_data->control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) ||
+		(data->acpi_data->status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE)) {
 		dprintk("Invalid control/status registers (%x - %x)\n",
-			data->acpi_data.control_register.space_id,
-			data->acpi_data.status_register.space_id);
+			data->acpi_data->control_register.space_id,
+			data->acpi_data->status_register.space_id);
 		goto err_out;
 	}
 
 	/* fill in data->powernow_table */
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table)
-		* (data->acpi_data.state_count + 1)), GFP_KERNEL);
+		* (data->acpi_data->state_count + 1)), GFP_KERNEL);
 	if (!powernow_table) {
 		dprintk("powernow_table memory alloc failure\n");
 		goto err_out;
@@ -787,12 +806,12 @@
 	if (ret_val)
 		goto err_out_mem;
 
-	powernow_table[data->acpi_data.state_count].frequency = CPUFREQ_TABLE_END;
-	powernow_table[data->acpi_data.state_count].index = 0;
+	powernow_table[data->acpi_data->state_count].frequency = CPUFREQ_TABLE_END;
+	powernow_table[data->acpi_data->state_count].index = 0;
 	data->powernow_table = powernow_table;
 
 	/* fill in data */
-	data->numps = data->acpi_data.state_count;
+	data->numps = data->acpi_data->state_count;
 	if (first_cpu(per_cpu(cpu_core_map, data->cpu)) == data->cpu)
 		print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
@@ -800,16 +819,31 @@
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
 
+	/* determine affinity, from ACPI if available */
+	if (preregister_valid) {
+		if ((data->acpi_data->shared_type == CPUFREQ_SHARED_TYPE_ALL) ||
+			(data->acpi_data->shared_type == CPUFREQ_SHARED_TYPE_ANY))
+			data->starting_core_affinity = data->acpi_data->shared_cpu_map;
+		else
+			data->starting_core_affinity = cpumask_of_cpu(data->cpu);
+	} else {
+	/* best guess from family if not */
+		if (cpu_family == CPU_HW_PSTATE)
+			data->starting_core_affinity = cpumask_of_cpu(data->cpu);
+		else
+			data->starting_core_affinity = per_cpu(cpu_core_map, data->cpu);
+	}
+
 	return 0;
 
 err_out_mem:
 	kfree(powernow_table);
 
 err_out:
-	acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
+	acpi_processor_unregister_performance(data->acpi_data, data->cpu);
 
 	/* data->acpi_data.state_count informs us at ->exit() whether ACPI was used */
-	data->acpi_data.state_count = 0;
+	data->acpi_data->state_count = 0;
 
 	return -ENODEV;
 }
@@ -821,10 +855,10 @@
 	rdmsr(MSR_PSTATE_CUR_LIMIT, hi, lo);
 	data->max_hw_pstate = (hi & HW_PSTATE_MAX_MASK) >> HW_PSTATE_MAX_SHIFT;
 
-	for (i = 0; i < data->acpi_data.state_count; i++) {
+	for (i = 0; i < data->acpi_data->state_count; i++) {
 		u32 index;
 
-		index = data->acpi_data.states[i].control & HW_PSTATE_MASK;
+		index = data->acpi_data->states[i].control & HW_PSTATE_MASK;
 		if (index > data->max_hw_pstate) {
 			printk(KERN_ERR PFX "invalid pstate %d - bad value %d.\n", i, index);
 			printk(KERN_ERR PFX "Please report to BIOS manufacturer\n");
@@ -840,7 +874,7 @@
 
 		powernow_table[i].index = index;
 
-		powernow_table[i].frequency = data->acpi_data.states[i].core_frequency * 1000;
+		powernow_table[i].frequency = data->acpi_data->states[i].core_frequency * 1000;
 	}
 	return 0;
 }
@@ -849,16 +883,16 @@
 {
 	int i;
 	int cntlofreq = 0;
-	for (i = 0; i < data->acpi_data.state_count; i++) {
+	for (i = 0; i < data->acpi_data->state_count; i++) {
 		u32 fid;
 		u32 vid;
 
 		if (data->exttype) {
-			fid = data->acpi_data.states[i].status & EXT_FID_MASK;
-			vid = (data->acpi_data.states[i].status >> VID_SHIFT) & EXT_VID_MASK;
+			fid = data->acpi_data->states[i].status & EXT_FID_MASK;
+			vid = (data->acpi_data->states[i].status >> VID_SHIFT) & EXT_VID_MASK;
 		} else {
-			fid = data->acpi_data.states[i].control & FID_MASK;
-			vid = (data->acpi_data.states[i].control >> VID_SHIFT) & VID_MASK;
+			fid = data->acpi_data->states[i].control & FID_MASK;
+			vid = (data->acpi_data->states[i].control >> VID_SHIFT) & VID_MASK;
 		}
 
 		dprintk("   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
@@ -899,10 +933,10 @@
 				cntlofreq = i;
 		}
 
-		if (powernow_table[i].frequency != (data->acpi_data.states[i].core_frequency * 1000)) {
+		if (powernow_table[i].frequency != (data->acpi_data->states[i].core_frequency * 1000)) {
 			printk(KERN_INFO PFX "invalid freq entries %u kHz vs. %u kHz\n",
 				powernow_table[i].frequency,
-				(unsigned int) (data->acpi_data.states[i].core_frequency * 1000));
+				(unsigned int) (data->acpi_data->states[i].core_frequency * 1000));
 			powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
 			continue;
 		}
@@ -912,8 +946,8 @@
 
 static void powernow_k8_cpu_exit_acpi(struct powernow_k8_data *data)
 {
-	if (data->acpi_data.state_count)
-		acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
+	if (data->acpi_data->state_count)
+		acpi_processor_unregister_performance(data->acpi_data, data->cpu);
 }
 
 #else
@@ -1101,7 +1135,7 @@
 static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
 {
 	struct powernow_k8_data *data;
-	cpumask_t oldmask;
+	cpumask_t oldmask = CPU_MASK_ALL;
 	int rc;
 
 	if (!cpu_online(pol->cpu))
@@ -1174,10 +1208,7 @@
 	/* run on any CPU again */
 	set_cpus_allowed_ptr(current, &oldmask);
 
-	if (cpu_family == CPU_HW_PSTATE)
-		pol->cpus = cpumask_of_cpu(pol->cpu);
-	else
-		pol->cpus = per_cpu(cpu_core_map, pol->cpu);
+	pol->cpus = data->starting_core_affinity;
 	data->available_cores = &(pol->cpus);
 
 	/* Take a crude guess here.
@@ -1300,6 +1331,7 @@
 	}
 
 	if (supported_cpus == num_online_cpus()) {
+		powernow_k8_cpu_preinit_acpi();
 		printk(KERN_INFO PFX "Found %d %s "
 			"processors (%d cpu cores) (" VERSION ")\n",
 			num_online_nodes(),
@@ -1316,6 +1348,8 @@
 	dprintk("exit\n");
 
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
+
+	free_percpu(acpi_perf_data);
 }
 
 MODULE_AUTHOR("Paul Devriendt <paul.devriendt@amd.com> and Mark Langsdorf <mark.langsdorf@amd.com>");
diff -r 88e9f029362d arch/x86/kernel/cpu/cpufreq/powernow-k8.h
--- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	Mon Jul 28 08:47:53 2008 -0500
+++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	Mon Jul 28 08:45:38 2008 -0500
@@ -33,12 +33,13 @@
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 	/* the acpi table needs to be kept. it's only available if ACPI was
 	 * used to determine valid frequency/vid/fid states */
-	struct acpi_processor_performance acpi_data;
+	struct acpi_processor_performance *acpi_data;
 #endif
 	/* we need to keep track of associated cores, but let cpufreq
 	 * handle hotplug events - so just point at cpufreq pol->cpus
 	 * structure */
 	cpumask_t *available_cores;
+	cpumask_t starting_core_affinity;
 };
