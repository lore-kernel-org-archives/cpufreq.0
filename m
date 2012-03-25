From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 06/13] cpupower: Remove unneeded code and by that fix a memleak
Date: Sun, 25 Mar 2012 20:38:47 +0200
Message-ID: <1332700734-26435-6-git-send-email-linux@dominikbrodowski.net>
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
Cc: Thomas Renninger <trenn@suse.de>, Dominik Brodowski <linux@dominikbrodowski.net>

From: Thomas Renninger <trenn@suse.de>

Looks like some not needed debug code slipped in.
Also this code:
tmp = sysfs_get_idlestate_name(cpu, idlestates - 1);
performs a strdup and the mem was not freed again.
-> delete it.

Signed-off-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
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
1.7.5.4

