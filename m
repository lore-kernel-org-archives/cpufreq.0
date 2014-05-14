From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH v4 1/8] cpufreq: cpufreq-cpu0: allow use of optional boost mode frequencies
Date: Wed, 14 May 2014 06:41:09 +0530
Message-ID: <1400029876-5830-2-git-send-email-thomas.ab@samsung.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v1RT4ePQBYZrmeBG1yy1JgeKOVI41qfUV+AYrI0m0fA=;
        b=RiuFnUUTRzol8hzjxpI0sVik6UftUuUfNIyc5qXheCcd2/UFuuoDLnbrGkV+gVYzRJ
         bgBmR2BhsgaS3FaSveIktdlu7vyWS/uLAkLK9yR9cFoQriuf6aHnE40Y8qvEDFtK+oWc
         OzohnxA3ysn38S1XpR3ekBuws7y7zo95zrg+grJ6wpncM+Gn707b16EKcj/P1WcJNoCY
         UG2mZOfKNAvyCetvWWuW2lSOGV1pYfGantUaJay1jZgRZj1naQYu8NDWKdw1z30SRHcv
         V9L9xV/z/sDkA+KUQv07FTGJLPPJp558aKYMLPv4Pe7ebK6wxO+rJLRbHujEcFIj0Nb3
         lyhQ==
In-Reply-To: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, shawn.guo@linaro.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, heiko@sntech.de, thomas.ab@samsung.com

From: Thomas Abraham <thomas.ab@samsung.com>

Lookup for the optional boost-frequency property in cpu0 node and if
available, enable support for boost mode frequencies. The frequencies
usable in boost mode are determined while preparing the cpufreq table
from the list of operating points available.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 .../devicetree/bindings/cpufreq/cpufreq-cpu0.txt   |    2 ++
 drivers/cpufreq/Kconfig                            |   11 +++++++++++
 drivers/cpufreq/cpufreq-cpu0.c                     |    5 +++++
 3 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
index f055515..60f321a 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
@@ -19,6 +19,8 @@ Optional properties:
 - cooling-min-level:
 - cooling-max-level:
      Please refer to Documentation/devicetree/bindings/thermal/thermal.txt.
+- boost-frequency:
+     Please refer to Documentation/devicetree/bindings/cpufreq/cpufreq-boost.txt
 
 Examples:
 
diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 1fbe11f..0ca4485 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -194,6 +194,17 @@ config GENERIC_CPUFREQ_CPU0
 
 	  If in doubt, say N.
 
+config GENERIC_CPUFREQ_CPU0_BOOST
+	bool "Boost frequency support for generic CPU0 cpufreq driver"
+	depends on GENERIC_CPUFREQ_CPU0
+	select CPU_FREQ_BOOST_SW
+	help
+	  This enables support for software managed overclocking (BOOST). It
+	  allows usage of special frequencies (those beyond the normal operating
+	  frequencies).
+
+	  If in doubt, say N.
+
 menu "x86 CPU frequency scaling drivers"
 depends on X86
 source "drivers/cpufreq/Kconfig.x86"
diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 1bf6bba..e6c21a8 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -194,6 +194,11 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 			transition_latency += ret * 1000;
 	}
 
+#ifdef CONFIG_GENERIC_CPUFREQ_CPU0_BOOST
+	if (of_find_property(cpu_dev->of_node, "boost-frequency", NULL))
+		cpu0_cpufreq_driver.boost_supported = true;
+#endif
+
 	ret = cpufreq_register_driver(&cpu0_cpufreq_driver);
 	if (ret) {
 		pr_err("failed register driver: %d\n", ret);
-- 
1.7.4.4

