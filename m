From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH] Hardware P-state driver for AMD Opterons, etc.
Date: Fri, 2 Jun 2006 17:45:24 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A843053503D0@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C68696.3D25A7C0"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C68696.3D25A7C0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Forthcoming AMD products will use a different
algorithm for transitioning pstates than the
current generation Opteron products do.  The
attached patch allows the powernow-k8 driver
to work with those products.

(posted and attached because my mailer is
extremely braindead).

-Mark Langsdorf
AMD, Inc.

 powernow-k8.c |  342
+++++++++++++++++++++++++++++++++++++++++++---------------
 powernow-k8.h |   40 ++++++
 2 files changed, 293 insertions(+), 89 deletions(-)

signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

---
linux-2.6.17-hwpstate/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig
2006-06-01 13:40:50.000000000 -0500
+++ linux-2.6.17-hwpstate/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
2006-06-02 17:38:15.000000000 -0500
@@ -1,5 +1,5 @@
 /*
- *   (c) 2003, 2004, 2005 Advanced Micro Devices, Inc.
+ *   (c) 2003-2006 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
  *  GNU general public license version 2. See "COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
@@ -14,13 +14,13 @@
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
  *
  *  Valuable input gratefully received from Dave Jones, Pavel Machek,
- *  Dominik Brodowski, and others.
+ *  Dominik Brodowski, Jacob Shin, and others.
  *  Originally developed by Paul Devriendt.
  *  Processor information obtained from Chapter 9 (Power and Thermal
Management)
  *  of the "BIOS and Kernel Developer's Guide for the AMD Athlon 64 and
AMD
  *  Opteron Processors" available for download from www.amd.com
  *
- *  Tables for specific CPUs can be infrerred from
+ *  Tables for specific CPUs can be inferred from
  *
http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/
30430.pdf
  */
=20
@@ -46,7 +46,7 @@
=20
 #define PFX "powernow-k8: "
 #define BFX PFX "BIOS error: "
-#define VERSION "version 1.60.2"
+#define VERSION "version 2.00.00"
 #include "powernow-k8.h"
=20
 /* serialize freq changes  */
@@ -54,6 +54,8 @@ static DEFINE_MUTEX(fidvid_mutex);
=20
 static struct powernow_k8_data *powernow_data[NR_CPUS];
=20
+static int cpu_family =3D CPU_OPTERON;
+
 #ifndef CONFIG_SMP
 static cpumask_t cpu_core_map[1];
 #endif
@@ -64,16 +66,36 @@ static u32 find_freq_from_fid(u32 fid)
 	return 800 + (fid * 100);
 }
=20
+
 /* Return a frequency in KHz, given an input fid */
 static u32 find_khz_freq_from_fid(u32 fid)
 {
 	return 1000 * find_freq_from_fid(fid);
 }
=20
-/* Return a voltage in miliVolts, given an input vid */
-static u32 find_millivolts_from_vid(struct powernow_k8_data *data, u32
vid)
+/* Return a frequency in MHz, given an input fid and did */
+static u32 find_freq_from_fiddid(u32 fid, u32 did)
+{
+	return 100 * (fid + 0x10) >> did;
+}
+
+static u32 find_khz_freq_from_fiddid(u32 fid, u32 did)
+{
+	return 1000 * find_freq_from_fiddid(fid, did);
+}
+
+static u32 find_fid_from_pstate(u32 pstate)
+{
+	u32 hi, lo;
+	rdmsr(MSR_PSTATE_DEF_BASE + pstate, lo, hi);
+	return lo & HW_PSTATE_FID_MASK;
+}
+
+static u32 find_did_from_pstate(u32 pstate)
 {
-	return 1550-vid*25;
+	u32 hi, lo;
+	rdmsr(MSR_PSTATE_DEF_BASE + pstate, lo, hi);
+	return (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
 }
=20
 /* Return the vco fid for an input fid
@@ -98,6 +120,9 @@ static int pending_bit_stuck(void)
 {
 	u32 lo, hi;
=20
+	if (cpu_family)
+		return 0;
+
 	rdmsr(MSR_FIDVID_STATUS, lo, hi);
 	return lo & MSR_S_LO_CHANGE_PENDING ? 1 : 0;
 }
@@ -111,6 +136,14 @@ static int query_current_values_with_pen
 	u32 lo, hi;
 	u32 i =3D 0;
=20
+	if (cpu_family) {
+		rdmsr(MSR_PSTATE_STATUS, lo, hi);
+		i =3D lo & HW_PSTATE_MASK;
+		rdmsr(MSR_PSTATE_DEF_BASE + i, lo, hi);
+		data->currfid =3D lo & HW_PSTATE_FID_MASK;
+		data->currdid =3D (lo & HW_PSTATE_DID_MASK) >>
HW_PSTATE_DID_SHIFT;
+		return 0;
+	}
 	do {
 		if (i++ > 10000) {
 			dprintk("detected change pending stuck\n");
@@ -175,7 +208,7 @@ static int write_new_fid(struct powernow
 	do {
 		wrmsr(MSR_FIDVID_CTL, lo, data->plllock *
PLL_LOCK_CONVERSION);
 		if (i++ > 100) {
-			printk(KERN_ERR PFX "internal error - pending
bit very stuck - no further pstate changes possible\n");
+			printk(KERN_ERR PFX "Hardware error - pending
bit very stuck - no further pstate changes possible\n");
 			return 1;
 		}
 	} while (query_current_values_with_pending_wait(data));
@@ -255,7 +288,15 @@ static int decrease_vid_code_by_step(str
 	return 0;
 }
=20
-/* Change the fid and vid, by the 3 phases. */
+/* Change hardware pstate by single MSR write */
+static int transition_pstate(struct powernow_k8_data *data, u32 pstate)
+{
+	wrmsr(MSR_PSTATE_CTRL, pstate, 0);
+	data->currfid =3D find_fid_from_pstate(pstate);
+	return 0;
+}
+
+/* Change Opteron/Athlon64 fid and vid, by the 3 phases. */
 static int transition_fid_vid(struct powernow_k8_data *data, u32
reqfid, u32 reqvid)
 {
 	if (core_voltage_pre_transition(data, reqvid))
@@ -474,26 +515,35 @@ static int check_supported_cpu(unsigned=20
 		goto out;
=20
 	eax =3D cpuid_eax(CPUID_PROCESSOR_SIGNATURE);
-	if ((eax & CPUID_XFAM) !=3D CPUID_XFAM_K8)
+	if (((eax & CPUID_XFAM) !=3D CPUID_XFAM_K8) &&=20
+	    ((eax & CPUID_XFAM) < CPUID_XFAM_10H))=20
 		goto out;
=20
-	if (((eax & CPUID_USE_XFAM_XMOD) !=3D CPUID_USE_XFAM_XMOD) ||
-	    ((eax & CPUID_XMOD) > CPUID_XMOD_REV_G)) {
-		printk(KERN_INFO PFX "Processor cpuid %x not
supported\n", eax);
-		goto out;
-	}
-
-	eax =3D cpuid_eax(CPUID_GET_MAX_CAPABILITIES);
-	if (eax < CPUID_FREQ_VOLT_CAPABILITIES) {
-		printk(KERN_INFO PFX
-		       "No frequency change capabilities detected\n");
-		goto out;
-	}
-
-	cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx, &edx);
-	if ((edx & P_STATE_TRANSITION_CAPABLE) !=3D
P_STATE_TRANSITION_CAPABLE) {
-		printk(KERN_INFO PFX "Power state transitions not
supported\n");
-		goto out;
+	if ((eax & CPUID_XFAM) =3D=3D CPUID_XFAM_K8) {
+		if (((eax & CPUID_USE_XFAM_XMOD) !=3D CPUID_USE_XFAM_XMOD)
||
+	    		((eax & CPUID_XMOD) > CPUID_XMOD_REV_G)) {
+			printk(KERN_INFO PFX "Processor cpuid %x not
supported\n", eax);
+			goto out;
+		}
+
+		eax =3D cpuid_eax(CPUID_GET_MAX_CAPABILITIES);
+		if (eax < CPUID_FREQ_VOLT_CAPABILITIES) {
+			printk(KERN_INFO PFX
+			       "No frequency change capabilities
detected\n");
+			goto out;
+		}
+
+		cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx,
&edx);
+		if ((edx & P_STATE_TRANSITION_CAPABLE) !=3D
P_STATE_TRANSITION_CAPABLE) {
+			printk(KERN_INFO PFX "Power state transitions
not supported\n");
+			goto out;
+		}
+	} else { /* must be a HW Pstate capable processor */
+		cpuid(CPUID_FREQ_VOLT_CAPABILITIES, &eax, &ebx, &ecx,
&edx);
+                if ((edx & USE_HW_PSTATE) =3D=3D USE_HW_PSTATE)=20
+			cpu_family =3D CPU_HW_PSTATE;
+                else=20
+			goto out;
 	}
=20
 	rc =3D 1;
@@ -547,12 +597,18 @@ static void print_basics(struct powernow
 {
 	int j;
 	for (j =3D 0; j < data->numps; j++) {
-		if (data->powernow_table[j].frequency !=3D
CPUFREQ_ENTRY_INVALID)
-			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz),
vid 0x%x (%d mV)\n", j,
+		if (data->powernow_table[j].frequency !=3D
CPUFREQ_ENTRY_INVALID) {
+			if (cpu_family) {
+			printk(KERN_INFO PFX "   %d : fid 0x%x gid 0x%x
(%d MHz)\n", j, (data->powernow_table[j].index & 0xff00) >> 8,
+				(data->powernow_table[j].index &
0xff0000) >> 16,
+				data->powernow_table[j].frequency/1000);
+			} else {
+			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz),
vid 0x%x\n", j,
 				data->powernow_table[j].index & 0xff,
 				data->powernow_table[j].frequency/1000,
-				data->powernow_table[j].index >> 8,
-				find_millivolts_from_vid(data,
data->powernow_table[j].index >> 8));
+				data->powernow_table[j].index >> 8);
+			}
+		}
 	}
 	if (data->batps)
 		printk(KERN_INFO PFX "Only %d pstates on battery\n",
data->batps);
@@ -702,7 +758,7 @@ static int find_psb_table(struct powerno
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data,
unsigned int index)
 {
-	if (!data->acpi_data.state_count)
+	if (!data->acpi_data.state_count || cpu_family)
 		return;
=20
 	data->irt =3D (data->acpi_data.states[index].control >> IRT_SHIFT)
& IRT_MASK;
@@ -715,9 +771,8 @@ static void powernow_k8_acpi_pst_values(
=20
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data)
 {
-	int i;
-	int cntlofreq =3D 0;
 	struct cpufreq_frequency_table *powernow_table;
+	int ret_val;
=20
 	if (acpi_processor_register_performance(&data->acpi_data,
data->cpu)) {
 		dprintk("register performance failed: bad ACPI data\n");
@@ -746,6 +801,85 @@ static int powernow_k8_cpu_init_acpi(str
 		goto err_out;
 	}
=20
+	if (cpu_family)
+		ret_val =3D fill_powernow_table_pstate(data,
powernow_table);
+	else
+		ret_val =3D fill_powernow_table_fidvid(data,
powernow_table);
+	if (ret_val)
+		goto err_out_mem;
+
+	powernow_table[data->acpi_data.state_count].frequency =3D
CPUFREQ_TABLE_END;
+	powernow_table[data->acpi_data.state_count].index =3D 0;
+	data->powernow_table =3D powernow_table;
+
+	/* fill in data */
+	data->numps =3D data->acpi_data.state_count;
+	print_basics(data);
+	powernow_k8_acpi_pst_values(data, 0);
+
+	/* notify BIOS that we exist */
+	acpi_processor_notify_smm(THIS_MODULE);
+
+	return 0;
+
+err_out_mem:
+	kfree(powernow_table);
+
+err_out:
+	acpi_processor_unregister_performance(&data->acpi_data,
data->cpu);
+
+	/* data->acpi_data.state_count informs us at ->exit() whether
ACPI was used */
+	data->acpi_data.state_count =3D 0;
+
+	return -ENODEV;
+}
+
+static int fill_powernow_table_pstate(struct powernow_k8_data *data,
struct cpufreq_frequency_table *powernow_table)
+{
+	int i;
+
+	for (i =3D 0; i < data->acpi_data.state_count; i++) {
+		u32 index;=09
+		u32 hi =3D 0, lo =3D 0;
+		u32 fid;
+		u32 did;
+
+		index =3D data->acpi_data.states[i].control &
HW_PSTATE_MASK;
+		if (index > MAX_HW_PSTATE) {
+			printk(KERN_ERR PFX "invalid pstate %d - bad
value %d.\n", i, index);
+			printk(KERN_ERR PFX "Please report to BIOS
manufacturer\n");
+		}
+		rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
+		if (!(hi & HW_PSTATE_VALID_MASK)) {
+			dprintk("invalid pstate %d, ignoring\n", index);
+			powernow_table[i].frequency =3D
CPUFREQ_ENTRY_INVALID;
+			continue;
+		}
+
+		fid =3D lo & HW_PSTATE_FID_MASK;
+		did =3D (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
+
+		dprintk("   %d : fid 0x%x, did 0x%x\n", index, fid,
did);
+
+		powernow_table[i].index =3D index | (fid <<
HW_FID_INDEX_SHIFT) | (did << HW_DID_INDEX_SHIFT);
+	=09
+		powernow_table[i].frequency =3D
find_khz_freq_from_fiddid(fid, did);
+
+		if (powernow_table[i].frequency !=3D
(data->acpi_data.states[i].core_frequency * 1000)) {
+			printk(KERN_INFO PFX "invalid freq entries %u
kHz vs. %u kHz\n",
+				powernow_table[i].frequency,
+				(unsigned int)
(data->acpi_data.states[i].core_frequency * 1000));
+			powernow_table[i].frequency =3D
CPUFREQ_ENTRY_INVALID;
+			continue;
+		}
+	}
+	return 0;
+}
+
+static int fill_powernow_table_fidvid(struct powernow_k8_data *data,
struct cpufreq_frequency_table *powernow_table)
+{
+	int i;
+	int cntlofreq =3D 0;
 	for (i =3D 0; i < data->acpi_data.state_count; i++) {
 		u32 fid;
 		u32 vid;
@@ -786,7 +920,7 @@ static int powernow_k8_cpu_init_acpi(str
 				if ((powernow_table[i].frequency !=3D
powernow_table[cntlofreq].frequency) ||
 				    (powernow_table[i].index !=3D
powernow_table[cntlofreq].index)) {
 					printk(KERN_ERR PFX "Too many lo
freq table entries\n");
-					goto err_out_mem;
+					return 1;
 				}
=20
 				dprintk("double low frequency table
entry, ignoring it.\n");
@@ -804,31 +938,7 @@ static int powernow_k8_cpu_init_acpi(str
 			continue;
 		}
 	}
-
-	powernow_table[data->acpi_data.state_count].frequency =3D
CPUFREQ_TABLE_END;
-	powernow_table[data->acpi_data.state_count].index =3D 0;
-	data->powernow_table =3D powernow_table;
-
-	/* fill in data */
-	data->numps =3D data->acpi_data.state_count;
-	print_basics(data);
-	powernow_k8_acpi_pst_values(data, 0);
-
-	/* notify BIOS that we exist */
-	acpi_processor_notify_smm(THIS_MODULE);
-
 	return 0;
-
-err_out_mem:
-	kfree(powernow_table);
-
-err_out:
-	acpi_processor_unregister_performance(&data->acpi_data,
data->cpu);
-
-	/* data->acpi_data.state_count informs us at ->exit() whether
ACPI was used */
-	data->acpi_data.state_count =3D 0;
-
-	return -ENODEV;
 }
=20
 static void powernow_k8_cpu_exit_acpi(struct powernow_k8_data *data)
@@ -844,20 +954,20 @@ static void powernow_k8_acpi_pst_values(
 #endif /* CONFIG_X86_POWERNOW_K8_ACPI */
=20
 /* Take a frequency, and issue the fid/vid transition command */
-static int transition_frequency(struct powernow_k8_data *data, unsigned
int index)
+static int transition_frequency_fidvid(struct powernow_k8_data *data,
unsigned int index)
 {
-	u32 fid;
-	u32 vid;
+	u32 fid =3D 0;
+	u32 vid =3D 0;
 	int res, i;
 	struct cpufreq_freqs freqs;
=20
 	dprintk("cpu %d transition to index %u\n", smp_processor_id(),
index);
=20
+	/* fid/vid correctness check for k8 */
 	/* fid are the lower 8 bits of the index we stored into
-	 * the cpufreq frequency table in find_psb_table, vid are
-	 * the upper 8 bits.
+	 * the cpufreq frequency table in find_psb_table, vid=20
+	* are the upper 8 bits.
 	 */
-
 	fid =3D data->powernow_table[index].index & 0xFF;
 	vid =3D (data->powernow_table[index].index & 0xFF00) >> 8;
=20
@@ -881,19 +991,55 @@ static int transition_frequency(struct p
=20
 	dprintk("cpu %d, changing to fid 0x%x, vid 0x%x\n",
 		smp_processor_id(), fid, vid);
-
-	freqs.cpu =3D data->cpu;
 	freqs.old =3D find_khz_freq_from_fid(data->currfid);
 	freqs.new =3D find_khz_freq_from_fid(fid);
-	for_each_cpu_mask(i, cpu_core_map[data->cpu]) {
+
+	for_each_cpu_mask(i, *(data->available_cores)) {
 		freqs.cpu =3D i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
=20
 	res =3D transition_fid_vid(data, fid, vid);
-
 	freqs.new =3D find_khz_freq_from_fid(data->currfid);
-	for_each_cpu_mask(i, cpu_core_map[data->cpu]) {
+
+	for_each_cpu_mask(i, *(data->available_cores)) {
+		freqs.cpu =3D i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+        }
+	return res;
+}
+
+/* Take a frequency, and issue the hardware pstate transition command
*/
+static int transition_frequency_pstate(struct powernow_k8_data *data,
unsigned int index)
+{
+	u32 fid =3D 0;
+	u32 did =3D 0;
+	u32 pstate =3D 0;
+	int res, i;
+	struct cpufreq_freqs freqs;
+
+	dprintk("cpu %d transition to index %u\n", smp_processor_id(),
index);
+
+	/* get fid did for hardware pstate transition */
+	pstate =3D index & HW_PSTATE_MASK;
+	if (pstate > MAX_HW_PSTATE)
+		return 0;
+	fid =3D (index & HW_FID_INDEX_MASK) >> HW_FID_INDEX_SHIFT;
+	did =3D (index & HW_DID_INDEX_MASK) >> HW_DID_INDEX_SHIFT;
+	freqs.old =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
+	freqs.new =3D find_khz_freq_from_fiddid(fid, did);
+
+	for_each_cpu_mask(i, *(data->available_cores)) {
+		freqs.cpu =3D i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+	}
+
+	res =3D transition_pstate(data, pstate);
+	data->currfid =3D find_fid_from_pstate(pstate);=09
+	data->currdid =3D find_did_from_pstate(pstate);
+	freqs.new =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
+
+	for_each_cpu_mask(i, *(data->available_cores)) {
 		freqs.cpu =3D i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
         }
@@ -938,13 +1084,18 @@ static int powernowk8_target(struct cpuf
 		goto err_out;
 	}
=20
-	dprintk("targ: curr fid 0x%x, vid 0x%x\n",
+	if (cpu_family)
+		dprintk("targ: curr fid 0x%x, did 0x%x\n",
+			data->currfid, data->currvid);
+	else {
+		dprintk("targ: curr fid 0x%x, vid 0x%x\n",
 		data->currfid, data->currvid);
=20
-	if ((checkvid !=3D data->currvid) || (checkfid !=3D data->currfid))
{
-		printk(KERN_INFO PFX
-			"error - out of sync, fix 0x%x 0x%x, vid 0x%x
0x%x\n",
-			checkfid, data->currfid, checkvid,
data->currvid);
+		if ((checkvid !=3D data->currvid) || (checkfid !=3D
data->currfid)) {
+			printk(KERN_INFO PFX
+				"error - out of sync, fix 0x%x 0x%x, vid
0x%x 0x%x\n",
+				checkfid, data->currfid, checkvid,
data->currvid);
+		}
 	}
=20
 	if (cpufreq_frequency_table_target(pol, data->powernow_table,
targfreq, relation, &newstate))
@@ -954,7 +1105,11 @@ static int powernowk8_target(struct cpuf
=20
 	powernow_k8_acpi_pst_values(data, newstate);
=20
-	if (transition_frequency(data, newstate)) {
+	if (cpu_family)
+		ret =3D transition_frequency_pstate(data, newstate);
+	else
+		ret =3D transition_frequency_fidvid(data, newstate);
+	if (ret) {
 		printk(KERN_ERR PFX "transition frequency failed\n");
 		ret =3D 1;
 		mutex_unlock(&fidvid_mutex);
@@ -962,7 +1117,10 @@ static int powernowk8_target(struct cpuf
 	}
 	mutex_unlock(&fidvid_mutex);
=20
-	pol->cur =3D find_khz_freq_from_fid(data->currfid);
+	if (cpu_family)
+		pol->cur =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
+	else
+		pol->cur =3D find_khz_freq_from_fid(data->currfid);
 	ret =3D 0;
=20
 err_out:
@@ -1007,14 +1165,13 @@ static int __cpuinit powernowk8_cpu_init
 		 * Use the PSB BIOS structure. This is only availabe on
 		 * an UP version, and is deprecated by AMD.
 		 */
-
 		if ((num_online_cpus() !=3D 1) || (num_possible_cpus() !=3D
1)) {
 			printk(KERN_ERR PFX "MP systems not supported by
PSB BIOS structure\n");
 			kfree(data);
 			return -ENODEV;
 		}
 		if (pol->cpu !=3D 0) {
-			printk(KERN_ERR PFX "init not cpu 0\n");
+			printk(KERN_ERR PFX "No _PSS objects for CPU
other than CPU0\n");
 			kfree(data);
 			return -ENODEV;
 		}
@@ -1042,20 +1199,28 @@ static int __cpuinit powernowk8_cpu_init
 	if (query_current_values_with_pending_wait(data))
 		goto err_out;
=20
-	fidvid_msr_init();
+	if (!cpu_family)
+		fidvid_msr_init();
=20
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
=20
 	pol->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	pol->cpus =3D cpu_core_map[pol->cpu];
+	if (cpu_family)
+		pol->cpus =3D cpumask_of_cpu(pol->cpu);
+	else
+		pol->cpus =3D cpu_core_map[pol->cpu];
+	data->available_cores =3D &(pol->cpus);
=20
 	/* Take a crude guess here.
 	 * That guess was in microseconds, so multiply with 1000 */
 	pol->cpuinfo.transition_latency =3D (((data->rvo + 8) *
data->vstable * VST_UNITS_20US)
 	    + (3 * (1 << data->irt) * 10)) * 1000;
=20
-	pol->cur =3D find_khz_freq_from_fid(data->currfid);
+	if (cpu_family)
+		pol->cur =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
+	else
+		pol->cur =3D find_khz_freq_from_fid(data->currfid);
 	dprintk("policy current frequency %d kHz\n", pol->cur);
=20
 	/* min/max the cpu is capable of */
@@ -1069,8 +1234,12 @@ static int __cpuinit powernowk8_cpu_init
=20
 	cpufreq_frequency_table_get_attr(data->powernow_table,
pol->cpu);
=20
-	printk("cpu_init done, current fid 0x%x, vid 0x%x\n",
-	       data->currfid, data->currvid);
+	if (cpu_family)
+		dprintk("cpu_init done, current fid 0x%x, did 0x%x\n",
+			data->currfid, data->currdid);
+	else
+		dprintk("cpu_init done, current fid 0x%x, vid 0x%x\n",
+			data->currfid, data->currvid);
=20
 	powernow_data[pol->cpu] =3D data;
=20
@@ -1156,8 +1325,9 @@ static int __cpuinit powernowk8_init(voi
 	}
=20
 	if (supported_cpus =3D=3D num_online_cpus()) {
-		printk(KERN_INFO PFX "Found %d AMD Athlon 64 / Opteron "
-			"processors (" VERSION ")\n", supported_cpus);
+		printk(KERN_INFO PFX "Found %d %s "
+			"processors (" VERSION ")\n", supported_cpus,
+			boot_cpu_data.x86_model_id);
 		return cpufreq_register_driver(&cpufreq_amd64_driver);
 	}
=20
---
linux-2.6.17-hwpstate/arch/i386/kernel/cpu/cpufreq/powernow-k8.h.orig
2006-06-02 15:27:19.000000000 -0500
+++ linux-2.6.17-hwpstate/arch/i386/kernel/cpu/cpufreq/powernow-k8.h
2006-06-02 15:57:36.000000000 -0500
@@ -1,5 +1,5 @@
 /*
- *  (c) 2003, 2004, 2005 Advanced Micro Devices, Inc.
+ *  (c) 2003-2006 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
  *  GNU general public license version 2. See "COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
@@ -21,8 +21,8 @@ struct powernow_k8_data {
 	u32 plllock; /* pll lock time, units 1 us */
         u32 exttype; /* extended interface =3D 1 */
=20
-	/* keep track of the current fid / vid */
-	u32 currvid, currfid;
+	/* keep track of the current fid / vid or did */
+	u32 currvid, currfid, currdid;
=20
 	/* the powernow_table includes all frequency and vid/fid
pairings:
 	 * fid are the lower 8 bits of the index, vid are the upper 8
bits.
@@ -34,6 +34,10 @@ struct powernow_k8_data {
 	 * used to determine valid frequency/vid/fid states */
 	struct acpi_processor_performance acpi_data;
 #endif
+	/* we need to keep track of associated cores, but let cpufreq
+	 * handle hotplug events - so just point at cpufreq pol->cpus
+	 * structure */
+	cpumask_t *available_cores;
 };
=20
=20
@@ -43,6 +47,7 @@ struct powernow_k8_data {
 #define CPUID_XFAM_K8			0
 #define CPUID_XMOD			0x000f0000	/* extended
model */
 #define CPUID_XMOD_REV_G		0x00060000
+#define CPUID_XFAM_10H 			0x00100000	/*
family 0x10 */
 #define CPUID_USE_XFAM_XMOD		0x00000f00
 #define CPUID_GET_MAX_CAPABILITIES	0x80000000
 #define CPUID_FREQ_VOLT_CAPABILITIES	0x80000007
@@ -79,6 +84,32 @@ struct powernow_k8_data {
 #define MSR_S_HI_CURRENT_VID      0x0000003f
 #define MSR_C_HI_STP_GNT_BENIGN	  0x00000001
=20
+
+/* Hardware Pstate _PSS and MSR definitions */
+#define USE_HW_PSTATE		0x00000080
+#define HW_PSTATE_FID_MASK 	0x0000003f
+#define HW_PSTATE_DID_MASK 	0x000001c0
+#define HW_PSTATE_DID_SHIFT 	6
+#define HW_PSTATE_MASK 		0x00000007
+#define HW_PSTATE_VALID_MASK 	0x80000000
+#define HW_FID_INDEX_SHIFT	8
+#define HW_FID_INDEX_MASK	0x0000ff00
+#define HW_DID_INDEX_SHIFT	16
+#define HW_DID_INDEX_MASK	0x00ff0000
+#define HW_WATTS_MASK		0xff
+#define HW_PWR_DVR_MASK		0x300
+#define HW_PWR_DVR_SHIFT	8
+#define HW_PWR_MAX_MULT		3
+#define MAX_HW_PSTATE		8	/* hw pstate supports up to 8 */
+#define MSR_PSTATE_DEF_BASE 	0xc0010064 /* base of Pstate MSRs */
+#define MSR_PSTATE_STATUS 	0xc0010063 /* Pstate Status MSR */
+#define MSR_PSTATE_CTRL 	0xc0010062 /* Pstate control MSR */
+
+/* define the two driver architectures */
+#define CPU_OPTERON 0
+#define CPU_HW_PSTATE 1
+
+
 /*
  * There are restrictions frequencies have to follow:
  * - only 1 entry in the low fid table ( <=3D1.4GHz )
@@ -182,6 +213,9 @@ static int core_frequency_transition(str
=20
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data,
unsigned int index);
=20
+static int fill_powernow_table_pstate(struct powernow_k8_data *data,
struct cpufreq_frequency_table *powernow_table);
+static int fill_powernow_table_fidvid(struct powernow_k8_data *data,
struct cpufreq_frequency_table *powernow_table);
+
 #ifdef CONFIG_SMP
 static inline void define_siblings(int cpu, cpumask_t
cpu_sharedcore_mask[])
 {

------_=_NextPart_001_01C68696.3D25A7C0
Content-Type: application/octet-stream;
 name=hwpstate.patch
Content-Transfer-Encoding: base64
Content-Description: hwpstate.patch
Content-Disposition: attachment;
 filename=hwpstate.patch

c2lnbmVkLW9mZi1ieTogTWFyayBMYW5nc2RvcmYgPG1hcmsubGFuZ3Nkb3JmQGFtZC5jb20+Cgot
LS0gbGludXgtMi42LjE3LWh3cHN0YXRlL2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcG93
ZXJub3ctazguYy5vcmlnCTIwMDYtMDYtMDEgMTM6NDA6NTAuMDAwMDAwMDAwIC0wNTAwCisrKyBs
aW51eC0yLjYuMTctaHdwc3RhdGUvYXJjaC9pMzg2L2tlcm5lbC9jcHUvY3B1ZnJlcS9wb3dlcm5v
dy1rOC5jCTIwMDYtMDYtMDIgMTc6Mzg6MTUuMDAwMDAwMDAwIC0wNTAwCkBAIC0xLDUgKzEsNSBA
QAogLyoKLSAqICAgKGMpIDIwMDMsIDIwMDQsIDIwMDUgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywg
SW5jLgorICogICAoYykgMjAwMy0yMDA2IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KICAq
ICBZb3VyIHVzZSBvZiB0aGlzIGNvZGUgaXMgc3ViamVjdCB0byB0aGUgdGVybXMgYW5kIGNvbmRp
dGlvbnMgb2YgdGhlCiAgKiAgR05VIGdlbmVyYWwgcHVibGljIGxpY2Vuc2UgdmVyc2lvbiAyLiBT
ZWUgIkNPUFlJTkciIG9yCiAgKiAgaHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzL2dwbC5odG1s
CkBAIC0xNCwxMyArMTQsMTMgQEAKICAqICBCYXNlZCB1cG9uIGRhdGFzaGVldHMgJiBzYW1wbGUg
Q1BVcyBraW5kbHkgcHJvdmlkZWQgYnkgQU1ELgogICoKICAqICBWYWx1YWJsZSBpbnB1dCBncmF0
ZWZ1bGx5IHJlY2VpdmVkIGZyb20gRGF2ZSBKb25lcywgUGF2ZWwgTWFjaGVrLAotICogIERvbWlu
aWsgQnJvZG93c2tpLCBhbmQgb3RoZXJzLgorICogIERvbWluaWsgQnJvZG93c2tpLCBKYWNvYiBT
aGluLCBhbmQgb3RoZXJzLgogICogIE9yaWdpbmFsbHkgZGV2ZWxvcGVkIGJ5IFBhdWwgRGV2cmll
bmR0LgogICogIFByb2Nlc3NvciBpbmZvcm1hdGlvbiBvYnRhaW5lZCBmcm9tIENoYXB0ZXIgOSAo
UG93ZXIgYW5kIFRoZXJtYWwgTWFuYWdlbWVudCkKICAqICBvZiB0aGUgIkJJT1MgYW5kIEtlcm5l
bCBEZXZlbG9wZXIncyBHdWlkZSBmb3IgdGhlIEFNRCBBdGhsb24gNjQgYW5kIEFNRAogICogIE9w
dGVyb24gUHJvY2Vzc29ycyIgYXZhaWxhYmxlIGZvciBkb3dubG9hZCBmcm9tIHd3dy5hbWQuY29t
CiAgKgotICogIFRhYmxlcyBmb3Igc3BlY2lmaWMgQ1BVcyBjYW4gYmUgaW5mcmVycmVkIGZyb20K
KyAqICBUYWJsZXMgZm9yIHNwZWNpZmljIENQVXMgY2FuIGJlIGluZmVycmVkIGZyb20KICAqICAg
ICBodHRwOi8vd3d3LmFtZC5jb20vdXMtZW4vYXNzZXRzL2NvbnRlbnRfdHlwZS93aGl0ZV9wYXBl
cnNfYW5kX3RlY2hfZG9jcy8zMDQzMC5wZGYKICAqLwogCkBAIC00Niw3ICs0Niw3IEBACiAKICNk
ZWZpbmUgUEZYICJwb3dlcm5vdy1rODogIgogI2RlZmluZSBCRlggUEZYICJCSU9TIGVycm9yOiAi
Ci0jZGVmaW5lIFZFUlNJT04gInZlcnNpb24gMS42MC4yIgorI2RlZmluZSBWRVJTSU9OICJ2ZXJz
aW9uIDIuMDAuMDAiCiAjaW5jbHVkZSAicG93ZXJub3ctazguaCIKIAogLyogc2VyaWFsaXplIGZy
ZXEgY2hhbmdlcyAgKi8KQEAgLTU0LDYgKzU0LDggQEAgc3RhdGljIERFRklORV9NVVRFWChmaWR2
aWRfbXV0ZXgpOwogCiBzdGF0aWMgc3RydWN0IHBvd2Vybm93X2s4X2RhdGEgKnBvd2Vybm93X2Rh
dGFbTlJfQ1BVU107CiAKK3N0YXRpYyBpbnQgY3B1X2ZhbWlseSA9IENQVV9PUFRFUk9OOworCiAj
aWZuZGVmIENPTkZJR19TTVAKIHN0YXRpYyBjcHVtYXNrX3QgY3B1X2NvcmVfbWFwWzFdOwogI2Vu
ZGlmCkBAIC02NCwxNiArNjYsMzYgQEAgc3RhdGljIHUzMiBmaW5kX2ZyZXFfZnJvbV9maWQodTMy
IGZpZCkKIAlyZXR1cm4gODAwICsgKGZpZCAqIDEwMCk7CiB9CiAKKwogLyogUmV0dXJuIGEgZnJl
cXVlbmN5IGluIEtIeiwgZ2l2ZW4gYW4gaW5wdXQgZmlkICovCiBzdGF0aWMgdTMyIGZpbmRfa2h6
X2ZyZXFfZnJvbV9maWQodTMyIGZpZCkKIHsKIAlyZXR1cm4gMTAwMCAqIGZpbmRfZnJlcV9mcm9t
X2ZpZChmaWQpOwogfQogCi0vKiBSZXR1cm4gYSB2b2x0YWdlIGluIG1pbGlWb2x0cywgZ2l2ZW4g
YW4gaW5wdXQgdmlkICovCi1zdGF0aWMgdTMyIGZpbmRfbWlsbGl2b2x0c19mcm9tX3ZpZChzdHJ1
Y3QgcG93ZXJub3dfazhfZGF0YSAqZGF0YSwgdTMyIHZpZCkKKy8qIFJldHVybiBhIGZyZXF1ZW5j
eSBpbiBNSHosIGdpdmVuIGFuIGlucHV0IGZpZCBhbmQgZGlkICovCitzdGF0aWMgdTMyIGZpbmRf
ZnJlcV9mcm9tX2ZpZGRpZCh1MzIgZmlkLCB1MzIgZGlkKQoreworCXJldHVybiAxMDAgKiAoZmlk
ICsgMHgxMCkgPj4gZGlkOworfQorCitzdGF0aWMgdTMyIGZpbmRfa2h6X2ZyZXFfZnJvbV9maWRk
aWQodTMyIGZpZCwgdTMyIGRpZCkKK3sKKwlyZXR1cm4gMTAwMCAqIGZpbmRfZnJlcV9mcm9tX2Zp
ZGRpZChmaWQsIGRpZCk7Cit9CisKK3N0YXRpYyB1MzIgZmluZF9maWRfZnJvbV9wc3RhdGUodTMy
IHBzdGF0ZSkKK3sKKwl1MzIgaGksIGxvOworCXJkbXNyKE1TUl9QU1RBVEVfREVGX0JBU0UgKyBw
c3RhdGUsIGxvLCBoaSk7CisJcmV0dXJuIGxvICYgSFdfUFNUQVRFX0ZJRF9NQVNLOworfQorCitz
dGF0aWMgdTMyIGZpbmRfZGlkX2Zyb21fcHN0YXRlKHUzMiBwc3RhdGUpCiB7Ci0JcmV0dXJuIDE1
NTAtdmlkKjI1OworCXUzMiBoaSwgbG87CisJcmRtc3IoTVNSX1BTVEFURV9ERUZfQkFTRSArIHBz
dGF0ZSwgbG8sIGhpKTsKKwlyZXR1cm4gKGxvICYgSFdfUFNUQVRFX0RJRF9NQVNLKSA+PiBIV19Q
U1RBVEVfRElEX1NISUZUOwogfQogCiAvKiBSZXR1cm4gdGhlIHZjbyBmaWQgZm9yIGFuIGlucHV0
IGZpZApAQCAtOTgsNiArMTIwLDkgQEAgc3RhdGljIGludCBwZW5kaW5nX2JpdF9zdHVjayh2b2lk
KQogewogCXUzMiBsbywgaGk7CiAKKwlpZiAoY3B1X2ZhbWlseSkKKwkJcmV0dXJuIDA7CisKIAly
ZG1zcihNU1JfRklEVklEX1NUQVRVUywgbG8sIGhpKTsKIAlyZXR1cm4gbG8gJiBNU1JfU19MT19D
SEFOR0VfUEVORElORyA/IDEgOiAwOwogfQpAQCAtMTExLDYgKzEzNiwxNCBAQCBzdGF0aWMgaW50
IHF1ZXJ5X2N1cnJlbnRfdmFsdWVzX3dpdGhfcGVuCiAJdTMyIGxvLCBoaTsKIAl1MzIgaSA9IDA7
CiAKKwlpZiAoY3B1X2ZhbWlseSkgeworCQlyZG1zcihNU1JfUFNUQVRFX1NUQVRVUywgbG8sIGhp
KTsKKwkJaSA9IGxvICYgSFdfUFNUQVRFX01BU0s7CisJCXJkbXNyKE1TUl9QU1RBVEVfREVGX0JB
U0UgKyBpLCBsbywgaGkpOworCQlkYXRhLT5jdXJyZmlkID0gbG8gJiBIV19QU1RBVEVfRklEX01B
U0s7CisJCWRhdGEtPmN1cnJkaWQgPSAobG8gJiBIV19QU1RBVEVfRElEX01BU0spID4+IEhXX1BT
VEFURV9ESURfU0hJRlQ7CisJCXJldHVybiAwOworCX0KIAlkbyB7CiAJCWlmIChpKysgPiAxMDAw
MCkgewogCQkJZHByaW50aygiZGV0ZWN0ZWQgY2hhbmdlIHBlbmRpbmcgc3R1Y2tcbiIpOwpAQCAt
MTc1LDcgKzIwOCw3IEBAIHN0YXRpYyBpbnQgd3JpdGVfbmV3X2ZpZChzdHJ1Y3QgcG93ZXJub3cK
IAlkbyB7CiAJCXdybXNyKE1TUl9GSURWSURfQ1RMLCBsbywgZGF0YS0+cGxsbG9jayAqIFBMTF9M
T0NLX0NPTlZFUlNJT04pOwogCQlpZiAoaSsrID4gMTAwKSB7Ci0JCQlwcmludGsoS0VSTl9FUlIg
UEZYICJpbnRlcm5hbCBlcnJvciAtIHBlbmRpbmcgYml0IHZlcnkgc3R1Y2sgLSBubyBmdXJ0aGVy
IHBzdGF0ZSBjaGFuZ2VzIHBvc3NpYmxlXG4iKTsKKwkJCXByaW50ayhLRVJOX0VSUiBQRlggIkhh
cmR3YXJlIGVycm9yIC0gcGVuZGluZyBiaXQgdmVyeSBzdHVjayAtIG5vIGZ1cnRoZXIgcHN0YXRl
IGNoYW5nZXMgcG9zc2libGVcbiIpOwogCQkJcmV0dXJuIDE7CiAJCX0KIAl9IHdoaWxlIChxdWVy
eV9jdXJyZW50X3ZhbHVlc193aXRoX3BlbmRpbmdfd2FpdChkYXRhKSk7CkBAIC0yNTUsNyArMjg4
LDE1IEBAIHN0YXRpYyBpbnQgZGVjcmVhc2VfdmlkX2NvZGVfYnlfc3RlcChzdHIKIAlyZXR1cm4g
MDsKIH0KIAotLyogQ2hhbmdlIHRoZSBmaWQgYW5kIHZpZCwgYnkgdGhlIDMgcGhhc2VzLiAqLwor
LyogQ2hhbmdlIGhhcmR3YXJlIHBzdGF0ZSBieSBzaW5nbGUgTVNSIHdyaXRlICovCitzdGF0aWMg
aW50IHRyYW5zaXRpb25fcHN0YXRlKHN0cnVjdCBwb3dlcm5vd19rOF9kYXRhICpkYXRhLCB1MzIg
cHN0YXRlKQoreworCXdybXNyKE1TUl9QU1RBVEVfQ1RSTCwgcHN0YXRlLCAwKTsKKwlkYXRhLT5j
dXJyZmlkID0gZmluZF9maWRfZnJvbV9wc3RhdGUocHN0YXRlKTsKKwlyZXR1cm4gMDsKK30KKwor
LyogQ2hhbmdlIE9wdGVyb24vQXRobG9uNjQgZmlkIGFuZCB2aWQsIGJ5IHRoZSAzIHBoYXNlcy4g
Ki8KIHN0YXRpYyBpbnQgdHJhbnNpdGlvbl9maWRfdmlkKHN0cnVjdCBwb3dlcm5vd19rOF9kYXRh
ICpkYXRhLCB1MzIgcmVxZmlkLCB1MzIgcmVxdmlkKQogewogCWlmIChjb3JlX3ZvbHRhZ2VfcHJl
X3RyYW5zaXRpb24oZGF0YSwgcmVxdmlkKSkKQEAgLTQ3NCwyNiArNTE1LDM1IEBAIHN0YXRpYyBp
bnQgY2hlY2tfc3VwcG9ydGVkX2NwdSh1bnNpZ25lZCAKIAkJZ290byBvdXQ7CiAKIAllYXggPSBj
cHVpZF9lYXgoQ1BVSURfUFJPQ0VTU09SX1NJR05BVFVSRSk7Ci0JaWYgKChlYXggJiBDUFVJRF9Y
RkFNKSAhPSBDUFVJRF9YRkFNX0s4KQorCWlmICgoKGVheCAmIENQVUlEX1hGQU0pICE9IENQVUlE
X1hGQU1fSzgpICYmIAorCSAgICAoKGVheCAmIENQVUlEX1hGQU0pIDwgQ1BVSURfWEZBTV8xMEgp
KSAKIAkJZ290byBvdXQ7CiAKLQlpZiAoKChlYXggJiBDUFVJRF9VU0VfWEZBTV9YTU9EKSAhPSBD
UFVJRF9VU0VfWEZBTV9YTU9EKSB8fAotCSAgICAoKGVheCAmIENQVUlEX1hNT0QpID4gQ1BVSURf
WE1PRF9SRVZfRykpIHsKLQkJcHJpbnRrKEtFUk5fSU5GTyBQRlggIlByb2Nlc3NvciBjcHVpZCAl
eCBub3Qgc3VwcG9ydGVkXG4iLCBlYXgpOwotCQlnb3RvIG91dDsKLQl9Ci0KLQllYXggPSBjcHVp
ZF9lYXgoQ1BVSURfR0VUX01BWF9DQVBBQklMSVRJRVMpOwotCWlmIChlYXggPCBDUFVJRF9GUkVR
X1ZPTFRfQ0FQQUJJTElUSUVTKSB7Ci0JCXByaW50ayhLRVJOX0lORk8gUEZYCi0JCSAgICAgICAi
Tm8gZnJlcXVlbmN5IGNoYW5nZSBjYXBhYmlsaXRpZXMgZGV0ZWN0ZWRcbiIpOwotCQlnb3RvIG91
dDsKLQl9Ci0KLQljcHVpZChDUFVJRF9GUkVRX1ZPTFRfQ0FQQUJJTElUSUVTLCAmZWF4LCAmZWJ4
LCAmZWN4LCAmZWR4KTsKLQlpZiAoKGVkeCAmIFBfU1RBVEVfVFJBTlNJVElPTl9DQVBBQkxFKSAh
PSBQX1NUQVRFX1RSQU5TSVRJT05fQ0FQQUJMRSkgewotCQlwcmludGsoS0VSTl9JTkZPIFBGWCAi
UG93ZXIgc3RhdGUgdHJhbnNpdGlvbnMgbm90IHN1cHBvcnRlZFxuIik7Ci0JCWdvdG8gb3V0Owor
CWlmICgoZWF4ICYgQ1BVSURfWEZBTSkgPT0gQ1BVSURfWEZBTV9LOCkgeworCQlpZiAoKChlYXgg
JiBDUFVJRF9VU0VfWEZBTV9YTU9EKSAhPSBDUFVJRF9VU0VfWEZBTV9YTU9EKSB8fAorCSAgICAJ
CSgoZWF4ICYgQ1BVSURfWE1PRCkgPiBDUFVJRF9YTU9EX1JFVl9HKSkgeworCQkJcHJpbnRrKEtF
Uk5fSU5GTyBQRlggIlByb2Nlc3NvciBjcHVpZCAleCBub3Qgc3VwcG9ydGVkXG4iLCBlYXgpOwor
CQkJZ290byBvdXQ7CisJCX0KKworCQllYXggPSBjcHVpZF9lYXgoQ1BVSURfR0VUX01BWF9DQVBB
QklMSVRJRVMpOworCQlpZiAoZWF4IDwgQ1BVSURfRlJFUV9WT0xUX0NBUEFCSUxJVElFUykgewor
CQkJcHJpbnRrKEtFUk5fSU5GTyBQRlgKKwkJCSAgICAgICAiTm8gZnJlcXVlbmN5IGNoYW5nZSBj
YXBhYmlsaXRpZXMgZGV0ZWN0ZWRcbiIpOworCQkJZ290byBvdXQ7CisJCX0KKworCQljcHVpZChD
UFVJRF9GUkVRX1ZPTFRfQ0FQQUJJTElUSUVTLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsKKwkJ
aWYgKChlZHggJiBQX1NUQVRFX1RSQU5TSVRJT05fQ0FQQUJMRSkgIT0gUF9TVEFURV9UUkFOU0lU
SU9OX0NBUEFCTEUpIHsKKwkJCXByaW50ayhLRVJOX0lORk8gUEZYICJQb3dlciBzdGF0ZSB0cmFu
c2l0aW9ucyBub3Qgc3VwcG9ydGVkXG4iKTsKKwkJCWdvdG8gb3V0OworCQl9CisJfSBlbHNlIHsg
LyogbXVzdCBiZSBhIEhXIFBzdGF0ZSBjYXBhYmxlIHByb2Nlc3NvciAqLworCQljcHVpZChDUFVJ
RF9GUkVRX1ZPTFRfQ0FQQUJJTElUSUVTLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsKKyAgICAg
ICAgICAgICAgICBpZiAoKGVkeCAmIFVTRV9IV19QU1RBVEUpID09IFVTRV9IV19QU1RBVEUpIAor
CQkJY3B1X2ZhbWlseSA9IENQVV9IV19QU1RBVEU7CisgICAgICAgICAgICAgICAgZWxzZSAKKwkJ
CWdvdG8gb3V0OwogCX0KIAogCXJjID0gMTsKQEAgLTU0NywxMiArNTk3LDE4IEBAIHN0YXRpYyB2
b2lkIHByaW50X2Jhc2ljcyhzdHJ1Y3QgcG93ZXJub3cKIHsKIAlpbnQgajsKIAlmb3IgKGogPSAw
OyBqIDwgZGF0YS0+bnVtcHM7IGorKykgewotCQlpZiAoZGF0YS0+cG93ZXJub3dfdGFibGVbal0u
ZnJlcXVlbmN5ICE9IENQVUZSRVFfRU5UUllfSU5WQUxJRCkKLQkJCXByaW50ayhLRVJOX0lORk8g
UEZYICIgICAlZCA6IGZpZCAweCV4ICglZCBNSHopLCB2aWQgMHgleCAoJWQgbVYpXG4iLCBqLAor
CQlpZiAoZGF0YS0+cG93ZXJub3dfdGFibGVbal0uZnJlcXVlbmN5ICE9IENQVUZSRVFfRU5UUllf
SU5WQUxJRCkgeworCQkJaWYgKGNwdV9mYW1pbHkpIHsKKwkJCXByaW50ayhLRVJOX0lORk8gUEZY
ICIgICAlZCA6IGZpZCAweCV4IGdpZCAweCV4ICglZCBNSHopXG4iLCBqLCAoZGF0YS0+cG93ZXJu
b3dfdGFibGVbal0uaW5kZXggJiAweGZmMDApID4+IDgsCisJCQkJKGRhdGEtPnBvd2Vybm93X3Rh
YmxlW2pdLmluZGV4ICYgMHhmZjAwMDApID4+IDE2LAorCQkJCWRhdGEtPnBvd2Vybm93X3RhYmxl
W2pdLmZyZXF1ZW5jeS8xMDAwKTsKKwkJCX0gZWxzZSB7CisJCQlwcmludGsoS0VSTl9JTkZPIFBG
WCAiICAgJWQgOiBmaWQgMHgleCAoJWQgTUh6KSwgdmlkIDB4JXhcbiIsIGosCiAJCQkJZGF0YS0+
cG93ZXJub3dfdGFibGVbal0uaW5kZXggJiAweGZmLAogCQkJCWRhdGEtPnBvd2Vybm93X3RhYmxl
W2pdLmZyZXF1ZW5jeS8xMDAwLAotCQkJCWRhdGEtPnBvd2Vybm93X3RhYmxlW2pdLmluZGV4ID4+
IDgsCi0JCQkJZmluZF9taWxsaXZvbHRzX2Zyb21fdmlkKGRhdGEsIGRhdGEtPnBvd2Vybm93X3Rh
YmxlW2pdLmluZGV4ID4+IDgpKTsKKwkJCQlkYXRhLT5wb3dlcm5vd190YWJsZVtqXS5pbmRleCA+
PiA4KTsKKwkJCX0KKwkJfQogCX0KIAlpZiAoZGF0YS0+YmF0cHMpCiAJCXByaW50ayhLRVJOX0lO
Rk8gUEZYICJPbmx5ICVkIHBzdGF0ZXMgb24gYmF0dGVyeVxuIiwgZGF0YS0+YmF0cHMpOwpAQCAt
NzAyLDcgKzc1OCw3IEBAIHN0YXRpYyBpbnQgZmluZF9wc2JfdGFibGUoc3RydWN0IHBvd2Vybm8K
ICNpZmRlZiBDT05GSUdfWDg2X1BPV0VSTk9XX0s4X0FDUEkKIHN0YXRpYyB2b2lkIHBvd2Vybm93
X2s4X2FjcGlfcHN0X3ZhbHVlcyhzdHJ1Y3QgcG93ZXJub3dfazhfZGF0YSAqZGF0YSwgdW5zaWdu
ZWQgaW50IGluZGV4KQogewotCWlmICghZGF0YS0+YWNwaV9kYXRhLnN0YXRlX2NvdW50KQorCWlm
ICghZGF0YS0+YWNwaV9kYXRhLnN0YXRlX2NvdW50IHx8IGNwdV9mYW1pbHkpCiAJCXJldHVybjsK
IAogCWRhdGEtPmlydCA9IChkYXRhLT5hY3BpX2RhdGEuc3RhdGVzW2luZGV4XS5jb250cm9sID4+
IElSVF9TSElGVCkgJiBJUlRfTUFTSzsKQEAgLTcxNSw5ICs3NzEsOCBAQCBzdGF0aWMgdm9pZCBw
b3dlcm5vd19rOF9hY3BpX3BzdF92YWx1ZXMoCiAKIHN0YXRpYyBpbnQgcG93ZXJub3dfazhfY3B1
X2luaXRfYWNwaShzdHJ1Y3QgcG93ZXJub3dfazhfZGF0YSAqZGF0YSkKIHsKLQlpbnQgaTsKLQlp
bnQgY250bG9mcmVxID0gMDsKIAlzdHJ1Y3QgY3B1ZnJlcV9mcmVxdWVuY3lfdGFibGUgKnBvd2Vy
bm93X3RhYmxlOworCWludCByZXRfdmFsOwogCiAJaWYgKGFjcGlfcHJvY2Vzc29yX3JlZ2lzdGVy
X3BlcmZvcm1hbmNlKCZkYXRhLT5hY3BpX2RhdGEsIGRhdGEtPmNwdSkpIHsKIAkJZHByaW50aygi
cmVnaXN0ZXIgcGVyZm9ybWFuY2UgZmFpbGVkOiBiYWQgQUNQSSBkYXRhXG4iKTsKQEAgLTc0Niw2
ICs4MDEsODUgQEAgc3RhdGljIGludCBwb3dlcm5vd19rOF9jcHVfaW5pdF9hY3BpKHN0cgogCQln
b3RvIGVycl9vdXQ7CiAJfQogCisJaWYgKGNwdV9mYW1pbHkpCisJCXJldF92YWwgPSBmaWxsX3Bv
d2Vybm93X3RhYmxlX3BzdGF0ZShkYXRhLCBwb3dlcm5vd190YWJsZSk7CisJZWxzZQorCQlyZXRf
dmFsID0gZmlsbF9wb3dlcm5vd190YWJsZV9maWR2aWQoZGF0YSwgcG93ZXJub3dfdGFibGUpOwor
CWlmIChyZXRfdmFsKQorCQlnb3RvIGVycl9vdXRfbWVtOworCisJcG93ZXJub3dfdGFibGVbZGF0
YS0+YWNwaV9kYXRhLnN0YXRlX2NvdW50XS5mcmVxdWVuY3kgPSBDUFVGUkVRX1RBQkxFX0VORDsK
Kwlwb3dlcm5vd190YWJsZVtkYXRhLT5hY3BpX2RhdGEuc3RhdGVfY291bnRdLmluZGV4ID0gMDsK
KwlkYXRhLT5wb3dlcm5vd190YWJsZSA9IHBvd2Vybm93X3RhYmxlOworCisJLyogZmlsbCBpbiBk
YXRhICovCisJZGF0YS0+bnVtcHMgPSBkYXRhLT5hY3BpX2RhdGEuc3RhdGVfY291bnQ7CisJcHJp
bnRfYmFzaWNzKGRhdGEpOworCXBvd2Vybm93X2s4X2FjcGlfcHN0X3ZhbHVlcyhkYXRhLCAwKTsK
KworCS8qIG5vdGlmeSBCSU9TIHRoYXQgd2UgZXhpc3QgKi8KKwlhY3BpX3Byb2Nlc3Nvcl9ub3Rp
Znlfc21tKFRISVNfTU9EVUxFKTsKKworCXJldHVybiAwOworCitlcnJfb3V0X21lbToKKwlrZnJl
ZShwb3dlcm5vd190YWJsZSk7CisKK2Vycl9vdXQ6CisJYWNwaV9wcm9jZXNzb3JfdW5yZWdpc3Rl
cl9wZXJmb3JtYW5jZSgmZGF0YS0+YWNwaV9kYXRhLCBkYXRhLT5jcHUpOworCisJLyogZGF0YS0+
YWNwaV9kYXRhLnN0YXRlX2NvdW50IGluZm9ybXMgdXMgYXQgLT5leGl0KCkgd2hldGhlciBBQ1BJ
IHdhcyB1c2VkICovCisJZGF0YS0+YWNwaV9kYXRhLnN0YXRlX2NvdW50ID0gMDsKKworCXJldHVy
biAtRU5PREVWOworfQorCitzdGF0aWMgaW50IGZpbGxfcG93ZXJub3dfdGFibGVfcHN0YXRlKHN0
cnVjdCBwb3dlcm5vd19rOF9kYXRhICpkYXRhLCBzdHJ1Y3QgY3B1ZnJlcV9mcmVxdWVuY3lfdGFi
bGUgKnBvd2Vybm93X3RhYmxlKQoreworCWludCBpOworCisJZm9yIChpID0gMDsgaSA8IGRhdGEt
PmFjcGlfZGF0YS5zdGF0ZV9jb3VudDsgaSsrKSB7CisJCXUzMiBpbmRleDsJCisJCXUzMiBoaSA9
IDAsIGxvID0gMDsKKwkJdTMyIGZpZDsKKwkJdTMyIGRpZDsKKworCQlpbmRleCA9IGRhdGEtPmFj
cGlfZGF0YS5zdGF0ZXNbaV0uY29udHJvbCAmIEhXX1BTVEFURV9NQVNLOworCQlpZiAoaW5kZXgg
PiBNQVhfSFdfUFNUQVRFKSB7CisJCQlwcmludGsoS0VSTl9FUlIgUEZYICJpbnZhbGlkIHBzdGF0
ZSAlZCAtIGJhZCB2YWx1ZSAlZC5cbiIsIGksIGluZGV4KTsKKwkJCXByaW50ayhLRVJOX0VSUiBQ
RlggIlBsZWFzZSByZXBvcnQgdG8gQklPUyBtYW51ZmFjdHVyZXJcbiIpOworCQl9CisJCXJkbXNy
KE1TUl9QU1RBVEVfREVGX0JBU0UgKyBpbmRleCwgbG8sIGhpKTsKKwkJaWYgKCEoaGkgJiBIV19Q
U1RBVEVfVkFMSURfTUFTSykpIHsKKwkJCWRwcmludGsoImludmFsaWQgcHN0YXRlICVkLCBpZ25v
cmluZ1xuIiwgaW5kZXgpOworCQkJcG93ZXJub3dfdGFibGVbaV0uZnJlcXVlbmN5ID0gQ1BVRlJF
UV9FTlRSWV9JTlZBTElEOworCQkJY29udGludWU7CisJCX0KKworCQlmaWQgPSBsbyAmIEhXX1BT
VEFURV9GSURfTUFTSzsKKwkJZGlkID0gKGxvICYgSFdfUFNUQVRFX0RJRF9NQVNLKSA+PiBIV19Q
U1RBVEVfRElEX1NISUZUOworCisJCWRwcmludGsoIiAgICVkIDogZmlkIDB4JXgsIGRpZCAweCV4
XG4iLCBpbmRleCwgZmlkLCBkaWQpOworCisJCXBvd2Vybm93X3RhYmxlW2ldLmluZGV4ID0gaW5k
ZXggfCAoZmlkIDw8IEhXX0ZJRF9JTkRFWF9TSElGVCkgfCAoZGlkIDw8IEhXX0RJRF9JTkRFWF9T
SElGVCk7CisJCQorCQlwb3dlcm5vd190YWJsZVtpXS5mcmVxdWVuY3kgPSBmaW5kX2toel9mcmVx
X2Zyb21fZmlkZGlkKGZpZCwgZGlkKTsKKworCQlpZiAocG93ZXJub3dfdGFibGVbaV0uZnJlcXVl
bmN5ICE9IChkYXRhLT5hY3BpX2RhdGEuc3RhdGVzW2ldLmNvcmVfZnJlcXVlbmN5ICogMTAwMCkp
IHsKKwkJCXByaW50ayhLRVJOX0lORk8gUEZYICJpbnZhbGlkIGZyZXEgZW50cmllcyAldSBrSHog
dnMuICV1IGtIelxuIiwKKwkJCQlwb3dlcm5vd190YWJsZVtpXS5mcmVxdWVuY3ksCisJCQkJKHVu
c2lnbmVkIGludCkgKGRhdGEtPmFjcGlfZGF0YS5zdGF0ZXNbaV0uY29yZV9mcmVxdWVuY3kgKiAx
MDAwKSk7CisJCQlwb3dlcm5vd190YWJsZVtpXS5mcmVxdWVuY3kgPSBDUFVGUkVRX0VOVFJZX0lO
VkFMSUQ7CisJCQljb250aW51ZTsKKwkJfQorCX0KKwlyZXR1cm4gMDsKK30KKworc3RhdGljIGlu
dCBmaWxsX3Bvd2Vybm93X3RhYmxlX2ZpZHZpZChzdHJ1Y3QgcG93ZXJub3dfazhfZGF0YSAqZGF0
YSwgc3RydWN0IGNwdWZyZXFfZnJlcXVlbmN5X3RhYmxlICpwb3dlcm5vd190YWJsZSkKK3sKKwlp
bnQgaTsKKwlpbnQgY250bG9mcmVxID0gMDsKIAlmb3IgKGkgPSAwOyBpIDwgZGF0YS0+YWNwaV9k
YXRhLnN0YXRlX2NvdW50OyBpKyspIHsKIAkJdTMyIGZpZDsKIAkJdTMyIHZpZDsKQEAgLTc4Niw3
ICs5MjAsNyBAQCBzdGF0aWMgaW50IHBvd2Vybm93X2s4X2NwdV9pbml0X2FjcGkoc3RyCiAJCQkJ
aWYgKChwb3dlcm5vd190YWJsZVtpXS5mcmVxdWVuY3kgIT0gcG93ZXJub3dfdGFibGVbY250bG9m
cmVxXS5mcmVxdWVuY3kpIHx8CiAJCQkJICAgIChwb3dlcm5vd190YWJsZVtpXS5pbmRleCAhPSBw
b3dlcm5vd190YWJsZVtjbnRsb2ZyZXFdLmluZGV4KSkgewogCQkJCQlwcmludGsoS0VSTl9FUlIg
UEZYICJUb28gbWFueSBsbyBmcmVxIHRhYmxlIGVudHJpZXNcbiIpOwotCQkJCQlnb3RvIGVycl9v
dXRfbWVtOworCQkJCQlyZXR1cm4gMTsKIAkJCQl9CiAKIAkJCQlkcHJpbnRrKCJkb3VibGUgbG93
IGZyZXF1ZW5jeSB0YWJsZSBlbnRyeSwgaWdub3JpbmcgaXQuXG4iKTsKQEAgLTgwNCwzMSArOTM4
LDcgQEAgc3RhdGljIGludCBwb3dlcm5vd19rOF9jcHVfaW5pdF9hY3BpKHN0cgogCQkJY29udGlu
dWU7CiAJCX0KIAl9Ci0KLQlwb3dlcm5vd190YWJsZVtkYXRhLT5hY3BpX2RhdGEuc3RhdGVfY291
bnRdLmZyZXF1ZW5jeSA9IENQVUZSRVFfVEFCTEVfRU5EOwotCXBvd2Vybm93X3RhYmxlW2RhdGEt
PmFjcGlfZGF0YS5zdGF0ZV9jb3VudF0uaW5kZXggPSAwOwotCWRhdGEtPnBvd2Vybm93X3RhYmxl
ID0gcG93ZXJub3dfdGFibGU7Ci0KLQkvKiBmaWxsIGluIGRhdGEgKi8KLQlkYXRhLT5udW1wcyA9
IGRhdGEtPmFjcGlfZGF0YS5zdGF0ZV9jb3VudDsKLQlwcmludF9iYXNpY3MoZGF0YSk7Ci0JcG93
ZXJub3dfazhfYWNwaV9wc3RfdmFsdWVzKGRhdGEsIDApOwotCi0JLyogbm90aWZ5IEJJT1MgdGhh
dCB3ZSBleGlzdCAqLwotCWFjcGlfcHJvY2Vzc29yX25vdGlmeV9zbW0oVEhJU19NT0RVTEUpOwot
CiAJcmV0dXJuIDA7Ci0KLWVycl9vdXRfbWVtOgotCWtmcmVlKHBvd2Vybm93X3RhYmxlKTsKLQot
ZXJyX291dDoKLQlhY3BpX3Byb2Nlc3Nvcl91bnJlZ2lzdGVyX3BlcmZvcm1hbmNlKCZkYXRhLT5h
Y3BpX2RhdGEsIGRhdGEtPmNwdSk7Ci0KLQkvKiBkYXRhLT5hY3BpX2RhdGEuc3RhdGVfY291bnQg
aW5mb3JtcyB1cyBhdCAtPmV4aXQoKSB3aGV0aGVyIEFDUEkgd2FzIHVzZWQgKi8KLQlkYXRhLT5h
Y3BpX2RhdGEuc3RhdGVfY291bnQgPSAwOwotCi0JcmV0dXJuIC1FTk9ERVY7CiB9CiAKIHN0YXRp
YyB2b2lkIHBvd2Vybm93X2s4X2NwdV9leGl0X2FjcGkoc3RydWN0IHBvd2Vybm93X2s4X2RhdGEg
KmRhdGEpCkBAIC04NDQsMjAgKzk1NCwyMCBAQCBzdGF0aWMgdm9pZCBwb3dlcm5vd19rOF9hY3Bp
X3BzdF92YWx1ZXMoCiAjZW5kaWYgLyogQ09ORklHX1g4Nl9QT1dFUk5PV19LOF9BQ1BJICovCiAK
IC8qIFRha2UgYSBmcmVxdWVuY3ksIGFuZCBpc3N1ZSB0aGUgZmlkL3ZpZCB0cmFuc2l0aW9uIGNv
bW1hbmQgKi8KLXN0YXRpYyBpbnQgdHJhbnNpdGlvbl9mcmVxdWVuY3koc3RydWN0IHBvd2Vybm93
X2s4X2RhdGEgKmRhdGEsIHVuc2lnbmVkIGludCBpbmRleCkKK3N0YXRpYyBpbnQgdHJhbnNpdGlv
bl9mcmVxdWVuY3lfZmlkdmlkKHN0cnVjdCBwb3dlcm5vd19rOF9kYXRhICpkYXRhLCB1bnNpZ25l
ZCBpbnQgaW5kZXgpCiB7Ci0JdTMyIGZpZDsKLQl1MzIgdmlkOworCXUzMiBmaWQgPSAwOworCXUz
MiB2aWQgPSAwOwogCWludCByZXMsIGk7CiAJc3RydWN0IGNwdWZyZXFfZnJlcXMgZnJlcXM7CiAK
IAlkcHJpbnRrKCJjcHUgJWQgdHJhbnNpdGlvbiB0byBpbmRleCAldVxuIiwgc21wX3Byb2Nlc3Nv
cl9pZCgpLCBpbmRleCk7CiAKKwkvKiBmaWQvdmlkIGNvcnJlY3RuZXNzIGNoZWNrIGZvciBrOCAq
LwogCS8qIGZpZCBhcmUgdGhlIGxvd2VyIDggYml0cyBvZiB0aGUgaW5kZXggd2Ugc3RvcmVkIGlu
dG8KLQkgKiB0aGUgY3B1ZnJlcSBmcmVxdWVuY3kgdGFibGUgaW4gZmluZF9wc2JfdGFibGUsIHZp
ZCBhcmUKLQkgKiB0aGUgdXBwZXIgOCBiaXRzLgorCSAqIHRoZSBjcHVmcmVxIGZyZXF1ZW5jeSB0
YWJsZSBpbiBmaW5kX3BzYl90YWJsZSwgdmlkIAorCSogYXJlIHRoZSB1cHBlciA4IGJpdHMuCiAJ
ICovCi0KIAlmaWQgPSBkYXRhLT5wb3dlcm5vd190YWJsZVtpbmRleF0uaW5kZXggJiAweEZGOwog
CXZpZCA9IChkYXRhLT5wb3dlcm5vd190YWJsZVtpbmRleF0uaW5kZXggJiAweEZGMDApID4+IDg7
CiAKQEAgLTg4MSwxOSArOTkxLDU1IEBAIHN0YXRpYyBpbnQgdHJhbnNpdGlvbl9mcmVxdWVuY3ko
c3RydWN0IHAKIAogCWRwcmludGsoImNwdSAlZCwgY2hhbmdpbmcgdG8gZmlkIDB4JXgsIHZpZCAw
eCV4XG4iLAogCQlzbXBfcHJvY2Vzc29yX2lkKCksIGZpZCwgdmlkKTsKLQotCWZyZXFzLmNwdSA9
IGRhdGEtPmNwdTsKIAlmcmVxcy5vbGQgPSBmaW5kX2toel9mcmVxX2Zyb21fZmlkKGRhdGEtPmN1
cnJmaWQpOwogCWZyZXFzLm5ldyA9IGZpbmRfa2h6X2ZyZXFfZnJvbV9maWQoZmlkKTsKLQlmb3Jf
ZWFjaF9jcHVfbWFzayhpLCBjcHVfY29yZV9tYXBbZGF0YS0+Y3B1XSkgeworCisJZm9yX2VhY2hf
Y3B1X21hc2soaSwgKihkYXRhLT5hdmFpbGFibGVfY29yZXMpKSB7CiAJCWZyZXFzLmNwdSA9IGk7
CiAJCWNwdWZyZXFfbm90aWZ5X3RyYW5zaXRpb24oJmZyZXFzLCBDUFVGUkVRX1BSRUNIQU5HRSk7
CiAJfQogCiAJcmVzID0gdHJhbnNpdGlvbl9maWRfdmlkKGRhdGEsIGZpZCwgdmlkKTsKLQogCWZy
ZXFzLm5ldyA9IGZpbmRfa2h6X2ZyZXFfZnJvbV9maWQoZGF0YS0+Y3VycmZpZCk7Ci0JZm9yX2Vh
Y2hfY3B1X21hc2soaSwgY3B1X2NvcmVfbWFwW2RhdGEtPmNwdV0pIHsKKworCWZvcl9lYWNoX2Nw
dV9tYXNrKGksICooZGF0YS0+YXZhaWxhYmxlX2NvcmVzKSkgeworCQlmcmVxcy5jcHUgPSBpOwor
CQljcHVmcmVxX25vdGlmeV90cmFuc2l0aW9uKCZmcmVxcywgQ1BVRlJFUV9QT1NUQ0hBTkdFKTsK
KyAgICAgICAgfQorCXJldHVybiByZXM7Cit9CisKKy8qIFRha2UgYSBmcmVxdWVuY3ksIGFuZCBp
c3N1ZSB0aGUgaGFyZHdhcmUgcHN0YXRlIHRyYW5zaXRpb24gY29tbWFuZCAqLworc3RhdGljIGlu
dCB0cmFuc2l0aW9uX2ZyZXF1ZW5jeV9wc3RhdGUoc3RydWN0IHBvd2Vybm93X2s4X2RhdGEgKmRh
dGEsIHVuc2lnbmVkIGludCBpbmRleCkKK3sKKwl1MzIgZmlkID0gMDsKKwl1MzIgZGlkID0gMDsK
Kwl1MzIgcHN0YXRlID0gMDsKKwlpbnQgcmVzLCBpOworCXN0cnVjdCBjcHVmcmVxX2ZyZXFzIGZy
ZXFzOworCisJZHByaW50aygiY3B1ICVkIHRyYW5zaXRpb24gdG8gaW5kZXggJXVcbiIsIHNtcF9w
cm9jZXNzb3JfaWQoKSwgaW5kZXgpOworCisJLyogZ2V0IGZpZCBkaWQgZm9yIGhhcmR3YXJlIHBz
dGF0ZSB0cmFuc2l0aW9uICovCisJcHN0YXRlID0gaW5kZXggJiBIV19QU1RBVEVfTUFTSzsKKwlp
ZiAocHN0YXRlID4gTUFYX0hXX1BTVEFURSkKKwkJcmV0dXJuIDA7CisJZmlkID0gKGluZGV4ICYg
SFdfRklEX0lOREVYX01BU0spID4+IEhXX0ZJRF9JTkRFWF9TSElGVDsKKwlkaWQgPSAoaW5kZXgg
JiBIV19ESURfSU5ERVhfTUFTSykgPj4gSFdfRElEX0lOREVYX1NISUZUOworCWZyZXFzLm9sZCA9
IGZpbmRfa2h6X2ZyZXFfZnJvbV9maWRkaWQoZGF0YS0+Y3VycmZpZCwgZGF0YS0+Y3VycmRpZCk7
CisJZnJlcXMubmV3ID0gZmluZF9raHpfZnJlcV9mcm9tX2ZpZGRpZChmaWQsIGRpZCk7CisKKwlm
b3JfZWFjaF9jcHVfbWFzayhpLCAqKGRhdGEtPmF2YWlsYWJsZV9jb3JlcykpIHsKKwkJZnJlcXMu
Y3B1ID0gaTsKKwkJY3B1ZnJlcV9ub3RpZnlfdHJhbnNpdGlvbigmZnJlcXMsIENQVUZSRVFfUFJF
Q0hBTkdFKTsKKwl9CisKKwlyZXMgPSB0cmFuc2l0aW9uX3BzdGF0ZShkYXRhLCBwc3RhdGUpOwor
CWRhdGEtPmN1cnJmaWQgPSBmaW5kX2ZpZF9mcm9tX3BzdGF0ZShwc3RhdGUpOwkKKwlkYXRhLT5j
dXJyZGlkID0gZmluZF9kaWRfZnJvbV9wc3RhdGUocHN0YXRlKTsKKwlmcmVxcy5uZXcgPSBmaW5k
X2toel9mcmVxX2Zyb21fZmlkZGlkKGRhdGEtPmN1cnJmaWQsIGRhdGEtPmN1cnJkaWQpOworCisJ
Zm9yX2VhY2hfY3B1X21hc2soaSwgKihkYXRhLT5hdmFpbGFibGVfY29yZXMpKSB7CiAJCWZyZXFz
LmNwdSA9IGk7CiAJCWNwdWZyZXFfbm90aWZ5X3RyYW5zaXRpb24oJmZyZXFzLCBDUFVGUkVRX1BP
U1RDSEFOR0UpOwogICAgICAgICB9CkBAIC05MzgsMTMgKzEwODQsMTggQEAgc3RhdGljIGludCBw
b3dlcm5vd2s4X3RhcmdldChzdHJ1Y3QgY3B1ZgogCQlnb3RvIGVycl9vdXQ7CiAJfQogCi0JZHBy
aW50aygidGFyZzogY3VyciBmaWQgMHgleCwgdmlkIDB4JXhcbiIsCisJaWYgKGNwdV9mYW1pbHkp
CisJCWRwcmludGsoInRhcmc6IGN1cnIgZmlkIDB4JXgsIGRpZCAweCV4XG4iLAorCQkJZGF0YS0+
Y3VycmZpZCwgZGF0YS0+Y3VycnZpZCk7CisJZWxzZSB7CisJCWRwcmludGsoInRhcmc6IGN1cnIg
ZmlkIDB4JXgsIHZpZCAweCV4XG4iLAogCQlkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJydmlkKTsK
IAotCWlmICgoY2hlY2t2aWQgIT0gZGF0YS0+Y3VycnZpZCkgfHwgKGNoZWNrZmlkICE9IGRhdGEt
PmN1cnJmaWQpKSB7Ci0JCXByaW50ayhLRVJOX0lORk8gUEZYCi0JCQkiZXJyb3IgLSBvdXQgb2Yg
c3luYywgZml4IDB4JXggMHgleCwgdmlkIDB4JXggMHgleFxuIiwKLQkJCWNoZWNrZmlkLCBkYXRh
LT5jdXJyZmlkLCBjaGVja3ZpZCwgZGF0YS0+Y3VycnZpZCk7CisJCWlmICgoY2hlY2t2aWQgIT0g
ZGF0YS0+Y3VycnZpZCkgfHwgKGNoZWNrZmlkICE9IGRhdGEtPmN1cnJmaWQpKSB7CisJCQlwcmlu
dGsoS0VSTl9JTkZPIFBGWAorCQkJCSJlcnJvciAtIG91dCBvZiBzeW5jLCBmaXggMHgleCAweCV4
LCB2aWQgMHgleCAweCV4XG4iLAorCQkJCWNoZWNrZmlkLCBkYXRhLT5jdXJyZmlkLCBjaGVja3Zp
ZCwgZGF0YS0+Y3VycnZpZCk7CisJCX0KIAl9CiAKIAlpZiAoY3B1ZnJlcV9mcmVxdWVuY3lfdGFi
bGVfdGFyZ2V0KHBvbCwgZGF0YS0+cG93ZXJub3dfdGFibGUsIHRhcmdmcmVxLCByZWxhdGlvbiwg
Jm5ld3N0YXRlKSkKQEAgLTk1NCw3ICsxMTA1LDExIEBAIHN0YXRpYyBpbnQgcG93ZXJub3drOF90
YXJnZXQoc3RydWN0IGNwdWYKIAogCXBvd2Vybm93X2s4X2FjcGlfcHN0X3ZhbHVlcyhkYXRhLCBu
ZXdzdGF0ZSk7CiAKLQlpZiAodHJhbnNpdGlvbl9mcmVxdWVuY3koZGF0YSwgbmV3c3RhdGUpKSB7
CisJaWYgKGNwdV9mYW1pbHkpCisJCXJldCA9IHRyYW5zaXRpb25fZnJlcXVlbmN5X3BzdGF0ZShk
YXRhLCBuZXdzdGF0ZSk7CisJZWxzZQorCQlyZXQgPSB0cmFuc2l0aW9uX2ZyZXF1ZW5jeV9maWR2
aWQoZGF0YSwgbmV3c3RhdGUpOworCWlmIChyZXQpIHsKIAkJcHJpbnRrKEtFUk5fRVJSIFBGWCAi
dHJhbnNpdGlvbiBmcmVxdWVuY3kgZmFpbGVkXG4iKTsKIAkJcmV0ID0gMTsKIAkJbXV0ZXhfdW5s
b2NrKCZmaWR2aWRfbXV0ZXgpOwpAQCAtOTYyLDcgKzExMTcsMTAgQEAgc3RhdGljIGludCBwb3dl
cm5vd2s4X3RhcmdldChzdHJ1Y3QgY3B1ZgogCX0KIAltdXRleF91bmxvY2soJmZpZHZpZF9tdXRl
eCk7CiAKLQlwb2wtPmN1ciA9IGZpbmRfa2h6X2ZyZXFfZnJvbV9maWQoZGF0YS0+Y3VycmZpZCk7
CisJaWYgKGNwdV9mYW1pbHkpCisJCXBvbC0+Y3VyID0gZmluZF9raHpfZnJlcV9mcm9tX2ZpZGRp
ZChkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJyZGlkKTsKKwllbHNlCisJCXBvbC0+Y3VyID0gZmlu
ZF9raHpfZnJlcV9mcm9tX2ZpZChkYXRhLT5jdXJyZmlkKTsKIAlyZXQgPSAwOwogCiBlcnJfb3V0
OgpAQCAtMTAwNywxNCArMTE2NSwxMyBAQCBzdGF0aWMgaW50IF9fY3B1aW5pdCBwb3dlcm5vd2s4
X2NwdV9pbml0CiAJCSAqIFVzZSB0aGUgUFNCIEJJT1Mgc3RydWN0dXJlLiBUaGlzIGlzIG9ubHkg
YXZhaWxhYmUgb24KIAkJICogYW4gVVAgdmVyc2lvbiwgYW5kIGlzIGRlcHJlY2F0ZWQgYnkgQU1E
LgogCQkgKi8KLQogCQlpZiAoKG51bV9vbmxpbmVfY3B1cygpICE9IDEpIHx8IChudW1fcG9zc2li
bGVfY3B1cygpICE9IDEpKSB7CiAJCQlwcmludGsoS0VSTl9FUlIgUEZYICJNUCBzeXN0ZW1zIG5v
dCBzdXBwb3J0ZWQgYnkgUFNCIEJJT1Mgc3RydWN0dXJlXG4iKTsKIAkJCWtmcmVlKGRhdGEpOwog
CQkJcmV0dXJuIC1FTk9ERVY7CiAJCX0KIAkJaWYgKHBvbC0+Y3B1ICE9IDApIHsKLQkJCXByaW50
ayhLRVJOX0VSUiBQRlggImluaXQgbm90IGNwdSAwXG4iKTsKKwkJCXByaW50ayhLRVJOX0VSUiBQ
RlggIk5vIF9QU1Mgb2JqZWN0cyBmb3IgQ1BVIG90aGVyIHRoYW4gQ1BVMFxuIik7CiAJCQlrZnJl
ZShkYXRhKTsKIAkJCXJldHVybiAtRU5PREVWOwogCQl9CkBAIC0xMDQyLDIwICsxMTk5LDI4IEBA
IHN0YXRpYyBpbnQgX19jcHVpbml0IHBvd2Vybm93azhfY3B1X2luaXQKIAlpZiAocXVlcnlfY3Vy
cmVudF92YWx1ZXNfd2l0aF9wZW5kaW5nX3dhaXQoZGF0YSkpCiAJCWdvdG8gZXJyX291dDsKIAot
CWZpZHZpZF9tc3JfaW5pdCgpOworCWlmICghY3B1X2ZhbWlseSkKKwkJZmlkdmlkX21zcl9pbml0
KCk7CiAKIAkvKiBydW4gb24gYW55IENQVSBhZ2FpbiAqLwogCXNldF9jcHVzX2FsbG93ZWQoY3Vy
cmVudCwgb2xkbWFzayk7CiAKIAlwb2wtPmdvdmVybm9yID0gQ1BVRlJFUV9ERUZBVUxUX0dPVkVS
Tk9SOwotCXBvbC0+Y3B1cyA9IGNwdV9jb3JlX21hcFtwb2wtPmNwdV07CisJaWYgKGNwdV9mYW1p
bHkpCisJCXBvbC0+Y3B1cyA9IGNwdW1hc2tfb2ZfY3B1KHBvbC0+Y3B1KTsKKwllbHNlCisJCXBv
bC0+Y3B1cyA9IGNwdV9jb3JlX21hcFtwb2wtPmNwdV07CisJZGF0YS0+YXZhaWxhYmxlX2NvcmVz
ID0gJihwb2wtPmNwdXMpOwogCiAJLyogVGFrZSBhIGNydWRlIGd1ZXNzIGhlcmUuCiAJICogVGhh
dCBndWVzcyB3YXMgaW4gbWljcm9zZWNvbmRzLCBzbyBtdWx0aXBseSB3aXRoIDEwMDAgKi8KIAlw
b2wtPmNwdWluZm8udHJhbnNpdGlvbl9sYXRlbmN5ID0gKCgoZGF0YS0+cnZvICsgOCkgKiBkYXRh
LT52c3RhYmxlICogVlNUX1VOSVRTXzIwVVMpCiAJICAgICsgKDMgKiAoMSA8PCBkYXRhLT5pcnQp
ICogMTApKSAqIDEwMDA7CiAKLQlwb2wtPmN1ciA9IGZpbmRfa2h6X2ZyZXFfZnJvbV9maWQoZGF0
YS0+Y3VycmZpZCk7CisJaWYgKGNwdV9mYW1pbHkpCisJCXBvbC0+Y3VyID0gZmluZF9raHpfZnJl
cV9mcm9tX2ZpZGRpZChkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJyZGlkKTsKKwllbHNlCisJCXBv
bC0+Y3VyID0gZmluZF9raHpfZnJlcV9mcm9tX2ZpZChkYXRhLT5jdXJyZmlkKTsKIAlkcHJpbnRr
KCJwb2xpY3kgY3VycmVudCBmcmVxdWVuY3kgJWQga0h6XG4iLCBwb2wtPmN1cik7CiAKIAkvKiBt
aW4vbWF4IHRoZSBjcHUgaXMgY2FwYWJsZSBvZiAqLwpAQCAtMTA2OSw4ICsxMjM0LDEyIEBAIHN0
YXRpYyBpbnQgX19jcHVpbml0IHBvd2Vybm93azhfY3B1X2luaXQKIAogCWNwdWZyZXFfZnJlcXVl
bmN5X3RhYmxlX2dldF9hdHRyKGRhdGEtPnBvd2Vybm93X3RhYmxlLCBwb2wtPmNwdSk7CiAKLQlw
cmludGsoImNwdV9pbml0IGRvbmUsIGN1cnJlbnQgZmlkIDB4JXgsIHZpZCAweCV4XG4iLAotCSAg
ICAgICBkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJydmlkKTsKKwlpZiAoY3B1X2ZhbWlseSkKKwkJ
ZHByaW50aygiY3B1X2luaXQgZG9uZSwgY3VycmVudCBmaWQgMHgleCwgZGlkIDB4JXhcbiIsCisJ
CQlkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJyZGlkKTsKKwllbHNlCisJCWRwcmludGsoImNwdV9p
bml0IGRvbmUsIGN1cnJlbnQgZmlkIDB4JXgsIHZpZCAweCV4XG4iLAorCQkJZGF0YS0+Y3VycmZp
ZCwgZGF0YS0+Y3VycnZpZCk7CiAKIAlwb3dlcm5vd19kYXRhW3BvbC0+Y3B1XSA9IGRhdGE7CiAK
QEAgLTExNTYsOCArMTMyNSw5IEBAIHN0YXRpYyBpbnQgX19jcHVpbml0IHBvd2Vybm93azhfaW5p
dCh2b2kKIAl9CiAKIAlpZiAoc3VwcG9ydGVkX2NwdXMgPT0gbnVtX29ubGluZV9jcHVzKCkpIHsK
LQkJcHJpbnRrKEtFUk5fSU5GTyBQRlggIkZvdW5kICVkIEFNRCBBdGhsb24gNjQgLyBPcHRlcm9u
ICIKLQkJCSJwcm9jZXNzb3JzICgiIFZFUlNJT04gIilcbiIsIHN1cHBvcnRlZF9jcHVzKTsKKwkJ
cHJpbnRrKEtFUk5fSU5GTyBQRlggIkZvdW5kICVkICVzICIKKwkJCSJwcm9jZXNzb3JzICgiIFZF
UlNJT04gIilcbiIsIHN1cHBvcnRlZF9jcHVzLAorCQkJYm9vdF9jcHVfZGF0YS54ODZfbW9kZWxf
aWQpOwogCQlyZXR1cm4gY3B1ZnJlcV9yZWdpc3Rlcl9kcml2ZXIoJmNwdWZyZXFfYW1kNjRfZHJp
dmVyKTsKIAl9CiAKLS0tIGxpbnV4LTIuNi4xNy1od3BzdGF0ZS9hcmNoL2kzODYva2VybmVsL2Nw
dS9jcHVmcmVxL3Bvd2Vybm93LWs4Lmgub3JpZwkyMDA2LTA2LTAyIDE1OjI3OjE5LjAwMDAwMDAw
MCAtMDUwMAorKysgbGludXgtMi42LjE3LWh3cHN0YXRlL2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2Nw
dWZyZXEvcG93ZXJub3ctazguaAkyMDA2LTA2LTAyIDE1OjU3OjM2LjAwMDAwMDAwMCAtMDUwMApA
QCAtMSw1ICsxLDUgQEAKIC8qCi0gKiAgKGMpIDIwMDMsIDIwMDQsIDIwMDUgQWR2YW5jZWQgTWlj
cm8gRGV2aWNlcywgSW5jLgorICogIChjKSAyMDAzLTIwMDYgQWR2YW5jZWQgTWljcm8gRGV2aWNl
cywgSW5jLgogICogIFlvdXIgdXNlIG9mIHRoaXMgY29kZSBpcyBzdWJqZWN0IHRvIHRoZSB0ZXJt
cyBhbmQgY29uZGl0aW9ucyBvZiB0aGUKICAqICBHTlUgZ2VuZXJhbCBwdWJsaWMgbGljZW5zZSB2
ZXJzaW9uIDIuIFNlZSAiQ09QWUlORyIgb3IKICAqICBodHRwOi8vd3d3LmdudS5vcmcvbGljZW5z
ZXMvZ3BsLmh0bWwKQEAgLTIxLDggKzIxLDggQEAgc3RydWN0IHBvd2Vybm93X2s4X2RhdGEgewog
CXUzMiBwbGxsb2NrOyAvKiBwbGwgbG9jayB0aW1lLCB1bml0cyAxIHVzICovCiAgICAgICAgIHUz
MiBleHR0eXBlOyAvKiBleHRlbmRlZCBpbnRlcmZhY2UgPSAxICovCiAKLQkvKiBrZWVwIHRyYWNr
IG9mIHRoZSBjdXJyZW50IGZpZCAvIHZpZCAqLwotCXUzMiBjdXJydmlkLCBjdXJyZmlkOworCS8q
IGtlZXAgdHJhY2sgb2YgdGhlIGN1cnJlbnQgZmlkIC8gdmlkIG9yIGRpZCAqLworCXUzMiBjdXJy
dmlkLCBjdXJyZmlkLCBjdXJyZGlkOwogCiAJLyogdGhlIHBvd2Vybm93X3RhYmxlIGluY2x1ZGVz
IGFsbCBmcmVxdWVuY3kgYW5kIHZpZC9maWQgcGFpcmluZ3M6CiAJICogZmlkIGFyZSB0aGUgbG93
ZXIgOCBiaXRzIG9mIHRoZSBpbmRleCwgdmlkIGFyZSB0aGUgdXBwZXIgOCBiaXRzLgpAQCAtMzQs
NiArMzQsMTAgQEAgc3RydWN0IHBvd2Vybm93X2s4X2RhdGEgewogCSAqIHVzZWQgdG8gZGV0ZXJt
aW5lIHZhbGlkIGZyZXF1ZW5jeS92aWQvZmlkIHN0YXRlcyAqLwogCXN0cnVjdCBhY3BpX3Byb2Nl
c3Nvcl9wZXJmb3JtYW5jZSBhY3BpX2RhdGE7CiAjZW5kaWYKKwkvKiB3ZSBuZWVkIHRvIGtlZXAg
dHJhY2sgb2YgYXNzb2NpYXRlZCBjb3JlcywgYnV0IGxldCBjcHVmcmVxCisJICogaGFuZGxlIGhv
dHBsdWcgZXZlbnRzIC0gc28ganVzdCBwb2ludCBhdCBjcHVmcmVxIHBvbC0+Y3B1cworCSAqIHN0
cnVjdHVyZSAqLworCWNwdW1hc2tfdCAqYXZhaWxhYmxlX2NvcmVzOwogfTsKIAogCkBAIC00Myw2
ICs0Nyw3IEBAIHN0cnVjdCBwb3dlcm5vd19rOF9kYXRhIHsKICNkZWZpbmUgQ1BVSURfWEZBTV9L
OAkJCTAKICNkZWZpbmUgQ1BVSURfWE1PRAkJCTB4MDAwZjAwMDAJLyogZXh0ZW5kZWQgbW9kZWwg
Ki8KICNkZWZpbmUgQ1BVSURfWE1PRF9SRVZfRwkJMHgwMDA2MDAwMAorI2RlZmluZSBDUFVJRF9Y
RkFNXzEwSCAJCQkweDAwMTAwMDAwCS8qIGZhbWlseSAweDEwICovCiAjZGVmaW5lIENQVUlEX1VT
RV9YRkFNX1hNT0QJCTB4MDAwMDBmMDAKICNkZWZpbmUgQ1BVSURfR0VUX01BWF9DQVBBQklMSVRJ
RVMJMHg4MDAwMDAwMAogI2RlZmluZSBDUFVJRF9GUkVRX1ZPTFRfQ0FQQUJJTElUSUVTCTB4ODAw
MDAwMDcKQEAgLTc5LDYgKzg0LDMyIEBAIHN0cnVjdCBwb3dlcm5vd19rOF9kYXRhIHsKICNkZWZp
bmUgTVNSX1NfSElfQ1VSUkVOVF9WSUQgICAgICAweDAwMDAwMDNmCiAjZGVmaW5lIE1TUl9DX0hJ
X1NUUF9HTlRfQkVOSUdOCSAgMHgwMDAwMDAwMQogCisKKy8qIEhhcmR3YXJlIFBzdGF0ZSBfUFNT
IGFuZCBNU1IgZGVmaW5pdGlvbnMgKi8KKyNkZWZpbmUgVVNFX0hXX1BTVEFURQkJMHgwMDAwMDA4
MAorI2RlZmluZSBIV19QU1RBVEVfRklEX01BU0sgCTB4MDAwMDAwM2YKKyNkZWZpbmUgSFdfUFNU
QVRFX0RJRF9NQVNLIAkweDAwMDAwMWMwCisjZGVmaW5lIEhXX1BTVEFURV9ESURfU0hJRlQgCTYK
KyNkZWZpbmUgSFdfUFNUQVRFX01BU0sgCQkweDAwMDAwMDA3CisjZGVmaW5lIEhXX1BTVEFURV9W
QUxJRF9NQVNLIAkweDgwMDAwMDAwCisjZGVmaW5lIEhXX0ZJRF9JTkRFWF9TSElGVAk4CisjZGVm
aW5lIEhXX0ZJRF9JTkRFWF9NQVNLCTB4MDAwMGZmMDAKKyNkZWZpbmUgSFdfRElEX0lOREVYX1NI
SUZUCTE2CisjZGVmaW5lIEhXX0RJRF9JTkRFWF9NQVNLCTB4MDBmZjAwMDAKKyNkZWZpbmUgSFdf
V0FUVFNfTUFTSwkJMHhmZgorI2RlZmluZSBIV19QV1JfRFZSX01BU0sJCTB4MzAwCisjZGVmaW5l
IEhXX1BXUl9EVlJfU0hJRlQJOAorI2RlZmluZSBIV19QV1JfTUFYX01VTFQJCTMKKyNkZWZpbmUg
TUFYX0hXX1BTVEFURQkJOAkvKiBodyBwc3RhdGUgc3VwcG9ydHMgdXAgdG8gOCAqLworI2RlZmlu
ZSBNU1JfUFNUQVRFX0RFRl9CQVNFIAkweGMwMDEwMDY0IC8qIGJhc2Ugb2YgUHN0YXRlIE1TUnMg
Ki8KKyNkZWZpbmUgTVNSX1BTVEFURV9TVEFUVVMgCTB4YzAwMTAwNjMgLyogUHN0YXRlIFN0YXR1
cyBNU1IgKi8KKyNkZWZpbmUgTVNSX1BTVEFURV9DVFJMIAkweGMwMDEwMDYyIC8qIFBzdGF0ZSBj
b250cm9sIE1TUiAqLworCisvKiBkZWZpbmUgdGhlIHR3byBkcml2ZXIgYXJjaGl0ZWN0dXJlcyAq
LworI2RlZmluZSBDUFVfT1BURVJPTiAwCisjZGVmaW5lIENQVV9IV19QU1RBVEUgMQorCisKIC8q
CiAgKiBUaGVyZSBhcmUgcmVzdHJpY3Rpb25zIGZyZXF1ZW5jaWVzIGhhdmUgdG8gZm9sbG93Ogog
ICogLSBvbmx5IDEgZW50cnkgaW4gdGhlIGxvdyBmaWQgdGFibGUgKCA8PTEuNEdIeiApCkBAIC0x
ODIsNiArMjEzLDkgQEAgc3RhdGljIGludCBjb3JlX2ZyZXF1ZW5jeV90cmFuc2l0aW9uKHN0cgog
CiBzdGF0aWMgdm9pZCBwb3dlcm5vd19rOF9hY3BpX3BzdF92YWx1ZXMoc3RydWN0IHBvd2Vybm93
X2s4X2RhdGEgKmRhdGEsIHVuc2lnbmVkIGludCBpbmRleCk7CiAKK3N0YXRpYyBpbnQgZmlsbF9w
b3dlcm5vd190YWJsZV9wc3RhdGUoc3RydWN0IHBvd2Vybm93X2s4X2RhdGEgKmRhdGEsIHN0cnVj
dCBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZSAqcG93ZXJub3dfdGFibGUpOworc3RhdGljIGludCBm
aWxsX3Bvd2Vybm93X3RhYmxlX2ZpZHZpZChzdHJ1Y3QgcG93ZXJub3dfazhfZGF0YSAqZGF0YSwg
c3RydWN0IGNwdWZyZXFfZnJlcXVlbmN5X3RhYmxlICpwb3dlcm5vd190YWJsZSk7CisKICNpZmRl
ZiBDT05GSUdfU01QCiBzdGF0aWMgaW5saW5lIHZvaWQgZGVmaW5lX3NpYmxpbmdzKGludCBjcHUs
IGNwdW1hc2tfdCBjcHVfc2hhcmVkY29yZV9tYXNrW10pCiB7Cg==

------_=_NextPart_001_01C68696.3D25A7C0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C68696.3D25A7C0--


