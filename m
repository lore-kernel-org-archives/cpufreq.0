From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 1/3] powertop: Use cpufreqlib for getting cpufreqstats info
Date: Wed, 25 Aug 2010 16:23:29 +0200
Message-ID: <1282746211-1227-2-git-send-email-trenn@suse.de>
References: <1282746211-1227-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1282746211-1227-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de
Cc: power@bughost.org, Amit Arora <amit.arora@linaro.org>, auke@linux.intel.com, cpufreq@vger.kernel.org

Sharing code is a good idea.
cpufrequtils/libs exist for years and every distribution
should have them. It's also well maintained and ideally is
the only userspace tool which needs adjusting if cpufreq
sysfs api changes at some time.


Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Amit Arora <amit.arora@linaro.org>
CC: auke@linux.intel.com
CC: power@bughost.org
CC: cpufreq@vger.kernel.org
---
 Makefile       |    1 +
 cpufreqstats.c |   52 ++++++++++++++++++++--------------------------------
 2 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/Makefile b/Makefile
index e4e1671..ee10a84 100644
--- a/Makefile
+++ b/Makefile
@@ -6,6 +6,7 @@ MANDIR=/usr/share/man/man8
 WARNFLAGS=-Wall -Wshadow -W -Wformat -Wimplicit-function-declaration -Wimplicit-int
 CFLAGS?=-O1 -g ${WARNFLAGS}
 CC?=gcc
+LDFLAGS = -lcpufreq
 
 CFLAGS+=-D VERSION=\"$(VERSION)\"
 
diff --git a/cpufreqstats.c b/cpufreqstats.c
index d10b047..303c3cf 100644
--- a/cpufreqstats.c
+++ b/cpufreqstats.c
@@ -29,6 +29,7 @@
 #include <stdint.h>
 #include <sys/types.h>
 #include <dirent.h>
+#include <cpufreq.h>
 
 #include "powertop.h"
 
@@ -100,15 +101,11 @@ static char *HzToHuman(unsigned long hz)
 
 void  do_cpufreq_stats(void)
 {
-	DIR *dir;
-	struct dirent *dirent;
-	FILE *file;
-	char filename[PATH_MAX];
-	char line[1024];
-
-	int ret = 0;
+	struct cpufreq_stats *freq_stats, *tmp;
+	int cpu = 0, ret = 0;
 	int maxfreq = 0;
 	uint64_t total_time = 0;
+	unsigned long long time_dummy = 0;
 
 	memcpy(&oldfreqs, &freqs, sizeof(freqs));
 	memset(&cpufreqstrings, 0, sizeof(cpufreqstrings));
@@ -117,30 +114,21 @@ void  do_cpufreq_stats(void)
 	for (ret = 0; ret<16; ret++)
 		freqs[ret].count = 0;
 
-	dir = opendir("/sys/devices/system/cpu");
-	if (!dir)
+	freq_stats = cpufreq_get_stats(0, &time_dummy);
+	if (!freq_stats)
+		/* Probably cpufreq_stats not compiled in or no cpufreq
+		   support, printing a debug message is appropriate */
 		return;
 
-	while ((dirent = readdir(dir))) {
-		int i;
-		if (dirent->d_name[0]=='.')
-			continue;
-		sprintf(filename, "/sys/devices/system/cpu/%s/cpufreq/stats/time_in_state", dirent->d_name);
-		file = fopen(filename, "r");
-		if (!file)
-			continue;
-		memset(line, 0, 1024);
-
-		i = 0;
-		while (!feof(file)) {
-			uint64_t f,count;
-			char *c;
-			if (fgets(line, 1023,file)==NULL)
-				break;
-			f = strtoull(line, &c, 10);
-			if (!c)
-				break;
-			count = strtoull(c, NULL, 10);
+	/* cpu loop */
+	while (freq_stats) {
+		int i = 0;
+		tmp = freq_stats;
+		/* freq loop */
+		for (;freq_stats; freq_stats = freq_stats->next) {
+
+			unsigned long f = freq_stats->frequency;
+			unsigned long long count = freq_stats->time_in_state;
 
 			if (freqs[i].frequency && freqs[i].frequency != f) {
 				zap();
@@ -156,11 +144,11 @@ void  do_cpufreq_stats(void)
 			if (i>15)
 				break;
 		}
-		fclose(file);
+		cpu++;
+		cpufreq_put_stats(tmp);
+		freq_stats = cpufreq_get_stats(cpu, &time_dummy);
 	}
 
-	closedir(dir);
-
 	for (ret = 0; ret < 16; ret++) {
 		delta[ret].count = freqs[ret].count - oldfreqs[ret].count;
 		total_time += delta[ret].count;
-- 
1.6.4.2

