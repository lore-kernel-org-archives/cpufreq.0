From: Thomas Abraham <ta.omasab@gmail.com>
Subject: [PATCH v3 1/7] cpufreq: cpufreq-cpu0: allow use of optional boost mode frequencies
Date: Fri,  7 Feb 2014 21:25:42 +0530
Message-ID: <1391788548-13056-2-git-send-email-thomas.ab@samsung.com>
References: <1391788548-13056-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4y5u83U/dN6NkUusEdv0lgDXer+eELJgwwzliPycBrc=;
        b=p1FXpMlkrJrS8JHDmS4uR5GEru0OWRHGbcYxYNsaXq5fcVqqBqZzJYbx7UTUC+7TRe
         XE2Jcuksay65f++RnCZoe9BJjzKAqG9+ueOsItUmmHqYariZysPuzx1C4LXukJYRhEIe
         ZF9Uhf2J5CRb8eWtr1ElDixCGGvJs+GglAD298EcjezOrO5OU/Vax3uhJKRmP8YJ9gNv
         nThqNfDD8VdKEeaPITS9Vxk1YQBeIz7Imm98Q0beS1o3UAYCnE4ptuJX83vcqBvAphNl
         wsF5U42Vg+2nyBeqSqXIhmj5NzpDCvHdXIjMdSR97hA5CHbzsAZGvEpA/30yWf4pJTLi
         UjrA==
In-Reply-To: <1391788548-13056-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, l.majewski@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de

From: Thomas Abraham <thomas.ab@samsung.com>

Lookup for the optional boost-frequency property in cpu0 node and if
available, enable support for boost mode frequencies. The frequencies
usable in boost mode are determined while preparing the cpufreq table
from the list of operating points available.

In addition to this, enable the CPU_FREQ_BOOST_SW config option for
this driver by default. On platforms that do not support boost mode,
the boost mode frequencies will not be specified in cpu0 node and
hence the boost mode support will not be enabled. Since this driver
anyways depends on THERMAL config option, it is safe to enable
CPU_FREQ_BOOST_SW config option as default.

Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt |    2 ++
 drivers/cpufreq/Kconfig                                    |    1 +
 drivers/cpufreq/cpufreq-cpu0.c                             |    3 +++
 3 files changed, 6 insertions(+)

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
index 4b029c0..52cc704 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -187,6 +187,7 @@ config GENERIC_CPUFREQ_CPU0
 	tristate "Generic CPU0 cpufreq driver"
 	depends on HAVE_CLK && REGULATOR && OF && THERMAL && CPU_THERMAL
 	select PM_OPP
+	select CPU_FREQ_BOOST_SW
 	help
 	  This adds a generic cpufreq driver for CPU0 frequency management.
 	  It supports both uniprocessor (UP) and symmetric multiprocessor (SMP)
diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 0c12ffc..06539eb 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -195,6 +195,9 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 			transition_latency += ret * 1000;
 	}
 
+	if (of_find_property(cpu_dev->of_node, "boost-frequency", NULL))
+		cpu0_cpufreq_driver.boost_supported = true;
+
 	ret = cpufreq_register_driver(&cpu0_cpufreq_driver);
 	if (ret) {
 		pr_err("failed register driver: %d\n", ret);
-- 
1.7.10.4
