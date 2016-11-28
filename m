From: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>
Subject: [PATCH] cpufrequtils: Report offline cpus in cpufreq-info
Date: Mon, 28 Nov 2016 14:12:30 +0530
Message-ID: <1480322550-13655-1-git-send-email-akshay.adiga@linux.vnet.ibm.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux@brodo.de, sergey.dryabzhinsky@gmail.com, linux@dominikbrodowski.net
Cc: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>

cpufrequtils did not check if the cpu is online and reported the
frequency anyways, which could be misleading to the user.
Added support to detect if the requested cpu is offline and
report that its offline.

When cpu 3 is offline the output would look as follows :
$./cpufreq-info -c 3
cpufrequtils 008: cpufreq-info (C) Dominik Brodowski 2004-2009
Report errors and bugs to cpufreq@vger.kernel.org, please.
CPU 3 is Offline

Signed-off-by: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>
---
 lib/sysfs.c  | 28 ++++++++++++++++++++++++++--
 utils/info.c |  7 ++++++-
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/lib/sysfs.c b/lib/sysfs.c
index 24dd563..9448499 100644
--- a/lib/sysfs.c
+++ b/lib/sysfs.c
@@ -28,7 +28,6 @@ unsigned int sysfs_read_file(unsigned int cpu, const char *fname, char *buf, siz
 	char path[SYSFS_PATH_MAX];
 	int fd;
 	size_t numread;
-
 	snprintf(path, sizeof(path), PATH_TO_CPU "cpu%u/cpufreq/%s",
 			 cpu, fname);
 
@@ -192,14 +191,39 @@ static int sysfs_write_one_value(unsigned int cpu, unsigned int which,
 
 int sysfs_cpu_exists(unsigned int cpu)
 {
-	char file[SYSFS_PATH_MAX];
+	char online[2], file[SYSFS_PATH_MAX];
 	struct stat statbuf;
+	int len, fd;
 
 	snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU "cpu%u/", cpu);
 
 	if ( stat(file, &statbuf) != 0 )
 		return -ENOSYS;
 
+	snprintf(file, SYSFS_PATH_MAX, PATH_TO_CPU "cpu%u/online", cpu);
+	fd = open(file, O_RDONLY);
+	if (fd < 0) {
+		/*
+		 * cpuX directory exists but cpuX/online does not. This
+		 * could because of cpu is not hotpluggable, which means
+		 * its online.
+		 */
+		return 0;
+	}
+
+	len = read(fd, online, 2);
+	if (len < 1) {
+		printf("Could not read cpu%u/online file\n", cpu);
+		close(fd);
+		return len;
+	}
+	/* Returning 1 if its offline */
+	if (online[0] == '0')	{
+		close(fd);
+		return 1;
+	}
+	close(fd);
+
 	return S_ISDIR(statbuf.st_mode) ? 0 : -ENOSYS;
 }
 
diff --git a/utils/info.c b/utils/info.c
index 155e604..3b8fee6 100644
--- a/utils/info.c
+++ b/utils/info.c
@@ -159,10 +159,15 @@ static void debug_output_one(unsigned int cpu)
 	struct cpufreq_policy *policy;
 	struct cpufreq_available_governors * governors;
 	struct cpufreq_stats *stats;
+	int offline;
 
-	if (cpufreq_cpu_exists(cpu)) {
+	offline = cpufreq_cpu_exists(cpu);
+	if (offline < 0)  {
 		printf(gettext ("couldn't analyze CPU %d as it doesn't seem to be present\n"), cpu);
 		return;
+	} else if (offline == 1) {
+		printf(gettext("CPU %d is Offline\n"), cpu);
+		return;
 	}
 
 	printf(gettext ("analyzing CPU %d:\n"), cpu);
-- 
2.5.5

