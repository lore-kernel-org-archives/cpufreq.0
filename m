From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/8] cpufreq-aperf: mperf might tick faster than expected, esp on Intel
Date: Wed,  9 Feb 2011 14:56:35 +0100
Message-ID: <baf510657c4f1bd118b96dde3d4d56dc0acc17df.1297259254.git.trenn@suse.de>
References: <cover.1297259254.git.trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <cover.1297259254.git.trenn@suse.de>
In-Reply-To: <cover.1297259254.git.trenn@suse.de>
References: <cover.1297259254.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net
Cc: lenb@kernel.org, andreas.herrmann3@amd.com, Thomas Renninger <trenn@suse.de>, cpufreq@vger.kernel.org

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 utils/cpufreq-aperf.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/utils/cpufreq-aperf.c b/utils/cpufreq-aperf.c
index c9461ae..07494a8 100644
--- a/utils/cpufreq-aperf.c
+++ b/utils/cpufreq-aperf.c
@@ -153,7 +153,10 @@ static int get_C_state_time(struct timeval time_diff, uint64_t mperf_diff,
 	expected_ticks = max_freq * overall_msecs;
 	*percent = (mperf_diff * 100) / expected_ticks;
 
-	cx_time = (expected_ticks - mperf_diff) / max_freq;
+	if (mperf_diff > expected_ticks)
+		cx_time = 0;
+	else
+		cx_time = (expected_ticks - mperf_diff) / max_freq;
 	c0_time = mperf_diff / max_freq;
 
 	CX_time->tv_sec  = cx_time / 1000;
-- 
1.7.3.4

