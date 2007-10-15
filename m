From: "Mark Langsdorf" <mark.langsdorf@amd.com>
Subject: [PATCH][try 3] architectural pstate driver for powernow-k8
Date: Mon, 15 Oct 2007 11:23:45 -0500
Message-ID: <200710151123.45582.mark.langsdorf@amd.com>
References: <200710091446.38432.mark.langsdorf@amd.com>
	<20071011075958.GK1130@shadowen.org>
	<20071015154031.GA30754@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20071015154031.GA30754@redhat.com>
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
To: Dave Jones <davej@redhat.com>, Andy Whitcroft <apw@shadowen.org>, Andi Kleen <andi@firstfloor.org>, cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Monday 15 October 2007 10:40, Dave Jones wrote:
> On Thu, Oct 11, 2007 at 08:59:58AM +0100, Andy Whitcroft wrote:
>  =

>  > >  	/* get fid did for hardware pstate transition */
>  > >  	pstate =3D index & HW_PSTATE_MASK;
>  > > -	if (pstate > MAX_HW_PSTATE)
>  > > +	if (pstate > data->max_hw_pstate);
>  > >  		return 0;
>  > =

>  > checkpatch picked up this dodgy if.  I suspect that the ';' is wrong
>  > from the context.
>  =

> Indeed.  Mark/Andreas, want to send me a new patch against latest
> Linus HEAD ?  I didn't apply the old one yet, as it conflicted with
> the changes already queued for merging.

This is against -git7.  I should think that's close enough.

This patch should apply cleanly to the 2.6.23-git7 kernel. =A0It changes the
powernow-k8 driver code that deals with 3rd generation Opteron, Phenom,
and later processors to match the architectural pstate driver described
in the AMD64 Architecture Programmer's Manual Volume 2 Chapter 18. =A0The
initial implementation of the hardware pstate driver for PowerNow!
used some processor-version specific features, and would not be
maintainable in the long term as the processor features changed.
This architectural driver should work on all future AMD processors.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>
Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>

diff -urpN -X linux-2.6.23-git7/Documentation/dontdiff linux-2.6.23-git7/ar=
ch/x86/kernel/cpu/cpufreq/powernow-k8.c linux-2.6.23-apn-git7/arch/x86/kern=
el/cpu/cpufreq/powernow-k8.c
--- linux-2.6.23-git7/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	2007-10-15 =
11:20:39.000000000 -0500
+++ linux-2.6.23-apn-git7/arch/x86/kernel/cpu/cpufreq/powernow-k8.c	2007-10=
-15 11:28:52.000000000 -0500
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
-}
-
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
+	return data[pstate].frequency;
 }
 =

-static u32 find_did_from_pstate(u32 pstate)
-{
-	u32 hi, lo;
-	rdmsr(MSR_PSTATE_DEF_BASE + pstate, lo, hi);
-	return (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
-}
 =

 /* Return the vco fid for an input fid
  *
@@ -142,9 +120,7 @@ static int query_current_values_with_pen
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
@@ -295,7 +271,7 @@ static int decrease_vid_code_by_step(str
 static int transition_pstate(struct powernow_k8_data *data, u32 pstate)
 {
 	wrmsr(MSR_PSTATE_CTRL, pstate, 0);
-	data->currfid =3D find_fid_from_pstate(pstate);
+	data->currpstate =3D pstate;
 	return 0;
 }
 =

@@ -845,17 +821,20 @@ err_out:
 static int fill_powernow_table_pstate(struct powernow_k8_data *data, struc=
t cpufreq_frequency_table *powernow_table)
 {
 	int i;
+	u32 hi =3D 0, lo =3D 0;
+	rdmsr(MSR_PSTATE_CUR_LIMIT, hi, lo);
+	data->max_hw_pstate =3D (hi & HW_PSTATE_MAX_MASK) >> HW_PSTATE_MAX_SHIFT;
 =

 	for (i =3D 0; i < data->acpi_data.state_count; i++) {
 		u32 index;
 		u32 hi =3D 0, lo =3D 0;
-		u32 fid;
-		u32 did;
 =

 		index =3D data->acpi_data.states[i].control & HW_PSTATE_MASK;
-		if (index > MAX_HW_PSTATE) {
+		if (index > data->max_hw_pstate) {
 			printk(KERN_ERR PFX "invalid pstate %d - bad value %d.\n", i, index);
 			printk(KERN_ERR PFX "Please report to BIOS manufacturer\n");
+			powernow_table[i].frequency =3D CPUFREQ_ENTRY_INVALID;
+			continue;
 		}
 		rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
 		if (!(hi & HW_PSTATE_VALID_MASK)) {
@@ -864,22 +843,9 @@ static int fill_powernow_table_pstate(st
 			continue;
 		}
 =

-		fid =3D lo & HW_PSTATE_FID_MASK;
-		did =3D (lo & HW_PSTATE_DID_MASK) >> HW_PSTATE_DID_SHIFT;
+		powernow_table[i].index =3D index;
 =

-		dprintk("   %d : fid 0x%x, did 0x%x\n", index, fid, did);
-
-		powernow_table[i].index =3D index | (fid << HW_FID_INDEX_SHIFT) | (did <=
< HW_DID_INDEX_SHIFT);
-
-		powernow_table[i].frequency =3D find_khz_freq_from_fiddid(fid, did);
-
-		if (powernow_table[i].frequency !=3D (data->acpi_data.states[i].core_fre=
quency * 1000)) {
-			printk(KERN_INFO PFX "invalid freq entries %u kHz vs. %u kHz\n",
-				powernow_table[i].frequency,
-				(unsigned int) (data->acpi_data.states[i].core_frequency * 1000));
-			powernow_table[i].frequency =3D CPUFREQ_ENTRY_INVALID;
-			continue;
-		}
+		powernow_table[i].frequency =3D data->acpi_data.states[i].core_frequency=
 * 1000;
 	}
 	return 0;
 }
@@ -1020,22 +986,18 @@ static int transition_frequency_fidvid(s
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
@@ -1043,9 +1005,7 @@ static int transition_frequency_pstate(s
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
@@ -1124,7 +1084,7 @@ static int powernowk8_target(struct cpuf
 	mutex_unlock(&fidvid_mutex);
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		pol->cur =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+		pol->cur =3D find_khz_freq_from_pstate(data->powernow_table, newstate);
 	else
 		pol->cur =3D find_khz_freq_from_fid(data->currfid);
 	ret =3D 0;
@@ -1223,7 +1183,7 @@ static int __cpuinit powernowk8_cpu_init
 	    + (3 * (1 << data->irt) * 10)) * 1000;
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		pol->cur =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+		pol->cur =3D find_khz_freq_from_pstate(data->powernow_table, data->currp=
state);
 	else
 		pol->cur =3D find_khz_freq_from_fid(data->currfid);
 	dprintk("policy current frequency %d kHz\n", pol->cur);
@@ -1240,8 +1200,7 @@ static int __cpuinit powernowk8_cpu_init
 	cpufreq_frequency_table_get_attr(data->powernow_table, pol->cpu);
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		dprintk("cpu_init done, current fid 0x%x, did 0x%x\n",
-			data->currfid, data->currdid);
+		dprintk("cpu_init done, current pstate 0x%x\n", data->currpstate);
 	else
 		dprintk("cpu_init done, current fid 0x%x, vid 0x%x\n",
 			data->currfid, data->currvid);
@@ -1297,7 +1256,7 @@ static unsigned int powernowk8_get (unsi
 		goto out;
 =

 	if (cpu_family =3D=3D CPU_HW_PSTATE)
-		khz =3D find_khz_freq_from_fiddid(data->currfid, data->currdid);
+		khz =3D find_khz_freq_from_pstate(data->powernow_table, data->currpstate=
);
 	else
 		khz =3D find_khz_freq_from_fid(data->currfid);
 =

diff -urpN -X linux-2.6.23-git7/Documentation/dontdiff linux-2.6.23-git7/ar=
ch/x86/kernel/cpu/cpufreq/powernow-k8.h linux-2.6.23-apn-git7/arch/x86/kern=
el/cpu/cpufreq/powernow-k8.h
--- linux-2.6.23-git7/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	2007-10-15 =
11:20:39.000000000 -0500
+++ linux-2.6.23-apn-git7/arch/x86/kernel/cpu/cpufreq/powernow-k8.h	2007-10=
-15 11:27:44.000000000 -0500
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
@@ -87,23 +88,14 @@ struct powernow_k8_data {
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
