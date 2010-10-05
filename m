From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 5/5] cpupowerutils: Introduce -b/-t --boost/--turbo cpufreq-info param
Date: Tue,  5 Oct 2010 14:23:14 +0200
Message-ID: <1286281394-14699-6-git-send-email-trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1286281394-14699-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: Borislav Petkov <borislav.petkov@amd.com>, Len Brown <len.brown@intel.com>

Prints out this by default (also works with --cpu X param):
  Analyzing Boost Capabilities on CPU 0:
  Supported: yes
  Active: yes

With activation one has to be careful...
On AMD, it's enough if any of the CPUs shows "Active: no" and boost mod=
e
is not active (cmp with powernow-k8 kernel code).

Not exactly sure how this works on Intel,
Intel=C2=AE 64 and IA-32 Architectures Software Developer=E2=80=99s Man=
ual
Volume 3A, System Programming Guide, Part 1
14.3.2.2 OS Control of Opportunistic Processor Performance Operation
says:
------
The DISENAGE bit in IA32_PERF_CTL (..) is not shared between logical
processors in a physical package.
------
So it sounds as if boost mode can get disabled on every processor
socket, or even more fine grained?

Possible further enhancements:
   cpufreq-set --turbo_active (or similar)
to enable/disable turbo/boost mode.

=46or AMD there already is:
/sys/devices/system/cpu/cpu0/cpufreq/cpb
but this could all get handled in userspace and this recently introduce=
d
interface could get removed again.
Then enabling/disabling could all be done on CPU 0 which cannot be take=
n
offline.
  -> To be discussed.

=46or Intel, some input about which other cores are affected by disabli=
ng
boost mode on a specific core is needed.
  -> To be discussed.

Potentially dangerous is if cores get offlined while boost mode got dis=
bled,
then the userspace tool would not be able to enable it again.
But as this stuff is meant for debugging and performance measuring only=
,
it should be enough to document this a bit in a manpage...


Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
CC: Borislav Petkov <borislav.petkov@amd.com>
CC: Len Brown <len.brown@intel.com>
---
 lib/cpufreq.c        |   37 +++++++++++++++++++++++++++++++++++++
 lib/cpufreq.h        |    8 ++++++++
 lib/msr.c            |   37 +++++++++++++++++++++++++++++++++++++
 lib/msr.h            |    5 +++++
 utils/cpufreq-info.c |   29 ++++++++++++++++++++++++++++-
 5 files changed, 115 insertions(+), 1 deletions(-)

diff --git a/lib/cpufreq.c b/lib/cpufreq.c
index ae7d8c5..0b5fe9f 100644
--- a/lib/cpufreq.c
+++ b/lib/cpufreq.c
@@ -12,6 +12,8 @@
=20
 #include "cpufreq.h"
 #include "sysfs.h"
+#include "cpuid.h"
+#include "msr.h"
=20
 int cpufreq_cpu_exists(unsigned int cpu)
 {
@@ -188,3 +190,38 @@ unsigned long cpufreq_get_transitions(unsigned int=
 cpu) {
=20
 	return (ret);
 }
+
+int cpufreq_has_boost_support(unsigned int cpu, int *support, int *act=
ive)
+{
+	struct cpupower_cpu_info cpu_info;
+	int ret;
+
+	*support =3D *active =3D 0;
+
+	ret =3D get_cpu_info(0, &cpu_info);
+	if (ret)
+		return ret;
+
+	if (cpu_info.vendor =3D=3D X86_VENDOR_INTEL) {
+		ret =3D msr_intel_has_boost_support(cpu);
+		if (ret <=3D 0)
+			return ret;
+		*support =3D ret;
+		ret =3D msr_intel_boost_is_active(cpu);
+		if (ret <=3D 0)
+			return ret;
+		*active =3D ret;
+	} else if (cpu_info.vendor =3D=3D X86_VENDOR_AMD) {
+		if (cpu_info.ext_cpuid_level < 0x80000007)
+			return 0;
+		if ((cpuid_edx(0x80000007) >> 9) & 0x1)
+			*support =3D 1;
+		else
+			return 0;
+		ret =3D msr_amd_boost_is_active(cpu);
+		if (ret <=3D 0)
+			return ret;
+		*active =3D ret;
+	}
+	return 0;
+}
diff --git a/lib/cpufreq.h b/lib/cpufreq.h
index 03be906..506b6fc 100644
--- a/lib/cpufreq.h
+++ b/lib/cpufreq.h
@@ -208,6 +208,14 @@ extern int cpufreq_modify_policy_governor(unsigned=
 int cpu, char *governor);
=20
 extern int cpufreq_set_frequency(unsigned int cpu, unsigned long targe=
t_frequency);
=20
+/* get boost mode support/activation
+ *
+ * Check whether Intel's "Turbo Boost Technology" or AMD's
+ * "Dynamic Speed Boost Technology" is supported and if, whether it's =
activated
+ */
+extern int cpufreq_has_boost_support(unsigned int cpu, int *support, i=
nt *active);
+
+
 #ifdef __cplusplus
 }
 #endif
diff --git a/lib/msr.c b/lib/msr.c
index bccea8d..9921ff1 100644
--- a/lib/msr.c
+++ b/lib/msr.c
@@ -18,6 +18,8 @@
 #include <sys/stat.h>
 #include <sys/types.h>
=20
+#define MSR_IA32_MISC_ENABLES	0x1a0
+
=20
 /* General X86 MSRs */
 #define MSR_IA32_APERF		0x000000E8
@@ -25,9 +27,11 @@
=20
 /* AMD specific MSRs */
 #define MSR_FIDVID_STATUS	0xc0010042
+#define MSR_K7_HWCR		0xc0010015
=20
 /* Intel specific MSRs */
 #define MSR_IA32_PERF_STATUS	0x198
+#define MSR_IA32_MISC_ENABLES	0x1a0
=20
 /* AMD specific bits */
 #define AMD_S_HI_CURRENT_VID	0x0000001f
@@ -123,8 +127,41 @@ int msr_amd_get_fidvid(unsigned int cpu, uint32_t =
*fid, uint32_t *vid)
 	return 0;
 }
=20
+int msr_amd_boost_is_active(unsigned int cpu)
+{
+	uint64_t k7_hwcr;
+	int ret;
+
+	ret =3D read_msr(cpu, MSR_K7_HWCR, &k7_hwcr);
+	if (ret)
+		return ret;
+	return !((k7_hwcr >> 25) & 0x1);
+}
+
 /* Intel X86 MSRs **********************************/
 int msr_intel_get_perf_status(unsigned int cpu, uint64_t perf_status)
 {
        return read_msr(cpu, MSR_IA32_PERF_STATUS, &perf_status);
 }
+
+int msr_intel_has_boost_support(unsigned int cpu)
+{
+	uint64_t misc_enables;
+	int ret;
+
+	ret =3D read_msr(cpu, MSR_IA32_MISC_ENABLES, &misc_enables);
+	if (ret)
+		return ret;
+	return (misc_enables >> 38) & 0x1;
+}
+
+int msr_intel_boost_is_active(unsigned int cpu)
+{
+	uint64_t perf_status;
+	int ret;
+
+	ret =3D read_msr(cpu, MSR_IA32_PERF_STATUS, &perf_status);
+	if (ret)
+		return ret;
+	return (perf_status >> 32) & 0x1;
+}
diff --git a/lib/msr.h b/lib/msr.h
index 8b1755e..6b743ce 100644
--- a/lib/msr.h
+++ b/lib/msr.h
@@ -3,3 +3,8 @@ extern int msr_get_aperf(unsigned int cpu, uint64_t *ap=
erf);
=20
 extern int msr_amd_get_fidvid(unsigned int cpu, uint32_t *fid, uint32_=
t *vid);
 extern int msr_intel_get_perf_status(unsigned int cpu, uint64_t perf_s=
tatus);
+
+extern int msr_intel_has_boost_support(unsigned int cpu);
+extern int msr_intel_boost_is_active(unsigned int cpu);
+
+extern int msr_amd_boost_is_active(unsigned int cpu);
diff --git a/utils/cpufreq-info.c b/utils/cpufreq-info.c
index 38d906a..be0c9e3 100644
--- a/utils/cpufreq-info.c
+++ b/utils/cpufreq-info.c
@@ -16,6 +16,7 @@
 #include <getopt.h>
=20
 #include "cpufreq.h"
+#include "cpuid.h"
=20
=20
 #define _(String) gettext (String)
@@ -286,6 +287,24 @@ static void debug_output(unsigned int cpu, unsigne=
d int all) {
 		debug_output_one(cpu);
 }
=20
+/* --boost / -b */
+
+static int get_boost_mode(unsigned int cpu) {
+	int support, active, ret;
+
+	ret =3D cpufreq_has_boost_support(cpu, &support, &active);
+	if (ret) {
+		printf(gettext ("Error while evaluating Boost Capabilities"
+				" on CPU %d:\n"), cpu);
+		return ret;
+	}
+
+      	printf(gettext ("Analyzing Boost Capabilities on CPU %d:\n"), c=
pu);
+	printf("Supported: %s\n", support ? "yes" : "no");
+	printf("Active: %s\n", active ? "yes" : "no");
+
+	return 0;
+}
=20
 /* --freq / -f */
=20
@@ -473,6 +492,8 @@ static void print_help(void) {
 static struct option info_opts[] =3D {
 	{ .name=3D"cpu",		.has_arg=3Drequired_argument,	.flag=3DNULL,	.val=3D=
'c'},
 	{ .name=3D"debug",	.has_arg=3Dno_argument,		.flag=3DNULL,	.val=3D'e'}=
,
+	{ .name=3D"turbo",	.has_arg=3Dno_argument,		.flag=3DNULL,	.val=3D't'}=
,
+	{ .name=3D"boost",	.has_arg=3Dno_argument,		.flag=3DNULL,	.val=3D'b'}=
,
 	{ .name=3D"freq",		.has_arg=3Dno_argument,		.flag=3DNULL,	.val=3D'f'}=
,
 	{ .name=3D"hwfreq",	.has_arg=3Dno_argument,		.flag=3DNULL,	.val=3D'w'=
},
 	{ .name=3D"hwlimits",	.has_arg=3Dno_argument,		.flag=3DNULL,	.val=3D'=
l'},
@@ -501,7 +522,7 @@ int main(int argc, char **argv) {
 	textdomain (PACKAGE);
=20
 	do {
-		ret =3D getopt_long(argc, argv, "c:hoefwldpgrasmy", info_opts, NULL)=
;
+		ret =3D getopt_long(argc, argv, "c:hoefwldpgrasmytb", info_opts, NUL=
L);
 		switch (ret) {
 		case '?':
 			output_param =3D '?';
@@ -514,6 +535,8 @@ int main(int argc, char **argv) {
 		case -1:
 			cont =3D 0;
 			break;
+		case 't':
+		case 'b':
 		case 'o':
 		case 'a':
 		case 'r':
@@ -587,6 +610,10 @@ int main(int argc, char **argv) {
 		print_header();
 		print_help();
 		break;
+	case 't':
+	case 'b':
+		get_boost_mode(cpu);
+		break;
 	case 'o':
 		proc_cpufreq_output();
 		break;
--=20
1.6.4.2

