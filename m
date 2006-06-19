From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH] Allow all processors to transition simeltameously
Date: Mon, 19 Jun 2006 13:31:36 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218E02@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C693CE.98CFD844"
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

------_=_NextPart_001_01C693CE.98CFD844
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The current generation of Opteron processors do=20
not provided a frequency independent TSC.  This
causes wild clock skew on systems that change
frequency while use TSC as a gtod source. =20
This patch provides a work around by=20
transitioning all processors to the same
frequency at the same time, so that the TSCs
on each processor are never incrementing at
a different rate.

the powernow-k8.tscsync=3D1 option enables=20
simeltameous transitions.  Other options
are necessary to force the use of TSC.

-Mark Langsdorf
AMD, Inc.

--- linux-mm2-2.6.17-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.old
2006-06-12 12:22:06.000000000 -0500
+++ linux-mm2-2.6.17-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
2006-06-15 13:35:32.000000000 -0500
@@ -37,6 +37,7 @@
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/delay.h>
+#include <asm/pci-direct.h>
=20
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 #include <linux/acpi.h>
@@ -46,13 +47,15 @@
=20
 #define PFX "powernow-k8: "
 #define BFX PFX "BIOS error: "
-#define VERSION "version 2.00.00"
+#define VERSION "version 2.10.00"
 #include "powernow-k8.h"
=20
 /* serialize freq changes  */
 static DEFINE_MUTEX(fidvid_mutex);
=20
 static struct powernow_k8_data *powernow_data[NR_CPUS];
+static int *req_state =3D NULL;
+static int tscsync __initdata =3D 0;
=20
 static int cpu_family =3D CPU_OPTERON;
=20
@@ -205,6 +208,17 @@ static int write_new_fid(struct powernow
 	dprintk("writing fid 0x%x, lo 0x%x, hi 0x%x\n",
 		fid, lo, data->plllock * PLL_LOCK_CONVERSION);
=20
+	if (tscsync) {
+		int i;
+		cpumask_t oldmask =3D current->cpus_allowed;
+		for_each_online_cpu(i) {
+			set_cpus_allowed(current, cpumask_of_cpu(i));
+			schedule();
+			wrmsr(MSR_FIDVID_CTL, lo &
~MSR_C_LO_INIT_FID_VID, data->plllock * PLL_LOCK_CONVERSION);
+		}
+		set_cpus_allowed(current, oldmask);
+		schedule();
+	}
 	do {
 		wrmsr(MSR_FIDVID_CTL, lo, data->plllock *
PLL_LOCK_CONVERSION);
 		if (i++ > 100) {
@@ -247,6 +261,17 @@ static int write_new_vid(struct powernow
 	dprintk("writing vid 0x%x, lo 0x%x, hi 0x%x\n",
 		vid, lo, STOP_GRANT_5NS);
=20
+	if (tscsync) {
+		int i;
+		cpumask_t oldmask =3D current->cpus_allowed;
+		for_each_online_cpu(i) {
+			set_cpus_allowed(current, cpumask_of_cpu(i));
+			schedule();
+			wrmsr(MSR_FIDVID_CTL, lo &
~MSR_C_LO_INIT_FID_VID, STOP_GRANT_5NS);
+		}
+		set_cpus_allowed(current, oldmask);
+		schedule();
+	}
 	do {
 		wrmsr(MSR_FIDVID_CTL, lo, STOP_GRANT_5NS);
 		if (i++ > 100) {
@@ -386,7 +411,8 @@ static int core_frequency_transition(str
 	}
=20
 	if (data->currfid =3D=3D reqfid) {
-		printk(KERN_ERR PFX "ph2 null fid transition 0x%x\n",
data->currfid);
+		if (!tscsync)
+			printk(KERN_ERR PFX "ph2 null fid transition
0x%x\n", data->currfid);
 		return 0;
 	}
=20
@@ -960,9 +986,21 @@ static int transition_frequency_fidvid(s
 	u32 vid =3D 0;
 	int res, i;
 	struct cpufreq_freqs freqs;
+	cpumask_t changing_cores;
=20
 	dprintk("cpu %d transition to index %u\n", smp_processor_id(),
index);
=20
+	/* if all processors are transitioning in step, find the highest
+	 * current state and go to that
+         */
+
+	if (tscsync && req_state) {
+		req_state[smp_processor_id()] =3D index;
+		for_each_online_cpu(i)=20
+			if (req_state[i] < index)
+				index =3D req_state[i];
+	}
+
 	/* fid/vid correctness check for k8 */
 	/* fid are the lower 8 bits of the index we stored into
 	 * the cpufreq frequency table in find_psb_table, vid
@@ -983,6 +1021,8 @@ static int transition_frequency_fidvid(s
 	}
=20
 	if ((fid < HI_FID_TABLE_BOTTOM) && (data->currfid <
HI_FID_TABLE_BOTTOM)) {
+		if (tscsync && (data->currfid =3D=3D fid))
+			return 0;
 		printk(KERN_ERR PFX
 		       "ignoring illegal change in lo freq table-%x to
0x%x\n",
 		       data->currfid, fid);
@@ -994,7 +1034,11 @@ static int transition_frequency_fidvid(s
 	freqs.old =3D find_khz_freq_from_fid(data->currfid);
 	freqs.new =3D find_khz_freq_from_fid(fid);
=20
-	for_each_cpu_mask(i, *(data->available_cores)) {
+	if (tscsync)
+		changing_cores =3D cpu_online_map;
+	else
+		changing_cores =3D *(data->available_cores);
+	for_each_cpu_mask(i, changing_cores) {
 		freqs.cpu =3D i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
@@ -1002,10 +1046,16 @@ static int transition_frequency_fidvid(s
 	res =3D transition_fid_vid(data, fid, vid);
 	freqs.new =3D find_khz_freq_from_fid(data->currfid);
=20
-	for_each_cpu_mask(i, *(data->available_cores)) {
+	for_each_cpu_mask(i, changing_cores) {
 		freqs.cpu =3D i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
+	if (tscsync)=20
+		for_each_online_cpu(i)
+			if (powernow_data[i]) {
+				powernow_data[i]->currfid =3D
data->currfid;
+				powernow_data[i]->currvid =3D
data->currvid;
+			}
 	return res;
 }
=20
@@ -1089,7 +1139,7 @@ static int powernowk8_target(struct cpuf
 		dprintk("targ: curr fid 0x%x, vid 0x%x\n",
 		data->currfid, data->currvid);
=20
-		if ((checkvid !=3D data->currvid) || (checkfid !=3D
data->currfid)) {
+		if (!tscsync && ((checkvid !=3D data->currvid) ||
(checkfid !=3D data->currfid))) {
 			printk(KERN_INFO PFX
 				"error - out of sync, fix 0x%x 0x%x, vid
0x%x 0x%x\n",
 				checkfid, data->currfid, checkvid,
data->currvid);
@@ -1100,7 +1150,6 @@ static int powernowk8_target(struct cpuf
 		goto err_out;
=20
 	mutex_lock(&fidvid_mutex);
-
 	powernow_k8_acpi_pst_values(data, newstate);
=20
 	if (cpu_family)
@@ -1137,6 +1186,32 @@ static int powernowk8_verify(struct cpuf
 	return cpufreq_frequency_table_verify(pol,
data->powernow_table);
 }
=20
+/* On an MP system that is transitioning all cores in sync, adjust the
+ * vids for each frequency to the highest.  Otherwise, systems made up
+ * of different steppings may fail.
+ */
+static void sync_tables(int curcpu)
+{
+	int j;
+	for (j =3D 0; j < powernow_data[curcpu]->numps; j++) {
+		int i;
+		int maxvid =3D 0;
+		for_each_online_cpu(i) {
+			int testvid;
+			if (!powernow_data[i] ||
!powernow_data[i]->powernow_table)
+				continue;
+			testvid =3D
powernow_data[i]->powernow_table[j].index & 0xff00;
+			if (testvid > maxvid)
+				maxvid =3D testvid;
+		}=09
+		for_each_online_cpu(i) {
+			if (!powernow_data[i] || !
powernow_data[i]->powernow_table)
+				continue;
+			powernow_data[i]->powernow_table[j].index &=3D
0xff;
+			powernow_data[i]->powernow_table[j].index |=3D
maxvid;
+		}
+	}
+}
 /* per CPU init entry point to the driver */
 static int __cpuinit powernowk8_cpu_init(struct cpufreq_policy *pol)
 {
@@ -1200,6 +1275,9 @@ static int __cpuinit powernowk8_cpu_init
 	if (!cpu_family)
 		fidvid_msr_init();
=20
+	if (tscsync && (cpu_family =3D=3D CPU_OPTERON))
+		req_state[pol->cpu] =3D 0;
+
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
=20
@@ -1241,6 +1319,13 @@ static int __cpuinit powernowk8_cpu_init
=20
 	powernow_data[pol->cpu] =3D data;
=20
+	if (tscsync && (cpu_family =3D=3D CPU_OPTERON)) {
+		u32 reg;
+		sync_tables(pol->cpu);
+		reg =3D read_pci_config(0, NB_PCI_ADDR + pol->cpu,
NB_PM_DEV, NB_C1_REG);
+		/* turn off C1 clock ramping */
+		write_pci_config(0, NB_PCI_ADDR + pol->cpu, NB_PM_DEV,
NB_C1_REG, reg & NB_C1_MASK);
+	}
 	return 0;
=20
 err_out:
@@ -1322,7 +1407,18 @@ static int __cpuinit powernowk8_init(voi
 			supported_cpus++;
 	}
=20
+#ifndef CONFIG_SMP
+	tscsync =3D 0;
+#endif
+
 	if (supported_cpus =3D=3D num_online_cpus()) {
+		if (tscsync) {
+			req_state =3D kzalloc(sizeof(int)*NR_CPUS,
GFP_KERNEL);
+			if (!req_state) {
+				printk(KERN_ERR PFX "Unable to allocate
memory!\n");
+				return -ENOMEM;
+			}
+		}
 		printk(KERN_INFO PFX "Found %d %s "
 			"processors (" VERSION ")\n", supported_cpus,
 			boot_cpu_data.x86_model_id);
@@ -1337,6 +1433,9 @@ static void __exit powernowk8_exit(void)
 {
 	dprintk("exit\n");
=20
+	if (tscsync)
+		kfree(req_state);
+
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
 }
=20
@@ -1346,3 +1445,6 @@ MODULE_LICENSE("GPL");
=20
 late_initcall(powernowk8_init);
 module_exit(powernowk8_exit);
+
+module_param(tscsync, int, 0);
+MODULE_PARM_DESC(tscsync, "enable tsc by synchronizing powernow-k8
changes");
--- linux-mm2-2.6.17-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k8.h.old
2006-06-12 12:22:13.000000000 -0500
+++ linux-mm2-2.6.17-rc6/arch/i386/kernel/cpu/cpufreq/powernow-k8.h
2006-06-15 13:31:02.000000000 -0500
@@ -171,6 +171,11 @@ struct powernow_k8_data {
 #define VID_MASK     0x1f
 #define FID_MASK     0x3f
=20
+/* Defines for disabling C1 clock ramping */
+#define NB_PCI_ADDR	0x18
+#define NB_PM_DEV	3
+#define NB_C1_REG	0x84
+#define NB_C1_MASK	0xfc
=20
 /*
  * Version 1.4 of the PSB table. This table is constructed by BIOS and
is

------_=_NextPart_001_01C693CE.98CFD844
Content-Type: application/octet-stream;
 name=pntscsync-2.6.17-rc6-mm2.patch
Content-Transfer-Encoding: base64
Content-Description: pntscsync-2.6.17-rc6-mm2.patch
Content-Disposition: attachment;
 filename=pntscsync-2.6.17-rc6-mm2.patch

LS0tIGxpbnV4LW1tMi0yLjYuMTctcmM2L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcG93
ZXJub3ctazguYy5vbGQJMjAwNi0wNi0xMiAxMjoyMjowNi4wMDAwMDAwMDAgLTA1MDAKKysrIGxp
bnV4LW1tMi0yLjYuMTctcmM2L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcG93ZXJub3ct
azguYwkyMDA2LTA2LTE1IDEzOjM1OjMyLjAwMDAwMDAwMCAtMDUwMApAQCAtMzcsNiArMzcsNyBA
QAogI2luY2x1ZGUgPGFzbS9tc3IuaD4KICNpbmNsdWRlIDxhc20vaW8uaD4KICNpbmNsdWRlIDxh
c20vZGVsYXkuaD4KKyNpbmNsdWRlIDxhc20vcGNpLWRpcmVjdC5oPgogCiAjaWZkZWYgQ09ORklH
X1g4Nl9QT1dFUk5PV19LOF9BQ1BJCiAjaW5jbHVkZSA8bGludXgvYWNwaS5oPgpAQCAtNDYsMTMg
KzQ3LDE1IEBACiAKICNkZWZpbmUgUEZYICJwb3dlcm5vdy1rODogIgogI2RlZmluZSBCRlggUEZY
ICJCSU9TIGVycm9yOiAiCi0jZGVmaW5lIFZFUlNJT04gInZlcnNpb24gMi4wMC4wMCIKKyNkZWZp
bmUgVkVSU0lPTiAidmVyc2lvbiAyLjEwLjAwIgogI2luY2x1ZGUgInBvd2Vybm93LWs4LmgiCiAK
IC8qIHNlcmlhbGl6ZSBmcmVxIGNoYW5nZXMgICovCiBzdGF0aWMgREVGSU5FX01VVEVYKGZpZHZp
ZF9tdXRleCk7CiAKIHN0YXRpYyBzdHJ1Y3QgcG93ZXJub3dfazhfZGF0YSAqcG93ZXJub3dfZGF0
YVtOUl9DUFVTXTsKK3N0YXRpYyBpbnQgKnJlcV9zdGF0ZSA9IE5VTEw7CitzdGF0aWMgaW50IHRz
Y3N5bmMgX19pbml0ZGF0YSA9IDA7CiAKIHN0YXRpYyBpbnQgY3B1X2ZhbWlseSA9IENQVV9PUFRF
Uk9OOwogCkBAIC0yMDUsNiArMjA4LDE3IEBAIHN0YXRpYyBpbnQgd3JpdGVfbmV3X2ZpZChzdHJ1
Y3QgcG93ZXJub3cKIAlkcHJpbnRrKCJ3cml0aW5nIGZpZCAweCV4LCBsbyAweCV4LCBoaSAweCV4
XG4iLAogCQlmaWQsIGxvLCBkYXRhLT5wbGxsb2NrICogUExMX0xPQ0tfQ09OVkVSU0lPTik7CiAK
KwlpZiAodHNjc3luYykgeworCQlpbnQgaTsKKwkJY3B1bWFza190IG9sZG1hc2sgPSBjdXJyZW50
LT5jcHVzX2FsbG93ZWQ7CisJCWZvcl9lYWNoX29ubGluZV9jcHUoaSkgeworCQkJc2V0X2NwdXNf
YWxsb3dlZChjdXJyZW50LCBjcHVtYXNrX29mX2NwdShpKSk7CisJCQlzY2hlZHVsZSgpOworCQkJ
d3Jtc3IoTVNSX0ZJRFZJRF9DVEwsIGxvICYgfk1TUl9DX0xPX0lOSVRfRklEX1ZJRCwgZGF0YS0+
cGxsbG9jayAqIFBMTF9MT0NLX0NPTlZFUlNJT04pOworCQl9CisJCXNldF9jcHVzX2FsbG93ZWQo
Y3VycmVudCwgb2xkbWFzayk7CisJCXNjaGVkdWxlKCk7CisJfQogCWRvIHsKIAkJd3Jtc3IoTVNS
X0ZJRFZJRF9DVEwsIGxvLCBkYXRhLT5wbGxsb2NrICogUExMX0xPQ0tfQ09OVkVSU0lPTik7CiAJ
CWlmIChpKysgPiAxMDApIHsKQEAgLTI0Nyw2ICsyNjEsMTcgQEAgc3RhdGljIGludCB3cml0ZV9u
ZXdfdmlkKHN0cnVjdCBwb3dlcm5vdwogCWRwcmludGsoIndyaXRpbmcgdmlkIDB4JXgsIGxvIDB4
JXgsIGhpIDB4JXhcbiIsCiAJCXZpZCwgbG8sIFNUT1BfR1JBTlRfNU5TKTsKIAorCWlmICh0c2Nz
eW5jKSB7CisJCWludCBpOworCQljcHVtYXNrX3Qgb2xkbWFzayA9IGN1cnJlbnQtPmNwdXNfYWxs
b3dlZDsKKwkJZm9yX2VhY2hfb25saW5lX2NwdShpKSB7CisJCQlzZXRfY3B1c19hbGxvd2VkKGN1
cnJlbnQsIGNwdW1hc2tfb2ZfY3B1KGkpKTsKKwkJCXNjaGVkdWxlKCk7CisJCQl3cm1zcihNU1Jf
RklEVklEX0NUTCwgbG8gJiB+TVNSX0NfTE9fSU5JVF9GSURfVklELCBTVE9QX0dSQU5UXzVOUyk7
CisJCX0KKwkJc2V0X2NwdXNfYWxsb3dlZChjdXJyZW50LCBvbGRtYXNrKTsKKwkJc2NoZWR1bGUo
KTsKKwl9CiAJZG8gewogCQl3cm1zcihNU1JfRklEVklEX0NUTCwgbG8sIFNUT1BfR1JBTlRfNU5T
KTsKIAkJaWYgKGkrKyA+IDEwMCkgewpAQCAtMzg2LDcgKzQxMSw4IEBAIHN0YXRpYyBpbnQgY29y
ZV9mcmVxdWVuY3lfdHJhbnNpdGlvbihzdHIKIAl9CiAKIAlpZiAoZGF0YS0+Y3VycmZpZCA9PSBy
ZXFmaWQpIHsKLQkJcHJpbnRrKEtFUk5fRVJSIFBGWCAicGgyIG51bGwgZmlkIHRyYW5zaXRpb24g
MHgleFxuIiwgZGF0YS0+Y3VycmZpZCk7CisJCWlmICghdHNjc3luYykKKwkJCXByaW50ayhLRVJO
X0VSUiBQRlggInBoMiBudWxsIGZpZCB0cmFuc2l0aW9uIDB4JXhcbiIsIGRhdGEtPmN1cnJmaWQp
OwogCQlyZXR1cm4gMDsKIAl9CiAKQEAgLTk2MCw5ICs5ODYsMjEgQEAgc3RhdGljIGludCB0cmFu
c2l0aW9uX2ZyZXF1ZW5jeV9maWR2aWQocwogCXUzMiB2aWQgPSAwOwogCWludCByZXMsIGk7CiAJ
c3RydWN0IGNwdWZyZXFfZnJlcXMgZnJlcXM7CisJY3B1bWFza190IGNoYW5naW5nX2NvcmVzOwog
CiAJZHByaW50aygiY3B1ICVkIHRyYW5zaXRpb24gdG8gaW5kZXggJXVcbiIsIHNtcF9wcm9jZXNz
b3JfaWQoKSwgaW5kZXgpOwogCisJLyogaWYgYWxsIHByb2Nlc3NvcnMgYXJlIHRyYW5zaXRpb25p
bmcgaW4gc3RlcCwgZmluZCB0aGUgaGlnaGVzdAorCSAqIGN1cnJlbnQgc3RhdGUgYW5kIGdvIHRv
IHRoYXQKKyAgICAgICAgICovCisKKwlpZiAodHNjc3luYyAmJiByZXFfc3RhdGUpIHsKKwkJcmVx
X3N0YXRlW3NtcF9wcm9jZXNzb3JfaWQoKV0gPSBpbmRleDsKKwkJZm9yX2VhY2hfb25saW5lX2Nw
dShpKSAKKwkJCWlmIChyZXFfc3RhdGVbaV0gPCBpbmRleCkKKwkJCQlpbmRleCA9IHJlcV9zdGF0
ZVtpXTsKKwl9CisKIAkvKiBmaWQvdmlkIGNvcnJlY3RuZXNzIGNoZWNrIGZvciBrOCAqLwogCS8q
IGZpZCBhcmUgdGhlIGxvd2VyIDggYml0cyBvZiB0aGUgaW5kZXggd2Ugc3RvcmVkIGludG8KIAkg
KiB0aGUgY3B1ZnJlcSBmcmVxdWVuY3kgdGFibGUgaW4gZmluZF9wc2JfdGFibGUsIHZpZApAQCAt
OTgzLDYgKzEwMjEsOCBAQCBzdGF0aWMgaW50IHRyYW5zaXRpb25fZnJlcXVlbmN5X2ZpZHZpZChz
CiAJfQogCiAJaWYgKChmaWQgPCBISV9GSURfVEFCTEVfQk9UVE9NKSAmJiAoZGF0YS0+Y3VycmZp
ZCA8IEhJX0ZJRF9UQUJMRV9CT1RUT00pKSB7CisJCWlmICh0c2NzeW5jICYmIChkYXRhLT5jdXJy
ZmlkID09IGZpZCkpCisJCQlyZXR1cm4gMDsKIAkJcHJpbnRrKEtFUk5fRVJSIFBGWAogCQkgICAg
ICAgImlnbm9yaW5nIGlsbGVnYWwgY2hhbmdlIGluIGxvIGZyZXEgdGFibGUtJXggdG8gMHgleFxu
IiwKIAkJICAgICAgIGRhdGEtPmN1cnJmaWQsIGZpZCk7CkBAIC05OTQsNyArMTAzNCwxMSBAQCBz
dGF0aWMgaW50IHRyYW5zaXRpb25fZnJlcXVlbmN5X2ZpZHZpZChzCiAJZnJlcXMub2xkID0gZmlu
ZF9raHpfZnJlcV9mcm9tX2ZpZChkYXRhLT5jdXJyZmlkKTsKIAlmcmVxcy5uZXcgPSBmaW5kX2to
el9mcmVxX2Zyb21fZmlkKGZpZCk7CiAKLQlmb3JfZWFjaF9jcHVfbWFzayhpLCAqKGRhdGEtPmF2
YWlsYWJsZV9jb3JlcykpIHsKKwlpZiAodHNjc3luYykKKwkJY2hhbmdpbmdfY29yZXMgPSBjcHVf
b25saW5lX21hcDsKKwllbHNlCisJCWNoYW5naW5nX2NvcmVzID0gKihkYXRhLT5hdmFpbGFibGVf
Y29yZXMpOworCWZvcl9lYWNoX2NwdV9tYXNrKGksIGNoYW5naW5nX2NvcmVzKSB7CiAJCWZyZXFz
LmNwdSA9IGk7CiAJCWNwdWZyZXFfbm90aWZ5X3RyYW5zaXRpb24oJmZyZXFzLCBDUFVGUkVRX1BS
RUNIQU5HRSk7CiAJfQpAQCAtMTAwMiwxMCArMTA0NiwxNiBAQCBzdGF0aWMgaW50IHRyYW5zaXRp
b25fZnJlcXVlbmN5X2ZpZHZpZChzCiAJcmVzID0gdHJhbnNpdGlvbl9maWRfdmlkKGRhdGEsIGZp
ZCwgdmlkKTsKIAlmcmVxcy5uZXcgPSBmaW5kX2toel9mcmVxX2Zyb21fZmlkKGRhdGEtPmN1cnJm
aWQpOwogCi0JZm9yX2VhY2hfY3B1X21hc2soaSwgKihkYXRhLT5hdmFpbGFibGVfY29yZXMpKSB7
CisJZm9yX2VhY2hfY3B1X21hc2soaSwgY2hhbmdpbmdfY29yZXMpIHsKIAkJZnJlcXMuY3B1ID0g
aTsKIAkJY3B1ZnJlcV9ub3RpZnlfdHJhbnNpdGlvbigmZnJlcXMsIENQVUZSRVFfUE9TVENIQU5H
RSk7CiAJfQorCWlmICh0c2NzeW5jKSAKKwkJZm9yX2VhY2hfb25saW5lX2NwdShpKQorCQkJaWYg
KHBvd2Vybm93X2RhdGFbaV0pIHsKKwkJCQlwb3dlcm5vd19kYXRhW2ldLT5jdXJyZmlkID0gZGF0
YS0+Y3VycmZpZDsKKwkJCQlwb3dlcm5vd19kYXRhW2ldLT5jdXJydmlkID0gZGF0YS0+Y3VycnZp
ZDsKKwkJCX0KIAlyZXR1cm4gcmVzOwogfQogCkBAIC0xMDg5LDcgKzExMzksNyBAQCBzdGF0aWMg
aW50IHBvd2Vybm93azhfdGFyZ2V0KHN0cnVjdCBjcHVmCiAJCWRwcmludGsoInRhcmc6IGN1cnIg
ZmlkIDB4JXgsIHZpZCAweCV4XG4iLAogCQlkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJydmlkKTsK
IAotCQlpZiAoKGNoZWNrdmlkICE9IGRhdGEtPmN1cnJ2aWQpIHx8IChjaGVja2ZpZCAhPSBkYXRh
LT5jdXJyZmlkKSkgeworCQlpZiAoIXRzY3N5bmMgJiYgKChjaGVja3ZpZCAhPSBkYXRhLT5jdXJy
dmlkKSB8fCAoY2hlY2tmaWQgIT0gZGF0YS0+Y3VycmZpZCkpKSB7CiAJCQlwcmludGsoS0VSTl9J
TkZPIFBGWAogCQkJCSJlcnJvciAtIG91dCBvZiBzeW5jLCBmaXggMHgleCAweCV4LCB2aWQgMHgl
eCAweCV4XG4iLAogCQkJCWNoZWNrZmlkLCBkYXRhLT5jdXJyZmlkLCBjaGVja3ZpZCwgZGF0YS0+
Y3VycnZpZCk7CkBAIC0xMTAwLDcgKzExNTAsNiBAQCBzdGF0aWMgaW50IHBvd2Vybm93azhfdGFy
Z2V0KHN0cnVjdCBjcHVmCiAJCWdvdG8gZXJyX291dDsKIAogCW11dGV4X2xvY2soJmZpZHZpZF9t
dXRleCk7Ci0KIAlwb3dlcm5vd19rOF9hY3BpX3BzdF92YWx1ZXMoZGF0YSwgbmV3c3RhdGUpOwog
CiAJaWYgKGNwdV9mYW1pbHkpCkBAIC0xMTM3LDYgKzExODYsMzIgQEAgc3RhdGljIGludCBwb3dl
cm5vd2s4X3ZlcmlmeShzdHJ1Y3QgY3B1ZgogCXJldHVybiBjcHVmcmVxX2ZyZXF1ZW5jeV90YWJs
ZV92ZXJpZnkocG9sLCBkYXRhLT5wb3dlcm5vd190YWJsZSk7CiB9CiAKKy8qIE9uIGFuIE1QIHN5
c3RlbSB0aGF0IGlzIHRyYW5zaXRpb25pbmcgYWxsIGNvcmVzIGluIHN5bmMsIGFkanVzdCB0aGUK
KyAqIHZpZHMgZm9yIGVhY2ggZnJlcXVlbmN5IHRvIHRoZSBoaWdoZXN0LiAgT3RoZXJ3aXNlLCBz
eXN0ZW1zIG1hZGUgdXAKKyAqIG9mIGRpZmZlcmVudCBzdGVwcGluZ3MgbWF5IGZhaWwuCisgKi8K
K3N0YXRpYyB2b2lkIHN5bmNfdGFibGVzKGludCBjdXJjcHUpCit7CisJaW50IGo7CisJZm9yIChq
ID0gMDsgaiA8IHBvd2Vybm93X2RhdGFbY3VyY3B1XS0+bnVtcHM7IGorKykgeworCQlpbnQgaTsK
KwkJaW50IG1heHZpZCA9IDA7CisJCWZvcl9lYWNoX29ubGluZV9jcHUoaSkgeworCQkJaW50IHRl
c3R2aWQ7CisJCQlpZiAoIXBvd2Vybm93X2RhdGFbaV0gfHwgIXBvd2Vybm93X2RhdGFbaV0tPnBv
d2Vybm93X3RhYmxlKQorCQkJCWNvbnRpbnVlOworCQkJdGVzdHZpZCA9IHBvd2Vybm93X2RhdGFb
aV0tPnBvd2Vybm93X3RhYmxlW2pdLmluZGV4ICYgMHhmZjAwOworCQkJaWYgKHRlc3R2aWQgPiBt
YXh2aWQpCisJCQkJbWF4dmlkID0gdGVzdHZpZDsKKwkJfQkKKwkJZm9yX2VhY2hfb25saW5lX2Nw
dShpKSB7CisJCQlpZiAoIXBvd2Vybm93X2RhdGFbaV0gfHwgISBwb3dlcm5vd19kYXRhW2ldLT5w
b3dlcm5vd190YWJsZSkKKwkJCQljb250aW51ZTsKKwkJCXBvd2Vybm93X2RhdGFbaV0tPnBvd2Vy
bm93X3RhYmxlW2pdLmluZGV4ICY9IDB4ZmY7CisJCQlwb3dlcm5vd19kYXRhW2ldLT5wb3dlcm5v
d190YWJsZVtqXS5pbmRleCB8PSBtYXh2aWQ7CisJCX0KKwl9Cit9CiAvKiBwZXIgQ1BVIGluaXQg
ZW50cnkgcG9pbnQgdG8gdGhlIGRyaXZlciAqLwogc3RhdGljIGludCBfX2NwdWluaXQgcG93ZXJu
b3drOF9jcHVfaW5pdChzdHJ1Y3QgY3B1ZnJlcV9wb2xpY3kgKnBvbCkKIHsKQEAgLTEyMDAsNiAr
MTI3NSw5IEBAIHN0YXRpYyBpbnQgX19jcHVpbml0IHBvd2Vybm93azhfY3B1X2luaXQKIAlpZiAo
IWNwdV9mYW1pbHkpCiAJCWZpZHZpZF9tc3JfaW5pdCgpOwogCisJaWYgKHRzY3N5bmMgJiYgKGNw
dV9mYW1pbHkgPT0gQ1BVX09QVEVST04pKQorCQlyZXFfc3RhdGVbcG9sLT5jcHVdID0gMDsKKwog
CS8qIHJ1biBvbiBhbnkgQ1BVIGFnYWluICovCiAJc2V0X2NwdXNfYWxsb3dlZChjdXJyZW50LCBv
bGRtYXNrKTsKIApAQCAtMTI0MSw2ICsxMzE5LDEzIEBAIHN0YXRpYyBpbnQgX19jcHVpbml0IHBv
d2Vybm93azhfY3B1X2luaXQKIAogCXBvd2Vybm93X2RhdGFbcG9sLT5jcHVdID0gZGF0YTsKIAor
CWlmICh0c2NzeW5jICYmIChjcHVfZmFtaWx5ID09IENQVV9PUFRFUk9OKSkgeworCQl1MzIgcmVn
OworCQlzeW5jX3RhYmxlcyhwb2wtPmNwdSk7CisJCXJlZyA9IHJlYWRfcGNpX2NvbmZpZygwLCBO
Ql9QQ0lfQUREUiArIHBvbC0+Y3B1LCBOQl9QTV9ERVYsIE5CX0MxX1JFRyk7CisJCS8qIHR1cm4g
b2ZmIEMxIGNsb2NrIHJhbXBpbmcgKi8KKwkJd3JpdGVfcGNpX2NvbmZpZygwLCBOQl9QQ0lfQURE
UiArIHBvbC0+Y3B1LCBOQl9QTV9ERVYsIE5CX0MxX1JFRywgcmVnICYgTkJfQzFfTUFTSyk7CisJ
fQogCXJldHVybiAwOwogCiBlcnJfb3V0OgpAQCAtMTMyMiw3ICsxNDA3LDE4IEBAIHN0YXRpYyBp
bnQgX19jcHVpbml0IHBvd2Vybm93azhfaW5pdCh2b2kKIAkJCXN1cHBvcnRlZF9jcHVzKys7CiAJ
fQogCisjaWZuZGVmIENPTkZJR19TTVAKKwl0c2NzeW5jID0gMDsKKyNlbmRpZgorCiAJaWYgKHN1
cHBvcnRlZF9jcHVzID09IG51bV9vbmxpbmVfY3B1cygpKSB7CisJCWlmICh0c2NzeW5jKSB7CisJ
CQlyZXFfc3RhdGUgPSBremFsbG9jKHNpemVvZihpbnQpKk5SX0NQVVMsIEdGUF9LRVJORUwpOwor
CQkJaWYgKCFyZXFfc3RhdGUpIHsKKwkJCQlwcmludGsoS0VSTl9FUlIgUEZYICJVbmFibGUgdG8g
YWxsb2NhdGUgbWVtb3J5IVxuIik7CisJCQkJcmV0dXJuIC1FTk9NRU07CisJCQl9CisJCX0KIAkJ
cHJpbnRrKEtFUk5fSU5GTyBQRlggIkZvdW5kICVkICVzICIKIAkJCSJwcm9jZXNzb3JzICgiIFZF
UlNJT04gIilcbiIsIHN1cHBvcnRlZF9jcHVzLAogCQkJYm9vdF9jcHVfZGF0YS54ODZfbW9kZWxf
aWQpOwpAQCAtMTMzNyw2ICsxNDMzLDkgQEAgc3RhdGljIHZvaWQgX19leGl0IHBvd2Vybm93azhf
ZXhpdCh2b2lkKQogewogCWRwcmludGsoImV4aXRcbiIpOwogCisJaWYgKHRzY3N5bmMpCisJCWtm
cmVlKHJlcV9zdGF0ZSk7CisKIAljcHVmcmVxX3VucmVnaXN0ZXJfZHJpdmVyKCZjcHVmcmVxX2Ft
ZDY0X2RyaXZlcik7CiB9CiAKQEAgLTEzNDYsMyArMTQ0NSw2IEBAIE1PRFVMRV9MSUNFTlNFKCJH
UEwiKTsKIAogbGF0ZV9pbml0Y2FsbChwb3dlcm5vd2s4X2luaXQpOwogbW9kdWxlX2V4aXQocG93
ZXJub3drOF9leGl0KTsKKworbW9kdWxlX3BhcmFtKHRzY3N5bmMsIGludCwgMCk7CitNT0RVTEVf
UEFSTV9ERVNDKHRzY3N5bmMsICJlbmFibGUgdHNjIGJ5IHN5bmNocm9uaXppbmcgcG93ZXJub3ct
azggY2hhbmdlcyIpOwotLS0gbGludXgtbW0yLTIuNi4xNy1yYzYvYXJjaC9pMzg2L2tlcm5lbC9j
cHUvY3B1ZnJlcS9wb3dlcm5vdy1rOC5oLm9sZAkyMDA2LTA2LTEyIDEyOjIyOjEzLjAwMDAwMDAw
MCAtMDUwMAorKysgbGludXgtbW0yLTIuNi4xNy1yYzYvYXJjaC9pMzg2L2tlcm5lbC9jcHUvY3B1
ZnJlcS9wb3dlcm5vdy1rOC5oCTIwMDYtMDYtMTUgMTM6MzE6MDIuMDAwMDAwMDAwIC0wNTAwCkBA
IC0xNzEsNiArMTcxLDExIEBAIHN0cnVjdCBwb3dlcm5vd19rOF9kYXRhIHsKICNkZWZpbmUgVklE
X01BU0sgICAgIDB4MWYKICNkZWZpbmUgRklEX01BU0sgICAgIDB4M2YKIAorLyogRGVmaW5lcyBm
b3IgZGlzYWJsaW5nIEMxIGNsb2NrIHJhbXBpbmcgKi8KKyNkZWZpbmUgTkJfUENJX0FERFIJMHgx
OAorI2RlZmluZSBOQl9QTV9ERVYJMworI2RlZmluZSBOQl9DMV9SRUcJMHg4NAorI2RlZmluZSBO
Ql9DMV9NQVNLCTB4ZmMKIAogLyoKICAqIFZlcnNpb24gMS40IG9mIHRoZSBQU0IgdGFibGUuIFRo
aXMgdGFibGUgaXMgY29uc3RydWN0ZWQgYnkgQklPUyBhbmQgaXMK

------_=_NextPart_001_01C693CE.98CFD844
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C693CE.98CFD844--


