From: Nishanth Menon <nm@ti.com>
Subject: [PATCH 2/2] cpufreq: cpufreq-cpu0: provide compatibility string for DT matchup
Date: Mon, 11 Mar 2013 18:05:30 -0500
Message-ID: <1363043130-30270-3-git-send-email-nm@ti.com>
References: <1363043130-30270-1-git-send-email-nm@ti.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
         :in-reply-to:references;
        bh=6lMw7rPqz+CviVoZnI/e4QtKnWBJMcineUoVI2lq6ug=;
        b=u45sCCP/FZ5dHM26jEooXuOxd1q9IM79HOb/KICZ3bHDLYdMeOpVNRFYLa103zb7mH
         APH4DfAykbQ8Q/M/xUPMrcXS40DszTQ+Fejxs7QSD/m5UYPyugqyLezVbM82u500uMyR
         5gRqyCe6kBw9aM7nSjXH8kNJf3FiZ/UghfGY09HaH/YZ/lV+LUy0Ll4CkDxCAEBndqVH
         NaByup9JxdadaQpTCaKebf3mhZaCSnM7VXauEeTz4DbkL9GKJL5OxXycAW3joD0JfJ2N
         rSQie2KCLnUy9PXUNxf/eNANSTWqs9CyiEZ+w/XzTRlpK8ycOtXGBDE71NNKGxGid06a
         4AYg==
In-Reply-To: <1363043130-30270-1-git-send-email-nm@ti.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@vger.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org

commit 5553f9e (cpufreq: instantiate cpufreq-cpu0 as a platform_driver)
now forces platform device to be registered for allowing cpufreq-cpu0
to be used by SoCs. example: drivers/cpufreq/highbank-cpufreq.c

However, for SoCs that wish to link up using device tree, instead
of platform device, provide compatibility string match:
compatible = "cpufreq,cpu0";

Cc: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Santosh Shilimkar <santosh.shilimkar@ti.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-kernel@vger.kernel.org
Cc: cpufreq@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linux-omap@vger.kernel.org

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    3 +++
 drivers/cpufreq/cpufreq-cpu0.c                     |    6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
index f180963..a5699f0 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
@@ -10,6 +10,8 @@ under node /cpus/cpu@0.
 Required properties:
 - operating-points: Refer to Documentation/devicetree/bindings/power/opp.txt
   for details
+- compatible: if platform_device is *not* used, should be:
+  "cpufreq,cpu0"
 
 Optional properties:
 - clock-name: If the clock is not converted to device tree, then describe
@@ -24,6 +26,7 @@ Examples:
 cpus {
 	#address-cells = <1>;
 	#size-cells = <0>;
+	compatible = "cpufreq,cpu0";
 
 	cpu@0 {
 		compatible = "arm,cortex-a9";
diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 28223c9..a6f0a9b 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -277,9 +277,15 @@ static int cpu0_cpufreq_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id of_cpu0_cpufreq_match[] = {
+	{ .compatible = "cpufreq,cpu0", },
+	{ /* end */ }
+};
+
 static struct platform_driver cpu0_cpufreq_platdrv = {
 	.driver = {
 		.name	= "cpufreq-cpu0",
+		.of_match_table = of_cpu0_cpufreq_match,
 		.owner	= THIS_MODULE,
 	},
 	.probe		= cpu0_cpufreq_probe,
-- 
1.7.9.5

