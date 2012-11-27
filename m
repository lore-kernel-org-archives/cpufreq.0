From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 5/8] cpupower tools: Fix malloc of cpu_info structure
Date: Tue, 27 Nov 2012 13:17:46 +0100
Message-ID: <1354018669-63680-6-git-send-email-trenn@suse.de>
References: <1354018669-63680-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1354018669-63680-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: Palmer Cox <p@lmercox.com>, cpufreq@vger.kernel.org, Thomas Renninger <trenn@suse.de>

From: Palmer Cox <p@lmercox.com>

The cpu_info member of cpupower_topology was being declared as an unnamed
structure. This member was then being malloced using the size of the
parent cpupower_topology * the number of cpus. This works
because cpu_info is smaller than cpupower_topology. However, there is
no guarantee that will always be the case. Making cpu_info its own
top level structure (named cpuid_core_info) allows for mallocing the actual
size of this structure. This also lets us get rid of a redefinition of
the structure in topology.c with slightly different field names.

Signed-off-by: Palmer Cox <p@lmercox.com>
Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/utils/helpers/helpers.h  |   17 +++++++++--------
 tools/power/cpupower/utils/helpers/topology.c |   14 +++-----------
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/helpers.h b/tools/power/cpupower/utils/helpers/helpers.h
index 2eb584c..f84985f 100644
--- a/tools/power/cpupower/utils/helpers/helpers.h
+++ b/tools/power/cpupower/utils/helpers/helpers.h
@@ -92,6 +92,14 @@ extern int get_cpu_info(unsigned int cpu, struct cpupower_cpu_info *cpu_info);
 extern struct cpupower_cpu_info cpupower_cpu_info;
 /* cpuid and cpuinfo helpers  **************************/
 
+struct cpuid_core_info {
+	int pkg;
+	int core;
+	int cpu;
+
+	/* flags */
+	unsigned int is_online:1;
+};
 
 /* CPU topology/hierarchy parsing ******************/
 struct cpupower_topology {
@@ -101,14 +109,7 @@ struct cpupower_topology {
 	unsigned int threads; /* per core */
 
 	/* Array gets mallocated with cores entries, holding per core info */
-	struct {
-		int pkg;
-		int core;
-		int cpu;
-
-		/* flags */
-		unsigned int is_online:1;
-	} *core_info;
+	struct cpuid_core_info *core_info;
 };
 
 extern int get_cpu_topology(struct cpupower_topology *cpu_top);
diff --git a/tools/power/cpupower/utils/helpers/topology.c b/tools/power/cpupower/utils/helpers/topology.c
index 216f3e3..4e2b583 100644
--- a/tools/power/cpupower/utils/helpers/topology.c
+++ b/tools/power/cpupower/utils/helpers/topology.c
@@ -36,14 +36,6 @@ static int sysfs_topology_read_file(unsigned int cpu, const char *fname, int *re
 	return 0;
 }
 
-struct cpuid_core_info {
-	unsigned int pkg;
-	unsigned int thread;
-	unsigned int cpu;
-	/* flags */
-	unsigned int is_online:1;
-};
-
 static int __compare(const void *t1, const void *t2)
 {
 	struct cpuid_core_info *top1 = (struct cpuid_core_info *)t1;
@@ -52,9 +44,9 @@ static int __compare(const void *t1, const void *t2)
 		return -1;
 	else if (top1->pkg > top2->pkg)
 		return 1;
-	else if (top1->thread < top2->thread)
+	else if (top1->core < top2->core)
 		return -1;
-	else if (top1->thread > top2->thread)
+	else if (top1->core > top2->core)
 		return 1;
 	else if (top1->cpu < top2->cpu)
 		return -1;
@@ -74,7 +66,7 @@ int get_cpu_topology(struct cpupower_topology *cpu_top)
 {
 	int cpu, cpus = sysconf(_SC_NPROCESSORS_CONF);
 
-	cpu_top->core_info = malloc(sizeof(struct cpupower_topology) * cpus);
+	cpu_top->core_info = malloc(sizeof(struct cpuid_core_info) * cpus);
 	if (cpu_top->core_info == NULL)
 		return -ENOMEM;
 	cpu_top->pkgs = cpu_top->cores = 0;
-- 
1.7.6.1

