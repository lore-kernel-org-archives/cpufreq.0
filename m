From: Andre Przywara <andre.przywara@amd.com>
Subject: [PATCH 3/8] cpufreq: Add compatibility hack to powernow-k8
Date: Thu, 26 Jul 2012 14:28:39 +0200
Message-ID: <1343305724-2809-4-git-send-email-andre.przywara@amd.com>
References: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343305724-2809-1-git-send-email-andre.przywara@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Renninger <trenn@suse.de>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@amd.com>

From: Matthew Garrett <mjg@redhat.com>

cpufreq modules are often loaded from init scripts that assume that all
recent AMD systems will use powernow-k8, so we should ensure that loading
it triggers a load of acpi-cpufreq if the latter is built as a module.
This avoids the problem of users ending up without any cpufreq support
after the transition.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
Signed-off-by: Andre Przywara <andre.przywara@amd.com>
---
 drivers/cpufreq/powernow-k8.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index c0e8164..6e35ed2 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1567,8 +1567,12 @@ static int __cpuinit powernowk8_init(void)
 			supported_cpus++;
 	}
 
-	if (supported_cpus != num_online_cpus())
+	if (supported_cpus != num_online_cpus()) {
+		if (static_cpu_has(X86_FEATURE_HW_PSTATE))
+			request_module("acpi_cpufreq");
+
 		return -ENODEV;
+	}
 
 	printk(KERN_INFO PFX "Found %d %s (%d cpu cores) (" VERSION ")\n",
 		num_online_nodes(), boot_cpu_data.x86_model_id, supported_cpus);
-- 
1.7.4.4

