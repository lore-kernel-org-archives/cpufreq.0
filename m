From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] cpufrequtils: Remove proc compile option and interfaces
Date: Wed,  1 Sep 2010 02:18:00 +0200
Message-ID: <1283300280-4458-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="macroman"
To: trenn@suse.de
Cc: linux@dominikbrodowski.net, cpufreq@vger.kernel.org

proc cpufreq kernel support is deprecated since the beginning of 2.6?)
If someone still likes to have support for the 2.4 cpufreq proc
interface one has to pick out an old cpufrequtils version
from now on...

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile         |   29 +-------
 lib/cpufreq.c    |   99 ++++--------------------
 lib/interfaces.h |   76 -------------------
 lib/proc.c       |  216 ----------------------------------------------=
--------
 lib/sysfs.h      |   19 +++++
 po/cs.po         |  186 ++++++++++++++++++++++++++++------------------=
-
 po/de.po         |    2 +-
 po/fr.po         |  187 ++++++++++++++++++++++++++++------------------=
-
 po/it.po         |    2 +-
 po/pt.po         |    2 +-
 10 files changed, 265 insertions(+), 553 deletions(-)
 delete mode 100644 lib/interfaces.h
 delete mode 100644 lib/proc.c
 create mode 100644 lib/sysfs.h

diff --git a/Makefile b/Makefile
index 3ef2af7..e23c644 100644
--- a/Makefile
+++ b/Makefile
@@ -37,13 +37,6 @@ NLS ?=3D		true
 # cpufreq-bench benchmarking tool
 CPUFRQ_BENCH ?=3D false
=20
-# Use the sysfs-based interface which is included in all 2.6 kernels
-# built with cpufreq support
-SYSFS ?=3D	true
-
-# Use the proc-based interface which is used in the 2.4 patch for cpuf=
req
-PROC ?=3D		true
-
 # Prefix to the directories we're installing to
 DESTDIR ?=3D=09
=20
@@ -119,24 +112,12 @@ CPPFLAGS +=3D -DVERSION=3D\"$(VERSION)\" -DPACKAG=
E=3D\"$(PACKAGE)\" \
 		-DPACKAGE_BUGREPORT=3D\"$(PACKAGE_BUGREPORT)\" -D_GNU_SOURCE
=20
 UTIL_SRC =3D 	utils/info.c utils/set.c utils/aperf.c utils/cpuid.h
-LIB_HEADERS =3D 	lib/cpufreq.h lib/interfaces.h
-LIB_SRC =3D 	lib/cpufreq.c
-LIB_OBJS =3D 	lib/cpufreq.o
+LIB_HEADERS =3D 	lib/cpufreq.h lib/sysfs.h
+LIB_SRC =3D 	lib/cpufreq.c lib/sysfs.c
+LIB_OBJS =3D 	lib/cpufreq.o lib/sysfs.o
=20
 CFLAGS +=3D	-pipe
=20
-ifeq ($(strip $(PROC)),true)
-	LIB_OBJS +=3D lib/proc.o
-	LIB_SRC +=3D lib/proc.c
-	CPPFLAGS +=3D -DINTERFACE_PROC
-endif
-
-ifeq ($(strip $(SYSFS)),true)
-	LIB_OBJS +=3D lib/sysfs.o
-	LIB_SRC +=3D lib/sysfs.c
-	CPPFLAGS +=3D -DINTERFACE_SYSFS
-endif
-
 ifeq ($(strip $(NLS)),true)
 	INSTALL_NLS +=3D install-gmo
 	COMPILE_NLS +=3D update-gmo
@@ -183,10 +164,6 @@ lib/%.o: $(LIB_SRC) $(LIB_HEADERS) build/ccdv
 	$(QUIET) $(CC) $(CPPFLAGS) $(CFLAGS) -fPIC -o $@ -c lib/$*.c
=20
 libcpufreq.so.$(LIB_MAJ): $(LIB_OBJS)
-	@if [ $(strip $(SYSFS)) !=3D true -a $(strip $(PROC)) !=3D true ]; th=
en \
-		echo '*** At least one of /sys support or /proc support MUST be enab=
led ***'; \
-		exit -1; \
-	fi;
 	$(QUIET) $(CC) -shared $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ \
 		-Wl,-soname,libcpufreq.so.$(LIB_MIN) $(LIB_OBJS)
 	@ln -sf $@ libcpufreq.so
diff --git a/lib/cpufreq.c b/lib/cpufreq.c
index 0c9f28e..603dbf8 100644
--- a/lib/cpufreq.c
+++ b/lib/cpufreq.c
@@ -11,60 +11,39 @@
 #include <string.h>
=20
 #include "cpufreq.h"
-#include "interfaces.h"
+#include "sysfs.h"
=20
 int cpufreq_cpu_exists(unsigned int cpu)
 {
-	int ret =3D sysfs_cpu_exists(cpu);
-	if (ret =3D=3D -ENOSYS)
-		ret =3D proc_cpu_exists(cpu);
-	return (ret);
+	return sysfs_cpu_exists(cpu);
 }
=20
 unsigned long cpufreq_get_freq_kernel(unsigned int cpu)
 {
-	unsigned long ret =3D sysfs_get_freq_kernel(cpu);
-	if (!ret)
-		ret =3D proc_get_freq_kernel(cpu);
-	return (ret);
+	return sysfs_get_freq_kernel(cpu);
 }
=20
 unsigned long cpufreq_get_freq_hardware(unsigned int cpu)
 {
-	unsigned long ret =3D sysfs_get_freq_hardware(cpu);
-	if (!ret)
-		ret =3D proc_get_freq_hardware(cpu);
-	return (ret);
+	return sysfs_get_freq_hardware(cpu);
 }
=20
 unsigned long cpufreq_get_transition_latency(unsigned int cpu)
 {
-	unsigned long ret =3D sysfs_get_transition_latency(cpu);
-	if (!ret)
-		ret =3D proc_get_transition_latency(cpu);
-	return (ret);
+	return sysfs_get_transition_latency(cpu);
 }
=20
 int cpufreq_get_hardware_limits(unsigned int cpu,
 				unsigned long *min,
 				unsigned long *max)
 {
-	int ret;
 	if ((!min) || (!max))
 		return -EINVAL;
-	ret =3D sysfs_get_hardware_limits(cpu, min, max);
-	if (ret)
-		ret =3D proc_get_hardware_limits(cpu, min, max);
-	return (ret);
+	return sysfs_get_hardware_limits(cpu, min, max);
 }
=20
 char * cpufreq_get_driver(unsigned int cpu) {
-	char * ret;
-	ret =3D sysfs_get_driver(cpu);
-	if (!ret) {
-		ret =3D proc_get_driver(cpu);
-	}
-	return (ret);
+	return sysfs_get_driver(cpu);
 }
=20
 void cpufreq_put_driver(char * ptr) {
@@ -74,11 +53,7 @@ void cpufreq_put_driver(char * ptr) {
 }
=20
 struct cpufreq_policy * cpufreq_get_policy(unsigned int cpu) {
-	struct cpufreq_policy * ret;
-	ret =3D sysfs_get_policy(cpu);
-	if (!ret)
-		ret =3D proc_get_policy(cpu);
-	return (ret);
+	return sysfs_get_policy(cpu);
 }
=20
 void cpufreq_put_policy(struct cpufreq_policy *policy) {
@@ -91,11 +66,7 @@ void cpufreq_put_policy(struct cpufreq_policy *polic=
y) {
 }
=20
 struct cpufreq_available_governors * cpufreq_get_available_governors(u=
nsigned int cpu) {
-	struct cpufreq_available_governors *ret;
-	ret =3D sysfs_get_available_governors(cpu);
-	if (!ret)
-		ret =3D proc_get_available_governors(cpu);
-	return (ret);
+	return sysfs_get_available_governors(cpu);
 }
=20
 void cpufreq_put_available_governors(struct cpufreq_available_governor=
s *any) {
@@ -116,11 +87,7 @@ void cpufreq_put_available_governors(struct cpufreq=
_available_governors *any) {
=20
=20
 struct cpufreq_available_frequencies * cpufreq_get_available_frequenci=
es(unsigned int cpu) {
-	struct cpufreq_available_frequencies * ret;
-	ret =3D sysfs_get_available_frequencies(cpu);
-	if (!ret)
-		ret =3D proc_get_available_frequencies(cpu);
-	return (ret);
+	return sysfs_get_available_frequencies(cpu);
 }
=20
 void cpufreq_put_available_frequencies(struct cpufreq_available_freque=
ncies *any) {
@@ -139,11 +106,7 @@ void cpufreq_put_available_frequencies(struct cpuf=
req_available_frequencies *any
=20
=20
 struct cpufreq_affected_cpus * cpufreq_get_affected_cpus(unsigned int =
cpu) {
-	struct cpufreq_affected_cpus * ret;
-	ret =3D sysfs_get_affected_cpus(cpu);
-	if (!ret)
-		ret =3D proc_get_affected_cpus(cpu);
-	return (ret);
+	return sysfs_get_affected_cpus(cpu);
 }
=20
 void cpufreq_put_affected_cpus(struct cpufreq_affected_cpus *any) {
@@ -162,11 +125,7 @@ void cpufreq_put_affected_cpus(struct cpufreq_affe=
cted_cpus *any) {
=20
=20
 struct cpufreq_affected_cpus * cpufreq_get_related_cpus(unsigned int c=
pu) {
-	struct cpufreq_affected_cpus * ret;
-	ret =3D sysfs_get_related_cpus(cpu);
-	if (!ret)
-		ret =3D proc_get_related_cpus(cpu);
-	return (ret);
+	return sysfs_get_related_cpus(cpu);
 }
=20
 void cpufreq_put_related_cpus(struct cpufreq_affected_cpus *any) {
@@ -175,56 +134,32 @@ void cpufreq_put_related_cpus(struct cpufreq_affe=
cted_cpus *any) {
=20
=20
 int cpufreq_set_policy(unsigned int cpu, struct cpufreq_policy *policy=
) {
-	int ret;
 	if (!policy || !(policy->governor))
 		return -EINVAL;
=20
-	ret =3D sysfs_set_policy(cpu, policy);
-	if (ret)
-		ret =3D proc_set_policy(cpu, policy);
-	return (ret);
+	return sysfs_set_policy(cpu, policy);
 }
=20
=20
 int cpufreq_modify_policy_min(unsigned int cpu, unsigned long min_freq=
) {
-	int ret;
-
-	ret =3D sysfs_modify_policy_min(cpu, min_freq);
-	if (ret)
-		ret =3D proc_modify_policy_min(cpu, min_freq);
-	return (ret);
+	return sysfs_modify_policy_min(cpu, min_freq);
 }
=20
=20
 int cpufreq_modify_policy_max(unsigned int cpu, unsigned long max_freq=
) {
-	int ret;
-
-	ret =3D sysfs_modify_policy_max(cpu, max_freq);
-	if (ret)
-		ret =3D proc_modify_policy_max(cpu, max_freq);
-	return (ret);
+	return sysfs_modify_policy_max(cpu, max_freq);
 }
=20
=20
 int cpufreq_modify_policy_governor(unsigned int cpu, char *governor) {
-	int ret;
-
 	if ((!governor) || (strlen(governor) > 19))
 		return -EINVAL;
=20
-	ret =3D sysfs_modify_policy_governor(cpu, governor);
-	if (ret)
-		ret =3D proc_modify_policy_governor(cpu, governor);
-	return (ret);
+	return sysfs_modify_policy_governor(cpu, governor);
 }
=20
 int cpufreq_set_frequency(unsigned int cpu, unsigned long target_frequ=
ency) {
-	int ret;
-
-	ret =3D sysfs_set_frequency(cpu, target_frequency);
-	if (ret)
-		ret =3D proc_set_frequency(cpu, target_frequency);
-	return (ret);
+	return sysfs_set_frequency(cpu, target_frequency);
 }
=20
 struct cpufreq_stats * cpufreq_get_stats(unsigned int cpu, unsigned lo=
ng long *total_time) {
diff --git a/lib/interfaces.h b/lib/interfaces.h
deleted file mode 100644
index 67ee131..0000000
--- a/lib/interfaces.h
+++ /dev/null
@@ -1,76 +0,0 @@
-#ifdef INTERFACE_SYSFS
-
-extern unsigned int sysfs_cpu_exists(unsigned int cpu);
-extern unsigned long sysfs_get_freq_kernel(unsigned int cpu);
-extern unsigned long sysfs_get_freq_hardware(unsigned int cpu);
-extern unsigned long sysfs_get_transition_latency(unsigned int cpu);
-extern int sysfs_get_hardware_limits(unsigned int cpu, unsigned long *=
min, unsigned long *max);
-extern char * sysfs_get_driver(unsigned int cpu);
-extern struct cpufreq_policy * sysfs_get_policy(unsigned int cpu);
-extern struct cpufreq_available_governors * sysfs_get_available_govern=
ors(unsigned int cpu);
-extern struct cpufreq_available_frequencies * sysfs_get_available_freq=
uencies(unsigned int cpu);
-extern struct cpufreq_affected_cpus * sysfs_get_affected_cpus(unsigned=
 int cpu);
-extern struct cpufreq_affected_cpus * sysfs_get_related_cpus(unsigned =
int cpu);
-extern struct cpufreq_stats * sysfs_get_stats(unsigned int cpu, unsign=
ed long long *total_time);
-extern unsigned long sysfs_get_transitions(unsigned int cpu);
-extern int sysfs_set_policy(unsigned int cpu, struct cpufreq_policy *p=
olicy);
-extern int sysfs_modify_policy_min(unsigned int cpu, unsigned long min=
_freq);
-extern int sysfs_modify_policy_max(unsigned int cpu, unsigned long max=
_freq);
-extern int sysfs_modify_policy_governor(unsigned int cpu, char *govern=
or);
-extern int sysfs_set_frequency(unsigned int cpu, unsigned long target_=
frequency);
-
-#else
-
-static inline unsigned int sysfs_cpu_exists(unsigned int cpu) { return=
 -ENOSYS; }
-static inline unsigned long sysfs_get_freq_kernel(unsigned int cpu) { =
return 0; }
-static inline unsigned long sysfs_get_freq_hardware(unsigned int cpu) =
{ return 0; }
-static inline unsigned long sysfs_get_transition_latency(unsigned int =
cpu) { return 0; }
-static inline int sysfs_get_hardware_limits(unsigned int cpu, unsigned=
 long *min, unsigned long *max)  { return -ENOSYS; }
-static inline char * sysfs_get_driver(unsigned int cpu) { return NULL;=
 }
-static inline struct cpufreq_policy * sysfs_get_policy(unsigned int cp=
u) { return NULL; }
-static inline struct cpufreq_available_governors * sysfs_get_available=
_governors(unsigned int cpu) { return NULL; }
-static inline struct cpufreq_available_frequencies * sysfs_get_availab=
le_frequencies(unsigned int cpu) { return NULL; }
-static inline struct cpufreq_affected_cpus * sysfs_get_affected_cpus(u=
nsigned int cpu) { return NULL; }
-static inline struct cpufreq_related_cpus * sysfs_get_affected_cpus(un=
signed int cpu) { return NULL; }
-static inline struct cpufreq_stats * sysfs_get_stats(unsigned int cpu,=
 unsigned long long *total_time) { return NULL; }
-static inline unsigned long sysfs_get_transitions(unsigned int cpu) { =
return 0; }
-static inline int sysfs_set_policy(unsigned int cpu, struct cpufreq_po=
licy *policy) { return -ENOSYS; }
-static inline int sysfs_modify_policy_min(unsigned int cpu, unsigned l=
ong min_freq) { return -ENOSYS; }
-static inline int sysfs_modify_policy_max(unsigned int cpu, unsigned l=
ong max_freq) { return -ENOSYS; }
-static inline int sysfs_modify_policy_governor(unsigned int cpu, char =
*governor) { return -ENOSYS; }
-static inline int sysfs_set_frequency(unsigned int cpu, unsigned long =
target_frequency) { return -ENOSYS; }
-
-#endif
-
-
-#ifdef INTERFACE_PROC
-
-extern int proc_cpu_exists(unsigned int cpu);
-extern unsigned long proc_get_freq_kernel(unsigned int cpu);
-extern struct cpufreq_policy * proc_get_policy(unsigned int cpu);
-extern int proc_set_policy(unsigned int cpu, struct cpufreq_policy *po=
licy);
-extern int proc_set_frequency(unsigned int cpu, unsigned long target_f=
requency);
-#else
-
-static inline int proc_cpu_exists(unsigned int cpu) {return -ENOSYS; }
-static inline unsigned long proc_get_freq_kernel(unsigned int cpu) { r=
eturn 0; }
-static inline struct cpufreq_policy * proc_get_policy(unsigned int cpu=
) { return NULL; }
-static inline int proc_set_policy(unsigned int cpu, struct cpufreq_pol=
icy *policy) { return -ENOSYS; }
-static inline int proc_set_frequency(unsigned int cpu, unsigned long t=
arget_frequency) { return -ENOSYS; }
-
-#endif
-
-/* these aren't implemented in /proc, and probably never will...*/
-
-static inline unsigned long proc_get_freq_hardware(unsigned int cpu) {=
 return 0; }
-static inline unsigned long proc_get_transition_latency(unsigned int c=
pu) { return -ENOSYS; }
-static inline int proc_get_hardware_limits(unsigned int cpu, unsigned =
long *min, unsigned long *max)  { return -ENOSYS; }
-static inline char * proc_get_driver(unsigned int cpu) {return NULL; }
-static inline struct cpufreq_available_governors * proc_get_available_=
governors(unsigned int cpu) { return NULL; }
-static inline struct cpufreq_available_frequencies * proc_get_availabl=
e_frequencies(unsigned int cpu) { return NULL; }
-static inline struct cpufreq_affected_cpus * proc_get_affected_cpus(un=
signed int cpu) { return NULL; }
-static inline struct cpufreq_affected_cpus * proc_get_related_cpus(uns=
igned int cpu) { return NULL; }
-static inline int proc_modify_policy_min(unsigned int cpu, unsigned lo=
ng min_freq) { return -ENOSYS; }
-static inline int proc_modify_policy_max(unsigned int cpu, unsigned lo=
ng max_freq) { return -ENOSYS; }
-static inline int proc_modify_policy_governor(unsigned int cpu, char *=
governor) { return -ENOSYS; }
-
diff --git a/lib/proc.c b/lib/proc.c
deleted file mode 100644
index 38d8483..0000000
--- a/lib/proc.c
+++ /dev/null
@@ -1,216 +0,0 @@
-/*
- *  (C) 2004  Dominik Brodowski <linux@dominikbrodowski.de>
- *
- *  Licensed under the terms of the GNU GPL License version 2.
- */
-
-#include <stdio.h>
-#include <errno.h>
-#include <stdlib.h>
-#include <string.h>
-
-#include "cpufreq.h"
-
-#define MAX_LINE_LEN 255
-
-static int readout_proc_cpufreq(unsigned int cpu, unsigned long *min, =
unsigned long *max, char **governor)
-{
-	FILE *fp;
-	char value[MAX_LINE_LEN];
-	char gov_value[MAX_LINE_LEN];
-	int ret =3D -ENODEV;
-	unsigned int cpu_read;
-	unsigned int tmp1, tmp2;
-
-	if ((!min) || (!max) || (!governor))
-		return -EINVAL;
-
-	fp =3D fopen("/proc/cpufreq","r");
-	if (!fp)
-		return -ENODEV;
-
-
-	if (!fgets(value, MAX_LINE_LEN, fp)) {
-		ret =3D -EIO;
-		goto error;
-	}
-
-	if (strlen(value) > (MAX_LINE_LEN - 10)) {
-		ret =3D -EIO;
-		goto error;
-	}
-
-	while(!feof(fp)) {
-		if (!fgets(value, MAX_LINE_LEN, fp)) {
-			ret =3D -EIO;
-			goto error;
-		}
-
-		if (strlen(value) > (MAX_LINE_LEN - 10)) {
-			ret =3D -EIO;
-			goto error;
-		}
-
-		ret =3D sscanf(value, "CPU%3d    %9lu kHz (%3d %%)  -  %9lu kHz (%3d=
 %%)  -  %s",
-			     &cpu_read , min, &tmp1, max, &tmp2, gov_value);
-		if (ret !=3D 6) {
-			ret =3D -EIO;
-			goto error;
-		}
-
-		if (cpu_read !=3D cpu)
-			continue;
-
-		if ((tmp2 < tmp1) || (tmp2 > 100) || (*max < *min)) {
-			ret =3D -ENOSYS;
-			goto error;
-		}
-
-		tmp1 =3D strlen(gov_value);
-		if (tmp1 > 20) {
-			ret =3D -ENOSYS;
-			goto error;
-		}
-
-		*governor =3D malloc(sizeof(char) * (tmp1 + 2));
-		if (!*governor) {
-			ret =3D -ENOMEM;
-			goto error;
-		}
-
-		strncpy(*governor, gov_value, tmp1);
-		(*governor)[tmp1] =3D '\0';
-
-		ret =3D 0;
-
-		break;
-	}
-
- error:
-	fclose(fp);
-	return (ret);
-}
-
-int proc_cpu_exists(unsigned int cpu) {
-	unsigned long tmp1, tmp2;
-	char *tmp3;
-	int ret;
-
-	ret =3D readout_proc_cpufreq(cpu, &tmp1, &tmp2, &tmp3);
-	if (ret)
-		return -ENODEV;
-
-	free(tmp3);
-	return 0;
-}
-
-struct cpufreq_policy * proc_get_policy(unsigned int cpu) {
-	struct cpufreq_policy tmp;
-	struct cpufreq_policy *ret;
-	int err;
-
-	err =3D readout_proc_cpufreq(cpu, &tmp.min, &tmp.max, &tmp.governor);
-	if (err)
-		return NULL;
-
-	ret =3D malloc(sizeof(struct cpufreq_policy));
-	if (!ret)
-		return NULL;
-
-	ret->min =3D tmp.min;
-	ret->max =3D tmp.max;
-	ret->governor =3D tmp.governor;
-
-	return (ret);
-}
-
-unsigned long proc_get_freq_kernel(unsigned int cpu) {
-	FILE *fp;
-	char value[MAX_LINE_LEN];
-	char file[MAX_LINE_LEN];
-	unsigned long value2;
-
-	snprintf(file, MAX_LINE_LEN, "/proc/sys/cpu/%u/speed", cpu);
-
-	fp =3D fopen(file,"r");
-	if (!fp)
-		return 0;
-
-	if (!fgets(value, MAX_LINE_LEN, fp)) {
-		fclose(fp);
-		return 0;
-	}
-
-	fclose(fp);
-
-	if (strlen(value) > (MAX_LINE_LEN - 10)) {
-		return 0;
-	}
-
-	if (sscanf(value, "%lu", &value2) !=3D 1)
-		return 0;
-
-	return value2;
-}
-
-int proc_set_policy(unsigned int cpu, struct cpufreq_policy *policy) {
-	FILE *fp;
-	char value[MAX_LINE_LEN];
-	int ret =3D -ENODEV;
-
-	if ((!policy) || (!policy->governor) || (strlen(policy->governor) > 1=
5))
-		return -EINVAL;
-
-	snprintf(value, MAX_LINE_LEN, "%d:%lu:%lu:%s", cpu, policy->min, poli=
cy->max, policy->governor);
-
-	value[MAX_LINE_LEN - 1]=3D'\0';
-
-	fp =3D fopen("/proc/cpufreq","r+");
-	if (!fp)
-		return -ENODEV;
-	ret =3D fputs(value, fp);
-	fclose(fp);
-
-	if (ret < 0)
-		return (ret);
-
-	return 0;
-}
-
-int proc_set_frequency(unsigned int cpu, unsigned long target_frequenc=
y) {
-	struct cpufreq_policy *pol =3D proc_get_policy(cpu);
-	struct cpufreq_policy new_pol;
-	char userspace_gov[] =3D "userspace";
-	FILE *fp;
-	char value[MAX_LINE_LEN];
-	char file[MAX_LINE_LEN];
-	int ret =3D 0;
-
-	if (!pol)
-		return -ENODEV;
-
-	if (strncmp(pol->governor, userspace_gov, 9) !=3D 0) {
-		cpufreq_put_policy(pol);
-		new_pol.min =3D pol->min;
-		new_pol.max =3D pol->max;
-		new_pol.governor =3D userspace_gov;
-		ret =3D proc_set_policy(cpu, &new_pol);
-		if (ret)
-			return (ret);
-	}
-
-
-	snprintf(file, MAX_LINE_LEN, "/proc/sys/cpu/%u/speed", cpu);
-	snprintf(value, MAX_LINE_LEN, "%lu", target_frequency);
-
-	fp =3D fopen(file,"r+");
-	if (!fp)
-		return -EINVAL;
-	ret =3D fputs(value, fp);
-	fclose(fp);
-
-	if (ret < 0)
-		return (ret);
-
-	return 0;
-}
diff --git a/lib/sysfs.h b/lib/sysfs.h
new file mode 100644
index 0000000..b8a2b69
--- /dev/null
+++ b/lib/sysfs.h
@@ -0,0 +1,19 @@
+extern unsigned int sysfs_cpu_exists(unsigned int cpu);
+extern unsigned long sysfs_get_freq_kernel(unsigned int cpu);
+extern unsigned long sysfs_get_freq_hardware(unsigned int cpu);
+extern unsigned long sysfs_get_transition_latency(unsigned int cpu);
+extern int sysfs_get_hardware_limits(unsigned int cpu, unsigned long *=
min, unsigned long *max);
+extern char * sysfs_get_driver(unsigned int cpu);
+extern struct cpufreq_policy * sysfs_get_policy(unsigned int cpu);
+extern struct cpufreq_available_governors * sysfs_get_available_govern=
ors(unsigned int cpu);
+extern struct cpufreq_available_frequencies * sysfs_get_available_freq=
uencies(unsigned int cpu);
+extern struct cpufreq_affected_cpus * sysfs_get_affected_cpus(unsigned=
 int cpu);
+extern struct cpufreq_affected_cpus * sysfs_get_related_cpus(unsigned =
int cpu);
+extern struct cpufreq_stats * sysfs_get_stats(unsigned int cpu, unsign=
ed long long *total_time);
+extern unsigned long sysfs_get_transitions(unsigned int cpu);
+extern int sysfs_set_policy(unsigned int cpu, struct cpufreq_policy *p=
olicy);
+extern int sysfs_modify_policy_min(unsigned int cpu, unsigned long min=
_freq);
+extern int sysfs_modify_policy_max(unsigned int cpu, unsigned long max=
_freq);
+extern int sysfs_modify_policy_governor(unsigned int cpu, char *govern=
or);
+extern int sysfs_set_frequency(unsigned int cpu, unsigned long target_=
frequency);
+
diff --git a/po/cs.po b/po/cs.po
index a4c14a7..4fdfffb 100644
--- a/po/cs.po
+++ b/po/cs.po
@@ -9,7 +9,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: cs\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2008-07-17 11:29+0200\n"
+"POT-Creation-Date: 2010-09-01 01:20+0200\n"
 "PO-Revision-Date: 2008-06-11 16:26+0200\n"
 "Last-Translator: Karel Voln=C3=BD <kavol@seznam.cz>\n"
 "Language-Team: Czech <diskuze@lists.l10n.cz>\n"
@@ -24,64 +24,74 @@ msgstr ""
 msgid "Couldn't count the number of CPUs (%s: %s), assuming 1\n"
 msgstr "Nelze zjistit po=C4=8Det CPU (%s: %s), p=C5=99edpokl=C3=A1d=C3=
=A1 se 1.\n"
=20
-#: utils/info.c:67
+#: utils/info.c:68
 #, c-format
 msgid ""
 "          minimum CPU frequency  -  maximum CPU frequency  -  governo=
r\n"
 msgstr ""
 "         minim=C3=A1ln=C3=AD frekvence CPU - maxim=C3=A1ln=C3=AD frek=
vence CPU -  regul=C3=A1tor\n"
=20
-#: utils/info.c:128
+#: utils/info.c:156
 #, c-format
 msgid "couldn't analyze CPU %d as it doesn't seem to be present\n"
 msgstr "nelze analyzovat CPU %d, vypad=C3=A1 to, =C5=BEe nen=C3=AD p=C5=
=99=C3=ADtomen\n"
=20
-#: utils/info.c:132
+#: utils/info.c:160
 #, c-format
 msgid "analyzing CPU %d:\n"
 msgstr "analyzuji CPU %d:\n"
=20
-#: utils/info.c:139
+#: utils/info.c:167
 #, c-format
 msgid "  no or unknown cpufreq driver is active on this CPU\n"
 msgstr "  pro tento CPU nen=C3=AD aktivn=C3=AD =C5=BE=C3=A1dn=C3=BD zn=
=C3=A1m=C3=BD ovlada=C4=8D cpufreq\n"
=20
-#: utils/info.c:141
+#: utils/info.c:169
 #, c-format
 msgid "  driver: %s\n"
 msgstr "  ovlada=C4=8D: %s\n"
=20
-#: utils/info.c:147
-#, c-format
-msgid "  CPUs which need to switch frequency at the same time: "
+#: utils/info.c:175
+#, fuzzy, c-format
+msgid "  CPUs which run at the same hardware frequency: "
+msgstr "  CPU, kter=C3=A9 mus=C3=AD m=C4=9Bnit frekvenci z=C3=A1rove=C5=
=88: "
+
+#: utils/info.c:186
+#, fuzzy, c-format
+msgid "  CPUs which need to have their frequency coordinated by softwa=
re: "
 msgstr "  CPU, kter=C3=A9 mus=C3=AD m=C4=9Bnit frekvenci z=C3=A1rove=C5=
=88: "
=20
-#: utils/info.c:157
+#: utils/info.c:197
+#, c-format
+msgid "  maximum transition latency: "
+msgstr ""
+
+#: utils/info.c:203
 #, c-format
 msgid "  hardware limits: "
 msgstr "  hardwarov=C3=A9 meze: "
=20
-#: utils/info.c:166
+#: utils/info.c:212
 #, c-format
 msgid "  available frequency steps: "
 msgstr "  dostupn=C3=A9 frekvence: "
=20
-#: utils/info.c:179
+#: utils/info.c:225
 #, c-format
 msgid "  available cpufreq governors: "
 msgstr "  dostupn=C3=A9 regul=C3=A1tory: "
=20
-#: utils/info.c:190
+#: utils/info.c:236
 #, c-format
 msgid "  current policy: frequency should be within "
 msgstr "  sou=C4=8Dasn=C3=A1 taktika: frekvence by m=C4=9Bla b=C3=BDt =
mezi "
=20
-#: utils/info.c:192
+#: utils/info.c:238
 #, c-format
 msgid " and "
 msgstr " a "
=20
-#: utils/info.c:196
+#: utils/info.c:242
 #, c-format
 msgid ""
 "The governor \"%s\" may decide which speed to use\n"
@@ -90,51 +100,51 @@ msgstr ""
 "  Regul=C3=A1tor \"%s\" m=C5=AF=C5=BEe rozhodnout jakou frekvenci pou=
=C5=BE=C3=ADt\n"
 "                    v t=C4=9Bchto mez=C3=ADch.\n"
=20
-#: utils/info.c:203
+#: utils/info.c:249
 #, c-format
 msgid "  current CPU frequency is "
 msgstr "  sou=C4=8Dasn=C3=A1 frekvence CPU je "
=20
-#: utils/info.c:206
+#: utils/info.c:252
 #, c-format
 msgid " (asserted by call to hardware)"
 msgstr "  (zji=C5=A1t=C4=9Bno hardwarov=C3=BDm vol=C3=A1n=C3=ADm)"
=20
-#: utils/info.c:214
+#: utils/info.c:260
 #, c-format
 msgid "  cpufreq stats: "
 msgstr "  statistika cpufreq: "
=20
-#: utils/info.c:361 utils/set.c:30
+#: utils/info.c:440 utils/set.c:31
 #, c-format
 msgid "Report errors and bugs to %s, please.\n"
 msgstr ""
 "Chyby v programu pros=C3=ADm hlaste na %s (anglicky).\n"
 "Chyby v p=C5=99ekladu pros=C3=ADm hlaste na kavol@seznam.cz (=C4=8Des=
ky ;-)\n"
=20
-#: utils/info.c:365
+#: utils/info.c:444
 #, c-format
 msgid "Usage: cpufreq-info [options]\n"
 msgstr "U=C5=BEit=C3=AD: cpufreq-info [p=C5=99ep=C3=ADna=C4=8De]\n"
=20
-#: utils/info.c:366 utils/set.c:35
+#: utils/info.c:445 utils/set.c:37
 #, c-format
 msgid "Options:\n"
 msgstr "P=C5=99ep=C3=ADna=C4=8De:\n"
=20
-#: utils/info.c:367
+#: utils/info.c:446
 #, c-format
 msgid ""
 "  -c CPU, --cpu CPU    CPU number which information shall be determin=
ed "
 "about\n"
 msgstr "  -c CPU, --cpu CPU    =C4=8C=C3=ADslo CPU, o kter=C3=A9m se m=
aj=C3=AD zjistit informace\n"
=20
-#: utils/info.c:368
+#: utils/info.c:447
 #, c-format
 msgid "  -e, --debug          Prints out debug information\n"
 msgstr "  -e, --debug          Vyp=C3=AD=C5=A1e ladic=C3=AD informace\=
n"
=20
-#: utils/info.c:369
+#: utils/info.c:448
 #, c-format
 msgid ""
 "  -f, --freq           Get frequency the CPU currently runs at, accor=
ding\n"
@@ -143,7 +153,7 @@ msgstr ""
 "  -f, --freq           Zjist=C3=AD aktu=C3=A1ln=C3=AD frekvenci, na k=
ter=C3=A9 CPU b=C4=9B=C5=BE=C3=AD\n"
 "                       podle cpufreq *\n"
=20
-#: utils/info.c:371
+#: utils/info.c:450
 #, c-format
 msgid ""
 "  -w, --hwfreq         Get frequency the CPU currently runs at, by re=
ading\n"
@@ -152,7 +162,7 @@ msgstr ""
 "  -w, --hwfreq         Zjist=C3=AD aktu=C3=A1ln=C3=AD frekvenci, na k=
ter=C3=A9 CPU b=C4=9B=C5=BE=C3=AD\n"
 "                       z hardware (dostupn=C3=A9 jen u=C5=BEivateli r=
oot) *\n"
=20
-#: utils/info.c:373
+#: utils/info.c:452
 #, c-format
 msgid ""
 "  -l, --hwlimits       Determine the minimum and maximum CPU frequenc=
y "
@@ -161,36 +171,52 @@ msgstr ""
 "  -l, --hwlimits       Zjist=C3=AD minim=C3=A1ln=C3=AD a maxim=C3=A1l=
n=C3=AD dostupnou frekvenci CPU "
 "*\n"
=20
-#: utils/info.c:374
+#: utils/info.c:453
 #, c-format
 msgid "  -d, --driver         Determines the used cpufreq kernel drive=
r *\n"
 msgstr "  -d, --driver         Zjist=C3=AD aktivn=C3=AD ovlada=C4=8D c=
pufreq *\n"
=20
-#: utils/info.c:375
+#: utils/info.c:454
 #, c-format
 msgid "  -p, --policy         Gets the currently used cpufreq policy *=
\n"
 msgstr "  -p, --policy         Zjist=C3=AD aktu=C3=A1ln=C3=AD taktiku =
cpufreq *\n"
=20
-#: utils/info.c:376
+#: utils/info.c:455
 #, c-format
 msgid "  -g, --governors      Determines available cpufreq governors *=
\n"
 msgstr "  -g, --governors      Zjist=C3=AD dostupn=C3=A9 regul=C3=A1to=
ry cpufreq *\n"
=20
-#: utils/info.c:377
-#, c-format
+#: utils/info.c:456
+#, fuzzy, c-format
 msgid ""
-"  -a, --affected-cpus  Determines which CPUs can only switch frequenc=
y at "
-"the\n"
-"                       same time *\n"
+"  -r, --related-cpus   Determines which CPUs run at the same hardware=
 "
+"frequency *\n"
 msgstr ""
 "  -a, --affected-cpus  Zjist=C3=AD, kter=C3=A9 CPU mus=C3=AD m=C4=9Bn=
it frekvenci z=C3=A1rove=C5=88 *\n"
=20
-#: utils/info.c:379
+#: utils/info.c:457
+#, fuzzy, c-format
+msgid ""
+"  -a, --affected-cpus  Determines which CPUs need to have their frequ=
ency\n"
+"                       coordinated by software *\n"
+msgstr ""
+"  -a, --affected-cpus  Zjist=C3=AD, kter=C3=A9 CPU mus=C3=AD m=C4=9Bn=
it frekvenci z=C3=A1rove=C5=88 *\n"
+
+#: utils/info.c:459
 #, c-format
 msgid "  -s, --stats          Shows cpufreq statistics if available\n"
 msgstr "  -s, --stats          Zobraz=C3=AD statistiku cpufreq, je-li =
dostupn=C3=A1\n"
=20
-#: utils/info.c:380
+#: utils/info.c:460
+#, fuzzy, c-format
+msgid ""
+"  -y, --latency        Determines the maximum latency on CPU frequenc=
y "
+"changes *\n"
+msgstr ""
+"  -l, --hwlimits       Zjist=C3=AD minim=C3=A1ln=C3=AD a maxim=C3=A1l=
n=C3=AD dostupnou frekvenci CPU "
+"*\n"
+
+#: utils/info.c:461
 #, c-format
 msgid ""
 "  -o, --proc           Prints out information like provided by the /p=
roc/"
@@ -200,21 +226,21 @@ msgstr ""
 "  -o, --proc           Vyp=C3=AD=C5=A1e informace ve form=C3=A1tu, ja=
k=C3=BD pou=C5=BE=C3=ADvalo rozhran=C3=AD\n"
 "                       /proc/cpufreq v kernelech =C5=99ady 2.4 a =C4=8D=
asn=C3=A9 2.6\n"
=20
-#: utils/info.c:382
-#, c-format
+#: utils/info.c:463
+#, fuzzy, c-format
 msgid ""
-"  -m, --human          human-readable output for the -f, -w and -s "
+"  -m, --human          human-readable output for the -f, -w, -s and -=
y "
 "parameters\n"
 msgstr ""
 "  -m, --human          V=C3=BDstup parametr=C5=AF -f, -w a -s v =E2=80=
=9Elidmi =C4=8Diteln=C3=A9m=E2=80=9C "
 "form=C3=A1tu\n"
=20
-#: utils/info.c:383 utils/set.c:42
+#: utils/info.c:464
 #, c-format
 msgid "  -h, --help           Prints out this screen\n"
 msgstr "  -h, --help           Vyp=C3=AD=C5=A1e tuto n=C3=A1pov=C4=9Bd=
u\n"
=20
-#: utils/info.c:386
+#: utils/info.c:467
 #, c-format
 msgid ""
 "If no argument or only the -c, --cpu parameter is given, debug output=
 about\n"
@@ -224,7 +250,7 @@ msgstr ""
 "jsou\n"
 "vyps=C3=A1ny ladic=C3=AD informace, co=C5=BE m=C5=AF=C5=BEe b=C3=BDt =
u=C5=BEite=C4=8Dn=C3=A9 nap=C5=99=C3=ADklad p=C5=99i hl=C3=A1=C5=A1en=C3=
=AD chyb.\n"
=20
-#: utils/info.c:388
+#: utils/info.c:469
 #, c-format
 msgid ""
 "For the arguments marked with *, omitting the -c or --cpu argument is=
\n"
@@ -233,14 +259,14 @@ msgstr ""
 "Nen=C3=AD-li p=C5=99i pou=C5=BEit=C3=AD p=C5=99ep=C3=ADna=C4=8D=C5=AF=
 ozna=C4=8Den=C3=BDch * zad=C3=A1n parametr -c nebo --cpu,\n"
 "p=C5=99edpokl=C3=A1d=C3=A1 se jeho hodnota 0.\n"
=20
-#: utils/info.c:478
+#: utils/info.c:563
 #, c-format
 msgid ""
 "The argument passed to this tool can't be combined with passing a --c=
pu "
 "argument\n"
 msgstr "Zadan=C3=BD parametr nem=C5=AF=C5=BEe b=C3=BDt pou=C5=BEit z=C3=
=A1rove=C5=88 s p=C5=99ep=C3=ADna=C4=8Dem -c nebo --cpu\n"
=20
-#: utils/info.c:491
+#: utils/info.c:576
 #, c-format
 msgid ""
 "You can't specify more than one --cpu parameter and/or\n"
@@ -249,17 +275,17 @@ msgstr ""
 "Nelze zadat v=C3=ADce ne=C5=BE jeden parametr -c nebo --cpu\n"
 "anebo v=C3=ADce ne=C5=BE jeden parametr ur=C4=8Duj=C3=ADc=C3=AD v=C3=BD=
stup\n"
=20
-#: utils/info.c:497 utils/set.c:79
+#: utils/info.c:582 utils/set.c:95
 #, c-format
 msgid "invalid or unknown argument\n"
 msgstr "neplatn=C3=BD nebo nezn=C3=A1m=C3=BD parametr\n"
=20
-#: utils/set.c:34
+#: utils/set.c:36
 #, c-format
 msgid "Usage: cpufreq-set [options]\n"
 msgstr "U=C5=BEit=C3=AD: cpufreq-set [p=C5=99ep=C3=ADna=C4=8De]\n"
=20
-#: utils/set.c:36
+#: utils/set.c:38
 #, c-format
 msgid ""
 "  -c CPU, --cpu CPU        number of CPU where cpufreq settings shall=
 be "
@@ -268,7 +294,7 @@ msgstr ""
 "  -c CPU, --cpu CPU        =C4=8C=C3=ADslo CPU pro kter=C3=BD se m=C3=
=A1 prov=C3=A9st nastaven=C3=AD "
 "cpufreq\n"
=20
-#: utils/set.c:37
+#: utils/set.c:39
 #, c-format
 msgid ""
 "  -d FREQ, --min FREQ      new minimum CPU frequency the governor may=
 "
@@ -277,7 +303,7 @@ msgstr ""
 "  -d FREQ, --min FREQ      Nov=C3=A1 nejni=C5=BE=C5=A1=C3=AD frekvenc=
e, kterou m=C5=AF=C5=BEe regul=C3=A1tor "
 "vybrat\n"
=20
-#: utils/set.c:38
+#: utils/set.c:40
 #, c-format
 msgid ""
 "  -u FREQ, --max FREQ      new maximum CPU frequency the governor may=
 "
@@ -286,12 +312,12 @@ msgstr ""
 "  -u FREQ, --max FREQ      Nov=C3=A1 nejvy=C5=A1=C5=A1=C3=AD frekvenc=
e, kterou m=C5=AF=C5=BEe regul=C3=A1tor "
 "zvolit\n"
=20
-#: utils/set.c:39
+#: utils/set.c:41
 #, c-format
 msgid "  -g GOV, --governor GOV   new cpufreq governor\n"
 msgstr "  -g GOV, --governors GOV  Nov=C3=BD regul=C3=A1tor cpufreq\n"
=20
-#: utils/set.c:40
+#: utils/set.c:42
 #, c-format
 msgid ""
 "  -f FREQ, --freq FREQ     specific frequency to be set. Requires use=
rspace\n"
@@ -303,6 +329,16 @@ msgstr ""
=20
 #: utils/set.c:44
 #, c-format
+msgid "  -r, --related            Switches all hardware-related CPUs\n=
"
+msgstr ""
+
+#: utils/set.c:45
+#, fuzzy, c-format
+msgid "  -h, --help               Prints out this screen\n"
+msgstr "  -h, --help           Vyp=C3=AD=C5=A1e tuto n=C3=A1pov=C4=9Bd=
u\n"
+
+#: utils/set.c:47
+#, c-format
 msgid ""
 "Notes:\n"
 "1. Omitting the -c or --cpu argument is equivalent to setting it to z=
ero\n"
@@ -322,30 +358,7 @@ msgstr ""
 "   p=C5=99ipojen=C3=ADm n=C3=A1zvu jednotky bez mezery mezi =C4=8D=C3=
=ADslem a jednotkou\n"
 "   (FREQ v kHz =3D^ Hz * 0,001 =3D ^ MHz * 1000 =3D^ GHz * 1000000)\n=
"
=20
-#: utils/set.c:251
-#, c-format
-msgid ""
-"the -f/--freq parameter cannot be combined with -d/--min, -u/--max or=
\n"
-"-g/--governor parameters\n"
-msgstr ""
-"p=C5=99ep=C3=ADna=C4=8D -f/--freq nem=C5=AF=C5=BEe b=C3=BDt pou=C5=BE=
it z=C3=A1rove=C5=88\n"
-"s p=C5=99ep=C3=ADna=C4=8Dem -d/--min, -u/--max nebo -g/--governor\n"
-
-#: utils/set.c:262
-#, c-format
-msgid ""
-"At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
-"-g/--governor must be passed\n"
-msgstr ""
-"Mus=C3=AD b=C3=BDt zad=C3=A1n alespo=C5=88 jeden p=C5=99ep=C3=ADna=C4=
=8D\n"
-"-f/--freq, -d/--min, -u/--max nebo -g/--governor\n"
-
-#: utils/set.c:282
-#, c-format
-msgid "wrong, unknown or unhandled CPU?\n"
-msgstr "nezn=C3=A1m=C3=BD nebo nepodporovan=C3=BD CPU?\n"
-
-#: utils/set.c:306
+#: utils/set.c:69
 #, c-format
 msgid ""
 "Error setting new values. Common errors:\n"
@@ -365,3 +378,26 @@ msgstr ""
 "- Sna=C5=BE=C3=ADte se nastavit ur=C4=8Ditou frekvenci, ale nen=C3=AD=
 dostupn=C3=BD\n"
 "  regul=C3=A1tor =E2=80=9Auserspace=E2=80=98, nap=C5=99=C3=ADklad pro=
to=C5=BEe nen=C3=AD nahr=C3=A1n v j=C3=A1d=C5=99e,\n"
 "  nebo nelze na tomto hardware nastavit ur=C4=8Ditou frekvenci?\n"
+
+#: utils/set.c:183
+#, c-format
+msgid "wrong, unknown or unhandled CPU?\n"
+msgstr "nezn=C3=A1m=C3=BD nebo nepodporovan=C3=BD CPU?\n"
+
+#: utils/set.c:336
+#, c-format
+msgid ""
+"the -f/--freq parameter cannot be combined with -d/--min, -u/--max or=
\n"
+"-g/--governor parameters\n"
+msgstr ""
+"p=C5=99ep=C3=ADna=C4=8D -f/--freq nem=C5=AF=C5=BEe b=C3=BDt pou=C5=BE=
it z=C3=A1rove=C5=88\n"
+"s p=C5=99ep=C3=ADna=C4=8Dem -d/--min, -u/--max nebo -g/--governor\n"
+
+#: utils/set.c:342
+#, c-format
+msgid ""
+"At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
+"-g/--governor must be passed\n"
+msgstr ""
+"Mus=C3=AD b=C3=BDt zad=C3=A1n alespo=C5=88 jeden p=C5=99ep=C3=ADna=C4=
=8D\n"
+"-f/--freq, -d/--min, -u/--max nebo -g/--governor\n"
diff --git a/po/de.po b/po/de.po
index 4c3a2bb..a5970ae 100644
--- a/po/de.po
+++ b/po/de.po
@@ -7,7 +7,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: cpufrequtils 006\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2009-08-09 11:53+0200\n"
+"POT-Creation-Date: 2010-09-01 01:20+0200\n"
 "PO-Revision-Date: 2009-08-08 17:18+0100\n"
 "Last-Translator:  <linux@dominikbrodowski.net>\n"
 "Language-Team: NONE\n"
diff --git a/po/fr.po b/po/fr.po
index fffdb42..4ebb40b 100644
--- a/po/fr.po
+++ b/po/fr.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: cpufrequtils 0.1-pre2\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2008-07-17 11:29+0200\n"
+"POT-Creation-Date: 2010-09-01 01:20+0200\n"
 "PO-Revision-Date: 2004-11-17 15:53+1000\n"
 "Last-Translator: Bruno Ducrot <ducrot@poupinou.org>\n"
 "Language-Team: NONE\n"
@@ -21,64 +21,74 @@ msgstr ""
 msgid "Couldn't count the number of CPUs (%s: %s), assuming 1\n"
 msgstr "D=E9termination du nombre de CPUs (%s : %s) impossible.  Assum=
e 1\n"
=20
-#: utils/info.c:67
+#: utils/info.c:68
 #, c-format
 msgid ""
 "          minimum CPU frequency  -  maximum CPU frequency  -  governo=
r\n"
 msgstr ""
 "         Fr=E9quence CPU minimale - Fr=E9quence CPU maximale  - r=E9g=
ulateur\n"
=20
-#: utils/info.c:128
+#: utils/info.c:156
 #, c-format
 msgid "couldn't analyze CPU %d as it doesn't seem to be present\n"
 msgstr "analyse du CPU %d impossible puisqu'il ne semble pas =EAtre pr=
=E9sent\n"
=20
-#: utils/info.c:132
+#: utils/info.c:160
 #, c-format
 msgid "analyzing CPU %d:\n"
 msgstr "analyse du CPU %d :\n"
=20
-#: utils/info.c:139
+#: utils/info.c:167
 #, c-format
 msgid "  no or unknown cpufreq driver is active on this CPU\n"
 msgstr "  pas de pilotes cpufreq reconnu pour ce CPU\n"
=20
-#: utils/info.c:141
+#: utils/info.c:169
 #, c-format
 msgid "  driver: %s\n"
 msgstr "  pilote : %s\n"
=20
-#: utils/info.c:147
-#, c-format
-msgid "  CPUs which need to switch frequency at the same time: "
+#: utils/info.c:175
+#, fuzzy, c-format
+msgid "  CPUs which run at the same hardware frequency: "
+msgstr "  CPUs qui doivent changer de fr=E9quences en m=EAme temps : "
+
+#: utils/info.c:186
+#, fuzzy, c-format
+msgid "  CPUs which need to have their frequency coordinated by softwa=
re: "
 msgstr "  CPUs qui doivent changer de fr=E9quences en m=EAme temps : "
=20
-#: utils/info.c:157
+#: utils/info.c:197
+#, c-format
+msgid "  maximum transition latency: "
+msgstr ""
+
+#: utils/info.c:203
 #, c-format
 msgid "  hardware limits: "
 msgstr "  limitation mat=E9rielle : "
=20
-#: utils/info.c:166
+#: utils/info.c:212
 #, c-format
 msgid "  available frequency steps: "
 msgstr "  plage de fr=E9quence : "
=20
-#: utils/info.c:179
+#: utils/info.c:225
 #, c-format
 msgid "  available cpufreq governors: "
 msgstr "  r=E9gulateurs disponibles : "
=20
-#: utils/info.c:190
+#: utils/info.c:236
 #, c-format
 msgid "  current policy: frequency should be within "
 msgstr "  tactique actuelle : la fr=E9quence doit =EAtre comprise entr=
e "
=20
-#: utils/info.c:192
+#: utils/info.c:238
 #, c-format
 msgid " and "
 msgstr " et "
=20
-#: utils/info.c:196
+#: utils/info.c:242
 #, c-format
 msgid ""
 "The governor \"%s\" may decide which speed to use\n"
@@ -87,37 +97,37 @@ msgstr ""
 "Le r=E9gulateur \"%s\" est libre de choisir la vitesse\n"
 "                  dans cette plage de fr=E9quences.\n"
=20
-#: utils/info.c:203
+#: utils/info.c:249
 #, c-format
 msgid "  current CPU frequency is "
 msgstr "  la fr=E9quence actuelle de ce CPU est "
=20
-#: utils/info.c:206
+#: utils/info.c:252
 #, c-format
 msgid " (asserted by call to hardware)"
 msgstr " (v=E9rifi=E9 par un appel direct du mat=E9riel)"
=20
-#: utils/info.c:214
+#: utils/info.c:260
 #, c-format
 msgid "  cpufreq stats: "
 msgstr "  des statistique concernant cpufreq:"
=20
-#: utils/info.c:361 utils/set.c:30
+#: utils/info.c:440 utils/set.c:31
 #, c-format
 msgid "Report errors and bugs to %s, please.\n"
 msgstr "Veuillez rapportez les erreurs et les bogues =E0 %s, s'il vous=
 plait.\n"
=20
-#: utils/info.c:365
+#: utils/info.c:444
 #, c-format
 msgid "Usage: cpufreq-info [options]\n"
 msgstr "Usage : cpufreq-info [options]\n"
=20
-#: utils/info.c:366 utils/set.c:35
+#: utils/info.c:445 utils/set.c:37
 #, c-format
 msgid "Options:\n"
 msgstr "Options :\n"
=20
-#: utils/info.c:367
+#: utils/info.c:446
 #, c-format
 msgid ""
 "  -c CPU, --cpu CPU    CPU number which information shall be determin=
ed "
@@ -126,12 +136,12 @@ msgstr ""
 "  -c CPU, --cpu CPU    Num=E9ro du CPU pour lequel l'information sera=
 "
 "affich=E9e\n"
=20
-#: utils/info.c:368
+#: utils/info.c:447
 #, c-format
 msgid "  -e, --debug          Prints out debug information\n"
 msgstr "  -e, --debug          Afficher les informations de d=E9boguag=
e\n"
=20
-#: utils/info.c:369
+#: utils/info.c:448
 #, c-format
 msgid ""
 "  -f, --freq           Get frequency the CPU currently runs at, accor=
ding\n"
@@ -140,7 +150,7 @@ msgstr ""
 "  -f, --freq           Obtenir la fr=E9quence actuelle du CPU selon l=
e point\n"
 "                       de vue du coeur du syst=E8me de cpufreq *\n"
=20
-#: utils/info.c:371
+#: utils/info.c:450
 #, c-format
 msgid ""
 "  -w, --hwfreq         Get frequency the CPU currently runs at, by re=
ading\n"
@@ -149,7 +159,7 @@ msgstr ""
 "  -w, --hwfreq         Obtenir la fr=E9quence actuelle du CPU directe=
ment par\n"
 "                       le mat=E9riel (doit =EAtre root) *\n"
=20
-#: utils/info.c:373
+#: utils/info.c:452
 #, c-format
 msgid ""
 "  -l, --hwlimits       Determine the minimum and maximum CPU frequenc=
y "
@@ -158,40 +168,57 @@ msgstr ""
 "  -l, --hwlimits       Affiche les fr=E9quences minimales et maximale=
s du CPU "
 "*\n"
=20
-#: utils/info.c:374
+#: utils/info.c:453
 #, c-format
 msgid "  -d, --driver         Determines the used cpufreq kernel drive=
r *\n"
 msgstr "  -d, --driver         Affiche le pilote cpufreq utilis=E9 *\n=
"
=20
-#: utils/info.c:375
+#: utils/info.c:454
 #, c-format
 msgid "  -p, --policy         Gets the currently used cpufreq policy *=
\n"
 msgstr "  -p, --policy         Affiche la tactique actuelle de cpufreq=
 *\n"
=20
-#: utils/info.c:376
+#: utils/info.c:455
 #, c-format
 msgid "  -g, --governors      Determines available cpufreq governors *=
\n"
 msgstr ""
 "  -g, --governors      Affiche les r=E9gulateurs disponibles de cpufr=
eq *\n"
=20
-#: utils/info.c:377
-#, c-format
+#: utils/info.c:456
+#, fuzzy, c-format
 msgid ""
-"  -a, --affected-cpus  Determines which CPUs can only switch frequenc=
y at "
-"the\n"
-"                       same time *\n"
+"  -r, --related-cpus   Determines which CPUs run at the same hardware=
 "
+"frequency *\n"
 msgstr ""
 "  -a, --affected-cpus   Affiche quels sont les CPUs qui doivent chang=
er de\n"
 "                        fr=E9quences en m=EAme temps *\n"
=20
-#: utils/info.c:379
+#: utils/info.c:457
+#, fuzzy, c-format
+msgid ""
+"  -a, --affected-cpus  Determines which CPUs need to have their frequ=
ency\n"
+"                       coordinated by software *\n"
+msgstr ""
+"  -a, --affected-cpus   Affiche quels sont les CPUs qui doivent chang=
er de\n"
+"                        fr=E9quences en m=EAme temps *\n"
+
+#: utils/info.c:459
 #, c-format
 msgid "  -s, --stats          Shows cpufreq statistics if available\n"
 msgstr ""
 "  -s, --stats          Indique des statistiques concernant cpufreq, s=
i\n"
 "                       disponibles\n"
=20
-#: utils/info.c:380
+#: utils/info.c:460
+#, fuzzy, c-format
+msgid ""
+"  -y, --latency        Determines the maximum latency on CPU frequenc=
y "
+"changes *\n"
+msgstr ""
+"  -l, --hwlimits       Affiche les fr=E9quences minimales et maximale=
s du CPU "
+"*\n"
+
+#: utils/info.c:461
 #, c-format
 msgid ""
 "  -o, --proc           Prints out information like provided by the /p=
roc/"
@@ -203,21 +230,21 @@ msgstr ""
 "versions\n"
 "                       2.4 et les anciennes versions 2.6 du noyau\n"
=20
-#: utils/info.c:382
-#, c-format
+#: utils/info.c:463
+#, fuzzy, c-format
 msgid ""
-"  -m, --human          human-readable output for the -f, -w and -s "
+"  -m, --human          human-readable output for the -f, -w, -s and -=
y "
 "parameters\n"
 msgstr ""
 "  -m, --human           affiche dans un format lisible pour un humain=
\n"
 "                        pour les options -f, -w et -s (MHz, GHz)\n"
=20
-#: utils/info.c:383 utils/set.c:42
+#: utils/info.c:464
 #, c-format
 msgid "  -h, --help           Prints out this screen\n"
 msgstr "  -h, --help           affiche l'aide-m=E9moire\n"
=20
-#: utils/info.c:386
+#: utils/info.c:467
 #, c-format
 msgid ""
 "If no argument or only the -c, --cpu parameter is given, debug output=
 about\n"
@@ -227,21 +254,21 @@ msgstr ""
 "argument, ou bien si seulement l'argument -c (--cpu) est donn=E9, afi=
n de\n"
 "faciliter les rapports de bogues par exemple\n"
=20
-#: utils/info.c:388
+#: utils/info.c:469
 #, c-format
 msgid ""
 "For the arguments marked with *, omitting the -c or --cpu argument is=
\n"
 "equivalent to setting it to zero\n"
 msgstr "Les arguments avec un * utiliseront le CPU 0 si -c (--cpu) est=
 omis\n"
=20
-#: utils/info.c:478
+#: utils/info.c:563
 #, c-format
 msgid ""
 "The argument passed to this tool can't be combined with passing a --c=
pu "
 "argument\n"
 msgstr "Cette option est incompatible avec --cpu\n"
=20
-#: utils/info.c:491
+#: utils/info.c:576
 #, c-format
 msgid ""
 "You can't specify more than one --cpu parameter and/or\n"
@@ -250,17 +277,17 @@ msgstr ""
 "On ne peut indiquer plus d'un param=E8tre --cpu, tout comme l'on ne p=
eut\n"
 "sp=E9cifier plus d'un argument de formatage\n"
=20
-#: utils/info.c:497 utils/set.c:79
+#: utils/info.c:582 utils/set.c:95
 #, c-format
 msgid "invalid or unknown argument\n"
 msgstr "option invalide\n"
=20
-#: utils/set.c:34
+#: utils/set.c:36
 #, c-format
 msgid "Usage: cpufreq-set [options]\n"
 msgstr "Usage : cpufreq-set [options]\n"
=20
-#: utils/set.c:36
+#: utils/set.c:38
 #, c-format
 msgid ""
 "  -c CPU, --cpu CPU        number of CPU where cpufreq settings shall=
 be "
@@ -269,7 +296,7 @@ msgstr ""
 "  -c CPU, --cpu CPU        num=E9ro du CPU =E0 prendre en compte pour=
 les\n"
 "                           changements\n"
=20
-#: utils/set.c:37
+#: utils/set.c:39
 #, c-format
 msgid ""
 "  -d FREQ, --min FREQ      new minimum CPU frequency the governor may=
 "
@@ -278,7 +305,7 @@ msgstr ""
 "  -d FREQ, --min FREQ       nouvelle fr=E9quence minimale du CPU =E0 =
utiliser\n"
 "                            par le r=E9gulateur\n"
=20
-#: utils/set.c:38
+#: utils/set.c:40
 #, c-format
 msgid ""
 "  -u FREQ, --max FREQ      new maximum CPU frequency the governor may=
 "
@@ -287,12 +314,12 @@ msgstr ""
 "  -u FREQ, --max FREQ       nouvelle fr=E9quence maximale du CPU =E0 =
utiliser\n"
 "                            par le r=E9gulateur\n"
=20
-#: utils/set.c:39
+#: utils/set.c:41
 #, c-format
 msgid "  -g GOV, --governor GOV   new cpufreq governor\n"
 msgstr "  -g GOV, --governor GOV   active le r=E9gulateur GOV\n"
=20
-#: utils/set.c:40
+#: utils/set.c:42
 #, c-format
 msgid ""
 "  -f FREQ, --freq FREQ     specific frequency to be set. Requires use=
rspace\n"
@@ -304,6 +331,16 @@ msgstr ""
=20
 #: utils/set.c:44
 #, c-format
+msgid "  -r, --related            Switches all hardware-related CPUs\n=
"
+msgstr ""
+
+#: utils/set.c:45
+#, fuzzy, c-format
+msgid "  -h, --help               Prints out this screen\n"
+msgstr "  -h, --help           affiche l'aide-m=E9moire\n"
+
+#: utils/set.c:47
+#, c-format
 msgid ""
 "Notes:\n"
 "1. Omitting the -c or --cpu argument is equivalent to setting it to z=
ero\n"
@@ -322,30 +359,7 @@ msgstr ""
 "   les valeurs par hz, kHz (par d=E9faut), MHz, GHz ou THz\n"
 "   (kHz =3D^ Hz * 0.001 =3D^ MHz * 1000 =3D^ GHz * 1000000).\n"
=20
-#: utils/set.c:251
-#, c-format
-msgid ""
-"the -f/--freq parameter cannot be combined with -d/--min, -u/--max or=
\n"
-"-g/--governor parameters\n"
-msgstr ""
-"l'option -f/--freq est incompatible avec les options -d/--min, -u/--m=
ax et\n"
-"-g/--governor\n"
-
-#: utils/set.c:262
-#, c-format
-msgid ""
-"At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
-"-g/--governor must be passed\n"
-msgstr ""
-"L'un de ces param=E8tres est obligatoire : -f/--freq, -d/--min, -u/--=
max et\n"
-"-g/--governor\n"
-
-#: utils/set.c:282
-#, c-format
-msgid "wrong, unknown or unhandled CPU?\n"
-msgstr "CPU inconnu ou non support=E9 ?\n"
-
-#: utils/set.c:306
+#: utils/set.c:69
 #, c-format
 msgid ""
 "Error setting new values. Common errors:\n"
@@ -368,3 +382,26 @@ msgstr ""
 "- vous voulez utiliser l'option -f/--freq, mais le r=E9gulateur =AB u=
serspace =BB\n"
 "  n'est pas disponible, par exemple parce que le mat=E9riel ne le sup=
porte\n"
 "  pas, ou bien n'est tout simplement pas charg=E9.\n"
+
+#: utils/set.c:183
+#, c-format
+msgid "wrong, unknown or unhandled CPU?\n"
+msgstr "CPU inconnu ou non support=E9 ?\n"
+
+#: utils/set.c:336
+#, c-format
+msgid ""
+"the -f/--freq parameter cannot be combined with -d/--min, -u/--max or=
\n"
+"-g/--governor parameters\n"
+msgstr ""
+"l'option -f/--freq est incompatible avec les options -d/--min, -u/--m=
ax et\n"
+"-g/--governor\n"
+
+#: utils/set.c:342
+#, c-format
+msgid ""
+"At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
+"-g/--governor must be passed\n"
+msgstr ""
+"L'un de ces param=E8tres est obligatoire : -f/--freq, -d/--min, -u/--=
max et\n"
+"-g/--governor\n"
diff --git a/po/it.po b/po/it.po
index 36f09ed..4e9aa83 100644
--- a/po/it.po
+++ b/po/it.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: cpufrequtils 0.3\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2009-08-09 11:53+0200\n"
+"POT-Creation-Date: 2010-09-01 01:20+0200\n"
 "PO-Revision-Date: 2009-08-15 12:00+0900\n"
 "Last-Translator: Mattia Dongili <malattia@gmail.com>\n"
 "Language-Team: NONE\n"
diff --git a/po/pt.po b/po/pt.po
index 75cca0d..2baf1d5 100644
--- a/po/pt.po
+++ b/po/pt.po
@@ -8,7 +8,7 @@ msgid ""
 msgstr ""
 "Project-Id-Version: cpufrequtils 004\n"
 "Report-Msgid-Bugs-To: \n"
-"POT-Creation-Date: 2009-08-09 11:53+0200\n"
+"POT-Creation-Date: 2010-09-01 01:20+0200\n"
 "PO-Revision-Date: 2008-06-14 22:16-0400\n"
 "Last-Translator: Claudio Eduardo <claudioeddy@gmail.com>\n"
 "MIME-Version: 1.0\n"
--=20
1.6.4.2

