From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: Adding SMP capability to MSR based Enhanced Speedstep
Date: Fri, 25 Jun 2004 16:31:10 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB600235523B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C45B0C.7F3BBC08"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: jeremy@goop.org, Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C45B0C.7F3BBC08
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


At present, MSR based Enhanced Speedstep Technology (EST) is handled by
speedstep-centrino.c. The attached patch adds more features to
speedstep-centrino, making it more generic. With these changes, it can
run on SMP systems which supports EST, based on the information provided
by ACPI. The non-ACPI (static table based) driver will still be UP only.

Comments/Feedback welcome.

Thanks,
Venki

---
linux-2.6.7-dbs/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c.org
2004-06-09 19:41:12.717485464 -0700
+++ linux-2.6.7-dbs/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
2004-06-10 19:29:23.848453448 -0700
@@ -79,6 +79,7 @@ static int centrino_verify_cpu_id(struct
=20
 /* Operating points for current CPU */
 static struct cpu_model *centrino_model;
+static int		centrino_cpu;
=20
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
=20
@@ -264,25 +265,50 @@ static int centrino_verify_cpu_id(struct
 	return -ENODEV;
 }
=20
-/* Extract clock in kHz from PERF_CTL value */
+/* To be called only after centrino_model is initialized */
 static unsigned extract_clock(unsigned msr)
 {
-	msr =3D (msr >> 8) & 0xff;
-	return msr * 100000;
+	int i;
+
+	/*=20
+	 * Extract clock in kHz from PERF_CTL value
+	 * for centrino, as some DSDTs are buggy.
+	 * Ideally, this can be done using the acpi_data structure.
+	 */
+	if (centrino_cpu) {
+		msr =3D (msr >> 8) & 0xff;
+		return msr * 100000;
+	}
+
+	if ((!centrino_model) || (!centrino_model->op_points))
+		return 0;
+=20
+	msr &=3D 0xffff;
+	for (i =3D 0;=20
+	     centrino_model->op_points[i].frequency !=3D
CPUFREQ_TABLE_END;=20
+	     i++) {
+		if (msr =3D=3D centrino_model->op_points[i].index)
+			return centrino_model->op_points[i].frequency;
+	}
+	return 0;
 }
=20
 /* Return the current CPU frequency in kHz */
 static unsigned int get_cur_freq(unsigned int cpu)
 {
 	unsigned l, h;
-	if (cpu)
+	cpumask_t saved_mask;
+
+	saved_mask =3D current->cpus_allowed;
+	set_cpus_allowed(current, cpumask_of_cpu(cpu));
+	if (smp_processor_id() !=3D cpu)
 		return 0;
=20
 	rdmsr(MSR_IA32_PERF_STATUS, l, h);
+	set_cpus_allowed(current, saved_mask);
 	return extract_clock(l);
 }
=20
-
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
=20
 static struct acpi_processor_performance p;
@@ -290,8 +316,6 @@ static struct acpi_processor_performance
 #include <linux/acpi.h>
 #include <acpi/processor.h>
=20
-#define ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP 0x1
-
 /*
  * centrino_cpu_init_acpi - register with ACPI P-States library=20
  *
@@ -312,12 +336,12 @@ static int centrino_cpu_init_acpi(struct
         arg0.buffer.pointer =3D (u8 *) arg0_buf;
         arg0_buf[0] =3D ACPI_PDC_REVISION_ID;
         arg0_buf[1] =3D 1;
-        arg0_buf[2] =3D ACPI_PDC_CAPABILITY_ENHANCED_SPEEDSTEP;
+        arg0_buf[2] =3D ACPI_PDC_EST_CAPABILITY_SMP |
ACPI_PDC_EST_CAPABILITY_MSR;
=20
 	p.pdc =3D &arg_list;
=20
 	/* register with ACPI core */
-        if (acpi_processor_register_performance(&p, 0))
+        if (acpi_processor_register_performance(&p, policy->cpu))
                 return -EIO;
=20
 	/* verify the acpi_data */
@@ -346,13 +370,6 @@ static int centrino_cpu_init_acpi(struct
 			result =3D -EINVAL;
 			goto err_unreg;
 		}
-
-		if (extract_clock(p.states[i].control) !=3D=20
-		    (p.states[i].core_frequency * 1000)) {
-			printk(KERN_DEBUG "Invalid encoded
frequency\n");
-			result =3D -EINVAL;
-			goto err_unreg;
-		}
 	}
=20
 	centrino_model =3D kmalloc(sizeof(struct cpu_model), GFP_KERNEL);
@@ -371,22 +388,35 @@ static int centrino_cpu_init_acpi(struct
                 goto err_kfree;
         }
=20
-	cur_freq =3D get_cur_freq(0);
-
         for (i=3D0; i<p.state_count; i++) {
 		centrino_model->op_points[i].index =3D
p.states[i].control;
 		centrino_model->op_points[i].frequency =3D
p.states[i].core_frequency * 1000;
+	}
+	centrino_model->op_points[p.state_count].frequency =3D
CPUFREQ_TABLE_END;
+
+
+	cur_freq =3D get_cur_freq(policy->cpu);
+
+	for (i=3D0; i<p.state_count; i++) {
+		if (extract_clock(centrino_model->op_points[i].index) !=3D
+		    (centrino_model->op_points[i].frequency)) {
+			printk(KERN_DEBUG "Invalid encoded
frequency\n");
+			result =3D -EINVAL;
+			goto err_kfree_all;
+		}
+
 		if (cur_freq =3D=3D centrino_model->op_points[i].frequency)
 			p.state =3D i;
 	}
-	centrino_model->op_points[p.state_count].frequency =3D
CPUFREQ_TABLE_END;
=20
 	return 0;
=20
+ err_kfree_all:
+	kfree(centrino_model->op_points);
  err_kfree:
 	kfree(centrino_model);
  err_unreg:
-	acpi_processor_unregister_performance(&p, 0);
+	acpi_processor_unregister_performance(&p, policy->cpu);
 	return (result);
 }
 #else
@@ -400,21 +430,24 @@ static int centrino_cpu_init(struct cpuf
 	unsigned l, h;
 	int ret;
=20
-	if (policy->cpu !=3D 0)
-		return -ENODEV;
-
 	if (!cpu_has(cpu, X86_FEATURE_EST))
 		return -ENODEV;
=20
-	if ((centrino_verify_cpu_id(cpu, &cpu_id_banias)) &&
-	    (centrino_verify_cpu_id(cpu, &cpu_id_dothan_a1)) &&
-		(centrino_verify_cpu_id(cpu, &cpu_id_dothan_b0))) {
-		printk(KERN_INFO PFX "found unsupported CPU with
Enhanced SpeedStep: "
-		       "send /proc/cpuinfo to " MAINTAINER "\n");
-		return -ENODEV;
-	}
+	if ((!centrino_verify_cpu_id(cpu, &cpu_id_banias)) ||
+	    (!centrino_verify_cpu_id(cpu, &cpu_id_dothan_a1)) ||
+	    (!centrino_verify_cpu_id(cpu, &cpu_id_dothan_b0)))
+		centrino_cpu =3D 1;
=20
 	if (centrino_cpu_init_acpi(policy)) {
+		if (policy->cpu !=3D 0)
+			return -ENODEV;
+
+		if (!centrino_cpu) {
+			printk(KERN_INFO PFX "found unsupported CPU with
Enhanced SpeedStep: "
+			       "send /proc/cpuinfo to " MAINTAINER
"\n");
+			return -ENODEV;
+		}
+
 		if (centrino_cpu_init_table(policy)) {
 			return -ENODEV;
 		}
@@ -436,7 +469,7 @@ static int centrino_cpu_init(struct cpuf
 		}
 	}
=20
-	freq =3D get_cur_freq(0);
+	freq =3D get_cur_freq(policy->cpu);
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
 	policy->cpuinfo.transition_latency =3D 10000; /* 10uS transition
latency */
@@ -463,7 +496,7 @@ static int centrino_cpu_exit(struct cpuf
=20
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI
 	if (!centrino_model->model_name) {
-		acpi_processor_unregister_performance(&p, 0);
+		acpi_processor_unregister_performance(&p, policy->cpu);
 		kfree(centrino_model->op_points);
 		kfree(centrino_model);
 	}
@@ -501,19 +534,35 @@ static int centrino_target (struct cpufr
 	unsigned int    newstate =3D 0;
 	unsigned int	msr, oldmsr, h;
 	struct cpufreq_freqs	freqs;
+	cpumask_t		saved_mask;
+	int			retval;
=20
 	if (centrino_model =3D=3D NULL)
 		return -ENODEV;
=20
+	/*
+	 * Support for SMP systems.
+	 * Make sure we are running on the CPU that wants to change
frequency
+	 */
+	saved_mask =3D current->cpus_allowed;
+	set_cpus_allowed(current, cpumask_of_cpu(policy->cpu));
+	if (smp_processor_id() !=3D policy->cpu) {
+		return(-EAGAIN);
+	}
+
 	if (cpufreq_frequency_table_target(policy,
centrino_model->op_points, target_freq,
-					   relation, &newstate))
-		return -EINVAL;
+					   relation, &newstate)) {
+		retval =3D -EINVAL;
+		goto migrate_end;
+	}
=20
 	msr =3D centrino_model->op_points[newstate].index;
 	rdmsr(MSR_IA32_PERF_CTL, oldmsr, h);
=20
-	if (msr =3D=3D (oldmsr & 0xffff))
-		return 0;
+	if (msr =3D=3D (oldmsr & 0xffff)) {
+		retval =3D 0;
+		goto migrate_end;
+	}
=20
 	/* Hm, old frequency can either be the last value we put in
 	   PERF_CTL, or whatever it is now. The trouble is that TM2
@@ -527,7 +576,7 @@ static int centrino_target (struct cpufr
 	   TODO: work out how the TCC interrupts work, and try to
 	   catch the CPU changing things under us.
 	*/
-	freqs.cpu =3D 0;
+	freqs.cpu =3D policy->cpu;
 	freqs.old =3D extract_clock(oldmsr);
 	freqs.new =3D extract_clock(msr);
 =09
@@ -546,7 +595,10 @@ static int centrino_target (struct cpufr
=20
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
=20
-	return 0;
+	retval =3D 0;
+migrate_end:
+	set_cpus_allowed(current, saved_mask);
+	return (retval);
 }
=20
 static struct freq_attr* centrino_attr[] =3D {


------_=_NextPart_001_01C45B0C.7F3BBC08
Content-Type: application/octet-stream;
	name="msr_centrino_4.patch"
Content-Transfer-Encoding: base64
Content-Description: msr_centrino_4.patch
Content-Disposition: attachment;
	filename="msr_centrino_4.patch"

LS0tIGxpbnV4LTIuNi43LWRicy9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3NwZWVkc3Rl
cC1jZW50cmluby5jLm9yZwkyMDA0LTA2LTA5IDE5OjQxOjEyLjcxNzQ4NTQ2NCAtMDcwMAorKysg
bGludXgtMi42LjctZGJzL2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvc3BlZWRzdGVwLWNl
bnRyaW5vLmMJMjAwNC0wNi0xMCAxOToyOToyMy44NDg0NTM0NDggLTA3MDAKQEAgLTc5LDYgKzc5
LDcgQEAgc3RhdGljIGludCBjZW50cmlub192ZXJpZnlfY3B1X2lkKHN0cnVjdAogCiAvKiBPcGVy
YXRpbmcgcG9pbnRzIGZvciBjdXJyZW50IENQVSAqLwogc3RhdGljIHN0cnVjdCBjcHVfbW9kZWwg
KmNlbnRyaW5vX21vZGVsOworc3RhdGljIGludAkJY2VudHJpbm9fY3B1OwogCiAjaWZkZWYgQ09O
RklHX1g4Nl9TUEVFRFNURVBfQ0VOVFJJTk9fVEFCTEUKIApAQCAtMjY0LDI1ICsyNjUsNTAgQEAg
c3RhdGljIGludCBjZW50cmlub192ZXJpZnlfY3B1X2lkKHN0cnVjdAogCXJldHVybiAtRU5PREVW
OwogfQogCi0vKiBFeHRyYWN0IGNsb2NrIGluIGtIeiBmcm9tIFBFUkZfQ1RMIHZhbHVlICovCisv
KiBUbyBiZSBjYWxsZWQgb25seSBhZnRlciBjZW50cmlub19tb2RlbCBpcyBpbml0aWFsaXplZCAq
Lwogc3RhdGljIHVuc2lnbmVkIGV4dHJhY3RfY2xvY2sodW5zaWduZWQgbXNyKQogewotCW1zciA9
IChtc3IgPj4gOCkgJiAweGZmOwotCXJldHVybiBtc3IgKiAxMDAwMDA7CisJaW50IGk7CisKKwkv
KiAKKwkgKiBFeHRyYWN0IGNsb2NrIGluIGtIeiBmcm9tIFBFUkZfQ1RMIHZhbHVlCisJICogZm9y
IGNlbnRyaW5vLCBhcyBzb21lIERTRFRzIGFyZSBidWdneS4KKwkgKiBJZGVhbGx5LCB0aGlzIGNh
biBiZSBkb25lIHVzaW5nIHRoZSBhY3BpX2RhdGEgc3RydWN0dXJlLgorCSAqLworCWlmIChjZW50
cmlub19jcHUpIHsKKwkJbXNyID0gKG1zciA+PiA4KSAmIDB4ZmY7CisJCXJldHVybiBtc3IgKiAx
MDAwMDA7CisJfQorCisJaWYgKCghY2VudHJpbm9fbW9kZWwpIHx8ICghY2VudHJpbm9fbW9kZWwt
Pm9wX3BvaW50cykpCisJCXJldHVybiAwOworIAorCW1zciAmPSAweGZmZmY7CisJZm9yIChpID0g
MDsgCisJICAgICBjZW50cmlub19tb2RlbC0+b3BfcG9pbnRzW2ldLmZyZXF1ZW5jeSAhPSBDUFVG
UkVRX1RBQkxFX0VORDsgCisJICAgICBpKyspIHsKKwkJaWYgKG1zciA9PSBjZW50cmlub19tb2Rl
bC0+b3BfcG9pbnRzW2ldLmluZGV4KQorCQkJcmV0dXJuIGNlbnRyaW5vX21vZGVsLT5vcF9wb2lu
dHNbaV0uZnJlcXVlbmN5OworCX0KKwlyZXR1cm4gMDsKIH0KIAogLyogUmV0dXJuIHRoZSBjdXJy
ZW50IENQVSBmcmVxdWVuY3kgaW4ga0h6ICovCiBzdGF0aWMgdW5zaWduZWQgaW50IGdldF9jdXJf
ZnJlcSh1bnNpZ25lZCBpbnQgY3B1KQogewogCXVuc2lnbmVkIGwsIGg7Ci0JaWYgKGNwdSkKKwlj
cHVtYXNrX3Qgc2F2ZWRfbWFzazsKKworCXNhdmVkX21hc2sgPSBjdXJyZW50LT5jcHVzX2FsbG93
ZWQ7CisJc2V0X2NwdXNfYWxsb3dlZChjdXJyZW50LCBjcHVtYXNrX29mX2NwdShjcHUpKTsKKwlp
ZiAoc21wX3Byb2Nlc3Nvcl9pZCgpICE9IGNwdSkKIAkJcmV0dXJuIDA7CiAKIAlyZG1zcihNU1Jf
SUEzMl9QRVJGX1NUQVRVUywgbCwgaCk7CisJc2V0X2NwdXNfYWxsb3dlZChjdXJyZW50LCBzYXZl
ZF9tYXNrKTsKIAlyZXR1cm4gZXh0cmFjdF9jbG9jayhsKTsKIH0KIAotCiAjaWZkZWYgQ09ORklH
X1g4Nl9TUEVFRFNURVBfQ0VOVFJJTk9fQUNQSQogCiBzdGF0aWMgc3RydWN0IGFjcGlfcHJvY2Vz
c29yX3BlcmZvcm1hbmNlIHA7CkBAIC0yOTAsOCArMzE2LDYgQEAgc3RhdGljIHN0cnVjdCBhY3Bp
X3Byb2Nlc3Nvcl9wZXJmb3JtYW5jZQogI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4KICNpbmNsdWRl
IDxhY3BpL3Byb2Nlc3Nvci5oPgogCi0jZGVmaW5lIEFDUElfUERDX0NBUEFCSUxJVFlfRU5IQU5D
RURfU1BFRURTVEVQIDB4MQotCiAvKgogICogY2VudHJpbm9fY3B1X2luaXRfYWNwaSAtIHJlZ2lz
dGVyIHdpdGggQUNQSSBQLVN0YXRlcyBsaWJyYXJ5IAogICoKQEAgLTMxMiwxMiArMzM2LDEyIEBA
IHN0YXRpYyBpbnQgY2VudHJpbm9fY3B1X2luaXRfYWNwaShzdHJ1Y3QKICAgICAgICAgYXJnMC5i
dWZmZXIucG9pbnRlciA9ICh1OCAqKSBhcmcwX2J1ZjsKICAgICAgICAgYXJnMF9idWZbMF0gPSBB
Q1BJX1BEQ19SRVZJU0lPTl9JRDsKICAgICAgICAgYXJnMF9idWZbMV0gPSAxOwotICAgICAgICBh
cmcwX2J1ZlsyXSA9IEFDUElfUERDX0NBUEFCSUxJVFlfRU5IQU5DRURfU1BFRURTVEVQOworICAg
ICAgICBhcmcwX2J1ZlsyXSA9IEFDUElfUERDX0VTVF9DQVBBQklMSVRZX1NNUCB8IEFDUElfUERD
X0VTVF9DQVBBQklMSVRZX01TUjsKIAogCXAucGRjID0gJmFyZ19saXN0OwogCiAJLyogcmVnaXN0
ZXIgd2l0aCBBQ1BJIGNvcmUgKi8KLSAgICAgICAgaWYgKGFjcGlfcHJvY2Vzc29yX3JlZ2lzdGVy
X3BlcmZvcm1hbmNlKCZwLCAwKSkKKyAgICAgICAgaWYgKGFjcGlfcHJvY2Vzc29yX3JlZ2lzdGVy
X3BlcmZvcm1hbmNlKCZwLCBwb2xpY3ktPmNwdSkpCiAgICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU87CiAKIAkvKiB2ZXJpZnkgdGhlIGFjcGlfZGF0YSAqLwpAQCAtMzQ2LDEzICszNzAsNiBAQCBz
dGF0aWMgaW50IGNlbnRyaW5vX2NwdV9pbml0X2FjcGkoc3RydWN0CiAJCQlyZXN1bHQgPSAtRUlO
VkFMOwogCQkJZ290byBlcnJfdW5yZWc7CiAJCX0KLQotCQlpZiAoZXh0cmFjdF9jbG9jayhwLnN0
YXRlc1tpXS5jb250cm9sKSAhPSAKLQkJICAgIChwLnN0YXRlc1tpXS5jb3JlX2ZyZXF1ZW5jeSAq
IDEwMDApKSB7Ci0JCQlwcmludGsoS0VSTl9ERUJVRyAiSW52YWxpZCBlbmNvZGVkIGZyZXF1ZW5j
eVxuIik7Ci0JCQlyZXN1bHQgPSAtRUlOVkFMOwotCQkJZ290byBlcnJfdW5yZWc7Ci0JCX0KIAl9
CiAKIAljZW50cmlub19tb2RlbCA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBjcHVfbW9kZWwpLCBH
RlBfS0VSTkVMKTsKQEAgLTM3MSwyMiArMzg4LDM1IEBAIHN0YXRpYyBpbnQgY2VudHJpbm9fY3B1
X2luaXRfYWNwaShzdHJ1Y3QKICAgICAgICAgICAgICAgICBnb3RvIGVycl9rZnJlZTsKICAgICAg
ICAgfQogCi0JY3VyX2ZyZXEgPSBnZXRfY3VyX2ZyZXEoMCk7Ci0KICAgICAgICAgZm9yIChpPTA7
IGk8cC5zdGF0ZV9jb3VudDsgaSsrKSB7CiAJCWNlbnRyaW5vX21vZGVsLT5vcF9wb2ludHNbaV0u
aW5kZXggPSBwLnN0YXRlc1tpXS5jb250cm9sOwogCQljZW50cmlub19tb2RlbC0+b3BfcG9pbnRz
W2ldLmZyZXF1ZW5jeSA9IHAuc3RhdGVzW2ldLmNvcmVfZnJlcXVlbmN5ICogMTAwMDsKKwl9CisJ
Y2VudHJpbm9fbW9kZWwtPm9wX3BvaW50c1twLnN0YXRlX2NvdW50XS5mcmVxdWVuY3kgPSBDUFVG
UkVRX1RBQkxFX0VORDsKKworCisJY3VyX2ZyZXEgPSBnZXRfY3VyX2ZyZXEocG9saWN5LT5jcHUp
OworCisJZm9yIChpPTA7IGk8cC5zdGF0ZV9jb3VudDsgaSsrKSB7CisJCWlmIChleHRyYWN0X2Ns
b2NrKGNlbnRyaW5vX21vZGVsLT5vcF9wb2ludHNbaV0uaW5kZXgpICE9CisJCSAgICAoY2VudHJp
bm9fbW9kZWwtPm9wX3BvaW50c1tpXS5mcmVxdWVuY3kpKSB7CisJCQlwcmludGsoS0VSTl9ERUJV
RyAiSW52YWxpZCBlbmNvZGVkIGZyZXF1ZW5jeVxuIik7CisJCQlyZXN1bHQgPSAtRUlOVkFMOwor
CQkJZ290byBlcnJfa2ZyZWVfYWxsOworCQl9CisKIAkJaWYgKGN1cl9mcmVxID09IGNlbnRyaW5v
X21vZGVsLT5vcF9wb2ludHNbaV0uZnJlcXVlbmN5KQogCQkJcC5zdGF0ZSA9IGk7CiAJfQotCWNl
bnRyaW5vX21vZGVsLT5vcF9wb2ludHNbcC5zdGF0ZV9jb3VudF0uZnJlcXVlbmN5ID0gQ1BVRlJF
UV9UQUJMRV9FTkQ7CiAKIAlyZXR1cm4gMDsKIAorIGVycl9rZnJlZV9hbGw6CisJa2ZyZWUoY2Vu
dHJpbm9fbW9kZWwtPm9wX3BvaW50cyk7CiAgZXJyX2tmcmVlOgogCWtmcmVlKGNlbnRyaW5vX21v
ZGVsKTsKICBlcnJfdW5yZWc6Ci0JYWNwaV9wcm9jZXNzb3JfdW5yZWdpc3Rlcl9wZXJmb3JtYW5j
ZSgmcCwgMCk7CisJYWNwaV9wcm9jZXNzb3JfdW5yZWdpc3Rlcl9wZXJmb3JtYW5jZSgmcCwgcG9s
aWN5LT5jcHUpOwogCXJldHVybiAocmVzdWx0KTsKIH0KICNlbHNlCkBAIC00MDAsMjEgKzQzMCwy
NCBAQCBzdGF0aWMgaW50IGNlbnRyaW5vX2NwdV9pbml0KHN0cnVjdCBjcHVmCiAJdW5zaWduZWQg
bCwgaDsKIAlpbnQgcmV0OwogCi0JaWYgKHBvbGljeS0+Y3B1ICE9IDApCi0JCXJldHVybiAtRU5P
REVWOwotCiAJaWYgKCFjcHVfaGFzKGNwdSwgWDg2X0ZFQVRVUkVfRVNUKSkKIAkJcmV0dXJuIC1F
Tk9ERVY7CiAKLQlpZiAoKGNlbnRyaW5vX3ZlcmlmeV9jcHVfaWQoY3B1LCAmY3B1X2lkX2Jhbmlh
cykpICYmCi0JICAgIChjZW50cmlub192ZXJpZnlfY3B1X2lkKGNwdSwgJmNwdV9pZF9kb3RoYW5f
YTEpKSAmJgotCQkoY2VudHJpbm9fdmVyaWZ5X2NwdV9pZChjcHUsICZjcHVfaWRfZG90aGFuX2Iw
KSkpIHsKLQkJcHJpbnRrKEtFUk5fSU5GTyBQRlggImZvdW5kIHVuc3VwcG9ydGVkIENQVSB3aXRo
IEVuaGFuY2VkIFNwZWVkU3RlcDogIgotCQkgICAgICAgInNlbmQgL3Byb2MvY3B1aW5mbyB0byAi
IE1BSU5UQUlORVIgIlxuIik7Ci0JCXJldHVybiAtRU5PREVWOwotCX0KKwlpZiAoKCFjZW50cmlu
b192ZXJpZnlfY3B1X2lkKGNwdSwgJmNwdV9pZF9iYW5pYXMpKSB8fAorCSAgICAoIWNlbnRyaW5v
X3ZlcmlmeV9jcHVfaWQoY3B1LCAmY3B1X2lkX2RvdGhhbl9hMSkpIHx8CisJICAgICghY2VudHJp
bm9fdmVyaWZ5X2NwdV9pZChjcHUsICZjcHVfaWRfZG90aGFuX2IwKSkpCisJCWNlbnRyaW5vX2Nw
dSA9IDE7CiAKIAlpZiAoY2VudHJpbm9fY3B1X2luaXRfYWNwaShwb2xpY3kpKSB7CisJCWlmIChw
b2xpY3ktPmNwdSAhPSAwKQorCQkJcmV0dXJuIC1FTk9ERVY7CisKKwkJaWYgKCFjZW50cmlub19j
cHUpIHsKKwkJCXByaW50ayhLRVJOX0lORk8gUEZYICJmb3VuZCB1bnN1cHBvcnRlZCBDUFUgd2l0
aCBFbmhhbmNlZCBTcGVlZFN0ZXA6ICIKKwkJCSAgICAgICAic2VuZCAvcHJvYy9jcHVpbmZvIHRv
ICIgTUFJTlRBSU5FUiAiXG4iKTsKKwkJCXJldHVybiAtRU5PREVWOworCQl9CisKIAkJaWYgKGNl
bnRyaW5vX2NwdV9pbml0X3RhYmxlKHBvbGljeSkpIHsKIAkJCXJldHVybiAtRU5PREVWOwogCQl9
CkBAIC00MzYsNyArNDY5LDcgQEAgc3RhdGljIGludCBjZW50cmlub19jcHVfaW5pdChzdHJ1Y3Qg
Y3B1ZgogCQl9CiAJfQogCi0JZnJlcSA9IGdldF9jdXJfZnJlcSgwKTsKKwlmcmVxID0gZ2V0X2N1
cl9mcmVxKHBvbGljeS0+Y3B1KTsKIAogCXBvbGljeS0+Z292ZXJub3IgPSBDUFVGUkVRX0RFRkFV
TFRfR09WRVJOT1I7CiAJcG9saWN5LT5jcHVpbmZvLnRyYW5zaXRpb25fbGF0ZW5jeSA9IDEwMDAw
OyAvKiAxMHVTIHRyYW5zaXRpb24gbGF0ZW5jeSAqLwpAQCAtNDYzLDcgKzQ5Niw3IEBAIHN0YXRp
YyBpbnQgY2VudHJpbm9fY3B1X2V4aXQoc3RydWN0IGNwdWYKIAogI2lmZGVmIENPTkZJR19YODZf
U1BFRURTVEVQX0NFTlRSSU5PX0FDUEkKIAlpZiAoIWNlbnRyaW5vX21vZGVsLT5tb2RlbF9uYW1l
KSB7Ci0JCWFjcGlfcHJvY2Vzc29yX3VucmVnaXN0ZXJfcGVyZm9ybWFuY2UoJnAsIDApOworCQlh
Y3BpX3Byb2Nlc3Nvcl91bnJlZ2lzdGVyX3BlcmZvcm1hbmNlKCZwLCBwb2xpY3ktPmNwdSk7CiAJ
CWtmcmVlKGNlbnRyaW5vX21vZGVsLT5vcF9wb2ludHMpOwogCQlrZnJlZShjZW50cmlub19tb2Rl
bCk7CiAJfQpAQCAtNTAxLDE5ICs1MzQsMzUgQEAgc3RhdGljIGludCBjZW50cmlub190YXJnZXQg
KHN0cnVjdCBjcHVmcgogCXVuc2lnbmVkIGludCAgICBuZXdzdGF0ZSA9IDA7CiAJdW5zaWduZWQg
aW50CW1zciwgb2xkbXNyLCBoOwogCXN0cnVjdCBjcHVmcmVxX2ZyZXFzCWZyZXFzOworCWNwdW1h
c2tfdAkJc2F2ZWRfbWFzazsKKwlpbnQJCQlyZXR2YWw7CiAKIAlpZiAoY2VudHJpbm9fbW9kZWwg
PT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKKwkvKgorCSAqIFN1cHBvcnQgZm9yIFNNUCBz
eXN0ZW1zLgorCSAqIE1ha2Ugc3VyZSB3ZSBhcmUgcnVubmluZyBvbiB0aGUgQ1BVIHRoYXQgd2Fu
dHMgdG8gY2hhbmdlIGZyZXF1ZW5jeQorCSAqLworCXNhdmVkX21hc2sgPSBjdXJyZW50LT5jcHVz
X2FsbG93ZWQ7CisJc2V0X2NwdXNfYWxsb3dlZChjdXJyZW50LCBjcHVtYXNrX29mX2NwdShwb2xp
Y3ktPmNwdSkpOworCWlmIChzbXBfcHJvY2Vzc29yX2lkKCkgIT0gcG9saWN5LT5jcHUpIHsKKwkJ
cmV0dXJuKC1FQUdBSU4pOworCX0KKwogCWlmIChjcHVmcmVxX2ZyZXF1ZW5jeV90YWJsZV90YXJn
ZXQocG9saWN5LCBjZW50cmlub19tb2RlbC0+b3BfcG9pbnRzLCB0YXJnZXRfZnJlcSwKLQkJCQkJ
ICAgcmVsYXRpb24sICZuZXdzdGF0ZSkpCi0JCXJldHVybiAtRUlOVkFMOworCQkJCQkgICByZWxh
dGlvbiwgJm5ld3N0YXRlKSkgeworCQlyZXR2YWwgPSAtRUlOVkFMOworCQlnb3RvIG1pZ3JhdGVf
ZW5kOworCX0KIAogCW1zciA9IGNlbnRyaW5vX21vZGVsLT5vcF9wb2ludHNbbmV3c3RhdGVdLmlu
ZGV4OwogCXJkbXNyKE1TUl9JQTMyX1BFUkZfQ1RMLCBvbGRtc3IsIGgpOwogCi0JaWYgKG1zciA9
PSAob2xkbXNyICYgMHhmZmZmKSkKLQkJcmV0dXJuIDA7CisJaWYgKG1zciA9PSAob2xkbXNyICYg
MHhmZmZmKSkgeworCQlyZXR2YWwgPSAwOworCQlnb3RvIG1pZ3JhdGVfZW5kOworCX0KIAogCS8q
IEhtLCBvbGQgZnJlcXVlbmN5IGNhbiBlaXRoZXIgYmUgdGhlIGxhc3QgdmFsdWUgd2UgcHV0IGlu
CiAJICAgUEVSRl9DVEwsIG9yIHdoYXRldmVyIGl0IGlzIG5vdy4gVGhlIHRyb3VibGUgaXMgdGhh
dCBUTTIKQEAgLTUyNyw3ICs1NzYsNyBAQCBzdGF0aWMgaW50IGNlbnRyaW5vX3RhcmdldCAoc3Ry
dWN0IGNwdWZyCiAJICAgVE9ETzogd29yayBvdXQgaG93IHRoZSBUQ0MgaW50ZXJydXB0cyB3b3Jr
LCBhbmQgdHJ5IHRvCiAJICAgY2F0Y2ggdGhlIENQVSBjaGFuZ2luZyB0aGluZ3MgdW5kZXIgdXMu
CiAJKi8KLQlmcmVxcy5jcHUgPSAwOworCWZyZXFzLmNwdSA9IHBvbGljeS0+Y3B1OwogCWZyZXFz
Lm9sZCA9IGV4dHJhY3RfY2xvY2sob2xkbXNyKTsKIAlmcmVxcy5uZXcgPSBleHRyYWN0X2Nsb2Nr
KG1zcik7CiAJCkBAIC01NDYsNyArNTk1LDEwIEBAIHN0YXRpYyBpbnQgY2VudHJpbm9fdGFyZ2V0
IChzdHJ1Y3QgY3B1ZnIKIAogCWNwdWZyZXFfbm90aWZ5X3RyYW5zaXRpb24oJmZyZXFzLCBDUFVG
UkVRX1BPU1RDSEFOR0UpOwogCi0JcmV0dXJuIDA7CisJcmV0dmFsID0gMDsKK21pZ3JhdGVfZW5k
OgorCXNldF9jcHVzX2FsbG93ZWQoY3VycmVudCwgc2F2ZWRfbWFzayk7CisJcmV0dXJuIChyZXR2
YWwpOwogfQogCiBzdGF0aWMgc3RydWN0IGZyZXFfYXR0ciogY2VudHJpbm9fYXR0cltdID0gewo=

------_=_NextPart_001_01C45B0C.7F3BBC08
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C45B0C.7F3BBC08--

