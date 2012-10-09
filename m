From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 8/8] patch cpupower_ivy_bridge_support.patch
Date: Tue,  9 Oct 2012 15:21:07 +0200
Message-ID: <1349788867-65962-9-git-send-email-trenn@suse.de>
References: <1349788867-65962-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1349788867-65962-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Thomas Renninger <trenn@suse.de>, linux@dominikbrodowski.net, rjw@sisk.pl

---
 tools/power/cpupower/utils/idle_monitor/snb_idle.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/power/cpupower/utils/idle_monitor/snb_idle.c b/tools/power/cpupower/utils/idle_monitor/snb_idle.c
index a1bc07c..9913a60 100644
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
+	case 0x3D: /* IVB Xeon */
+		break;
+	default:
 		return NULL;
+	}
 
 	is_valid = calloc(cpu_count, sizeof(int));
 	for (num = 0; num < SNB_CSTATE_COUNT; num++) {
-- 
1.7.6.1

