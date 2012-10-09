From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/8] cpupower tools: Fix issues with sysfs_topology_read_file
Date: Tue,  9 Oct 2012 15:21:03 +0200
Message-ID: <1349788867-65962-5-git-send-email-trenn@suse.de>
References: <1349788867-65962-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1349788867-65962-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Palmer Cox <p@lmercox.com>, linux@dominikbrodowski.net, rjw@sisk.pl, Thomas Renninger <trenn@suse.de>

From: Palmer Cox <p@lmercox.com>

Fix a variety of issues with sysfs_topology_read_file:
* The return value of sysfs_topology_read_file function was not properly
  being checked for failure.
* The function was reading int valued sysfs variables and then returning
  their value. So, even if a function was trying to check the return value
  of this function, a caller would not be able to tell an failure code apart
  from reading a negative value. This also conflicted with the comment on the
  function which said that a return value of 0 indicated success.
* The function was parsing int valued sysfs values with strtoul instead of
  strtol.
* The function was non-static even though it was only used in the
  file it was declared in.

Signed-off-by: Palmer Cox <p@lmercox.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/utils/helpers/topology.c |   21 +++++++++++++--------
 1 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/topology.c b/tools/power/cpupower/utils/helpers/topology.c
index 4eae2c4..216f3e3 100644
--- a/tools/power/cpupower/utils/helpers/topology.c
+++ b/tools/power/cpupower/utils/helpers/topology.c
@@ -20,9 +20,8 @@
 #include <helpers/sysfs.h>
 
 /* returns -1 on failure, 0 on success */
-int sysfs_topology_read_file(unsigned int cpu, const char *fname)
+static int sysfs_topology_read_file(unsigned int cpu, const char *fname, int *result)
 {
-	unsigned long value;
 	char linebuf[MAX_LINE_LEN];
 	char *endp;
 	char path[SYSFS_PATH_MAX];
@@ -31,10 +30,10 @@ int sysfs_topology_read_file(unsigned int cpu, const char *fname)
 			 cpu, fname);
 	if (sysfs_read_file(path, linebuf, MAX_LINE_LEN) == 0)
 		return -1;
-	value = strtoul(linebuf, &endp, 0);
+	*result = strtol(linebuf, &endp, 0);
 	if (endp == linebuf || errno == ERANGE)
 		return -1;
-	return value;
+	return 0;
 }
 
 struct cpuid_core_info {
@@ -82,13 +81,19 @@ int get_cpu_topology(struct cpupower_topology *cpu_top)
 	for (cpu = 0; cpu < cpus; cpu++) {
 		cpu_top->core_info[cpu].cpu = cpu;
 		cpu_top->core_info[cpu].is_online = sysfs_is_cpu_online(cpu);
-		cpu_top->core_info[cpu].pkg =
-			sysfs_topology_read_file(cpu, "physical_package_id");
+		if(sysfs_topology_read_file(
+			cpu,
+			"physical_package_id",
+			&(cpu_top->core_info[cpu].pkg)) < 0)
+			return -1;
 		if ((int)cpu_top->core_info[cpu].pkg != -1 &&
 		    cpu_top->core_info[cpu].pkg > cpu_top->pkgs)
 			cpu_top->pkgs = cpu_top->core_info[cpu].pkg;
-		cpu_top->core_info[cpu].core =
-			sysfs_topology_read_file(cpu, "core_id");
+		if(sysfs_topology_read_file(
+			cpu,
+			"core_id",
+			&(cpu_top->core_info[cpu].core)) < 0)
+			return -1;
 	}
 	cpu_top->pkgs++;
 
-- 
1.7.6.1

