From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 05/13] cpupower: Fix number of idle states
Date: Sun, 25 Mar 2012 20:38:46 +0200
Message-ID: <1332700734-26435-5-git-send-email-linux@dominikbrodowski.net>
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

The number of idle states was wrong.
The POLL idle state (on X86) was missed out:
Number of idle states: 4
Available idle states: C1-NHM C3-NHM C6-NHM

While the POLL is not a real idle state, its
statistics should still be shown. It's now also
explained in a detailed manpage.
This should fix a bug of missing the first idle
state on other archs.

Signed-off-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
---
 tools/power/cpupower/utils/cpuidle-info.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/power/cpupower/utils/cpuidle-info.c b/tools/power/cpupower/utils/cpuidle-info.c
index b028267..e076beb 100644
--- a/tools/power/cpupower/utils/cpuidle-info.c
+++ b/tools/power/cpupower/utils/cpuidle-info.c
@@ -43,9 +43,8 @@ static void cpuidle_cpu_output(unsigned int cpu, int verbose)
 	}
 
 	printf(_("Number of idle states: %d\n"), idlestates);
-
 	printf(_("Available idle states:"));
-	for (idlestate = 1; idlestate < idlestates; idlestate++) {
+	for (idlestate = 0; idlestate < idlestates; idlestate++) {
 		tmp = sysfs_get_idlestate_name(cpu, idlestate);
 		if (!tmp)
 			continue;
@@ -57,7 +56,7 @@ static void cpuidle_cpu_output(unsigned int cpu, int verbose)
 	if (!verbose)
 		return;
 
-	for (idlestate = 1; idlestate < idlestates; idlestate++) {
+	for (idlestate = 0; idlestate < idlestates; idlestate++) {
 		tmp = sysfs_get_idlestate_name(cpu, idlestate);
 		if (!tmp)
 			continue;
-- 
1.7.5.4

