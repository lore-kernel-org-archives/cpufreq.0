From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/4] cpufreq-aperf: mperf might tick faster than expected, esp on Intel
Date: Tue,  1 Feb 2011 16:11:44 +0100
Message-ID: <7043858684c755c587d032735f35e5df5e0f624c.1296572755.git.trenn@suse.de>
References: <cover.1296572755.git.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <cover.1296572755.git.trenn@suse.de>
In-Reply-To: <cover.1296572755.git.trenn@suse.de>
References: <cover.1296572755.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: cpufreq@vger.kernel.org, herrmann.der.user@googlemail.com, Thomas Renninger <trenn@suse.de>

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 utils/cpufreq-aperf.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/utils/cpufreq-aperf.c b/utils/cpufreq-aperf.c
index c9461ae..ac5e3ac 100644
--- a/utils/cpufreq-aperf.c
+++ b/utils/cpufreq-aperf.c
@@ -153,7 +153,10 @@ static int get_C_state_time(struct timeval time_diff, uint64_t mperf_diff,
 	expected_ticks = max_freq * overall_msecs;
 	*percent = (mperf_diff * 100) / expected_ticks;
 
-	cx_time = (expected_ticks - mperf_diff) / max_freq;
+	if (mperf_diff > expected_ticks)
+		cx_time = c0_time;
+	else
+		cx_time = (expected_ticks - mperf_diff) / max_freq;
 	c0_time = mperf_diff / max_freq;
 
 	CX_time->tv_sec  = cx_time / 1000;
-- 
1.7.3.4

