From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/4] cpufrequtils: Add cpuidle-info tool with some cstate library functions
Date: Thu, 23 Sep 2010 17:30:08 +0200
Message-ID: <1285255810-11252-3-git-send-email-trenn@suse.de>
References: <1285255810-11252-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1285255810-11252-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@dominikbrodowski.net
Cc: trenn@suse.de

lib/cpuidle.c is doing it very similar to lib/cpufreq.c
Most info is retrieved from:
/sys/devices/system/cpu/cpu0/cpuidle/state*
/sys/devices/system/cpu/cpuidle/*

The output is not meant to be fixed yet, but should be at some point.
Please provide suggestions how this could get enhanced!

default cpuidle-info reports:

--------------------------------

#> ./utils/cpuidle-info --silent -c0
CPUidle driver: acpi_idle
CPUidle governor: menu
Analyzing CPU 0:
Cstates: 4
Available C-states: C1 C2 C3

--------------------------------

#> /utils/cpuidle-info -c0
CPUidle driver: acpi_idle
CPUidle governor: menu
Analyzing CPU 0:
Cstates: 4
Available C-states: C1 C2 C3
C1:
Flags/Description: ACPI FFH INTEL MWAIT 0x0
Latency: 1
Usage: 366131
Duration: 379777661
C2:
Flags/Description: ACPI FFH INTEL MWAIT 0x10
Latency: 64
Usage: 1050392
Duration: 667633395
C3:
Flags/Description: ACPI FFH INTEL MWAIT 0x20
Latency: 96
Usage: 57846995
Duration: 868424861184

--------------------------------

#> ./utils/cpuidle-info --proc -c0
active state:            C0
max_cstate:              C3
maximum allowed latency: 2000000000 usec
states:
    C1:                  type[C1] promotion[--] demotion[--] latency[001] usage[00366132] duration[00000000000379777813]
    C2:                  type[C2] promotion[--] demotion[--] latency[064] usage[01050393] duration[00000000000667633592]
    C3:                  type[C3] promotion[--] demotion[--] latency[096] usage[57848625] duration[00000000868446911164]

--------------------------------

Notes to --proc compatible output:
active state is hardcoded to be C0 -> proc also always reports zero.

Same for promotion/demotion, it's also hardcoded in the kernel for some time
and returns zero info: [--]

max_cstate provides some sane info, instead of always C8 (proc).

maximum allowed latency is hardcoded, but it may make sense that cpuidle exports
this to userspace, cpuidle at least still uses the qos interface for its
decisions.

type which should differ ACPI exported and real C-state type is hardcoded for
now.

latency, usage and duration are retrieved from cpuidle.
Strange is that latency is the same, usage is the same, but the duration is
a rather different value when retrieved through cpuidle. /proc seem to be
broken, I could even get negativ values there. So better use cpuidle-info -o
instead reading out /proc/acpi/processor/*/power.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux@dominikbrodowski.net
CC: cpufreq@vger.kernel.org
---
 Makefile             |   13 +-
 lib/cpufreq.c        |   26 ++--
 lib/cpuidle.c        |   59 +++++++
 lib/cpuidle.h        |   32 ++++
 lib/sysfs.c          |  440 +++++++++++++++++++++++++++++++++++++++++---------
 lib/sysfs.h          |   42 ++++--
 utils/cpuidle-info.c |  305 ++++++++++++++++++++++++++++++++++
 7 files changed, 805 insertions(+), 112 deletions(-)
 create mode 100644 lib/cpuidle.c
 create mode 100644 lib/cpuidle.h
 create mode 100644 utils/cpuidle-info.c

diff --git a/Makefile b/Makefile
index aa4b9ff..07637ed 100644
--- a/Makefile
+++ b/Makefile
@@ -111,11 +111,11 @@ WARNINGS += -Wshadow
 CPPFLAGS += -DVERSION=\"$(VERSION)\" -DPACKAGE=\"$(PACKAGE)\" \
 		-DPACKAGE_BUGREPORT=\"$(PACKAGE_BUGREPORT)\" -D_GNU_SOURCE
 
-UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuid.h
-UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf
-LIB_HEADERS = 	lib/cpufreq.h lib/sysfs.h
-LIB_SRC = 	lib/cpufreq.c lib/sysfs.c
-LIB_OBJS = 	lib/cpufreq.o lib/sysfs.o
+UTIL_SRC = 	utils/cpufreq-info.c utils/cpufreq-set.c utils/cpufreq-aperf.c utils/cpuidle-info.c utils/cpuid.h
+UTIL_BINS = 	utils/cpufreq-info utils/cpufreq-set utils/cpufreq-aperf utils/cpuidle-info
+LIB_HEADERS = 	lib/cpufreq.h lib/cpuidle.h lib/sysfs.h
+LIB_SRC = 	lib/cpufreq.c lib/cpuidle.c lib/sysfs.c
+LIB_OBJS = 	lib/cpufreq.o lib/cpuidle.o lib/sysfs.o
 
 CFLAGS +=	-pipe
 
@@ -150,8 +150,6 @@ else
 endif
 
 
-
-
 # the actual make rules
 
 all: ccdv libcpufreq utils $(COMPILE_NLS) $(COMPILE_BENCH)
@@ -244,6 +242,7 @@ uninstall:
 	- rm -f $(DESTDIR)${bindir}/cpufreq-set
 	- rm -f $(DESTDIR)${bindir}/cpufreq-info
 	- rm -f $(DESTDIR)${bindir}/cpufreq-aperf
+	- rm -f $(DESTDIR)${bindir}/cpuidle-info
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-set.1
 	- rm -f $(DESTDIR)${mandir}/man1/cpufreq-info.1
 	- for HLANG in $(LANGUAGES); do \
diff --git a/lib/cpufreq.c b/lib/cpufreq.c
index 603dbf8..ae7d8c5 100644
--- a/lib/cpufreq.c
+++ b/lib/cpufreq.c
@@ -30,7 +30,7 @@ unsigned long cpufreq_get_freq_hardware(unsigned int cpu)
 
 unsigned long cpufreq_get_transition_latency(unsigned int cpu)
 {
-	return sysfs_get_transition_latency(cpu);
+	return sysfs_get_freq_transition_latency(cpu);
 }
 
 int cpufreq_get_hardware_limits(unsigned int cpu,
@@ -39,11 +39,11 @@ int cpufreq_get_hardware_limits(unsigned int cpu,
 {
 	if ((!min) || (!max))
 		return -EINVAL;
-	return sysfs_get_hardware_limits(cpu, min, max);
+	return sysfs_get_freq_hardware_limits(cpu, min, max);
 }
 
 char * cpufreq_get_driver(unsigned int cpu) {
-	return sysfs_get_driver(cpu);
+	return sysfs_get_freq_driver(cpu);
 }
 
 void cpufreq_put_driver(char * ptr) {
@@ -53,7 +53,7 @@ void cpufreq_put_driver(char * ptr) {
 }
 
 struct cpufreq_policy * cpufreq_get_policy(unsigned int cpu) {
-	return sysfs_get_policy(cpu);
+	return sysfs_get_freq_policy(cpu);
 }
 
 void cpufreq_put_policy(struct cpufreq_policy *policy) {
@@ -66,7 +66,7 @@ void cpufreq_put_policy(struct cpufreq_policy *policy) {
 }
 
 struct cpufreq_available_governors * cpufreq_get_available_governors(unsigned int cpu) {
-	return sysfs_get_available_governors(cpu);
+	return sysfs_get_freq_available_governors(cpu);
 }
 
 void cpufreq_put_available_governors(struct cpufreq_available_governors *any) {
@@ -106,7 +106,7 @@ void cpufreq_put_available_frequencies(struct cpufreq_available_frequencies *any
 
 
 struct cpufreq_affected_cpus * cpufreq_get_affected_cpus(unsigned int cpu) {
-	return sysfs_get_affected_cpus(cpu);
+	return sysfs_get_freq_affected_cpus(cpu);
 }
 
 void cpufreq_put_affected_cpus(struct cpufreq_affected_cpus *any) {
@@ -125,7 +125,7 @@ void cpufreq_put_affected_cpus(struct cpufreq_affected_cpus *any) {
 
 
 struct cpufreq_affected_cpus * cpufreq_get_related_cpus(unsigned int cpu) {
-	return sysfs_get_related_cpus(cpu);
+	return sysfs_get_freq_related_cpus(cpu);
 }
 
 void cpufreq_put_related_cpus(struct cpufreq_affected_cpus *any) {
@@ -137,17 +137,17 @@ int cpufreq_set_policy(unsigned int cpu, struct cpufreq_policy *policy) {
 	if (!policy || !(policy->governor))
 		return -EINVAL;
 
-	return sysfs_set_policy(cpu, policy);
+	return sysfs_set_freq_policy(cpu, policy);
 }
 
 
 int cpufreq_modify_policy_min(unsigned int cpu, unsigned long min_freq) {
-	return sysfs_modify_policy_min(cpu, min_freq);
+	return sysfs_modify_freq_policy_min(cpu, min_freq);
 }
 
 
 int cpufreq_modify_policy_max(unsigned int cpu, unsigned long max_freq) {
-	return sysfs_modify_policy_max(cpu, max_freq);
+	return sysfs_modify_freq_policy_max(cpu, max_freq);
 }
 
 
@@ -155,7 +155,7 @@ int cpufreq_modify_policy_governor(unsigned int cpu, char *governor) {
 	if ((!governor) || (strlen(governor) > 19))
 		return -EINVAL;
 
-	return sysfs_modify_policy_governor(cpu, governor);
+	return sysfs_modify_freq_policy_governor(cpu, governor);
 }
 
 int cpufreq_set_frequency(unsigned int cpu, unsigned long target_frequency) {
@@ -165,7 +165,7 @@ int cpufreq_set_frequency(unsigned int cpu, unsigned long target_frequency) {
 struct cpufreq_stats * cpufreq_get_stats(unsigned int cpu, unsigned long long *total_time) {
 	struct cpufreq_stats *ret;
 
-	ret = sysfs_get_stats(cpu, total_time);
+	ret = sysfs_get_freq_stats(cpu, total_time);
 	return (ret);
 }
 
@@ -184,7 +184,7 @@ void cpufreq_put_stats(struct cpufreq_stats *any) {
 }
 
 unsigned long cpufreq_get_transitions(unsigned int cpu) {
-	unsigned long ret = sysfs_get_transitions(cpu);
+	unsigned long ret = sysfs_get_freq_transitions(cpu);
 
 	return (ret);
 }
diff --git a/lib/cpuidle.c b/lib/cpuidle.c
new file mode 100644
index 0000000..f37cdea
--- /dev/null
+++ b/lib/cpuidle.c
@@ -0,0 +1,59 @@
+/*
+ *  (C) 2004-2009  Dominik Brodowski <linux@dominikbrodowski.de>
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ */
+
+
+#include <stdio.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+#include <unistd.h>
+
+#include "cpuidle.h"
+#include "sysfs.h"
+
+/* read access to files which contain one numeric value */
+
+int cpuidle_get_cstate_count(unsigned int cpu) {
+	return sysfs_get_cstate_count(cpu);
+}
+
+unsigned long cpuidle_get_cstate_latency(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_get_cstate_latency(cpu, cstate);
+}
+
+unsigned long cpuidle_get_cstate_usage(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_get_cstate_usage(cpu, cstate);
+}
+
+unsigned long long cpuidle_get_cstate_time(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_get_cstate_time(cpu, cstate);
+}
+
+char * cpuidle_get_cstate_name(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_get_cstate_name(cpu, cstate);
+}
+
+char * cpuidle_get_cstate_desc(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_get_cstate_desc(cpu, cstate);
+}
+
+char * cpuidle_get_driver(void)
+{
+	return sysfs_get_cpuidle_driver();
+}
+
+char * cpuidle_get_governor(void)
+{
+	return sysfs_get_cpuidle_governor();
+}
diff --git a/lib/cpuidle.h b/lib/cpuidle.h
new file mode 100644
index 0000000..78263fb
--- /dev/null
+++ b/lib/cpuidle.h
@@ -0,0 +1,32 @@
+/*
+ *  cpuidle.h - definitions for libcpupower
+ *
+ *  Copyright (C) 2010  Thomas Renninger <trenn@suse.de>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation, version 2 of the License.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, write to the Free Software
+ *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ */
+
+extern int cpuidle_get_cstate_count(unsigned int cpu);
+extern unsigned long cpuidle_get_cstate_latency(unsigned int cpu,
+						unsigned int cstate);
+extern unsigned long cpuidle_get_cstate_usage(unsigned int cpu,
+					      unsigned int cstate);
+extern unsigned long long cpuidle_get_cstate_time(unsigned int cpu,
+					   unsigned int cstate);
+extern char * cpuidle_get_cstate_name(unsigned int cpu, unsigned int cstate);
+extern char * cpuidle_get_cstate_desc(unsigned int cpu, unsigned int cstate);
+extern char * cpuidle_get_driver(void);
+extern char * cpuidle_get_governor(void);
+
+
diff --git a/lib/sysfs.c b/lib/sysfs.c
index 4e0edab..2cc368a 100644
--- a/lib/sysfs.c
+++ b/lib/sysfs.c
@@ -21,9 +21,12 @@
 #define MAX_LINE_LEN 255
 #define SYSFS_PATH_MAX 255
 
+/* CPUFREQ sysfs access **************************************************/
+
 /* helper function to read file from /sys into given buffer */
 /* fname is a relative path under "cpuX/cpufreq" dir */
-unsigned int sysfs_read_file(unsigned int cpu, const char *fname, char *buf, size_t buflen)
+unsigned int sysfs_cpufreq_read_file(unsigned int cpu, const char *fname,
+				     char *buf, size_t buflen)
 {
 	char path[SYSFS_PATH_MAX];
 	int fd;
@@ -50,7 +53,8 @@ unsigned int sysfs_read_file(unsigned int cpu, const char *fname, char *buf, siz
 
 /* helper function to write a new value to a /sys file */
 /* fname is a relative path under "cpuX/cpufreq" dir */
-unsigned int sysfs_write_file(unsigned int cpu, const char *fname, const char *value, size_t len)
+unsigned int sysfs_cpufreq_write_file(unsigned int cpu, const char *fname,
+				      const char *value, size_t len)
 {
 	char path[SYSFS_PATH_MAX];
 	int fd;
@@ -76,7 +80,7 @@ unsigned int sysfs_write_file(unsigned int cpu, const char *fname, const char *v
 
 /* read access to files which contain one numeric value */
 
-enum {
+enum cpufreq_value {
 	CPUINFO_CUR_FREQ,
 	CPUINFO_MIN_FREQ,
 	CPUINFO_MAX_FREQ,
@@ -85,10 +89,10 @@ enum {
 	SCALING_MIN_FREQ,
 	SCALING_MAX_FREQ,
 	STATS_NUM_TRANSITIONS,
-	MAX_VALUE_FILES
+	MAX_CPUFREQ_VALUE_READ_FILES
 };
 
-static const char *value_files[MAX_VALUE_FILES] = {
+static const char *cpufreq_value_files[MAX_CPUFREQ_VALUE_READ_FILES] = {
 	[CPUINFO_CUR_FREQ] = "cpuinfo_cur_freq",
 	[CPUINFO_MIN_FREQ] = "cpuinfo_min_freq",
 	[CPUINFO_MAX_FREQ] = "cpuinfo_max_freq",
@@ -100,20 +104,20 @@ static const char *value_files[MAX_VALUE_FILES] = {
 };
 
 
-static unsigned long sysfs_get_one_value(unsigned int cpu, unsigned int which)
+static unsigned long sysfs_cpufreq_get_one_value(unsigned int cpu,
+						 enum cpufreq_value which)
 {
  	unsigned long value;
 	unsigned int len;
 	char linebuf[MAX_LINE_LEN];
 	char *endp;
 
-	if ( which >= MAX_VALUE_FILES )
+	if ( which >= MAX_CPUFREQ_VALUE_READ_FILES )
 		return 0;
 
-	if ( ( len = sysfs_read_file(cpu, value_files[which], linebuf, sizeof(linebuf))) == 0 )
-	{
+	if ( ( len = sysfs_cpufreq_read_file(cpu, cpufreq_value_files[which],
+					     linebuf, sizeof(linebuf))) == 0 )
 		return 0;
-	}
 
 	value = strtoul(linebuf, &endp, 0);
 
@@ -125,31 +129,31 @@ static unsigned long sysfs_get_one_value(unsigned int cpu, unsigned int which)
 
 /* read access to files which contain one string */
 
-enum {
+enum cpufreq_string {
 	SCALING_DRIVER,
 	SCALING_GOVERNOR,
-	MAX_STRING_FILES
+	MAX_CPUFREQ_STRING_FILES
 };
 
-static const char *string_files[MAX_STRING_FILES] = {
+static const char *cpufreq_string_files[MAX_CPUFREQ_STRING_FILES] = {
 	[SCALING_DRIVER] = "scaling_driver",
 	[SCALING_GOVERNOR] = "scaling_governor",
 };
 
 
-static char * sysfs_get_one_string(unsigned int cpu, unsigned int which)
+static char * sysfs_cpufreq_get_one_string(unsigned int cpu,
+					   enum cpufreq_string which)
 {
 	char linebuf[MAX_LINE_LEN];
 	char *result;
 	unsigned int len;
 
-	if (which >= MAX_STRING_FILES)
+	if (which >= MAX_CPUFREQ_STRING_FILES)
 		return NULL;
 
-	if ( ( len = sysfs_read_file(cpu, string_files[which], linebuf, sizeof(linebuf))) == 0 )
-	{
+	if ( ( len = sysfs_cpufreq_read_file(cpu, cpufreq_string_files[which],
+					     linebuf, sizeof(linebuf))) == 0 )
 		return NULL;
-	}
 
 	if ( ( result = strdup(linebuf) ) == NULL )
 		return NULL;
@@ -162,99 +166,86 @@ static char * sysfs_get_one_string(unsigned int cpu, unsigned int which)
 
 /* write access */
 
-enum {
+enum cpufreq_write {
 	WRITE_SCALING_MIN_FREQ,
 	WRITE_SCALING_MAX_FREQ,
 	WRITE_SCALING_GOVERNOR,
 	WRITE_SCALING_SET_SPEED,
-	MAX_WRITE_FILES
+	MAX_CPUFREQ_WRITE_FILES
 };
 
-static const char *write_files[MAX_VALUE_FILES] = {
+static const char *cpufreq_write_files[MAX_CPUFREQ_WRITE_FILES] = {
 	[WRITE_SCALING_MIN_FREQ] = "scaling_min_freq",
 	[WRITE_SCALING_MAX_FREQ] = "scaling_max_freq",
 	[WRITE_SCALING_GOVERNOR] = "scaling_governor",
 	[WRITE_SCALING_SET_SPEED] = "scaling_setspeed",
 };
 
-static int sysfs_write_one_value(unsigned int cpu, unsigned int which,
-				 const char *new_value, size_t len)
+static int sysfs_cpufreq_write_one_value(unsigned int cpu,
+					 enum cpufreq_write which,
+					 const char *new_value, size_t len)
 {
-	if (which >= MAX_WRITE_FILES)
+	if (which >= MAX_CPUFREQ_WRITE_FILES)
 		return 0;
 
-	if ( sysfs_write_file(cpu, write_files[which], new_value, len) != len )
+	if ( sysfs_cpufreq_write_file(cpu, cpufreq_write_files[which],
+			      new_value, len) != len )
 		return -ENODEV;
 
 	return 0;
 };
 
-
-int sysfs_cpu_exists(unsigned int cpu)
-{
-	char file[SYSFS_PATH_MAX];
-	struct stat statbuf;
-
-	snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU "cpu%u/", cpu);
-
-	if ( stat(file, &statbuf) != 0 )
-		return -ENOSYS;
-
-	return S_ISDIR(statbuf.st_mode) ? 0 : -ENOSYS;
-}
-
-
 unsigned long sysfs_get_freq_kernel(unsigned int cpu)
 {
-	return sysfs_get_one_value(cpu, SCALING_CUR_FREQ);
+	return sysfs_cpufreq_get_one_value(cpu, SCALING_CUR_FREQ);
 }
 
 unsigned long sysfs_get_freq_hardware(unsigned int cpu)
 {
-	return sysfs_get_one_value(cpu, CPUINFO_CUR_FREQ);
+	return sysfs_cpufreq_get_one_value(cpu, CPUINFO_CUR_FREQ);
 }
 
-unsigned long sysfs_get_transition_latency(unsigned int cpu)
+unsigned long sysfs_get_freq_transition_latency(unsigned int cpu)
 {
-	return sysfs_get_one_value(cpu, CPUINFO_LATENCY);
+	return sysfs_cpufreq_get_one_value(cpu, CPUINFO_LATENCY);
 }
 
-int sysfs_get_hardware_limits(unsigned int cpu,
+int sysfs_get_freq_hardware_limits(unsigned int cpu,
 			      unsigned long *min,
 			      unsigned long *max)
 {
 	if ((!min) || (!max))
 		return -EINVAL;
 
-	*min = sysfs_get_one_value(cpu, CPUINFO_MIN_FREQ);
+	*min = sysfs_cpufreq_get_one_value(cpu, CPUINFO_MIN_FREQ);
 	if (!*min)
 		return -ENODEV;
 
-	*max = sysfs_get_one_value(cpu, CPUINFO_MAX_FREQ);
+	*max = sysfs_cpufreq_get_one_value(cpu, CPUINFO_MAX_FREQ);
 	if (!*max)
 		return -ENODEV;
 
 	return 0;
 }
 
-char * sysfs_get_driver(unsigned int cpu) {
-	return sysfs_get_one_string(cpu, SCALING_DRIVER);
+char * sysfs_get_freq_driver(unsigned int cpu) {
+	return sysfs_cpufreq_get_one_string(cpu, SCALING_DRIVER);
 }
 
-struct cpufreq_policy * sysfs_get_policy(unsigned int cpu) {
+struct cpufreq_policy * sysfs_get_freq_policy(unsigned int cpu) {
 	struct cpufreq_policy *policy;
 
 	policy = malloc(sizeof(struct cpufreq_policy));
 	if (!policy)
 		return NULL;
 
-	policy->governor = sysfs_get_one_string(cpu, SCALING_GOVERNOR);
+	policy->governor = sysfs_cpufreq_get_one_string(cpu, SCALING_GOVERNOR);
 	if (!policy->governor) {
 		free(policy);
 		return NULL;
 	}
-	policy->min = sysfs_get_one_value(cpu, SCALING_MIN_FREQ);
-	policy->max = sysfs_get_one_value(cpu, SCALING_MAX_FREQ);
+	policy->min = sysfs_cpufreq_get_one_value(cpu, SCALING_MIN_FREQ);
+	policy->max = sysfs_cpufreq_get_one_value(cpu, SCALING_MAX_FREQ);
 	if ((!policy->min) || (!policy->max)) {
 		free(policy->governor);
 		free(policy);
@@ -264,14 +255,16 @@ struct cpufreq_policy * sysfs_get_policy(unsigned int cpu) {
 	return policy;
 }
 
-struct cpufreq_available_governors * sysfs_get_available_governors(unsigned int cpu) {
+struct cpufreq_available_governors *
+sysfs_get_freq_available_governors(unsigned int cpu) {
 	struct cpufreq_available_governors *first = NULL;
 	struct cpufreq_available_governors *current = NULL;
 	char linebuf[MAX_LINE_LEN];
 	unsigned int pos, i;
 	unsigned int len;
 
-	if ( ( len = sysfs_read_file(cpu, "scaling_available_governors", linebuf, sizeof(linebuf))) == 0 )
+	if ( ( len = sysfs_cpufreq_read_file(cpu, "scaling_available_governors",
+					     linebuf, sizeof(linebuf))) == 0 )
 	{
 		return NULL;
 	}
@@ -321,7 +314,8 @@ struct cpufreq_available_governors * sysfs_get_available_governors(unsigned int
 }
 
 
-struct cpufreq_available_frequencies * sysfs_get_available_frequencies(unsigned int cpu) {
+struct cpufreq_available_frequencies *
+sysfs_get_available_frequencies(unsigned int cpu) {
 	struct cpufreq_available_frequencies *first = NULL;
 	struct cpufreq_available_frequencies *current = NULL;
 	char one_value[SYSFS_PATH_MAX];
@@ -329,7 +323,9 @@ struct cpufreq_available_frequencies * sysfs_get_available_frequencies(unsigned
 	unsigned int pos, i;
 	unsigned int len;
 
-	if ( ( len = sysfs_read_file(cpu, "scaling_available_frequencies", linebuf, sizeof(linebuf))) == 0 )
+	if ( ( len = sysfs_cpufreq_read_file(cpu,
+					     "scaling_available_frequencies",
+					     linebuf, sizeof(linebuf))) == 0 )
 	{
 		return NULL;
 	}
@@ -386,7 +382,8 @@ static struct cpufreq_affected_cpus * sysfs_get_cpu_list(unsigned int cpu,
 	unsigned int pos, i;
 	unsigned int len;
 
-	if ( ( len = sysfs_read_file(cpu, file, linebuf, sizeof(linebuf))) == 0 )
+	if ( ( len = sysfs_cpufreq_read_file(cpu, file, linebuf,
+					     sizeof(linebuf))) == 0 )
 	{
 		return NULL;
 	}
@@ -435,15 +432,15 @@ static struct cpufreq_affected_cpus * sysfs_get_cpu_list(unsigned int cpu,
 	return NULL;
 }
 
-struct cpufreq_affected_cpus * sysfs_get_affected_cpus(unsigned int cpu) {
+struct cpufreq_affected_cpus * sysfs_get_freq_affected_cpus(unsigned int cpu) {
 	return sysfs_get_cpu_list(cpu, "affected_cpus");
 }
 
-struct cpufreq_affected_cpus * sysfs_get_related_cpus(unsigned int cpu) {
+struct cpufreq_affected_cpus * sysfs_get_freq_related_cpus(unsigned int cpu) {
 	return sysfs_get_cpu_list(cpu, "related_cpus");
 }
 
-struct cpufreq_stats * sysfs_get_stats(unsigned int cpu, unsigned long long *total_time) {
+struct cpufreq_stats * sysfs_get_freq_stats(unsigned int cpu, unsigned long long *total_time) {
 	struct cpufreq_stats *first = NULL;
 	struct cpufreq_stats *current = NULL;
 	char one_value[SYSFS_PATH_MAX];
@@ -451,7 +448,8 @@ struct cpufreq_stats * sysfs_get_stats(unsigned int cpu, unsigned long long *tot
 	unsigned int pos, i;
 	unsigned int len;
 
-	if ( ( len = sysfs_read_file(cpu, "stats/time_in_state", linebuf, sizeof(linebuf))) == 0 )
+	if ( ( len = sysfs_cpufreq_read_file(cpu, "stats/time_in_state",
+					     linebuf, sizeof(linebuf))) == 0 )
 		return NULL;
 
 	*total_time = 0;
@@ -499,9 +497,9 @@ struct cpufreq_stats * sysfs_get_stats(unsigned int cpu, unsigned long long *tot
 	return NULL;
 }
 
-unsigned long sysfs_get_transitions(unsigned int cpu)
+unsigned long sysfs_get_freq_transitions(unsigned int cpu)
 {
-	return sysfs_get_one_value(cpu, STATS_NUM_TRANSITIONS);
+	return sysfs_cpufreq_get_one_value(cpu, STATS_NUM_TRANSITIONS);
 }
 
 static int verify_gov(char *new_gov, char *passed_gov)
@@ -539,7 +537,7 @@ static int verify_gov(char *new_gov, char *passed_gov)
 	return 0;
 }
 
-int sysfs_modify_policy_governor(unsigned int cpu, char *governor)
+int sysfs_modify_freq_policy_governor(unsigned int cpu, char *governor)
 {
 	char new_gov[SYSFS_PATH_MAX];
 
@@ -549,30 +547,33 @@ int sysfs_modify_policy_governor(unsigned int cpu, char *governor)
 	if (verify_gov(new_gov, governor))
 		return -EINVAL;
 
-	return sysfs_write_one_value(cpu, WRITE_SCALING_GOVERNOR, new_gov, strlen(new_gov));
+	return sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_GOVERNOR,
+					     new_gov, strlen(new_gov));
 };
 
-int sysfs_modify_policy_max(unsigned int cpu, unsigned long max_freq)
+int sysfs_modify_freq_policy_max(unsigned int cpu, unsigned long max_freq)
 {
 	char value[SYSFS_PATH_MAX];
 
 	snprintf(value, SYSFS_PATH_MAX, "%lu", max_freq);
 
-	return sysfs_write_one_value(cpu, WRITE_SCALING_MAX_FREQ, value, strlen(value));
+	return sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_MAX_FREQ,
+					     value, strlen(value));
 };
 
 
-int sysfs_modify_policy_min(unsigned int cpu, unsigned long min_freq)
+int sysfs_modify_freq_policy_min(unsigned int cpu, unsigned long min_freq)
 {
 	char value[SYSFS_PATH_MAX];
 
 	snprintf(value, SYSFS_PATH_MAX, "%lu", min_freq);
 
-	return sysfs_write_one_value(cpu, WRITE_SCALING_MIN_FREQ, value, strlen(value));
+	return sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_MIN_FREQ,
+					     value, strlen(value));
 };
 
 
-int sysfs_set_policy(unsigned int cpu, struct cpufreq_policy *policy)
+int sysfs_set_freq_policy(unsigned int cpu, struct cpufreq_policy *policy)
 {
 	char min[SYSFS_PATH_MAX];
 	char max[SYSFS_PATH_MAX];
@@ -593,30 +594,34 @@ int sysfs_set_policy(unsigned int cpu, struct cpufreq_policy *policy)
 	snprintf(min, SYSFS_PATH_MAX, "%lu", policy->min);
 	snprintf(max, SYSFS_PATH_MAX, "%lu", policy->max);
 
-	old_min = sysfs_get_one_value(cpu, SCALING_MIN_FREQ);
+	old_min = sysfs_cpufreq_get_one_value(cpu, SCALING_MIN_FREQ);
 	write_max_first = (old_min && (policy->max < old_min) ? 0 : 1);
 
 	if (write_max_first) {
-		ret = sysfs_write_one_value(cpu, WRITE_SCALING_MAX_FREQ, max, strlen(max));
+		ret = sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_MAX_FREQ,
+						    max, strlen(max));
 		if (ret)
 			return ret;
 	}
 
-	ret = sysfs_write_one_value(cpu, WRITE_SCALING_MIN_FREQ, min, strlen(min));
+	ret = sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_MIN_FREQ, min,
+					    strlen(min));
 	if (ret)
 		return ret;
 
 	if (!write_max_first) {
-		ret = sysfs_write_one_value(cpu, WRITE_SCALING_MAX_FREQ, max, strlen(max));
+		ret = sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_MAX_FREQ,
+						    max, strlen(max));
 		if (ret)
 			return ret;
 	}
 
-	return sysfs_write_one_value(cpu, WRITE_SCALING_GOVERNOR, gov, strlen(gov));
+	return sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_GOVERNOR,
+					     gov, strlen(gov));
 }
 
 int sysfs_set_frequency(unsigned int cpu, unsigned long target_frequency) {
-	struct cpufreq_policy *pol = sysfs_get_policy(cpu);
+	struct cpufreq_policy *pol = sysfs_get_freq_policy(cpu);
 	char userspace_gov[] = "userspace";
 	char freq[SYSFS_PATH_MAX];
 	int ret;
@@ -625,7 +630,7 @@ int sysfs_set_frequency(unsigned int cpu, unsigned long target_frequency) {
 		return -ENODEV;
 
 	if (strncmp(pol->governor, userspace_gov, 9) != 0) {
-		ret = sysfs_modify_policy_governor(cpu, userspace_gov);
+		ret = sysfs_modify_freq_policy_governor(cpu, userspace_gov);
 		if (ret) {
 			cpufreq_put_policy(pol);
 			return (ret);
@@ -636,5 +641,282 @@ int sysfs_set_frequency(unsigned int cpu, unsigned long target_frequency) {
 
 	snprintf(freq, SYSFS_PATH_MAX, "%lu", target_frequency);
 
-	return sysfs_write_one_value(cpu, WRITE_SCALING_SET_SPEED, freq, strlen(freq));
+	return sysfs_cpufreq_write_one_value(cpu, WRITE_SCALING_SET_SPEED,
+					     freq, strlen(freq));
+}
+
+/* CPUFREQ sysfs access **************************************************/
+
+/* CPUidle Cstate specific /sys/devices/system/cpu/cpuX/cpuidle/ access */
+
+/*
+ * helper function to read file from /sys into given buffer
+ * fname is a relative path under "cpuX/cpuidle/stateX/" dir
+ * cstates starting with 0, C0 is not counted as cstate.
+ * This means if you want C1 info, pass 0 as cstate param
+ */
+unsigned int sysfs_cstate_read_file(unsigned int cpu, unsigned int cstate,
+			     const char *fname, char *buf, size_t buflen)
+{
+	char path[SYSFS_PATH_MAX];
+	int fd;
+	size_t numread;
+
+	snprintf(path, sizeof(path), PATH_TO_CPU "cpu%u/cpuidle/state%u/%s",
+		 cpu, cstate, fname);
+
+	if ( ( fd = open(path, O_RDONLY) ) == -1 )
+		return 0;
+
+	numread = read(fd, buf, buflen - 1);
+	if ( numread < 1 )
+	{
+		close(fd);
+		return 0;
+	}
+
+	buf[numread] = '\0';
+	close(fd);
+
+	return numread;
 }
+
+/* read access to files which contain one numeric value */
+
+enum cstate_value {
+	CSTATE_USAGE,
+	CSTATE_POWER,
+	CSTATE_LATENCY,
+	CSTATE_TIME,
+	MAX_CSTATE_VALUE_FILES
+};
+
+static const char *cstate_value_files[MAX_CSTATE_VALUE_FILES] = {
+	[CSTATE_USAGE] = "usage",
+	[CSTATE_POWER] = "power",
+	[CSTATE_LATENCY] = "latency",
+	[CSTATE_TIME]  = "time",
+};
+
+static unsigned long long sysfs_cstate_get_one_value(unsigned int cpu,
+						     unsigned int cstate,
+						     enum cstate_value which)
+{
+ 	unsigned long value;
+	unsigned int len;
+	char linebuf[MAX_LINE_LEN];
+	char *endp;
+
+	if ( which >= MAX_CSTATE_VALUE_FILES )
+		return 0;
+
+	if ( ( len = sysfs_cstate_read_file(cpu, cstate,
+					    cstate_value_files[which],
+					    linebuf, sizeof(linebuf))) == 0 )
+	{
+		return 0;
+	}
+
+	value = strtoul(linebuf, &endp, 0);
+
+	if ( endp == linebuf || errno == ERANGE )
+		return 0;
+
+	return value;
+}
+
+/* read access to files which contain one string */
+
+enum cstate_string {
+	CSTATE_DESC,
+	CSTATE_NAME,
+	MAX_CSTATE_STRING_FILES
+};
+
+static const char *cstate_string_files[MAX_CSTATE_STRING_FILES] = {
+	[CSTATE_DESC] = "desc",
+	[CSTATE_NAME] = "name",
+};
+
+
+static char * sysfs_cstate_get_one_string(unsigned int cpu,
+					  unsigned int cstate,
+					  enum cstate_string which)
+{
+	char linebuf[MAX_LINE_LEN];
+	char *result;
+	unsigned int len;
+
+	if (which >= MAX_CSTATE_STRING_FILES)
+		return NULL;
+
+	if ( ( len = sysfs_cstate_read_file(cpu, cstate,
+					    cstate_string_files[which],
+					    linebuf, sizeof(linebuf))) == 0 )
+		return NULL;
+
+	if ( ( result = strdup(linebuf) ) == NULL )
+		return NULL;
+
+	if (result[strlen(result) - 1] == '\n')
+		result[strlen(result) - 1] = '\0';
+
+	return result;
+}
+
+unsigned long sysfs_get_cstate_latency(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_cstate_get_one_value(cpu, cstate, CSTATE_LATENCY);
+}
+
+unsigned long sysfs_get_cstate_usage(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_cstate_get_one_value(cpu, cstate, CSTATE_USAGE);
+}
+
+unsigned long long sysfs_get_cstate_time(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_cstate_get_one_value(cpu, cstate, CSTATE_TIME);
+}
+
+char * sysfs_get_cstate_name(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_cstate_get_one_string(cpu, cstate, CSTATE_NAME);
+}
+
+char * sysfs_get_cstate_desc(unsigned int cpu, unsigned int cstate)
+{
+	return sysfs_cstate_get_one_string(cpu, cstate, CSTATE_DESC);
+}
+
+/*
+ * Returns number of supported C-states of CPU core cpu
+ * Negativ in error case
+ * Zero if cpuidle does not export any C-states
+ */
+int sysfs_get_cstate_count(unsigned int cpu)
+{
+	char file[SYSFS_PATH_MAX];
+	struct stat statbuf;
+	int cstates = 1;
+
+	
+	snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU "cpuidle");
+	if ( stat(file, &statbuf) != 0 || !S_ISDIR(statbuf.st_mode))
+		return -ENODEV;
+
+	snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU "cpu%u/cpuidle/state0", cpu);
+	if ( stat(file, &statbuf) != 0 || !S_ISDIR(statbuf.st_mode))
+		return 0;
+
+	while(stat(file, &statbuf) == 0 && S_ISDIR(statbuf.st_mode)) {
+		snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU
+			 "cpu%u/cpuidle/state%d", cpu, cstates);
+		cstates++;
+	}
+	cstates--;
+	return cstates;
+}
+
+/* CPUidle Cstate specific /sys/devices/system/cpu/cpuX/cpuidle/ access */
+
+/* CPUidle general /sys/devices/system/cpu/cpuidle/ sysfs access ********/
+
+/*
+ * helper function to read file from /sys into given buffer
+ * fname is a relative path under "cpu/cpuidle/" dir
+ */
+unsigned int sysfs_cpuidle_read_file(const char *fname, char *buf,
+				     size_t buflen)
+{
+	char path[SYSFS_PATH_MAX];
+	int fd;
+	size_t numread;
+
+	snprintf(path, sizeof(path), PATH_TO_CPU "cpuidle/%s", fname);
+
+	if ( ( fd = open(path, O_RDONLY) ) == -1 )
+		return 0;
+
+	numread = read(fd, buf, buflen - 1);
+	if ( numread < 1 )
+	{
+		close(fd);
+		return 0;
+	}
+
+	buf[numread] = '\0';
+	close(fd);
+
+	return numread;
+}
+
+/* read access to files which contain one string */
+
+enum cpuidle_string {
+	CPUIDLE_GOVERNOR,
+	CPUIDLE_GOVERNOR_RO,
+	CPUIDLE_DRIVER,
+	MAX_CPUIDLE_STRING_FILES
+};
+
+static const char *cpuidle_string_files[MAX_CPUIDLE_STRING_FILES] = {
+	[CPUIDLE_GOVERNOR]	= "current_governor",
+	[CPUIDLE_GOVERNOR_RO]	= "current_governor_ro",
+	[CPUIDLE_DRIVER]	= "current_driver",
+};
+
+
+static char * sysfs_cpuidle_get_one_string(enum cpuidle_string which)
+{
+	char linebuf[MAX_LINE_LEN];
+	char *result;
+	unsigned int len;
+
+	if (which >= MAX_CPUIDLE_STRING_FILES)
+		return NULL;
+
+	if ( ( len = sysfs_cpuidle_read_file(cpuidle_string_files[which],
+					    linebuf, sizeof(linebuf))) == 0 )
+		return NULL;
+
+	if ( ( result = strdup(linebuf) ) == NULL )
+		return NULL;
+
+	if (result[strlen(result) - 1] == '\n')
+		result[strlen(result) - 1] = '\0';
+
+	return result;
+}
+
+char * sysfs_get_cpuidle_governor(void)
+{
+	char *tmp = sysfs_cpuidle_get_one_string(CPUIDLE_GOVERNOR_RO);
+	if (!tmp)
+		return sysfs_cpuidle_get_one_string(CPUIDLE_GOVERNOR);
+	else
+		return tmp;
+}
+
+char * sysfs_get_cpuidle_driver(void)
+{
+	return sysfs_cpuidle_get_one_string(CPUIDLE_DRIVER);
+}
+
+/* CPUidle general /sys/devices/system/cpu/cpuidle/ sysfs access ********/
+
+/* General sysfs access **************************************************/
+int sysfs_cpu_exists(unsigned int cpu)
+{
+	char file[SYSFS_PATH_MAX];
+	struct stat statbuf;
+
+	snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU "cpu%u/", cpu);
+
+	if ( stat(file, &statbuf) != 0 )
+		return -ENOSYS;
+
+	return S_ISDIR(statbuf.st_mode) ? 0 : -ENOSYS;
+}
+/* General sysfs access **************************************************/
+
diff --git a/lib/sysfs.h b/lib/sysfs.h
index b8a2b69..c0eed4e 100644
--- a/lib/sysfs.h
+++ b/lib/sysfs.h
@@ -1,19 +1,35 @@
+/* General */
 extern unsigned int sysfs_cpu_exists(unsigned int cpu);
+
+/* CPUfreq */
 extern unsigned long sysfs_get_freq_kernel(unsigned int cpu);
 extern unsigned long sysfs_get_freq_hardware(unsigned int cpu);
-extern unsigned long sysfs_get_transition_latency(unsigned int cpu);
-extern int sysfs_get_hardware_limits(unsigned int cpu, unsigned long *min, unsigned long *max);
-extern char * sysfs_get_driver(unsigned int cpu);
-extern struct cpufreq_policy * sysfs_get_policy(unsigned int cpu);
-extern struct cpufreq_available_governors * sysfs_get_available_governors(unsigned int cpu);
+extern unsigned long sysfs_get_freq_transition_latency(unsigned int cpu);
+extern int sysfs_get_freq_hardware_limits(unsigned int cpu, unsigned long *min, unsigned long *max);
+extern char * sysfs_get_freq_driver(unsigned int cpu);
+extern struct cpufreq_policy * sysfs_get_freq_policy(unsigned int cpu);
+extern struct cpufreq_available_governors * sysfs_get_freq_available_governors(unsigned int cpu);
 extern struct cpufreq_available_frequencies * sysfs_get_available_frequencies(unsigned int cpu);
-extern struct cpufreq_affected_cpus * sysfs_get_affected_cpus(unsigned int cpu);
-extern struct cpufreq_affected_cpus * sysfs_get_related_cpus(unsigned int cpu);
-extern struct cpufreq_stats * sysfs_get_stats(unsigned int cpu, unsigned long long *total_time);
-extern unsigned long sysfs_get_transitions(unsigned int cpu);
-extern int sysfs_set_policy(unsigned int cpu, struct cpufreq_policy *policy);
-extern int sysfs_modify_policy_min(unsigned int cpu, unsigned long min_freq);
-extern int sysfs_modify_policy_max(unsigned int cpu, unsigned long max_freq);
-extern int sysfs_modify_policy_governor(unsigned int cpu, char *governor);
+extern struct cpufreq_affected_cpus * sysfs_get_freq_affected_cpus(unsigned int cpu);
+extern struct cpufreq_affected_cpus * sysfs_get_freq_related_cpus(unsigned int cpu);
+extern struct cpufreq_stats * sysfs_get_freq_stats(unsigned int cpu, unsigned long long *total_time);
+extern unsigned long sysfs_get_freq_transitions(unsigned int cpu);
+extern int sysfs_set_freq_policy(unsigned int cpu, struct cpufreq_policy *policy);
+extern int sysfs_modify_freq_policy_min(unsigned int cpu, unsigned long min_freq);
+extern int sysfs_modify_freq_policy_max(unsigned int cpu, unsigned long max_freq);
+extern int sysfs_modify_freq_policy_governor(unsigned int cpu, char *governor);
 extern int sysfs_set_frequency(unsigned int cpu, unsigned long target_frequency);
 
+/* CPUidle - Cstates */
+extern unsigned long sysfs_get_cstate_latency(unsigned int cpu, unsigned int cstate);
+extern unsigned long sysfs_get_cstate_usage(unsigned int cpu, unsigned int cstate);
+extern unsigned long long sysfs_get_cstate_time(unsigned int cpu, unsigned int cstate);
+extern char * sysfs_get_cstate_name(unsigned int cpu, unsigned int cstate);
+extern char * sysfs_get_cstate_desc(unsigned int cpu, unsigned int cstate);
+extern int sysfs_get_cstate_count(unsigned int cpu);
+
+extern char * sysfs_get_cpuidle_governor(void);
+extern char * sysfs_get_cpuidle_driver(void);
+
+
+
diff --git a/utils/cpuidle-info.c b/utils/cpuidle-info.c
new file mode 100644
index 0000000..b874732
--- /dev/null
+++ b/utils/cpuidle-info.c
@@ -0,0 +1,305 @@
+/*
+ *  (C) 2004-2009  Dominik Brodowski <linux@dominikbrodowski.de>
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ */
+
+
+#include <unistd.h>
+#include <stdio.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <libintl.h>
+#include <locale.h>
+
+#include <getopt.h>
+
+#include "cpuidle.h"
+
+#define _(String) gettext (String)
+#define gettext_noop(String) String
+#define N_(String) gettext_noop (String)
+
+#define LINE_LEN 10
+
+static unsigned int count_cpus(void)
+{
+	FILE *fp;
+	char value[LINE_LEN];
+	unsigned int ret = 0;
+	unsigned int cpunr = 0;
+
+	fp = fopen("/proc/stat", "r");
+	if(!fp) {
+		printf(gettext("Couldn't count the number of CPUs (%s: %s), assuming 1\n"), "/proc/stat", strerror(errno));
+		return 1;
+	}
+
+	while (!feof(fp)) {
+		if (!fgets(value, LINE_LEN, fp))
+			continue;
+		value[LINE_LEN - 1] = '\0';
+		if (strlen(value) < (LINE_LEN - 2))
+			continue;
+		if (strstr(value, "cpu "))
+			continue;
+		if (sscanf(value, "cpu%d ", &cpunr) != 1)
+			continue;
+		if (cpunr > ret)
+			ret = cpunr;
+	}
+	fclose(fp);
+
+	/* cpu count starts from 0, on error return 1 (UP) */
+	return (ret+1);
+}
+
+static void cpuidle_cpu_output(unsigned int cpu, int verbose)
+{
+	int cstates, cstate;
+	char *tmp;
+
+	printf(gettext ("Analyzing CPU %d:\n"), cpu);
+
+	cstates = cpuidle_get_cstate_count(cpu);
+	if (cstates == 0) {
+		printf(gettext("CPU %u: No C-states\n"), cpu);
+		return;
+	}
+	else if (cstates <= 0) {
+		printf(gettext("CPU %u: Can't read C-state info\n"), cpu);
+		return;
+	}
+	tmp = cpuidle_get_cstate_name(cpu, cstates - 1);
+	if (!tmp) {
+		printf(gettext("Could not determine max C-state %u\n"),
+		       cstates - 1);
+		return;
+	}
+
+	printf("Cstates: %d\n", cstates);
+
+	printf(gettext("Available C-states:"));
+	for (cstate = 1; cstate < cstates; cstate++) {
+		tmp = cpuidle_get_cstate_name(cpu, cstate);
+		if (!tmp)
+			continue;
+		printf(" %s", tmp);
+		free(tmp);
+	}
+	printf("\n");
+
+	if (!verbose)
+		return;
+
+	for (cstate = 1; cstate < cstates; cstate++) {
+		tmp = cpuidle_get_cstate_name(cpu, cstate);
+		if (!tmp)
+			continue;
+		printf("%s:\n", tmp);
+		free(tmp);
+
+		tmp = cpuidle_get_cstate_desc(cpu, cstate);
+		if (!tmp)
+			continue;
+		printf("Flags/Description: %s\n", tmp);
+		free(tmp);
+
+		printf(gettext("Latency: %lu\n"),
+		       cpuidle_get_cstate_latency(cpu, cstate));
+		printf(gettext("Usage: %lu\n"),
+		       cpuidle_get_cstate_usage(cpu, cstate));
+		printf(gettext("Duration: %llu\n"),
+		       cpuidle_get_cstate_time(cpu, cstate));
+	}
+	printf("\n");
+}
+
+static void cpuidle_general_output(void)
+{
+	char *tmp;
+
+	tmp = cpuidle_get_driver();
+	if (!tmp) {
+		printf(gettext ("Could not determine cpuidle driver\n"));
+		return;
+	}
+
+	printf(gettext("CPUidle driver: %s\n"), tmp);
+	free (tmp);
+
+	tmp = cpuidle_get_governor();
+	if (!tmp) {
+		printf(gettext ("Could not determine cpuidle governor\n"));
+		return;
+	}
+
+	printf(gettext("CPUidle governor: %s\n"), tmp);
+	free (tmp);
+}
+
+static void proc_cpuidle_cpu_output(unsigned int cpu)
+{
+	long max_allowed_cstate = 2000000000;
+	int cstates, cstate;
+
+	cstates = cpuidle_get_cstate_count(cpu);
+	if (cstates == 0) {
+		/*
+		 * Go on and print same useless info as you'd see with
+		 * cat /proc/acpi/processor/../power
+		 *	printf(gettext("CPU %u: No C-states available\n"), cpu);
+		 *	return;
+		 */
+	}
+	else if (cstates <= 0) {
+		printf(gettext("CPU %u: Can't read C-state info\n"), cpu);
+		return;
+	}
+	/* printf("Cstates: %d\n", cstates); */
+
+	printf(gettext("active state:            C0\n"));
+	printf(gettext("max_cstate:              C%u\n"), cstates-1);
+	printf(gettext("maximum allowed latency: %lu usec\n"), max_allowed_cstate);
+	printf(gettext("states:\t\n"));
+	for (cstate = 1; cstate < cstates; cstate++) {
+		printf("    C%d:                  "
+		       "type[C%d] ", cstate, cstate);
+		printf(gettext("promotion[--] demotion[--] "));
+		printf(gettext("latency[%03lu] "),
+		       cpuidle_get_cstate_latency(cpu, cstate));
+		printf(gettext("usage[%08lu] "),
+		       cpuidle_get_cstate_usage(cpu, cstate));
+		printf(gettext("duration[%020Lu] \n"),
+		       cpuidle_get_cstate_time(cpu, cstate));
+	}
+}
+
+static void proc_cpuidle_output(void)
+{
+	unsigned int cpu, nr_cpus;
+
+	nr_cpus = count_cpus();
+	/* printf("CPUs: %d\n", nr_cpus); */
+	for (cpu = 0; cpu < nr_cpus; cpu++) {
+		proc_cpuidle_cpu_output(cpu);
+	}
+}
+
+/* --freq / -f */
+
+
+static void print_header(void) {
+	printf(PACKAGE " " VERSION ": cpufreq-info (C) Thomas Renninger <trenn@suse.de> 2010\n");
+	printf(gettext ("Report errors and bugs to %s, please.\n"), PACKAGE_BUGREPORT);
+}
+
+static void print_help(void) {
+	printf(gettext ("Usage: cpuidle-info [options]\n"));
+	printf(gettext ("Options:\n"));
+	printf(gettext ("  -c CPU, --cpu CPU    CPU number which information shall be determined about\n"));
+	printf(gettext ("  -s, --silent         Only show general C-state information\n"));
+	printf(gettext ("  -o, --proc           Prints out information like provided by the /proc/acpi/processor/*/power\n"
+	       "                       interface in older kernels\n"));
+	printf(gettext ("  -h, --help           Prints out this screen\n"));
+
+	printf("\n");
+}
+
+static struct option info_opts[] = {
+	{ .name="cpu",		.has_arg=required_argument,	.flag=NULL,	.val='c'},
+	{ .name="silent",	.has_arg=no_argument,		.flag=NULL,	.val='s'},
+	{ .name="proc",		.has_arg=no_argument,		.flag=NULL,	.val='o'},
+	{ .name="help",		.has_arg=no_argument,		.flag=NULL,	.val='h'},
+};
+
+static inline void cpuidle_exit(int fail)
+{
+	print_header();
+	print_help();
+	exit(EXIT_FAILURE);
+}
+
+
+int main(int argc, char **argv) {
+	extern char *optarg;
+	extern int optind, opterr, optopt;
+	int ret = 0, cont = 1, output_param = 0, verbose = 1;
+	unsigned int cpu = 0, cpu_defined = 0, nr_cpus;
+
+	setlocale(LC_ALL, "");
+	textdomain (PACKAGE);
+
+	do {
+		ret = getopt_long(argc, argv, "c:hos", info_opts, NULL);
+		if (ret == -1)
+			break;
+		switch (ret) {
+		case '?':
+			output_param = '?';
+			cont = 0;
+			break;
+		case 'h':
+			output_param = 'h';
+			cont = 0;
+			break;
+		case 's':
+			verbose = 0;
+			break;
+		case -1:
+			cont = 0;
+			break;
+		case 'o':
+			if (output_param) {
+				output_param = -1;
+				cont = 0;
+				break;
+			}
+			output_param = ret;
+			break;
+		case 'c':
+			if (cpu_defined) {
+				output_param = -1;
+				cont = 0;
+				break;
+			}
+			if ((sscanf(optarg, "%d ", &cpu)) != 1) {
+				output_param = '?';
+				cont = 0;
+			}
+			cpu_defined = 1;
+			break;
+		}
+	} while(cont);
+
+	switch (output_param) {
+	case -1:
+		printf(gettext ("You can't specify more than one --cpu parameter and/or\n"
+		       "more than one output-specific argument\n"));
+		cpuidle_exit(EXIT_FAILURE);
+	case '?':
+		printf(gettext ("invalid or unknown argument\n"));
+		cpuidle_exit(EXIT_FAILURE);
+	case 'h':
+		cpuidle_exit(EXIT_SUCCESS);
+	case 'o':
+		if (cpu_defined)
+			proc_cpuidle_cpu_output(cpu);
+		else
+			proc_cpuidle_output();
+		break;
+	case 0:
+		cpuidle_general_output();
+		if (cpu_defined)
+			cpuidle_cpu_output(cpu, verbose);
+		else {
+			printf("\n");
+			nr_cpus = count_cpus();
+			for (cpu = 0; cpu < nr_cpus; cpu++)
+				cpuidle_cpu_output(cpu, verbose);
+		}
+		break;
+	}
+	return (EXIT_SUCCESS);
+}
-- 
1.6.4.2

