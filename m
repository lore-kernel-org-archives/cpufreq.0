From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH] Get core affinity from
 acpi_processor_preregister_performance()
Date: Mon, 9 Jul 2007 17:36:29 -0500
Message-ID: <200707091736.29441.mark.langsdorf@amd.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Linux now supports the ACPI _PSD structure, which indicates which processors
have their pstates tied together.  _PSD discovery is handled through
acpi_processor_preregister_performance().  Add support for this call to
powernow-k8.c.  Fallback support is included if the BIOS does not provide
a _PSD

This patch looks a little ugly, because a large part of it is turning a
static structure reference to a pointer structure reference.  The rest of
the change is fairly mild and based on the speedstep-centrino code.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- linux-2.6.22/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.old	2007-07-09 16:24:28.000000000 -0500
+++ linux-2.6.22/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2007-07-09 17:07:47.000000000 -0500
@@ -739,6 +739,7 @@ static int find_psb_table(struct powerno
 
 		data->numps = psb->numps;
 		dprintk("numpstates: 0x%x\n", data->numps);
+		data->starting_core_affinity = cpumask_of_cpu(0);
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
 	/*
@@ -759,15 +760,44 @@ static int find_psb_table(struct powerno
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
+static struct acpi_processor_performance *acpi_perf_data[NR_CPUS];
+static int preregister_valid = 0;
+
+static int powernow_k8_cpu_preinit_acpi()
+{
+	int i; 
+	struct acpi_processor_performance *data;
+printk(KERN_ERR PFX "mjll called preinit!\n");
+	for_each_possible_cpu(i) {
+		data = kzalloc(sizeof(struct acpi_processor_performance),
+				GFP_KERNEL);
+		if (!data) {
+			int j;
+			for_each_possible_cpu(j) {
+				kfree(acpi_perf_data[j]);
+				acpi_perf_data[j] = NULL;
+			}
+			return -ENODEV;
+		}
+		acpi_perf_data[i] = data;
+	}
+
+	if (acpi_processor_preregister_performance(acpi_perf_data))
+		return -ENODEV;
+	else 
+		preregister_valid = 1;
+	return 0;
 }
 
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
@@ -775,28 +805,29 @@ static int powernow_k8_cpu_init_acpi(str
 	struct cpufreq_frequency_table *powernow_table;
 	int ret_val;
 
-	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
+	data->acpi_data = acpi_perf_data[data->cpu];
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
@@ -809,12 +840,12 @@ static int powernow_k8_cpu_init_acpi(str
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
 	if (first_cpu(cpu_core_map[data->cpu]) == data->cpu)
 		print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
@@ -822,16 +853,31 @@ static int powernow_k8_cpu_init_acpi(str
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
 
+	/* determine affinity, from ACPI if available */
+	if (preregister_valid) {
+		if ((data->acpi_data->shared_type == CPUFREQ_SHARED_TYPE_ALL) ||
+		    (data->acpi_data->shared_type == CPUFREQ_SHARED_TYPE_ANY))
+			data->starting_core_affinity = data->acpi_data->shared_cpu_map;
+		else
+			data->starting_core_affinity = cpumask_of_cpu(data->cpu);
+	} else {
+		/* best guess from family if not */
+		if (cpu_family == CPU_HW_PSTATE)
+			data->starting_core_affinity = cpumask_of_cpu(data->cpu);
+		else
+			data->starting_core_affinity = cpu_core_map[data->cpu];
+	}
+
 	return 0;
 
 err_out_mem:
 	kfree(powernow_table);
 
 err_out:
-	acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
+	acpi_processor_unregister_performance(data->acpi_data, data->cpu);
 
-	/* data->acpi_data.state_count informs us at ->exit() whether ACPI was used */
-	data->acpi_data.state_count = 0;
+	/* data->acpi_data->state_count informs us at ->exit() whether ACPI was used */
+	data->acpi_data->state_count = 0;
 
 	return -ENODEV;
 }
@@ -840,13 +886,13 @@ static int fill_powernow_table_pstate(st
 {
 	int i;
 
-	for (i = 0; i < data->acpi_data.state_count; i++) {
+	for (i = 0; i < data->acpi_data->state_count; i++) {
 		u32 index;
 		u32 hi = 0, lo = 0;
 		u32 fid;
 		u32 did;
 
-		index = data->acpi_data.states[i].control & HW_PSTATE_MASK;
+		index = data->acpi_data->states[i].control & HW_PSTATE_MASK;
 		if (index > MAX_HW_PSTATE) {
 			printk(KERN_ERR PFX "invalid pstate %d - bad value %d.\n", i, index);
 			printk(KERN_ERR PFX "Please report to BIOS manufacturer\n");
@@ -867,10 +913,10 @@ static int fill_powernow_table_pstate(st
 
 		powernow_table[i].frequency = find_khz_freq_from_fiddid(fid, did);
 
-		if (powernow_table[i].frequency != (data->acpi_data.states[i].core_frequency * 1000)) {
+		if (powernow_table[i].frequency != (data->acpi_data->states[i].core_frequency * 1000)) {
 			printk(KERN_INFO PFX "invalid freq entries %u kHz vs. %u kHz\n",
 				powernow_table[i].frequency,
-				(unsigned int) (data->acpi_data.states[i].core_frequency * 1000));
+				(unsigned int) (data->acpi_data->states[i].core_frequency * 1000));
 			powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
 			continue;
 		}
@@ -882,16 +928,16 @@ static int fill_powernow_table_fidvid(st
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
@@ -932,10 +978,10 @@ static int fill_powernow_table_fidvid(st
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
@@ -945,14 +991,15 @@ static int fill_powernow_table_fidvid(st
 
 static void powernow_k8_cpu_exit_acpi(struct powernow_k8_data *data)
 {
-	if (data->acpi_data.state_count)
-		acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
+	if (data->acpi_data->state_count)
+		acpi_processor_unregister_performance(data->acpi_data, data->cpu);
 }
 
 #else
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data) { return -ENODEV; }
 static void powernow_k8_cpu_exit_acpi(struct powernow_k8_data *data) { return; }
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, unsigned int index) { return; }
+static int powernow_k8_cpu_preinit_acpi() { return -ENODEV; }
 #endif /* CONFIG_X86_POWERNOW_K8_ACPI */
 
 /* Take a frequency, and issue the fid/vid transition command */
@@ -1166,7 +1213,7 @@ static int __cpuinit powernowk8_cpu_init
 		 * an UP version, and is deprecated by AMD.
 		 */
 		if (num_online_cpus() != 1) {
-			printk(KERN_ERR PFX "MP systems not supported by PSB BIOS structure\n");
+			printk(KERN_ERR PFX "Your BIOS does not provide _PSS objects.  PowerNow! does not work on SMP systems without _PSS objects.  Complain to your BIOS vendor.\n");
 			kfree(data);
 			return -ENODEV;
 		}
@@ -1206,10 +1253,7 @@ static int __cpuinit powernowk8_cpu_init
 	set_cpus_allowed(current, oldmask);
 
 	pol->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	if (cpu_family == CPU_HW_PSTATE)
-		pol->cpus = cpumask_of_cpu(pol->cpu);
-	else
-		pol->cpus = cpu_core_map[pol->cpu];
+	pol->cpus = data->starting_core_affinity;
 	data->available_cores = &(pol->cpus);
 
 	/* Take a crude guess here.
@@ -1329,6 +1373,7 @@ static int __cpuinit powernowk8_init(voi
 	}
 
 	if (supported_cpus == num_online_cpus()) {
+		powernow_k8_cpu_preinit_acpi();
 		printk(KERN_INFO PFX "Found %d %s "
 			"processors (" VERSION ")\n", supported_cpus,
 			boot_cpu_data.x86_model_id);
--- linux-2.6.22/arch/i386/kernel/cpu/cpufreq/powernow-k8.h.old	2007-07-09 16:24:34.000000000 -0500
+++ linux-2.6.22/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2007-07-09 16:46:33.000000000 -0500
@@ -32,12 +32,13 @@ struct powernow_k8_data {
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
