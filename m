From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] tools: cpufreq: Fix cpufreq-info print messages for affected[related]_cpus
Date: Fri, 29 Mar 2013 19:56:39 +0530
Message-ID: <8c5305cdbe0fb20730e6b28f79a71d36a472a817.1364567091.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-kernel@lists.linaro.org, patches@linaro.org, arvind.chauhan@arm.com, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, charles.garcia-tobin@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

Earlier definitions of affected and related cpus were:
Related_cpus: CPUs which run at the same hardware frequency.
Affected_cpus: CPUs which need to have their frequency coordinated by software.

These definitions were very confusing as they don't communicate the real
difference between them.

Following are the new definitions of these variables:
Related_cpus: All (Online & Offline) CPUs that run at the same hardware frequency.
Affected_cpus: Online CPUs that run at the same hardware frequency.

Above definitions are more consistent with latest cpufreq core code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/power/cpupower/utils/cpufreq-info.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/utils/cpufreq-info.c b/tools/power/cpupower/utils/cpufreq-info.c
index 28953c9..a81d4ec 100644
--- a/tools/power/cpupower/utils/cpufreq-info.c
+++ b/tools/power/cpupower/utils/cpufreq-info.c
@@ -247,7 +247,7 @@ static void debug_output_one(unsigned int cpu)
 
 	cpus = cpufreq_get_related_cpus(cpu);
 	if (cpus) {
-		printf(_("  CPUs which run at the same hardware frequency: "));
+		printf(_("  All (Online & Offline) CPUs that run at the same hardware frequency: "));
 		while (cpus->next) {
 			printf("%d ", cpus->cpu);
 			cpus = cpus->next;
@@ -258,7 +258,7 @@ static void debug_output_one(unsigned int cpu)
 
 	cpus = cpufreq_get_affected_cpus(cpu);
 	if (cpus) {
-		printf(_("  CPUs which need to have their frequency coordinated by software: "));
+		printf(_("  Online CPUs that run at the same hardware frequency: "));
 		while (cpus->next) {
 			printf("%d ", cpus->cpu);
 			cpus = cpus->next;
-- 
1.7.12.rc2.18.g61b472e

