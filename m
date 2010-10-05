From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/5] cpupowerutils: Let older tools make use of global read_msr functions
Date: Tue,  5 Oct 2010 14:23:11 +0200
Message-ID: <1286281394-14699-3-git-send-email-trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1286281394-14699-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

These are not intended to be exported via library, but internal tools
can statically link/compile against msr.o to keep the code base as tiny
as possible.


Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 debug/i386/centrino-decode.c    |   45 +++++---------------------------------
 debug/i386/powernow-k8-decode.c |   38 ++------------------------------
 debug/x86_64/Makefile           |   17 +++++++++++---
 lib/msr.c                       |   42 ++++++++++++++++++++++++++++++++++++
 lib/msr.h                       |    1 +
 5 files changed, 65 insertions(+), 78 deletions(-)

diff --git a/debug/i386/centrino-decode.c b/debug/i386/centrino-decode.c
index 7ef24cc..67e9dbf 100644
--- a/debug/i386/centrino-decode.c
+++ b/debug/i386/centrino-decode.c
@@ -22,44 +22,9 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 
-#define MCPU	32
-
-#define MSR_IA32_PERF_STATUS	0x198
-
-static int rdmsr(unsigned int cpu, unsigned int msr,
-		 unsigned int *lo, unsigned int *hi)
-{
-	int fd;
-	char file[20];
-	unsigned long long val;
-	int retval = -1;
-
-	*lo = *hi = 0;
-
-	if (cpu > MCPU)
-		goto err1;
-
-	sprintf(file, "/dev/cpu/%d/msr", cpu);
-	fd = open(file, O_RDONLY);
+#include "msr.h"
 
-	if (fd < 0)
-		goto err1;
-
-	if (lseek(fd, msr, SEEK_CUR) == -1)
-		goto err2;
-
-	if (read(fd, &val, 8) != 8)
-		goto err2;
-
-	*lo = (uint32_t )(val & 0xffffffffull);
-	*hi = (uint32_t )(val>>32 & 0xffffffffull);
-
-	retval = 0;
-err2:
-	close(fd);
-err1:
-	return retval;
-}
+#define MCPU	32
 
 static void decode (unsigned int msr)
 {
@@ -75,10 +40,11 @@ static void decode (unsigned int msr)
 
 static int decode_live(unsigned int cpu)
 {
-	unsigned int lo, hi;
+	unsigned int lo;
+	uint64_t cpu_freq;
 	int err;
 
-	err = rdmsr(cpu, MSR_IA32_PERF_STATUS, &lo, &hi);
+	err = msr_intel_get_perf_status(cpu, &cpu_freq);
 
 	if (err) {
 		printf("can't get MSR_IA32_PERF_STATUS for cpu %d\n", cpu);
@@ -87,6 +53,7 @@ static int decode_live(unsigned int cpu)
 		return 1;
 	}
 
+	lo = (uint32_t )(cpu_freq & 0xffffffffull);
 	decode(lo);
 
 	return 0;
diff --git a/debug/i386/powernow-k8-decode.c b/debug/i386/powernow-k8-decode.c
index 638a6b3..435c597 100644
--- a/debug/i386/powernow-k8-decode.c
+++ b/debug/i386/powernow-k8-decode.c
@@ -18,41 +18,9 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 
-#define MCPU 32
-
-#define MSR_FIDVID_STATUS	0xc0010042
-
-#define MSR_S_HI_CURRENT_VID	0x0000001f
-#define MSR_S_LO_CURRENT_FID	0x0000003f
-
-static int get_fidvid(uint32_t cpu, uint32_t *fid, uint32_t *vid)
-{
-	int err = 1;
-	uint64_t msr = 0;
-	int fd;
-	char file[20];
-
-	if (cpu > MCPU)
-		goto out;
-
-	sprintf(file, "/dev/cpu/%d/msr", cpu);
-
-	fd = open(file, O_RDONLY);
-	if (fd < 0)
-		goto out;
-	lseek(fd, MSR_FIDVID_STATUS, SEEK_CUR);
-	if (read(fd, &msr, 8) != 8)
-		goto err1;
-
-	*fid = ((uint32_t )(msr & 0xffffffffull)) & MSR_S_LO_CURRENT_FID;
-	*vid = ((uint32_t )(msr>>32 & 0xffffffffull)) & MSR_S_HI_CURRENT_VID;
-	err = 0;
-err1:
-	close(fd);
-out:
-	return err;
-}
+#include "msr.h"
 
+#define MCPU 32
 
 /* Return a frequency in MHz, given an input fid */
 static uint32_t find_freq_from_fid(uint32_t fid)
@@ -77,7 +45,7 @@ int main (int argc, char *argv[])
 	else
 		cpu = strtoul(argv[1], NULL, 0);
 
-	err = get_fidvid(cpu, &fid, &vid);
+	err = msr_amd_get_fidvid(cpu, &fid, &vid);
 
 	if (err) {
 		printf("can't get fid, vid from MSR\n");
diff --git a/debug/x86_64/Makefile b/debug/x86_64/Makefile
index dbf1399..d8e4db8 100644
--- a/debug/x86_64/Makefile
+++ b/debug/x86_64/Makefile
@@ -1,10 +1,19 @@
 default: all
 
-centrino-decode: centrino-decode.c
-	$(CC) $(CFLAGS) -o centrino-decode centrino-decode.c
+CFLAGS += -I ../../lib
 
-powernow-k8-decode: powernow-k8-decode.c
-	$(CC) $(CFLAGS) -o powernow-k8-decode powernow-k8-decode.c
+centrino-decode: centrino-decode.c msr.o
+	$(CC) $(CFLAGS) -c centrino-decode.c -o centrino-decode.o
+	$(CC) $(CFLAGS) -c ../../lib/msr.c -o ../../lib/msr.o
+	$(CC) $(CFLAGS) centrino-decode.o ../../lib/msr.o -o centrino-decode
+
+powernow-k8-decode: powernow-k8-decode.c msr.o
+	$(CC) $(CFLAGS) -c powernow-k8-decode.c -o powernow-k8-decode.o
+	$(CC) $(CFLAGS) -c ../../lib/msr.c -o  ../../lib/msr.o
+	$(CC) ../../lib/msr.o powernow-k8-decode.o -o powernow-k8-decode
+
+msr.o: ../../lib/msr.c
+	$(CC) -c ../../lib/msr.c -o ../../lib/msr.o
 
 all: centrino-decode powernow-k8-decode
 
diff --git a/lib/msr.c b/lib/msr.c
index f532e1a..bccea8d 100644
--- a/lib/msr.c
+++ b/lib/msr.c
@@ -1,3 +1,15 @@
+/*
+ *  (C) 2010	Thomas Renninger <trenn@suse.de>
+ *
+ *  Licensed under the terms of the GNU GPL License version 2.
+ *
+ *  msr.c:
+ *  Provides easy access to X86 specific Machine Specific Registers (MSRs)
+ *
+ *  Callers have to make sure themselves whether the machine supports
+ *  the called MSR functions, for example via cpuid.
+ */
+
 #include <stdio.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -7,13 +19,19 @@
 #include <sys/types.h>
 
 
+/* General X86 MSRs */
 #define MSR_IA32_APERF		0x000000E8
 #define MSR_IA32_MPERF		0x000000E7
 
+/* AMD specific MSRs */
 #define MSR_FIDVID_STATUS	0xc0010042
 
+/* Intel specific MSRs */
 #define MSR_IA32_PERF_STATUS	0x198
 
+/* AMD specific bits */
+#define AMD_S_HI_CURRENT_VID	0x0000001f
+#define AMD_S_LO_CURRENT_FID	0x0000003f
 
 /*
  * read_msr
@@ -75,6 +93,8 @@ static int write_msr(int cpu, unsigned int idx, uint64_t val)
 	return -1;
 }
 
+/* General X86 MSRs ********************************/
+
 int msr_get_aperf(unsigned int cpu, uint64_t *aperf)
 {
 	return read_msr(cpu, MSR_IA32_APERF, aperf);
@@ -84,5 +104,27 @@ int msr_get_aperf(unsigned int cpu, uint64_t *aperf)
 int msr_get_mperf(unsigned int cpu, uint64_t *mperf)
 {
 	return read_msr(cpu, MSR_IA32_MPERF, mperf);
+}
 
+/* AMD X86 MSRs ************************************/
+int msr_amd_get_fidvid(unsigned int cpu, uint32_t *fid, uint32_t *vid)
+{
+	uint64_t fid_vid;
+	int ret;
+
+	ret = read_msr(cpu, MSR_FIDVID_STATUS, &fid_vid);
+	if (ret)
+		return ret;
+
+	*fid = ((uint32_t )(fid_vid & 0xffffffffull)) & AMD_S_LO_CURRENT_FID;
+	*vid = ((uint32_t )(fid_vid >> 32 & 0xffffffffull))
+		& AMD_S_HI_CURRENT_VID;
+
+	return 0;
+}
+
+/* Intel X86 MSRs **********************************/
+int msr_intel_get_perf_status(unsigned int cpu, uint64_t perf_status)
+{
+       return read_msr(cpu, MSR_IA32_PERF_STATUS, &perf_status);
 }
diff --git a/lib/msr.h b/lib/msr.h
index 347c50f..8b1755e 100644
--- a/lib/msr.h
+++ b/lib/msr.h
@@ -2,3 +2,4 @@ extern int msr_get_mperf(unsigned int cpu, uint64_t *mperf);
 extern int msr_get_aperf(unsigned int cpu, uint64_t *aperf);
 
 extern int msr_amd_get_fidvid(unsigned int cpu, uint32_t *fid, uint32_t *vid);
+extern int msr_intel_get_perf_status(unsigned int cpu, uint64_t perf_status);
-- 
1.6.4.2

