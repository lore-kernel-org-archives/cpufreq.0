From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/4] cpupower: Make monitor command -c/--cpu aware
Date: Fri, 12 Aug 2011 01:11:38 +0200
Message-ID: <1313104298-45443-4-git-send-email-trenn@suse.de>
References: <1313104298-45443-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1313104298-45443-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

This allows for example:
cpupower -c 2-4,6 monitor -m Mperf
              |Mperf
PKG |CORE|CPU | C0   | Cx   | Freq
   0|   8|   4|  2.42| 97.58|  1353
   0|  16|   2| 14.38| 85.62|  1928
   0|  24|   6|  1.76| 98.24|  1442
   1|  16|   3| 15.53| 84.47|  1650

CPUs always get resorted for package, core then cpu id if it could get read out
(or however you name these topology levels...).
Still this is a nice way to keep the overview if a test binary is bound to
a specific CPU or if one wants to show all CPUs inside a package or similar.

Still missing: Do not measure not available cores to reduce the overhead
and achieve better results.


Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 .../cpupower/utils/idle_monitor/cpupower-monitor.c |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
index dd8e1ea..6cb8d9e 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpupower-monitor.c
@@ -149,6 +149,10 @@ void print_results(int topology_depth, int cpu)
 	unsigned long long result;
 	cstate_t s;
 
+	/* Be careful CPUs may got resorted for pkg value do not just use cpu */
+	if (!bitmask_isbitset(cpus_chosen, cpu_top.core_info[cpu].cpu))
+		return;
+
 	if (topology_depth > 2)
 		printf("%4d|", cpu_top.core_info[cpu].pkg);
 	if (topology_depth > 1)
@@ -389,6 +393,10 @@ int cmd_monitor(int argc, char **argv)
 		return EXIT_FAILURE;
 	}
 
+	/* Default is: monitor all CPUs */
+	if (bitmask_isallclear(cpus_chosen))
+		bitmask_setall(cpus_chosen);
+
 	dprint("System has up to %d CPU cores\n", cpu_count);
 
 	for (num = 0; all_monitors[num]; num++) {
-- 
1.7.3.4

