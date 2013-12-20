From: John Tobias <john.tobias.ph@gmail.com>
Subject: [PATCH v3 2/2] cpufreq: imx6q: add of_init_opp_table
Date: Thu, 19 Dec 2013 20:15:29 -0800
Message-ID: <1387512929-7304-2-git-send-email-john.tobias.ph@gmail.com>
References: <1387512929-7304-1-git-send-email-john.tobias.ph@gmail.com>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U+Wwqla+PfsT/czEExdUyWvGG0SRQnyNF4LIAQzzdCg=;
        b=ootA4D2HVdko+FDhPYBWXRRzF9sGc0HPBLKCj8FXMl/rrRAq8emQX5Qd8nLyUywM7G
         IrsFxgeb7J2788yWA4PBVmym5ySrPRLqZOeeWs9P1CC+ZU/TnoF4WrdUCXb2InOeEaqO
         hU8z4tM4r/i/79H43a2VGrQJNmpQ/PonTzM/7rM9MIrv3iKGhyLWUEN1r2n9hml0MZTK
         GRAnPUXn6JxyDnicWJhSS5Thq6rfiTW4iAtFarujc3Tv7/HadTohF5FckJp7UEom60Ja
         YAbQT0FZQBfOB3FAdPAQ4zvC+O3453ScLX/BQWkjuWklNs4Uiw6U32U9QkSvXur5Vk3g
         z53g==
In-Reply-To: <1387512929-7304-1-git-send-email-john.tobias.ph@gmail.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, rjw@rjwysocki.net, shawn.guo@linaro.org, festevam@gmail.com, b20788@freescale.com, viresh.kumar@linaro.org
Cc: John Tobias <john.tobias.ph@gmail.com>

Add a routine check to see if the platform supplied the OPP table.
Incase there's not OPP table exist, it will try to get it.

Signed-off-by: John Tobias <john.tobias.ph@gmail.com>
---
 drivers/cpufreq/imx6q-cpufreq.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index 4b3f18e..f261a88 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -187,12 +187,25 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 		goto put_node;
 	}
 
-	/* We expect an OPP table supplied by platform */
+	/* We expect an OPP table supplied by platform.
+	 * Just, incase the platform did not supply the OPP
+	 * table, it will try to get it.
+	 */
 	num = dev_pm_opp_get_opp_count(cpu_dev);
 	if (num < 0) {
-		ret = num;
-		dev_err(cpu_dev, "no OPP table is found: %d\n", ret);
-		goto put_node;
+		ret = of_init_opp_table(cpu_dev);
+		if (ret < 0) {
+			dev_err(cpu_dev, "failed to init OPP table\n");
+			ret = -ENODEV;
+			goto put_node;
+		}
+
+		num = dev_pm_opp_get_opp_count(cpu_dev);
+		if (num < 0) {
+			ret = num;
+			dev_err(cpu_dev, "no OPP table is found: %d\n", ret);
+			goto put_node;
+		}
 	}
 
 	ret = dev_pm_opp_init_cpufreq_table(cpu_dev, &freq_table);
-- 
1.8.3.2

