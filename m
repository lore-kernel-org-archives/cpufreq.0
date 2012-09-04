From: Andre Przywara <andre.przywara@amd.com>
Subject: [PATCH 4/8 v2] powernow-k8: delay info messages until initialization has succeeded
Date: Tue, 4 Sep 2012 10:28:05 +0200
Message-ID: <1346747289-8421-5-git-send-email-andre.przywara@amd.com>
References: <1346747289-8421-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1346747289-8421-1-git-send-email-andre.przywara@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Thomas Renninger <trenn@suse.de>
Cc: Matthew Garret <mjg@redhat.com>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Herrmann <andreas.herrmann3@amd.com>, Andre Przywara <andre.przywara@amd.com>

powernow-k8 is quite prematurely crying Hooray and outputs diagnostic
messages, although the actual initialization can still fail.
Since now we may have acpi-cpufreq already loaded, we move the
messages at the end of the init routine to avoid confusing output
if the loading of powernow-k8 should not succeed.

Signed-off-by: Andre Przywara <andre.przywara@amd.com>
---
 drivers/cpufreq/powernow-k8.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 16c7fb6..8ff0621 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1573,9 +1573,6 @@ static int __cpuinit powernowk8_init(void)
 	if (supported_cpus != num_online_cpus())
 		return -ENODEV;
 
-	printk(KERN_INFO PFX "Found %d %s (%d cpu cores) (" VERSION ")\n",
-		num_online_nodes(), boot_cpu_data.x86_model_id, supported_cpus);
-
 	if (boot_cpu_has(X86_FEATURE_CPB)) {
 
 		cpb_capable = true;
@@ -1594,16 +1591,23 @@ static int __cpuinit powernowk8_init(void)
 			struct msr *reg = per_cpu_ptr(msrs, cpu);
 			cpb_enabled |= !(!!(reg->l & BIT(25)));
 		}
-
-		printk(KERN_INFO PFX "Core Performance Boosting: %s.\n",
-			(cpb_enabled ? "on" : "off"));
 	}
 
 	rv = cpufreq_register_driver(&cpufreq_amd64_driver);
-	if (rv < 0 && boot_cpu_has(X86_FEATURE_CPB)) {
-		unregister_cpu_notifier(&cpb_nb);
-		msrs_free(msrs);
-		msrs = NULL;
+
+	if (!rv)
+		pr_info(PFX "Found %d %s (%d cpu cores) (" VERSION ")\n",
+			num_online_nodes(), boot_cpu_data.x86_model_id,
+			supported_cpus);
+
+	if (boot_cpu_has(X86_FEATURE_CPB)) {
+		if (rv < 0) {
+			unregister_cpu_notifier(&cpb_nb);
+			msrs_free(msrs);
+			msrs = NULL;
+		} else
+			pr_info(PFX "Core Performance Boosting: %s.\n",
+				(cpb_enabled ? "on" : "off"));
 	}
 	return rv;
 }
-- 
1.7.12

