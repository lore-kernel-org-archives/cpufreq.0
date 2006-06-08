From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH][1/2] Clarify cpu_family statements
Date: Thu, 8 Jun 2006 10:30:17 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A8430564A36C@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C68B10.7366EAF1"
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

------_=_NextPart_001_01C68B10.7366EAF1
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This patch clarfies the meaning of the cpu_family if
statements in the hw pstate driver patch for powernow-k8

-Mark Langsdorf
AMD, Inc.

(inline and attached because my mailer is very braindead)
signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- linux-mm6-2.6.17/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig
2006-06-08 09:44:17.000000000 -0500
+++ linux-mm6-2.6.17/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
2006-06-08 09:58:01.000000000 -0500
@@ -120,7 +120,7 @@ static int pending_bit_stuck(void)
 {
 	u32 lo, hi;
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		return 0;
=20
 	rdmsr(MSR_FIDVID_STATUS, lo, hi);
@@ -136,7 +136,7 @@ static int query_current_values_with_pen
 	u32 lo, hi;
 	u32 i =3D 0;
=20
-	if (cpu_family) {
+	if (cpu_family =3D=3D CPU_HW_PSTATE) {
 		rdmsr(MSR_PSTATE_STATUS, lo, hi);
 		i =3D lo & HW_PSTATE_MASK;
 		rdmsr(MSR_PSTATE_DEF_BASE + i, lo, hi);
@@ -598,7 +598,7 @@ static void print_basics(struct powernow
 	int j;
 	for (j =3D 0; j < data->numps; j++) {
 		if (data->powernow_table[j].frequency !=3D
CPUFREQ_ENTRY_INVALID) {
-			if (cpu_family) {
+			if (cpu_family =3D=3D CPU_HW_PSTATE) {
 			printk(KERN_INFO PFX "   %d : fid 0x%x gid 0x%x
(%d MHz)\n", j, (data->powernow_table[j].index & 0xff00) >> 8,
 				(data->powernow_table[j].index &
0xff0000) >> 16,
 				data->powernow_table[j].frequency/1000);
@@ -758,7 +758,7 @@ static int find_psb_table(struct powerno
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 static void powernow_k8_acpi_pst_values(struct powernow_k8_data *data,
unsigned int index)
 {
-	if (!data->acpi_data.state_count || cpu_family)
+	if (!data->acpi_data.state_count || (cpu_family =3D=3D
CPU_HW_PSTATE))
 		return;
=20
 	data->irt =3D (data->acpi_data.states[index].control >> IRT_SHIFT)
& IRT_MASK;
@@ -801,7 +801,7 @@ static int powernow_k8_cpu_init_acpi(str
 		goto err_out;
 	}
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		ret_val =3D fill_powernow_table_pstate(data,
powernow_table);
 	else
 		ret_val =3D fill_powernow_table_fidvid(data,
powernow_table);
@@ -1082,7 +1082,7 @@ static int powernowk8_target(struct cpuf
 	if (query_current_values_with_pending_wait(data))
 		goto err_out;
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		dprintk("targ: curr fid 0x%x, did 0x%x\n",
 			data->currfid, data->currvid);
 	else {
@@ -1103,7 +1103,7 @@ static int powernowk8_target(struct cpuf
=20
 	powernow_k8_acpi_pst_values(data, newstate);
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		ret =3D transition_frequency_pstate(data, newstate);
 	else
 		ret =3D transition_frequency_fidvid(data, newstate);
@@ -1115,7 +1115,7 @@ static int powernowk8_target(struct cpuf
 	}
 	mutex_unlock(&fidvid_mutex);
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		pol->cur =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
 	else
 		pol->cur =3D find_khz_freq_from_fid(data->currfid);
@@ -1197,14 +1197,14 @@ static int __cpuinit powernowk8_cpu_init
 	if (query_current_values_with_pending_wait(data))
 		goto err_out;
=20
-	if (!cpu_family)
+	if (cpu_family =3D=3D CPU_OPTERON)
 		fidvid_msr_init();
=20
 	/* run on any CPU again */
 	set_cpus_allowed(current, oldmask);
=20
 	pol->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		pol->cpus =3D cpumask_of_cpu(pol->cpu);
 	else
 		pol->cpus =3D cpu_core_map[pol->cpu];
@@ -1215,7 +1215,7 @@ static int __cpuinit powernowk8_cpu_init
 	pol->cpuinfo.transition_latency =3D (((data->rvo + 8) *
data->vstable * VST_UNITS_20US)
 	    + (3 * (1 << data->irt) * 10)) * 1000;
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		pol->cur =3D find_khz_freq_from_fiddid(data->currfid,
data->currdid);
 	else
 		pol->cur =3D find_khz_freq_from_fid(data->currfid);
@@ -1232,7 +1232,7 @@ static int __cpuinit powernowk8_cpu_init
=20
 	cpufreq_frequency_table_get_attr(data->powernow_table,
pol->cpu);
=20
-	if (cpu_family)
+	if (cpu_family =3D=3D CPU_HW_PSTATE)
 		dprintk("cpu_init done, current fid 0x%x, did 0x%x\n",
 			data->currfid, data->currdid);
 	else

------_=_NextPart_001_01C68B10.7366EAF1
Content-Type: application/octet-stream;
 name=clarify_cpu_family.patch
Content-Transfer-Encoding: base64
Content-Description: clarify_cpu_family.patch
Content-Disposition: attachment;
 filename=clarify_cpu_family.patch

c2lnbmVkLW9mZi1ieTogTWFyayBMYW5nc2RvcmYgPG1hcmsubGFuZ3Nkb3JmQGFtZC5jb20+Cgot
LS0gbGludXgtbW02LTIuNi4xNy9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3Bvd2Vybm93
LWs4LmMub3JpZwkyMDA2LTA2LTA4IDA5OjQ0OjE3LjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgt
bW02LTIuNi4xNy9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3Bvd2Vybm93LWs4LmMJMjAw
Ni0wNi0wOCAwOTo1ODowMS4wMDAwMDAwMDAgLTA1MDAKQEAgLTEyMCw3ICsxMjAsNyBAQCBzdGF0
aWMgaW50IHBlbmRpbmdfYml0X3N0dWNrKHZvaWQpCiB7CiAJdTMyIGxvLCBoaTsKIAotCWlmIChj
cHVfZmFtaWx5KQorCWlmIChjcHVfZmFtaWx5ID09IENQVV9IV19QU1RBVEUpCiAJCXJldHVybiAw
OwogCiAJcmRtc3IoTVNSX0ZJRFZJRF9TVEFUVVMsIGxvLCBoaSk7CkBAIC0xMzYsNyArMTM2LDcg
QEAgc3RhdGljIGludCBxdWVyeV9jdXJyZW50X3ZhbHVlc193aXRoX3BlbgogCXUzMiBsbywgaGk7
CiAJdTMyIGkgPSAwOwogCi0JaWYgKGNwdV9mYW1pbHkpIHsKKwlpZiAoY3B1X2ZhbWlseSA9PSBD
UFVfSFdfUFNUQVRFKSB7CiAJCXJkbXNyKE1TUl9QU1RBVEVfU1RBVFVTLCBsbywgaGkpOwogCQlp
ID0gbG8gJiBIV19QU1RBVEVfTUFTSzsKIAkJcmRtc3IoTVNSX1BTVEFURV9ERUZfQkFTRSArIGks
IGxvLCBoaSk7CkBAIC01OTgsNyArNTk4LDcgQEAgc3RhdGljIHZvaWQgcHJpbnRfYmFzaWNzKHN0
cnVjdCBwb3dlcm5vdwogCWludCBqOwogCWZvciAoaiA9IDA7IGogPCBkYXRhLT5udW1wczsgaisr
KSB7CiAJCWlmIChkYXRhLT5wb3dlcm5vd190YWJsZVtqXS5mcmVxdWVuY3kgIT0gQ1BVRlJFUV9F
TlRSWV9JTlZBTElEKSB7Ci0JCQlpZiAoY3B1X2ZhbWlseSkgeworCQkJaWYgKGNwdV9mYW1pbHkg
PT0gQ1BVX0hXX1BTVEFURSkgewogCQkJcHJpbnRrKEtFUk5fSU5GTyBQRlggIiAgICVkIDogZmlk
IDB4JXggZ2lkIDB4JXggKCVkIE1IeilcbiIsIGosIChkYXRhLT5wb3dlcm5vd190YWJsZVtqXS5p
bmRleCAmIDB4ZmYwMCkgPj4gOCwKIAkJCQkoZGF0YS0+cG93ZXJub3dfdGFibGVbal0uaW5kZXgg
JiAweGZmMDAwMCkgPj4gMTYsCiAJCQkJZGF0YS0+cG93ZXJub3dfdGFibGVbal0uZnJlcXVlbmN5
LzEwMDApOwpAQCAtNzU4LDcgKzc1OCw3IEBAIHN0YXRpYyBpbnQgZmluZF9wc2JfdGFibGUoc3Ry
dWN0IHBvd2Vybm8KICNpZmRlZiBDT05GSUdfWDg2X1BPV0VSTk9XX0s4X0FDUEkKIHN0YXRpYyB2
b2lkIHBvd2Vybm93X2s4X2FjcGlfcHN0X3ZhbHVlcyhzdHJ1Y3QgcG93ZXJub3dfazhfZGF0YSAq
ZGF0YSwgdW5zaWduZWQgaW50IGluZGV4KQogewotCWlmICghZGF0YS0+YWNwaV9kYXRhLnN0YXRl
X2NvdW50IHx8IGNwdV9mYW1pbHkpCisJaWYgKCFkYXRhLT5hY3BpX2RhdGEuc3RhdGVfY291bnQg
fHwgKGNwdV9mYW1pbHkgPT0gQ1BVX0hXX1BTVEFURSkpCiAJCXJldHVybjsKIAogCWRhdGEtPmly
dCA9IChkYXRhLT5hY3BpX2RhdGEuc3RhdGVzW2luZGV4XS5jb250cm9sID4+IElSVF9TSElGVCkg
JiBJUlRfTUFTSzsKQEAgLTgwMSw3ICs4MDEsNyBAQCBzdGF0aWMgaW50IHBvd2Vybm93X2s4X2Nw
dV9pbml0X2FjcGkoc3RyCiAJCWdvdG8gZXJyX291dDsKIAl9CiAKLQlpZiAoY3B1X2ZhbWlseSkK
KwlpZiAoY3B1X2ZhbWlseSA9PSBDUFVfSFdfUFNUQVRFKQogCQlyZXRfdmFsID0gZmlsbF9wb3dl
cm5vd190YWJsZV9wc3RhdGUoZGF0YSwgcG93ZXJub3dfdGFibGUpOwogCWVsc2UKIAkJcmV0X3Zh
bCA9IGZpbGxfcG93ZXJub3dfdGFibGVfZmlkdmlkKGRhdGEsIHBvd2Vybm93X3RhYmxlKTsKQEAg
LTEwODIsNyArMTA4Miw3IEBAIHN0YXRpYyBpbnQgcG93ZXJub3drOF90YXJnZXQoc3RydWN0IGNw
dWYKIAlpZiAocXVlcnlfY3VycmVudF92YWx1ZXNfd2l0aF9wZW5kaW5nX3dhaXQoZGF0YSkpCiAJ
CWdvdG8gZXJyX291dDsKIAotCWlmIChjcHVfZmFtaWx5KQorCWlmIChjcHVfZmFtaWx5ID09IENQ
VV9IV19QU1RBVEUpCiAJCWRwcmludGsoInRhcmc6IGN1cnIgZmlkIDB4JXgsIGRpZCAweCV4XG4i
LAogCQkJZGF0YS0+Y3VycmZpZCwgZGF0YS0+Y3VycnZpZCk7CiAJZWxzZSB7CkBAIC0xMTAzLDcg
KzExMDMsNyBAQCBzdGF0aWMgaW50IHBvd2Vybm93azhfdGFyZ2V0KHN0cnVjdCBjcHVmCiAKIAlw
b3dlcm5vd19rOF9hY3BpX3BzdF92YWx1ZXMoZGF0YSwgbmV3c3RhdGUpOwogCi0JaWYgKGNwdV9m
YW1pbHkpCisJaWYgKGNwdV9mYW1pbHkgPT0gQ1BVX0hXX1BTVEFURSkKIAkJcmV0ID0gdHJhbnNp
dGlvbl9mcmVxdWVuY3lfcHN0YXRlKGRhdGEsIG5ld3N0YXRlKTsKIAllbHNlCiAJCXJldCA9IHRy
YW5zaXRpb25fZnJlcXVlbmN5X2ZpZHZpZChkYXRhLCBuZXdzdGF0ZSk7CkBAIC0xMTE1LDcgKzEx
MTUsNyBAQCBzdGF0aWMgaW50IHBvd2Vybm93azhfdGFyZ2V0KHN0cnVjdCBjcHVmCiAJfQogCW11
dGV4X3VubG9jaygmZmlkdmlkX211dGV4KTsKIAotCWlmIChjcHVfZmFtaWx5KQorCWlmIChjcHVf
ZmFtaWx5ID09IENQVV9IV19QU1RBVEUpCiAJCXBvbC0+Y3VyID0gZmluZF9raHpfZnJlcV9mcm9t
X2ZpZGRpZChkYXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJyZGlkKTsKIAllbHNlCiAJCXBvbC0+Y3Vy
ID0gZmluZF9raHpfZnJlcV9mcm9tX2ZpZChkYXRhLT5jdXJyZmlkKTsKQEAgLTExOTcsMTQgKzEx
OTcsMTQgQEAgc3RhdGljIGludCBfX2NwdWluaXQgcG93ZXJub3drOF9jcHVfaW5pdAogCWlmIChx
dWVyeV9jdXJyZW50X3ZhbHVlc193aXRoX3BlbmRpbmdfd2FpdChkYXRhKSkKIAkJZ290byBlcnJf
b3V0OwogCi0JaWYgKCFjcHVfZmFtaWx5KQorCWlmIChjcHVfZmFtaWx5ID09IENQVV9PUFRFUk9O
KQogCQlmaWR2aWRfbXNyX2luaXQoKTsKIAogCS8qIHJ1biBvbiBhbnkgQ1BVIGFnYWluICovCiAJ
c2V0X2NwdXNfYWxsb3dlZChjdXJyZW50LCBvbGRtYXNrKTsKIAogCXBvbC0+Z292ZXJub3IgPSBD
UFVGUkVRX0RFRkFVTFRfR09WRVJOT1I7Ci0JaWYgKGNwdV9mYW1pbHkpCisJaWYgKGNwdV9mYW1p
bHkgPT0gQ1BVX0hXX1BTVEFURSkKIAkJcG9sLT5jcHVzID0gY3B1bWFza19vZl9jcHUocG9sLT5j
cHUpOwogCWVsc2UKIAkJcG9sLT5jcHVzID0gY3B1X2NvcmVfbWFwW3BvbC0+Y3B1XTsKQEAgLTEy
MTUsNyArMTIxNSw3IEBAIHN0YXRpYyBpbnQgX19jcHVpbml0IHBvd2Vybm93azhfY3B1X2luaXQK
IAlwb2wtPmNwdWluZm8udHJhbnNpdGlvbl9sYXRlbmN5ID0gKCgoZGF0YS0+cnZvICsgOCkgKiBk
YXRhLT52c3RhYmxlICogVlNUX1VOSVRTXzIwVVMpCiAJICAgICsgKDMgKiAoMSA8PCBkYXRhLT5p
cnQpICogMTApKSAqIDEwMDA7CiAKLQlpZiAoY3B1X2ZhbWlseSkKKwlpZiAoY3B1X2ZhbWlseSA9
PSBDUFVfSFdfUFNUQVRFKQogCQlwb2wtPmN1ciA9IGZpbmRfa2h6X2ZyZXFfZnJvbV9maWRkaWQo
ZGF0YS0+Y3VycmZpZCwgZGF0YS0+Y3VycmRpZCk7CiAJZWxzZQogCQlwb2wtPmN1ciA9IGZpbmRf
a2h6X2ZyZXFfZnJvbV9maWQoZGF0YS0+Y3VycmZpZCk7CkBAIC0xMjMyLDcgKzEyMzIsNyBAQCBz
dGF0aWMgaW50IF9fY3B1aW5pdCBwb3dlcm5vd2s4X2NwdV9pbml0CiAKIAljcHVmcmVxX2ZyZXF1
ZW5jeV90YWJsZV9nZXRfYXR0cihkYXRhLT5wb3dlcm5vd190YWJsZSwgcG9sLT5jcHUpOwogCi0J
aWYgKGNwdV9mYW1pbHkpCisJaWYgKGNwdV9mYW1pbHkgPT0gQ1BVX0hXX1BTVEFURSkKIAkJZHBy
aW50aygiY3B1X2luaXQgZG9uZSwgY3VycmVudCBmaWQgMHgleCwgZGlkIDB4JXhcbiIsCiAJCQlk
YXRhLT5jdXJyZmlkLCBkYXRhLT5jdXJyZGlkKTsKIAllbHNlCg==

------_=_NextPart_001_01C68B10.7366EAF1
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C68B10.7366EAF1--


