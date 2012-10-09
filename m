From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 6/8] cpupower tools: Fix warning and a bug with the cpu package count
Date: Tue,  9 Oct 2012 15:21:05 +0200
Message-ID: <1349788867-65962-7-git-send-email-trenn@suse.de>
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

The pkgs member of cpupower_topology is being used as the number of
cpu packages. As the comment in get_cpu_topology notes, the package ids
are not guaranteed to be contiguous. So, simply setting pkgs to the value
of the highest physical_package_id doesn't actually provide a count of
the number of cpu packages. Instead, calculate pkgs by setting it to
the number of distinct physical_packge_id values which is pretty easy
to do after the core_info structs are sorted. Calculating pkgs this
way also has the nice benefit of getting rid of a sign comparison warning
that GCC 4.6 was reporting.

Signed-off-by: Palmer Cox <p@lmercox.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/utils/helpers/topology.c |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/topology.c b/tools/power/cpupower/utils/helpers/topology.c
index 4e2b583..c13120a 100644
--- a/tools/power/cpupower/utils/helpers/topology.c
+++ b/tools/power/cpupower/utils/helpers/topology.c
@@ -64,7 +64,7 @@ static int __compare(const void *t1, const void *t2)
  */
 int get_cpu_topology(struct cpupower_topology *cpu_top)
 {
-	int cpu, cpus = sysconf(_SC_NPROCESSORS_CONF);
+	int cpu, last_pkg, cpus = sysconf(_SC_NPROCESSORS_CONF);
 
 	cpu_top->core_info = malloc(sizeof(struct cpuid_core_info) * cpus);
 	if (cpu_top->core_info == NULL)
@@ -78,20 +78,28 @@ int get_cpu_topology(struct cpupower_topology *cpu_top)
 			"physical_package_id",
 			&(cpu_top->core_info[cpu].pkg)) < 0)
 			return -1;
-		if ((int)cpu_top->core_info[cpu].pkg != -1 &&
-		    cpu_top->core_info[cpu].pkg > cpu_top->pkgs)
-			cpu_top->pkgs = cpu_top->core_info[cpu].pkg;
 		if(sysfs_topology_read_file(
 			cpu,
 			"core_id",
 			&(cpu_top->core_info[cpu].core)) < 0)
 			return -1;
 	}
-	cpu_top->pkgs++;
 
 	qsort(cpu_top->core_info, cpus, sizeof(struct cpuid_core_info),
 	      __compare);
 
+	/* Count the number of distinct pkgs values. This works
+	   because the primary sort of the core_info struct was just
+	   done by pkg value. */
+	last_pkg = cpu_top->core_info[0].pkg;
+	for(cpu = 1; cpu < cpus; cpu++) {
+		if(cpu_top->core_info[cpu].pkg != last_pkg) {
+			last_pkg = cpu_top->core_info[cpu].pkg;
+			cpu_top->pkgs++;
+		}
+	}
+	cpu_top->pkgs++;
+
 	/* Intel's cores count is not consecutively numbered, there may
 	 * be a core_id of 3, but none of 2. Assume there always is 0
 	 * Get amount of cores by counting duplicates in a package
-- 
1.7.6.1

