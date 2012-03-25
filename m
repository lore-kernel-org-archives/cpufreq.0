From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 02/13] cpupower: AMD fam14h/Ontario monitor can also be used by fam12h cpus
Date: Sun, 25 Mar 2012 20:38:43 +0200
Message-ID: <1332700734-26435-2-git-send-email-linux@dominikbrodowski.net>
References: <20120325183807.GA26398@comet.dominikbrodowski.net>
 <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1332700734-26435-1-git-send-email-linux@dominikbrodowski.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>, Andreas Herrmann <herrmann.der.user@googlemail.com>, Dominik Brodowski <linux@dominikbrodowski.net>

From: Thomas Renninger <trenn@suse.de>

The name of the monitor is updated at runtime to the name of the
CPU type.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Andreas Herrmann <herrmann.der.user@googlemail.com>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/man/cpupower-monitor.1        |    2 +-
 .../cpupower/utils/idle_monitor/amd_fam14h_idle.c  |   16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/power/cpupower/man/cpupower-monitor.1 b/tools/power/cpupower/man/cpupower-monitor.1
index d5cfa26..1141c20 100644
--- a/tools/power/cpupower/man/cpupower-monitor.1
+++ b/tools/power/cpupower/man/cpupower-monitor.1
@@ -107,7 +107,7 @@ Deepest package sleep states may in reality show up as machine/platform wide
 sleep states and can only be entered if all cores are idle. Look up Intel
 manuals (some are provided in the References section) for further details.
 
-.SS "Ontario" "Liano"
+.SS "Fam_12h" "Fam_14h"
 AMD laptop and desktop processor (family 12h and 14h) sleep state counters.
 The registers are accessed via PCI and therefore can still be read out while
 cores have been offlined.
diff --git a/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c b/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
index 108108d..2116df9 100644
--- a/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
+++ b/tools/power/cpupower/utils/idle_monitor/amd_fam14h_idle.c
@@ -281,13 +281,13 @@ struct cpuidle_monitor *amd_fam14h_register(void)
 	if (cpupower_cpu_info.vendor != X86_VENDOR_AMD)
 		return NULL;
 
-	if (cpupower_cpu_info.family == 0x14) {
-		if (cpu_count <= 0 || cpu_count > 2) {
-			fprintf(stderr, "AMD fam14h: Invalid cpu count: %d\n",
-				cpu_count);
-			return NULL;
-		}
-	} else
+	if (cpupower_cpu_info.family == 0x14)
+		strncpy(amd_fam14h_monitor.name, "Fam_14h",
+			MONITOR_NAME_LEN - 1);
+	else if (cpupower_cpu_info.family == 0x12)
+		strncpy(amd_fam14h_monitor.name, "Fam_12h",
+			MONITOR_NAME_LEN - 1);
+	else
 		return NULL;
 
 	/* We do not alloc for nbp1 machine wide counter */
@@ -322,7 +322,7 @@ static void amd_fam14h_unregister(void)
 }
 
 struct cpuidle_monitor amd_fam14h_monitor = {
-	.name			= "Ontario",
+	.name			= "",
 	.hw_states		= amd_fam14h_cstates,
 	.hw_states_num		= AMD_FAM14H_STATE_NUM,
 	.start			= amd_fam14h_start,
-- 
1.7.5.4

