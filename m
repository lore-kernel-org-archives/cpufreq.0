From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/4] cpupower: Do not show an empty Idle_Stats monitor if no idle driver is available
Date: Fri, 12 Aug 2011 01:11:36 +0200
Message-ID: <1313104298-45443-2-git-send-email-trenn@suse.de>
References: <1313104298-45443-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1313104298-45443-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

By taking error values of:
sysfs_get_idlestate_count(..);
into account.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 .../cpupower/utils/idle_monitor/cpuidle_sysfs.c    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tools/power/cpupower/utils/idle_monitor/cpuidle_sysfs.c b/tools/power/cpupower/utils/idle_monitor/cpuidle_sysfs.c
index d048b96..bcd22a1 100644
--- a/tools/power/cpupower/utils/idle_monitor/cpuidle_sysfs.c
+++ b/tools/power/cpupower/utils/idle_monitor/cpuidle_sysfs.c
@@ -134,7 +134,7 @@ static struct cpuidle_monitor *cpuidle_register(void)
 	/* Assume idle state count is the same for all CPUs */
 	cpuidle_sysfs_monitor.hw_states_num = sysfs_get_idlestate_count(0);
 
-	if (cpuidle_sysfs_monitor.hw_states_num == 0)
+	if (cpuidle_sysfs_monitor.hw_states_num <= 0)
 		return NULL;
 
 	for (num = 0; num < cpuidle_sysfs_monitor.hw_states_num; num++) {
-- 
1.7.3.4

