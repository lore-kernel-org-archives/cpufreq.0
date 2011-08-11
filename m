From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 3/4] cpupower: Better detect offlined CPUs
Date: Fri, 12 Aug 2011 01:11:37 +0200
Message-ID: <1313104298-45443-3-git-send-email-trenn@suse.de>
References: <1313104298-45443-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1313104298-45443-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

Before, checking for offlined CPUs was done dirty and
it was checked whether topology parsing returned -1 values.
But this is a valid case on a Xen (and possibly other) kernels.

Do proper online/offline checking, also take CONFIG_HOTPLUG_CPU
option into account (no /sys/devices/../cpuX/online file).

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 tools/power/cpupower/utils/helpers/helpers.h       |    3 +
 tools/power/cpupower/utils/helpers/sysfs.c         |   50 ++++++++++++++++++++
 tools/power/cpupower/utils/helpers/sysfs.h         |    2 +
 tools/power/cpupower/utils/helpers/topology.c      |    5 ++-
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |   10 +++-
 5 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
index 592ee36..7a83022 100644
--- a/tools/power/cpupower/utils/helpers/helpers.h
+++ b/tools/power/cpupower/utils/helpers/helpers.h
@@ -96,6 +96,9 @@ struct cpupower_topology {
 		int pkg;
 		int core;
 		int cpu;
+
+		/* flags */
+		unsigned int is_online:1;
 	} *core_info;
 };
 
diff --git a/tools/power/cpupower/utils/helpers/sysfs.c b/tools/power/cpupower/utils/helpers/sysfs.c
index 55e2466..c634302 100644
--- a/tools/power/cpupower/utils/helpers/sysfs.c
+++ b/tools/power/cpupower/utils/helpers/sysfs.c
@@ -56,6 +56,56 @@ static unsigned int sysfs_write_file(const char *path,
 	return (unsigned int) numwrite;
 }
 
+/*
+ * Detect whether a CPU is online
+ *
+ * Returns:
+ *     1 -> if CPU is online
+ *     0 -> if CPU is offline
+ *     negative errno values in error case
+ */
+int sysfs_is_cpu_online(unsigned int cpu)
+{
+	char path[SYSFS_PATH_MAX];
+	int fd;
+	ssize_t numread;
+	unsigned long long value;
+	char linebuf[MAX_LINE_LEN];
+	char *endp;
+	struct stat statbuf;
+
+	snprintf(path, sizeof(path), PATH_TO_CPU "cpu%u", cpu);
+
+	if (stat(path, &statbuf) != 0)
+		return 0;
+
+	/*
+	 * kernel without CONFIG_HOTPLUG_CPU
+	 * -> cpuX directory exists, but not cpuX/online file
+	 */
+	snprintf(path, sizeof(path), PATH_TO_CPU "cpu%u/online", cpu);
+	if (stat(path, &statbuf) != 0)
+		return 1;
+
+	fd = open(path, O_RDONLY);
+	if (fd == -1)
+		return -errno;
+
+	numread = read(fd, linebuf, MAX_LINE_LEN - 1);
+	if (numread < 1) {
+		close(fd);
+		return -EIO;
+	}
+	linebuf[numread] = '\0';
+	close(fd);
+
+	value = strtoull(linebuf, &endp, 0);
+	if (value > 1 || value < 0)
+		return -EINVAL;
+
+	return value;
+}
+
 /* CPUidle idlestate specific /sys/devices/system/cpu/cpuX/cpuidle/ access */
 
 /*
diff --git a/tools/power/cpupower/utils/helpers/sysfs.h b/tools/power/cpupower/utils/helpers/sysfs.h
index f9373e0..8cb797b 100644
--- a/tools/power/cpupower/utils/helpers/sysfs.h
+++ b/tools/power/cpupower/utils/helpers/sysfs.h
@@ -7,6 +7,8 @@
 
 extern unsigned int sysfs_read_file(const char *path, char *buf, size_t buflen);
 
+extern int sysfs_is_cpu_online(unsigned int cpu);
+
 extern unsigned long sysfs_get_idlestate_latency(unsigned int cpu,
 						unsigned int idlestate);
 extern unsigned long sysfs_get_idlestate_usage(unsigned int cpu,
diff --git a/tools/power/cpupower/utils/helpers/topology.c b/tools/power/cpupower/utils/helpers/topology.c
index 385ee5c..4eae2c4 100644
--- a/tools/power/cpupower/utils/helpers/topology.c
+++ b/tools/power/cpupower/utils/helpers/topology.c
@@ -41,6 +41,8 @@ struct cpuid_core_info {
 	unsigned int pkg;
 	unsigned int thread;
 	unsigned int cpu;
+	/* flags */
+	unsigned int is_online:1;
 };
 
 static int __compare(const void *t1, const void *t2)
@@ -78,6 +80,8 @@ int get_cpu_topology(struct cpupower_topology *cpu_top)
 		return -ENOMEM;
 	cpu_top->pkgs = cpu_top->cores = 0;
 	for (cpu = 0; cpu < cpus; cpu++) {
+		cpu_top->core_info[cpu].cpu = cpu;
+		cpu_top->core_info[cpu].is_online = sysfs_is_cpu_online(cpu);
 		cpu_top->core_info[cpu].pkg =
 			sysfs_topology_read_file(cpu, "physical_package_id");
 		if ((int)cpu_top->core_info[cpu].pkg != -1 &&
@@ -85,7 +89,6 @@ int get_cpu_topology(struct cpupower_topology *cpu_top)
 			cpu_top->pkgs = cpu_top->core_info[cpu].pkg;
 		cpu_top->core_info[cpu].core =
 			sysfs_topology_read_file(cpu, "core_id");
-		cpu_top->core_info[cpu].cpu = cpu;
 	}
 	cpu_top->pkgs++;
 
diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
index ba4bf06..dd8e1ea 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
@@ -190,9 +190,13 @@ void print_results(int topology_depth, int cpu)
 			}
 		}
 	}
-	/* cpu offline */
-	if (cpu_top.core_info[cpu].pkg == -1 ||
-	    cpu_top.core_info[cpu].core == -1) {
+	/*
+	 * The monitor could still provide useful data, for example
+	 * AMD HW counters partly sit in PCI config space.
+	 * It's up to the monitor plug-in to check .is_online, this one
+	 * is just for additional info.
+	 */
+	if (!cpu_top.core_info[cpu].is_online) {
 		printf(_(" *is offline\n"));
 		return;
 	} else
-- 
1.7.3.4

