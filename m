From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH] cpufreq powernow-k8: Remove firmware warning in zero transition latency case
Date: Wed, 8 Jun 2011 10:07:13 +0200
Message-ID: <201106081007.14264.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: davej@codemonkey.org.uk
Cc: cpufreq@vger.kernel.org

AMD's BKDG documents that a zero transition latency should get passed for
several recent CPU models.
-> This isn't a firmware bug.

I did not dare to really pass the zero latency to the cpufreq core,
this would need careful checking whether this does not show side effects.
-> Still modify latency to 1 (us) in case BIOS passes zero.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: cpufreq@vger.kernel.org
CC: davej@codemonkey.org.uk

---
 drivers/cpufreq/powernow-k8.c |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 83479b6..170ad36 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1022,18 +1022,9 @@ static int get_transition_latency(struct powernow_k8_data *data)
 		if (cur_latency > max_latency)
 			max_latency = cur_latency;
 	}
-	if (max_latency == 0) {
-		/*
-		 * Fam 11h and later may return 0 as transition latency. This
-		 * is intended and means "very fast". While cpufreq core and
-		 * governors currently can handle that gracefully, better set it
-		 * to 1 to avoid problems in the future.
-		 */
-		if (boot_cpu_data.x86 < 0x11)
-			printk(KERN_ERR FW_WARN PFX "Invalid zero transition "
-				"latency\n");
+	if (max_latency == 0)
 		max_latency = 1;
-	}
+
 	/* value in usecs, needs to be in nanoseconds */
 	return 1000 * max_latency;
 }
