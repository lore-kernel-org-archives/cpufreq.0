From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH][retry] Allow Powernow-k8 to use _PSD
Date: Thu, 7 Feb 2008 12:46:44 -0600
Message-ID: <200802071246.44728.mark.langsdorf@amd.com>
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

The ACPI _PSD structure indicates which processors share frequencies.
Provide support for powernow-k8.c to use this function.

This was included in the 2.6.23-mm series but dropped from 2.6.24
and is being resubmitted.

Patch is against 2.6.24-mm1.  It has been tested on AMD 2nd and
3rd generation Opteron systems.

-Mark Langsdorf
Operating System Research Center
AMD

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- arch/x86/kernel/cpu/cpufreq/powernow-k8.c.orig	2008-02-07 10:58:55.000000000 -0600
+++ arch/x86/kernel/cpu/cpufreq/powernow-k8.c	2008-02-07 12:38:18.000000000 -0600
@@ -124,7 +124,8 @@ static int query_current_values_with_pen
 		return 0;
 	}
 	do {
-		if (i++ > 10000) {
+		msleep(5);
+		if (i++ > 1000) {
 			dprintk("detected change pending stuck\n");
 			return 1;
 		}
@@ -574,7 +575,10 @@ static int check_pst_table(struct powern
 
 static void print_basics(struct powernow_k8_data *data)
 {
+	static int printed = 0;
 	int j;
+	if (printed)
+		return;
 	for (j = 0; j < data->numps; j++) {
 		if (data->powernow_table[j].frequency != CPUFREQ_ENTRY_INVALID) {
 			if (cpu_family == CPU_HW_PSTATE) {
@@ -593,6 +597,7 @@ static void print_basics(struct powernow
 	}
 	if (data->batps)
 		printk(KERN_INFO PFX "Only %d pstates on battery\n", data->batps);
+	printed = 1;
 }
 
 static int fill_powernow_table(struct powernow_k8_data *data, struct pst_s *pst, u8 maxvid)
@@ -642,8 +647,6 @@ static int fill_powernow_table(struct po
 
 	dprintk("cfid 0x%x, cvid 0x%x\n", data->currfid, data->currvid);
 	data->powernow_table = powernow_table;
-	if (first_cpu(per_cpu(cpu_core_map, data->cpu)) == data->cpu)
-		print_basics(data);
 
 	for (j = 0; j < data->numps; j++)
 		if ((pst[j].fid==data->currfid) && (pst[j].vid==data->currvid))
@@ -720,6 +723,7 @@ static int find_psb_table(struct powerno
 
 		data->numps = psb->numps;
 		dprintk("numpstates: 0x%x\n", data->numps);
+		data->starting_core_affinity = cpumask_of_cpu(0);
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
 	/*
@@ -740,15 +744,29 @@ static int find_psb_table(struct powerno
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
+static struct acpi_processor_performance *acpi_perf_data;
+static int preregister_valid = 0;
+
+static int powernow_k8_cpu_preinit_acpi()
+{
+	acpi_perf_data = alloc_percpu(struct acpi_processor_performance);
+
+	if (acpi_processor_preregister_performance(acpi_perf_data))
+		return -ENODEV;
+	else 
+		preregister_valid = 1;
+	return 0;
 }
 
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
@@ -756,28 +774,29 @@ static int powernow_k8_cpu_init_acpi(str
 	struct cpufreq_frequency_table *powernow_table;
 	int ret_val;
 
-	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
+	data->acpi_data = percpu_ptr(acpi_perf_data, data->cpu);
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
@@ -790,12 +809,12 @@ static int powernow_k8_cpu_init_acpi(str
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
@@ -803,16 +822,32 @@ static int powernow_k8_cpu_init_acpi(str
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
+			data->starting_core_affinity = per_cpu(cpu_core_map, data->cpu);
+
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
@@ -824,11 +859,11 @@ static int fill_powernow_table_pstate(st
 	rdmsr(MSR_PSTATE_CUR_LIMIT, hi, lo);
 	data->max_hw_pstate = (hi & HW_PSTATE_MAX_MASK) >> HW_PSTATE_MAX_SHIFT;
 
-	for (i = 0; i < data->acpi_data.state_count; i++) {
+	for (i = 0; i < data->acpi_data->state_count; i++) {
 		u32 index;
 		u32 hi = 0, lo = 0;
 
-		index = data->acpi_data.states[i].control & HW_PSTATE_MASK;
+		index = data->acpi_data->states[i].control & HW_PSTATE_MASK;
 		if (index > data->max_hw_pstate) {
 			printk(KERN_ERR PFX "invalid pstate %d - bad value %d.\n", i, index);
 			printk(KERN_ERR PFX "Please report to BIOS manufacturer\n");
@@ -844,7 +879,7 @@ static int fill_powernow_table_pstate(st
 
 		powernow_table[i].index = index;
 
-		powernow_table[i].frequency = data->acpi_data.states[i].core_frequency * 1000;
+		powernow_table[i].frequency = data->acpi_data->states[i].core_frequency * 1000;
 	}
 	return 0;
 }
@@ -853,16 +888,16 @@ static int fill_powernow_table_fidvid(st
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
@@ -903,10 +938,10 @@ static int fill_powernow_table_fidvid(st
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
@@ -916,14 +951,15 @@ static int fill_powernow_table_fidvid(st
 
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
@@ -1128,7 +1164,7 @@ static int __cpuinit powernowk8_cpu_init
 		 * an UP version, and is deprecated by AMD.
 		 */
 		if (num_online_cpus() != 1) {
-			printk(KERN_ERR PFX "MP systems not supported by PSB BIOS structure\n");
+			printk(KERN_ERR PFX "Your BIOS does not provide _PSS objects.  PowerNow! does not work on SMP systems without _PSS objects.  Complain to your BIOS vendor.\n");
 			kfree(data);
 			return -ENODEV;
 		}
@@ -1167,10 +1203,7 @@ static int __cpuinit powernowk8_cpu_init
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
 
-	if (cpu_family == CPU_HW_PSTATE)
-		pol->cpus = cpumask_of_cpu(pol->cpu);
-	else
-		pol->cpus = per_cpu(cpu_core_map, pol->cpu);
+	pol->cpus = data->starting_core_affinity;
 	data->available_cores = &(pol->cpus);
 
 	/* Take a crude guess here.
@@ -1289,6 +1322,7 @@ static int __cpuinit powernowk8_init(voi
 	}
 
 	if (supported_cpus == num_online_cpus()) {
+		powernow_k8_cpu_preinit_acpi();
 		printk(KERN_INFO PFX "Found %d %s "
 			"processors (%d cpu cores) (" VERSION ")\n",
 			num_online_nodes(),
--- arch/x86/kernel/cpu/cpufreq/powernow-k8.c.orig	2008-02-07 10:58:55.000000000 -0600
+++ arch/x86/kernel/cpu/cpufreq/powernow-k8.c	2008-02-07 12:38:18.000000000 -0600
@@ -124,7 +124,8 @@ static int query_current_values_with_pen
 		return 0;
 	}
 	do {
-		if (i++ > 10000) {
+		msleep(5);
+		if (i++ > 1000) {
 			dprintk("detected change pending stuck\n");
 			return 1;
 		}
@@ -574,7 +575,10 @@ static int check_pst_table(struct powern
 
 static void print_basics(struct powernow_k8_data *data)
 {
+	static int printed = 0;
 	int j;
+	if (printed)
+		return;
 	for (j = 0; j < data->numps; j++) {
 		if (data->powernow_table[j].frequency != CPUFREQ_ENTRY_INVALID) {
 			if (cpu_family == CPU_HW_PSTATE) {
@@ -593,6 +597,7 @@ static void print_basics(struct powernow
 	}
 	if (data->batps)
 		printk(KERN_INFO PFX "Only %d pstates on battery\n", data->batps);
+	printed = 1;
 }
 
 static int fill_powernow_table(struct powernow_k8_data *data, struct pst_s *pst, u8 maxvid)
@@ -642,8 +647,6 @@ static int fill_powernow_table(struct po
 
 	dprintk("cfid 0x%x, cvid 0x%x\n", data->currfid, data->currvid);
 	data->powernow_table = powernow_table;
-	if (first_cpu(per_cpu(cpu_core_map, data->cpu)) == data->cpu)
-		print_basics(data);
 
 	for (j = 0; j < data->numps; j++)
 		if ((pst[j].fid==data->currfid) && (pst[j].vid==data->currvid))
@@ -720,6 +723,7 @@ static int find_psb_table(struct powerno
 
 		data->numps = psb->numps;
 		dprintk("numpstates: 0x%x\n", data->numps);
+		data->starting_core_affinity = cpumask_of_cpu(0);
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
 	/*
@@ -740,15 +744,29 @@ static int find_psb_table(struct powerno
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
+static struct acpi_processor_performance *acpi_perf_data;
+static int preregister_valid = 0;
+
+static int powernow_k8_cpu_preinit_acpi()
+{
+	acpi_perf_data = alloc_percpu(struct acpi_processor_performance);
+
+	if (acpi_processor_preregister_performance(acpi_perf_data))
+		return -ENODEV;
+	else 
+		preregister_valid = 1;
+	return 0;
 }
 
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
@@ -756,28 +774,29 @@ static int powernow_k8_cpu_init_acpi(str
 	struct cpufreq_frequency_table *powernow_table;
 	int ret_val;
 
-	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
+	data->acpi_data = percpu_ptr(acpi_perf_data, data->cpu);
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
@@ -790,12 +809,12 @@ static int powernow_k8_cpu_init_acpi(str
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
@@ -803,16 +822,32 @@ static int powernow_k8_cpu_init_acpi(str
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
+			data->starting_core_affinity = per_cpu(cpu_core_map, data->cpu);
+
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
@@ -824,11 +859,11 @@ static int fill_powernow_table_pstate(st
 	rdmsr(MSR_PSTATE_CUR_LIMIT, hi, lo);
 	data->max_hw_pstate = (hi & HW_PSTATE_MAX_MASK) >> HW_PSTATE_MAX_SHIFT;
 
-	for (i = 0; i < data->acpi_data.state_count; i++) {
+	for (i = 0; i < data->acpi_data->state_count; i++) {
 		u32 index;
 		u32 hi = 0, lo = 0;
 
-		index = data->acpi_data.states[i].control & HW_PSTATE_MASK;
+		index = data->acpi_data->states[i].control & HW_PSTATE_MASK;
 		if (index > data->max_hw_pstate) {
 			printk(KERN_ERR PFX "invalid pstate %d - bad value %d.\n", i, index);
 			printk(KERN_ERR PFX "Please report to BIOS manufacturer\n");
@@ -844,7 +879,7 @@ static int fill_powernow_table_pstate(st
 
 		powernow_table[i].index = index;
 
-		powernow_table[i].frequency = data->acpi_data.states[i].core_frequency * 1000;
+		powernow_table[i].frequency = data->acpi_data->states[i].core_frequency * 1000;
 	}
 	return 0;
 }
@@ -853,16 +888,16 @@ static int fill_powernow_table_fidvid(st
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
@@ -903,10 +938,10 @@ static int fill_powernow_table_fidvid(st
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
@@ -916,14 +951,15 @@ static int fill_powernow_table_fidvid(st
 
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
@@ -1128,7 +1164,7 @@ static int __cpuinit powernowk8_cpu_init
 		 * an UP version, and is deprecated by AMD.
 		 */
 		if (num_online_cpus() != 1) {
-			printk(KERN_ERR PFX "MP systems not supported by PSB BIOS structure\n");
+			printk(KERN_ERR PFX "Your BIOS does not provide _PSS objects.  PowerNow! does not work on SMP systems without _PSS objects.  Complain to your BIOS vendor.\n");
 			kfree(data);
 			return -ENODEV;
 		}
@@ -1167,10 +1203,7 @@ static int __cpuinit powernowk8_cpu_init
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
 
-	if (cpu_family == CPU_HW_PSTATE)
-		pol->cpus = cpumask_of_cpu(pol->cpu);
-	else
-		pol->cpus = per_cpu(cpu_core_map, pol->cpu);
+	pol->cpus = data->starting_core_affinity;
 	data->available_cores = &(pol->cpus);
 
 	/* Take a crude guess here.
@@ -1289,6 +1322,7 @@ static int __cpuinit powernowk8_init(voi
 	}
 
 	if (supported_cpus == num_online_cpus()) {
+		powernow_k8_cpu_preinit_acpi();
 		printk(KERN_INFO PFX "Found %d %s "
 			"processors (%d cpu cores) (" VERSION ")\n",
 			num_online_nodes(),
