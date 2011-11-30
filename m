From: Borislav Petkov <bp@amd64.org>
Subject: [PATCH 2/2] powernow-k8: Fix unregister order
Date: Wed, 30 Nov 2011 15:49:55 +0100
Message-ID: <1322664595-23489-2-git-send-email-bp@amd64.org>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <borislav.petkov@amd.com>

From: Borislav Petkov <borislav.petkov@amd.com>

When we're CPB capable and have allocated a percpu msrs variable, we
need to first unregister the notifier and then free the msrs because the
notifier touches the said variable which could disappear in-between.

Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
---
 drivers/cpufreq/powernow-k8.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 1c6d879..c36983e 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1582,7 +1582,7 @@ static int __cpuinit powernowk8_init(void)
 	}
 
 	rv = cpufreq_register_driver(&cpufreq_amd64_driver);
-	if (rv < 0 && boot_cpu_has(X86_FEATURE_CPB)) {
+	if (rv < 0 && cpb_capable) {
 		unregister_cpu_notifier(&cpb_nb);
 		msrs_free(msrs);
 		msrs = NULL;
@@ -1595,11 +1595,10 @@ static void __exit powernowk8_exit(void)
 {
 	pr_debug("exit\n");
 
-	if (boot_cpu_has(X86_FEATURE_CPB)) {
+	if (cpb_capable) {
+		unregister_cpu_notifier(&cpb_nb);
 		msrs_free(msrs);
 		msrs = NULL;
-
-		unregister_cpu_notifier(&cpb_nb);
 	}
 
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
-- 
1.7.8.rc0

