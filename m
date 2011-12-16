From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/4] cpupower: Remove unneeded code and by that fix a memleak
Date: Fri, 16 Dec 2011 15:35:54 +0100
Message-ID: <1324046154-64824-5-git-send-email-trenn@suse.de>
References: <1324046154-64824-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1324046154-64824-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: cpufreq@vger.kernel.org, Thomas Renninger <trenn@suse.de>

Looks like some not needed debug code slipped in.
Also this code:
tmp = sysfs_get_idlestate_name(cpu, idlestates - 1);
performs a strdup and the mem was not freed again.
-> delete it.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: cpufreq@vger.kernel.org
CC: linux@dominikbrodowski.net
---
 tools/power/cpupower/utils/cpuidle-info.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/tools/power/cpupower/utils/cpuidle-info.c b/tools/power/cpupower/utils/cpuidle-info.c
index e076beb..8145af5 100644
--- a/tools/power/cpupower/utils/cpuidle-info.c
+++ b/tools/power/cpupower/utils/cpuidle-info.c
@@ -35,13 +35,6 @@ static void cpuidle_cpu_output(unsigned int cpu, int verbose)
 		printf(_("CPU %u: Can't read idle state info\n"), cpu);
 		return;
 	}
-	tmp = sysfs_get_idlestate_name(cpu, idlestates - 1);
-	if (!tmp) {
-		printf(_("Could not determine max idle state %u\n"),
-		       idlestates - 1);
-		return;
-	}
-
 	printf(_("Number of idle states: %d\n"), idlestates);
 	printf(_("Available idle states:"));
 	for (idlestate = 0; idlestate < idlestates; idlestate++) {
-- 
1.7.6.1

