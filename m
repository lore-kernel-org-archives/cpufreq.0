From: John Tobias <john.tobias.ph@gmail.com>
Subject: [PATCH v3] cpufreq: imx6q: add of_init_opp_table
Date: Thu, 19 Dec 2013 22:56:28 -0800
Message-ID: <1387522588-13114-1-git-send-email-john.tobias.ph@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=tu4YdXPJvolhPbvicolhpl/EDXWZiUTXh+V7XS5moZo=;
        b=xmOG/2zU6by1q49XaUDRXL3Ahf7ZPo1xrabDsCPtEW2pNP78/qEcVGw/A5fZbbBiKf
         A0S6o4+SA98H+GAr6CWpwf6msUqk3nd7ZXXeaGnH9Q4B5kW2czrLyHcQ5T58gkKBg2HU
         8cz2LAF92KbJ5mzUpEbAK2UTdOxCR3Kph/l6pcpjhVvcEh21/jDbHx5f8pct03ZpAbuV
         g8oft+n5fJcoj86Mu3q0ud3YyjOsRJNCKfzKbiiVxV1uMzjycebKTR3hjTDQt6f7MOsq
         sf6M+5sCHrHHM0Ki+n/6eStH4p0aD11jpw4dKjK7/8sp/NOeeu+obcGChreVvE0vZnxS
         nP+A==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, cpufreq@vger.kernel.org, rjw@rjwysocki.net, shawn.guo@linaro.org, festevam@gmail.com, b20788@freescale.com, viresh.kumar@linaro.org
Cc: John Tobias <john.tobias.ph@gmail.com>

Add a routine check to see if the platform supplied the OPP table.
Incase there's no OPP table exist, it will try to initialise it.

It's been tested on iMX6SL board where the platform doesn't have
an OPP table.

Signed-off-by: John Tobias <john.tobias.ph@gmail.com>
---
 drivers/cpufreq/imx6q-cpufreq.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index 4b3f18e..e125aed 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -187,12 +187,25 @@ static int imx6q_cpufreq_probe(struct platform_device *pdev)
 		goto put_node;
 	}
 
-	/* We expect an OPP table supplied by platform */
+	/*
+	 * We expect an OPP table supplied by platform.
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
+			dev_err(cpu_dev, "failed to init OPP table: %d\n", ret);
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

