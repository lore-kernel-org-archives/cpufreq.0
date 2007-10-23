From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH] Get core affinity from
	acpi_processor_preregister_performance()
Date: Tue, 23 Oct 2007 15:35:24 -0500
Message-ID: <200710231535.24805.mark.langsdorf@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
To: davej@redhat.com, cpufreq@lists.linux.org.uk

Linux now supports the ACPI _PSD structure, which indicates which processors
have their pstates tied together. =A0_PSD discovery is handled through
acpi_processor_preregister_performance(). =A0Add support for this call to
powernow-k8.c. =A0Fallback support is included if the BIOS does not provide
a _PSD

This patch looks a little ugly, because a large part of it is turning a
static structure reference to a pointer structure reference. =A0The rest of
the change is fairly mild and based on the speedstep-centrino code.

This should apply on top of the architectural pstate patch I just
submitted.  It has been tested on several laptops and a few servers,
with 2nd and 3rd generation Opteron parts and some Turion X2s.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

diff -uprN -X linux-2.6.23-git18-vanilla/Documentation/dontdiff linux-2.6.2=
3-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.c linux-2.6.23-git1=
8/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
--- linux-2.6.23-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	20=
07-10-23 13:51:12.000000000 -0500
+++ linux-2.6.23-git18/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	2007-10-23=
 15:26:36.000000000 -0500
@@ -46,7 +46,7 @@
 =

 #define PFX "powernow-k8: "
 #define BFX PFX "BIOS error: "
-#define VERSION "version 2.00.00"
+#define VERSION "version 2.20.00"
 #include "powernow-k8.h"
 =

 /* serialize freq changes  */
@@ -73,33 +73,11 @@ static u32 find_khz_freq_from_fid(u32 fi
 	return 1000 * find_freq_from_fid(fid);
 }
 =

-/* Return a frequency in MHz, given an input fid and did */
-static u32 find_freq_from_fiddid(u32 fid, u32 did)
+static u32 find_khz_freq_from_pstate(struct cpufreq_frequency_table *data,=
 u32 pstate)
 {
-	if (current_cpu_data.x86 =3D=3D 0x10)
-		return 100 * (fid + 0x10) >> did;
-	else
-		return 100 * (fid + 0x8) >> did;
+	return data[pstate].frequency;
 }
 =

-static u32 find_khz_freq_from_fiddid(u32 fid, u32 did)
-{
-	return 1000 * find_freq_from_fiddid(fid, did);
-}
-
-static u32 find_fid_from_pstate(u32 pstate)
-{
-	u32 hi, lo;
-	rdmsr(MSR_PSTATE_DEF_BASE + pstate, lo, hi);
-	return lo & HW_PSTATE_FID_MASK;
-}
-
-static u32 find_did_from_pstate(u32 pstate)
-{
-	u32 hi, lo;
-	rdmsr(MSR_PSTATE_DEF_BASE + pstate, lo, hi);
-	return (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
-}
 =

 /* Return the vco fid for an input fid
  *
@@ -142,13 +120,12 @@ static int query_current_values_with_pen
 	if (cpu_family =3D=3D CPU_HW_PSTATE) {
 		rdmsr(MSR_PSTATE_STATUS, lo, hi);
 		i =3D lo & HW_PSTATE_MASK;
-		rdmsr(MSR_PSTATE_DEF_BASE + i, lo, hi);
-		data->currfid =3D lo & HW_PSTATE_FID_MASK;
-		data->currdid =3D (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
+		data->currpstate =3D i;
 		return 0;
 	}
 	do {
-		if (i++ > 10000) {
+		msleep(5);
+		if (i++ > 1000) {
 			dprintk("detected change pending stuck\n");
 			return 1;
 		}
@@ -295,7 +272,7 @@ static int decrease_vid_code_by_step(str
 static int transition_pstate(struct powernow_k8_data *data, u32 pstate)
 {
 	wrmsr(MSR_PSTATE_CTRL, pstate, 0);
-	data->currfid =3D find_fid_from_pstate(pstate);
+	data->currpstate =3D pstate;
 	return 0;
 }
 =

@@ -745,6 +722,7 @@ static int find_psb_table(struct powerno
 =

 		data->numps =3D psb->numps;
 		dprintk("numpstates: 0x%x\n", data->numps);
+		data->starting_core_affinity =3D cpumask_of_cpu(0);
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
 	/*
@@ -765,15 +743,29 @@ static int find_psb_table(struct powerno
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, uns=
igned int index)
 {
-	if (!data->acpi_data.state_count || (cpu_family =3D=3D CPU_HW_PSTATE))
+	if (!data->acpi_data->state_count || (cpu_family =3D=3D CPU_HW_PSTATE))
 		return;
 =

-	data->irt =3D (data->acpi_data.states[index].control >> IRT_SHIFT) & IRT_=
MASK;
-	data->rvo =3D (data->acpi_data.states[index].control >> RVO_SHIFT) & RVO_=
MASK;
-	data->exttype =3D (data->acpi_data.states[index].control >> EXT_TYPE_SHIF=
T) & EXT_TYPE_MASK;
-	data->plllock =3D (data->acpi_data.states[index].control >> PLL_L_SHIFT) =
& PLL_L_MASK;
-	data->vidmvs =3D 1 << ((data->acpi_data.states[index].control >> MVS_SHIF=
T) & MVS_MASK);
-	data->vstable =3D (data->acpi_data.states[index].control >> VST_SHIFT) & =
VST_MASK;
+	data->irt =3D (data->acpi_data->states[index].control >> IRT_SHIFT) & IRT=
_MASK;
+	data->rvo =3D (data->acpi_data->states[index].control >> RVO_SHIFT) & RVO=
_MASK;
+	data->exttype =3D (data->acpi_data->states[index].control >> EXT_TYPE_SHI=
FT) & EXT_TYPE_MASK;
+	data->plllock =3D (data->acpi_data->states[index].control >> PLL_L_SHIFT)=
 & PLL_L_MASK;
+	data->vidmvs =3D 1 << ((data->acpi_data->states[index].control >> MVS_SHI=
FT) & MVS_MASK);
+	data->vstable =3D (data->acpi_data->states[index].control >> VST_SHIFT) &=
 VST_MASK;
+}
+
+static struct acpi_processor_performance *acpi_perf_data;
+static int preregister_valid =3D 0;
+
+static int powernow_k8_cpu_preinit_acpi()
+{
+	acpi_perf_data =3D alloc_percpu(struct acpi_processor_performance);
+
+	if (acpi_processor_preregister_performance(acpi_perf_data))
+		return -ENODEV;
+	else =

+		preregister_valid =3D 1;
+	return 0;
 }
 =

 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
@@ -781,28 +773,29 @@ static int powernow_k8_cpu_init_acpi(str
 	struct cpufreq_frequency_table *powernow_table;
 	int ret_val;
 =

-	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
+	data->acpi_data =3D percpu_ptr(acpi_perf_data, data->cpu);
+	if (acpi_processor_register_performance(data->acpi_data, data->cpu)) {
 		dprintk("register performance failed: bad ACPI data\n");
 		return -EIO;
 	}
 =

 	/* verify the data contained in the ACPI structures */
-	if (data->acpi_data.state_count <=3D 1) {
+	if (data->acpi_data->state_count <=3D 1) {
 		dprintk("No ACPI P-States\n");
 		goto err_out;
 	}
 =

-	if ((data->acpi_data.control_register.space_id !=3D ACPI_ADR_SPACE_FIXED_=
HARDWARE) ||
-		(data->acpi_data.status_register.space_id !=3D ACPI_ADR_SPACE_FIXED_HARD=
WARE)) {
+	if ((data->acpi_data->control_register.space_id !=3D ACPI_ADR_SPACE_FIXED=
_HARDWARE) ||
+		(data->acpi_data->status_register.space_id !=3D ACPI_ADR_SPACE_FIXED_HAR=
DWARE)) {
 		dprintk("Invalid control/status registers (%x - %x)\n",
-			data->acpi_data.control_register.space_id,
-			data->acpi_data.status_register.space_id);
+			data->acpi_data->control_register.space_id,
+			data->acpi_data->status_register.space_id);
 		goto err_out;
 	}
 =

 	/* fill in data->powernow_table */
 	powernow_table =3D kmalloc((sizeof(struct cpufreq_frequency_table)
-		* (data->acpi_data.state_count + 1)), GFP_KERNEL);
+		* (data->acpi_data->state_count + 1)), GFP_KERNEL);
 	if (!powernow_table) {
 		dprintk("powernow_table memory alloc failure\n");
 		goto err_out;
@@ -815,12 +808,12 @@ static int powernow_k8_cpu_init_acpi(str
 	if (ret_val)
 		goto err_out_mem;
 =

-	powernow_table[data->acpi_data.state_count].frequency =3D CPUFREQ_TABLE_E=
ND;
-	powernow_table[data->acpi_data.state_count].index =3D 0;
+	powernow_table[data->acpi_data->state_count].frequency =3D CPUFREQ_TABLE_=
END;
+	powernow_table[data->acpi_data->state_count].index =3D 0;
 	data->powernow_table =3D powernow_table;
 =

 	/* fill in data */
-	data->numps =3D data->acpi_data.state_count;
+	data->numps =3D data->acpi_data->state_count;
 	if (first_cpu(per_cpu(cpu_core_map, data->cpu)) =3D=3D data->cpu)
 		print_basics(data);
 	powernow_k8_acpi_pst_values(data, 0);
@@ -828,16 +821,32 @@ static int powernow_k8_cpu_init_acpi(str
 	/* notify BIOS that we exist */
 	acpi_processor_notify_smm(THIS_MODULE);
 =

+	/* determine affinity, from ACPI if available */
+	if (preregister_valid) {
+		if ((data->acpi_data->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ALL) ||
+		    (data->acpi_data->shared_type =3D=3D CPUFREQ_SHARED_TYPE_ANY))
+			data->starting_core_affinity =3D data->acpi_data->shared_cpu_map;
+		else
+			data->starting_core_affinity =3D cpumask_of_cpu(data->cpu);
+	} else {
+		/* best guess from family if not */
+		if (cpu_family =3D=3D CPU_HW_PSTATE)
+			data->starting_core_affinity =3D cpumask_of_cpu(data->cpu);
+		else
+			data->starting_core_affinity =3D per_cpu(cpu_core_map, data->cpu);
+
+	}
+
 	return 0;
 =

 err_out_mem:
 	kfree(powernow_table);
 =

 err_out:
-	acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
+	acpi_processor_unregister_performance(data->acpi_data, data->cpu);
 =

-	/* data->acpi_data.state_count informs us at ->exit() whether ACPI was us=
ed */
-	data->acpi_data.state_count =3D 0;
+	/* data->acpi_data->state_count informs us at ->exit() whether ACPI was u=
sed */
+	data->acpi_data->state_count =3D 0;
 =

 	return -ENODEV;
 }
@@ -845,17 +854,20 @@ err_out:
 static int fill_powernow_table_pstate(struct powernow_k8_data *data, struc=
t cpufreq_frequency_table *powernow_table)
 {
 	int i;
+	u32 hi =3D 0, lo =3D 0;
+	rdmsr(MSR_PSTATE_CUR_LIMIT, hi, lo);
+	data->max_hw_pstate =3D (hi & HW_PSTATE_MAX_MASK) >> HW_PSTATE_MAX_SHIFT;
 =

-	for (i =3D 0; i < data->acpi_data.state_count; i++) {
+	for (i =3D 0; i < data->acpi_data->state_count; i++) {
 		u32 index;
 		u32 hi =3D 0, lo =3D 0;
-		u32 fid;
-		u32 did;
 =

-		index =3D data->acpi_data.states[i].control & HW_PSTATE_MASK;
-		if (index > MAX_HW_PSTATE) {
+		index =3D data->acpi_data->states[i].control & HW_PSTATE_MASK;
+		if (index > data->max_hw_pstate) {
 			printk(KERN_ERR PFX "invalid pstate %d - bad value %d.\n", i, index);
 			printk(KERN_ERR PFX "Please report to BIOS manufacturer\n");
+			powernow_table[i].frequency =3D CPUFREQ_ENTRY_INVALID;
+			continue;
 		}
 		rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
 		if (!(hi & HW_PSTATE_VALID_MASK)) {
@@ -864,22 +876,9 @@ static int fill_powernow_table_pstate(st
 			continue;
 		}
 =

-		fid =3D lo & HW_PSTATE_FID_MASK;
-		did =3D (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
-
-		dprintk("   %d : fid 0x%x, did 0x%x\n", index, fid, did);
-
-		powernow_table[i].index =3D index | (fid << HW_FID_INDEX_SHIFT) | (did <=
< HW_DID_INDEX_SHIFT);
-
-		powernow_table[i].frequency =3D find_khz_freq_from_fiddid(fid, did);
+		powernow_table[i].index =3D index;
 =

-		if (powernow_table[i].frequency !=3D (data->acpi_data.states[i].core_fre=
quency * 1000)) {
-			printk(KERN_INFO PFX "invalid freq entries %u kHz vs. %u kHz\n",
-				powernow_table[i].frequency,
-				(unsigned int) (data->acpi_data.states[i].core_frequency * 1000));
-			powernow_table[i].frequency =3D CPUFREQ_ENTRY_INVALID;
-			continue;
-		}
+		powernow_table[i].frequency =3D data->acpi_data->states[i].core_frequenc=
y * 1000;
 	}
 	return 0;
 }
@@ -888,16 +887,16 @@ static int fill_powernow_table_fidvid(st
 {
 	int i;
 	int cntlofreq =3D 0;
-	for (i =3D 0; i < data->acpi_data.state_count; i++) {
+	for (i =3D 0; i < data->acpi_data->state_count; i++) {
 		u32 fid;
 		u32 vid;
 =

 		if (data->exttype) {
-			fid =3D data->acpi_data.states[i].status & EXT_FID_MASK;
-			vid =3D (data->acpi_data.states[i].status >> VID_SHIFT) & EXT_VID_MASK;
+			fid =3D data->acpi_data->states[i].status & EXT_FID_MASK;
+			vid =3D (data->acpi_data->states[i].status >> VID_SHIFT) & EXT_VID_MASK;
 		} else {
-			fid =3D data->acpi_data.states[i].control & FID_MASK;
-			vid =3D (data->acpi_data.states[i].control >> VID_SHIFT) & VID_MASK;
+			fid =3D data->acpi_data->states[i].control & FID_MASK;
+			vid =3D (data->acpi_data->states[i].control >> VID_SHIFT) & VID_MASK;
 		}
 =

 		dprintk("   %d : fid 0x%x, vid 0x%x\n", i, fid, vid);
@@ -938,10 +937,10 @@ static int fill_powernow_table_fidvid(st
 				cntlofreq =3D i;
 		}
 =

-		if (powernow_table[i].frequency !=3D (data->acpi_data.states[i].core_fre=
quency * 1000)) {
+		if (powernow_table[i].frequency !=3D (data->acpi_data->states[i].core_fr=
equency * 1000)) {
 			printk(KERN_INFO PFX "invalid freq entries %u kHz vs. %u kHz\n",
 				powernow_table[i].frequency,
-				(unsigned int) (data->acpi_data.states[i].core_frequency * 1000));
+				(unsigned int) (data->acpi_data->states[i].core_frequency * 1000));
 			powernow_table[i].frequency =3D CPUFREQ_ENTRY_INVALID;
 			continue;
 		}
@@ -951,14 +950,15 @@ static int fill_powernow_table_fidvid(st
 =

 static void powernow_k8_cpu_exit_acpi(struct powernow_k8_data *data)
 {
-	if (data->acpi_data.state_count)
-		acpi_processor_unregister_performance(&data->acpi_data, data->cpu);
+	if (data->acpi_data->state_count)
+		acpi_processor_unregister_performance(data->acpi_data, data->cpu);
 }
 =

 #else
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data) { retu=
rn -ENODEV; }
 static void powernow_k8_cpu_exit_acpi(struct powernow_k8_data *data) { ret=
urn; }
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, uns=
igned int index) { return; }
+static int powernow_k8_cpu_preinit_acpi() { return -ENODEV; }
 #endif /* CONFIG_X86_POWERNOW_K8_ACPI */
 =

 /* Take a frequency, and issue the fid/vid transition command */
@@ -1020,22 +1020,18 @@ static int transition_frequency_fidvid(s
 /* Take a frequency, and issue the hardware pstate transition command */
 static int transition_frequency_pstate(struct powernow_k8_data *data, unsi=
gned int index)
 {
-	u32 fid =3D 0;
-	u32 did =3D 0;
 	u32 pstate =3D 0;
 	int res, i;
 	struct cpufreq_freqs freqs;
 =

 	dprintk("cpu %d transition to index %u\n", smp_processor_id(), index);
 =

-	/* get fid did for hardware pstate transition */
+	/* get MSR index for hardware pstate transition */
 	pstate =3D index & HW_PSTATE_MASK;
-	if (pstate > MAX_HW_PSTATE)
+	if (pstate > data->max_hw_pstate)
 		return 0;
-	fid =3D (index & HW_FID_INDEX_MASK) >> HW_FID_INDEX_SHIFT;
-	did =3D (index & HW_DID_INDEX_MASK) >> HW_DID_INDEX_SHIFT;
-	freqs.old =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
-	freqs.new =3D find_khz_freq_from_fiddid(fid, did);
+	freqs.old =3D find_khz_freq_from_pstate(data->powernow_table, data->currp=
state);
+	freqs.new =3D find_khz_freq_from_pstate(data->powernow_table, pstate);
 =

 	for_each_cpu_mask(i, *(data->available_cores)) {
 		freqs.cpu =3D i;
@@ -1043,9 +1039,7 @@ static int transition_frequency_pstate(s
 	}
 =

 	res =3D transition_pstate(data, pstate);
-	data->currfid =3D find_fid_from_pstate(pstate);
-	data->currdid =3D find_did_from_pstate(pstate);
-	freqs.new =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+	freqs.new =3D find_khz_freq_from_pstate(data->powernow_table, pstate);
 =

 	for_each_cpu_mask(i, *(data->available_cores)) {
 		freqs.cpu =3D i;
@@ -1090,10 +1084,7 @@ static int powernowk8_target(struct cpuf
 	if (query_current_values_with_pending_wait(data))
 		goto err_out;
 =

-	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		dprintk("targ: curr fid 0x%x, did 0x%x\n",
-			data->currfid, data->currdid);
-	else {
+	if (cpu_family !=3D CPU_HW_PSTATE) {
 		dprintk("targ: curr fid 0x%x, vid 0x%x\n",
 		data->currfid, data->currvid);
 =

@@ -1124,7 +1115,7 @@ static int powernowk8_target(struct cpuf
 	mutex_unlock(&fidvid_mutex);
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		pol->cur =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+		pol->cur =3D find_khz_freq_from_pstate(data->powernow_table, newstate);
 	else
 		pol->cur =3D find_khz_freq_from_fid(data->currfid);
 	ret =3D 0;
@@ -1172,7 +1163,7 @@ static int __cpuinit powernowk8_cpu_init
 		 * an UP version, and is deprecated by AMD.
 		 */
 		if (num_online_cpus() !=3D 1) {
-			printk(KERN_ERR PFX "MP systems not supported by PSB BIOS structure\n");
+			printk(KERN_ERR PFX "Your BIOS does not provide _PSS objects.  PowerNow=
! does not work on SMP systems without _PSS objects.  Complain to your BIOS=
 vendor.\n");
 			kfree(data);
 			return -ENODEV;
 		}
@@ -1211,10 +1202,7 @@ static int __cpuinit powernowk8_cpu_init
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
 =

-	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		pol->cpus =3D cpumask_of_cpu(pol->cpu);
-	else
-		pol->cpus =3D per_cpu(cpu_core_map, pol->cpu);
+	pol->cpus =3D data->starting_core_affinity;
 	data->available_cores =3D &(pol->cpus);
 =

 	/* Take a crude guess here.
@@ -1223,7 +1211,7 @@ static int __cpuinit powernowk8_cpu_init
 	    + (3 * (1 << data->irt) * 10)) * 1000;
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		pol->cur =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+		pol->cur =3D find_khz_freq_from_pstate(data->powernow_table, data->currp=
state);
 	else
 		pol->cur =3D find_khz_freq_from_fid(data->currfid);
 	dprintk("policy current frequency %d kHz\n", pol->cur);
@@ -1240,8 +1228,7 @@ static int __cpuinit powernowk8_cpu_init
 	cpufreq_frequency_table_get_attr(data->powernow_table, pol->cpu);
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		dprintk("cpu_init done, current fid 0x%x, did 0x%x\n",
-			data->currfid, data->currdid);
+		dprintk("cpu_init done, current pstate 0x%x\n", data->currpstate);
 	else
 		dprintk("cpu_init done, current fid 0x%x, vid 0x%x\n",
 			data->currfid, data->currvid);
@@ -1297,7 +1284,7 @@ static unsigned int powernowk8_get (unsi
 		goto out;
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		khz =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+		khz =3D find_khz_freq_from_pstate(data->powernow_table, data->currpstate=
);
 	else
 		khz =3D find_khz_freq_from_fid(data->currfid);
 =

@@ -1334,6 +1321,7 @@ static int __cpuinit powernowk8_init(voi
 	}
 =

 	if (supported_cpus =3D=3D num_online_cpus()) {
+		powernow_k8_cpu_preinit_acpi();
 		printk(KERN_INFO PFX "Found %d %s "
 			"processors (%d cpu cores) (" VERSION ")\n",
 			num_online_nodes(),
diff -uprN -X linux-2.6.23-git18-vanilla/Documentation/dontdiff linux-2.6.2=
3-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.h linux-2.6.23-git1=
8/arch/x86/kernel/cpu/cpufreq/powernow-k8.h
--- linux-2.6.23-git18-vanilla/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	20=
07-10-23 13:51:12.000000000 -0500
+++ linux-2.6.23-git18/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	2007-10-23=
 14:14:56.000000000 -0500
@@ -10,6 +10,7 @@ struct powernow_k8_data {
 =

 	u32 numps;  /* number of p-states */
 	u32 batps;  /* number of p-states supported on battery */
+	u32 max_hw_pstate; /* maximum legal hardware pstate */
 =

 	/* these values are constant when the PSB is used to determine
 	 * vid/fid pairings, but are modified during the ->target() call
@@ -21,8 +22,8 @@ struct powernow_k8_data {
 	u32 plllock; /* pll lock time, units 1 us */
         u32 exttype; /* extended interface =3D 1 */
 =

-	/* keep track of the current fid / vid or did */
-	u32 currvid, currfid, currdid;
+	/* keep track of the current fid / vid or pstate */
+	u32 currvid, currfid, currpstate;
 =

 	/* the powernow_table includes all frequency and vid/fid pairings:
 	 * fid are the lower 8 bits of the index, vid are the upper 8 bits.
@@ -32,12 +33,13 @@ struct powernow_k8_data {
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
 =

 =

@@ -87,23 +89,14 @@ struct powernow_k8_data {
 =

 /* Hardware Pstate _PSS and MSR definitions */
 #define USE_HW_PSTATE		0x00000080
-#define HW_PSTATE_FID_MASK 	0x0000003f
-#define HW_PSTATE_DID_MASK 	0x000001c0
-#define HW_PSTATE_DID_SHIFT 	6
 #define HW_PSTATE_MASK 		0x00000007
 #define HW_PSTATE_VALID_MASK 	0x80000000
-#define HW_FID_INDEX_SHIFT	8
-#define HW_FID_INDEX_MASK	0x0000ff00
-#define HW_DID_INDEX_SHIFT	16
-#define HW_DID_INDEX_MASK	0x00ff0000
-#define HW_WATTS_MASK		0xff
-#define HW_PWR_DVR_MASK		0x300
-#define HW_PWR_DVR_SHIFT	8
-#define HW_PWR_MAX_MULT		3
-#define MAX_HW_PSTATE		8	/* hw pstate supports up to 8 */
+#define HW_PSTATE_MAX_MASK	0x000000f0
+#define HW_PSTATE_MAX_SHIFT	4
 #define MSR_PSTATE_DEF_BASE 	0xc0010064 /* base of Pstate MSRs */
 #define MSR_PSTATE_STATUS 	0xc0010063 /* Pstate Status MSR */
 #define MSR_PSTATE_CTRL 	0xc0010062 /* Pstate control MSR */
+#define MSR_PSTATE_CUR_LIMIT	0xc0010061 /* pstate current limit MSR */
 =

 /* define the two driver architectures */
 #define CPU_OPTERON 0
@@ -216,6 +209,7 @@ static int core_frequency_transition(str
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data, uns=
igned int index);
 =

 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
+static int powernow_k8_cpu_preinit_acpi(void);
 static int fill_powernow_table_pstate(struct powernow_k8_data *data, struc=
t cpufreq_frequency_table *powernow_table);
 static int fill_powernow_table_fidvid(struct powernow_k8_data *data, struc=
t cpufreq_frequency_table *powernow_table);
 #endif
