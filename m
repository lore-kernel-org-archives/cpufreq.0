From: Vishwanath BS <vishwanath.bs@ti.com>
Subject: [PATCH] cpufreq: Add documentation for sampling_down_factor
Date: Tue, 25 Jan 2011 16:03:03 +0530
Message-ID: <1295951583-19997-1-git-send-email-vishwanath.bs@ti.com>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: patches@linaro.org, Vishwanath BS <vishwanath.bs@ti.com>

Update cpufreq governor documentation for sampling_down_factor tunable
parameter.

Signed-off-by: Vishwanath BS <vishwanath.bs@ti.com>
---
 Documentation/cpu-freq/governors.txt |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/Documentation/cpu-freq/governors.txt b/Documentation/cpu-freq/governors.txt
index 737988f..ef570ff
--- a/Documentation/cpu-freq/governors.txt
+++ b/Documentation/cpu-freq/governors.txt
@@ -158,6 +158,16 @@ intensive calculation on your laptop that you do not care how long it
 takes to complete as you can 'nice' it and prevent it from taking part
 in the deciding process of whether to increase your CPU frequency.
 
+sampling_down_factor: this parameter controls the rate at which the
+kernel makes a decision on when to decrease the frequency while running
+at top speed. Set to 1 it makes no changes from existing behavior,
+but set to greater than 1 (e.g. 100) it acts as a multiplier for the
+scheduling interval for reevaluating load when the CPU is at its top
+speed due to high load. This improves performance by reducing the overhead
+of load evaluation and helping the CPU stay at its top speed when truly
+busy, rather than shifting back and forth in speed. This tunable has no
+effect on behavior at lower speeds/lower CPU loads.
+
 
 2.5 Conservative
 ----------------
-- 
1.7.0.4

