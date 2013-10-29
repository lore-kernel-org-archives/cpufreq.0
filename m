From: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Subject: [PATCH v3 4/4] ARM: vexpress/TC2: register vexpress-spc cpufreq device
Date: Tue, 29 Oct 2013 12:18:40 +0000
Message-ID: <1383049120-8336-5-git-send-email-Sudeep.KarkadaNagesha@arm.com>
References: <1383049120-8336-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1383049120-8336-1-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Sudeep.KarkadaNagesha@arm.com, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>

From: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>

This patch adds vexpress-spc platform device to enables the vexpress
SPC cpufreq interface driver.

Signed-off-by: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
Acked-by: Pawel Moll <Pawel.Moll@arm.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/mach-vexpress/spc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-vexpress/spc.c b/arch/arm/mach-vexpress/spc.c
index 3532e26..033d34d 100644
--- a/arch/arm/mach-vexpress/spc.c
+++ b/arch/arm/mach-vexpress/spc.c
@@ -24,6 +24,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/semaphore.h>
@@ -537,6 +538,7 @@ static int __init ve_spc_clk_init(void)
 			pr_warn("failed to initialise cpu%d opp table\n", cpu);
 	}
 
+	platform_device_register_simple("vexpress-spc-cpufreq", -1, NULL, 0);
 	return 0;
 }
 module_init(ve_spc_clk_init);
-- 
1.8.1.2

