From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 8/8] cpupower: IvyBridge (0x3a and 0x3e models) support
Date: Tue, 27 Nov 2012 13:17:49 +0100
Message-ID: <1354018669-63680-9-git-send-email-trenn@suse.de>
References: <1354018669-63680-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1354018669-63680-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Signed-off-by: Thomas Renninger <trenn@suse.de>
---
 tools/power/cpupower/utils/helpers/cpuid.c         |    2 ++
 tools/power/cpupower/utils/idle_monitor/snb_idle.c |   10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/utils/helpers/cpuid.c b/tools/power/cpupower/utils/helpers/cpuid.c
index 906895d..93b0aa7 100644
--- a/tools/power/cpupower/utils/helpers/cpuid.c
+++ b/tools/power/cpupower/utils/helpers/cpuid.c
@@ -158,6 +158,8 @@ out:
 				cpu_info->caps |= CPUPOWER_CAP_HAS_TURBO_RATIO;
 			case 0x2A:	/* SNB */
 			case 0x2D:	/* SNB Xeon */
+			case 0x3A:	/* IVB */
+			case 0x3E:	/* IVB Xeon */
 				cpu_info->caps |= CPUPOWER_CAP_HAS_TURBO_RATIO;
 				cpu_info->caps |= CPUPOWER_CAP_IS_SNB;
 				break;
diff --git a/tools/power/cpupower/utils/idle_monitor/snb_idle.c b/tools/power/cpupower/utils/idle_monitor/snb_idle.c
index a1bc07c..a99b43b 100644
--- a/tools/power/cpupower/utils/idle_monitor/snb_idle.c
+++ b/tools/power/cpupower/utils/idle_monitor/snb_idle.c
@@ -150,9 +150,15 @@ static struct cpuidle_monitor *snb_register(void)
 	    || cpupower_cpu_info.family != 6)
 		return NULL;
 
-	if (cpupower_cpu_info.model != 0x2A
-	    && cpupower_cpu_info.model != 0x2D)
+	switch (cpupower_cpu_info.model) {
+	case 0x2A: /* SNB */
+	case 0x2D: /* SNB Xeon */
+	case 0x3A: /* IVB */
+	case 0x3E: /* IVB Xeon */
+		break;
+	default:
 		return NULL;
+	}
 
 	is_valid = calloc(cpu_count, sizeof(int));
 	for (num = 0; num < SNB_CSTATE_COUNT; num++) {
-- 
1.7.6.1

