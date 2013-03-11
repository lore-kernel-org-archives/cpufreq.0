From: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Subject: [PATCH v2] kirkwood: fix coccicheck warnings
Date: Mon, 11 Mar 2013 17:14:02 +0200
Message-ID: <1363014842-11659-1-git-send-email-silviupopescu1990@gmail.com>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=bp8Ji+PjNBnJ9mD2OLZ2G1V3pgrnqy3z0wMeIBJv2VY=;
        b=QWri58u5BjNzT5TotNx8bCLUWujHq8VuZHvcT627yM1fmq/5a2vLs7q4o2LytkLdpf
         S5orf7cvPjeNOMz6+SIGUoPKRTB4ZUZgXvXUqUhmbos3NsEu7yOzD0raqhXVupLRS9D+
         s0GZFLaopFzZg88mQuyFgESddPmsKyljz+QfwccEeo3hXk4MmZyN6mZkAfDT6Rvk+pat
         7FtuxHCr360dW7R1OCuS0ocHqk3RxpTXwclUVjZ1p35reT3Yaz18s0wZEUq4VB+/gCH/
         L1qj0zLEHzqo386ZG5BOFPHyECC7OR7qCq/9ZosxXFWgn+LybiKUinLp3g07l4P7/CK5
         SQmA==
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: rjw@sisk.pl, jason@lakedaemon.net, andrew@lunn.ch, daniel.lezcano@linaro.org, len.brown@intel.com, rob.lee@linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Silviu-Mihai Popescu <silviupopescu1990@gmail.com>

Convert all uses of devm_request_and_ioremap() to the newly introduced
devm_ioremap_resource() which provides more consistent error handling.

devm_ioremap_resource() provides its own error messages so all explicit
error messages can be removed from the failure code paths.

Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
---
 drivers/cpufreq/kirkwood-cpufreq.c |    8 +++-----
 drivers/cpuidle/cpuidle-kirkwood.c |    6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/kirkwood-cpufreq.c b/drivers/cpufreq/kirkwood-cpufreq.c
index 0e83e3c..6052476 100644
--- a/drivers/cpufreq/kirkwood-cpufreq.c
+++ b/drivers/cpufreq/kirkwood-cpufreq.c
@@ -175,11 +175,9 @@ static int kirkwood_cpufreq_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Cannot get memory resource\n");
 		return -ENODEV;
 	}
-	priv.base = devm_request_and_ioremap(&pdev->dev, res);
-	if (!priv.base) {
-		dev_err(&pdev->dev, "Cannot ioremap\n");
-		return -EADDRNOTAVAIL;
-	}
+	priv.base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv.base))
+		return PTR_ERR(priv.base);
 
 	np = of_find_node_by_path("/cpus/cpu@0");
 	if (!np)
diff --git a/drivers/cpuidle/cpuidle-kirkwood.c b/drivers/cpuidle/cpuidle-kirkwood.c
index 670aa1e..53aad73 100644
--- a/drivers/cpuidle/cpuidle-kirkwood.c
+++ b/drivers/cpuidle/cpuidle-kirkwood.c
@@ -66,9 +66,9 @@ static int kirkwood_cpuidle_probe(struct platform_device *pdev)
 	if (res == NULL)
 		return -EINVAL;
 
-	ddr_operation_base = devm_request_and_ioremap(&pdev->dev, res);
-	if (!ddr_operation_base)
-		return -EADDRNOTAVAIL;
+	ddr_operation_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(ddr_operation_base))
+		return PTR_ERR(ddr_operation_base);
 
 	device = &per_cpu(kirkwood_cpuidle_device, smp_processor_id());
 	device->state_count = KIRKWOOD_MAX_STATES;
-- 
1.7.9.5

