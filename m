From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 4/4] cpufreq-aperf: mperf might tick faster than expected, esp on Intel
Date: Tue, 1 Feb 2011 16:25:13 +0100
Message-ID: <201102011625.13898.trenn@suse.de>
References: <cover.1296572755.git.trenn@suse.de> <7043858684c755c587d032735f35e5df5e0f624c.1296572755.git.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <7043858684c755c587d032735f35e5df5e0f624c.1296572755.git.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: linux@dominikbrodowski.net
Cc: cpufreq@vger.kernel.org, herrmann.der.user@googlemail.com

I sent an old/broken patch (4/4).

This one is better:

cpufreq-aperf: mperf might tick faster than expected, esp on Intel

fixes lines like that:

CPU     Average freq(KHz)  Time in C0      Time in Cx      C0 percentage
000     2601300            05 sec 004 ms   8155059272 sec 192 ms   100


Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org

---
 utils/cpufreq-aperf.c |    5 ++-
 6 files changed, 293 insertions(+), 211 deletions(-)

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
