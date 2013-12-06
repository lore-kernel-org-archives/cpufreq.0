From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 2/3] clk: exynos5420: Add alias names for cpu clocks
Date: Fri,  6 Dec 2013 15:18:03 +0530
Message-ID: <1386323284-15646-3-git-send-email-arun.kk@samsung.com>
References: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PHM3dTEXJxFiWxVUP9E2wqS5yl9untRU0EgtL57cnrM=;
        b=kjj9W6Sjg7kl21b8InBKN7prifPBV3R4rL4vNZlRm56apvwx7WObyVZmzbJ/zi0JAN
         /yd/5P9/b7EWR7atDE7+3DLy3YeF+OOHp9zfxuTNM7dKeoJueD3BkpY4zrMNJXAelWUB
         b7JG5d/kVYowaXOGX8h1mKOiNTKo8uHMCErbrHj6C3xTMPmZYRs80hn2TEqtAzX5zvrB
         l6oc+/y88egqRNA92Uf0lUlANC2py8g77QPWJYadCKK9A+3BrrjA5qg93tuRnSolV9op
         RRyr7LGzv2QOGpBuPUfZreS3pIoES+FjJAn7QpinUvR7l4Iq4lLkfAUcWBWB/N9qMOlC
         SjhA==
In-Reply-To: <1386323284-15646-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, rjw@rjwysocki.net, viresh.kumar@linaro.org, tomasz.figa@gmail.com, arjun.kv@samsung.com, abrestic@chromium.org, arunkk.samsung@gmail.com

Adds alias names for cpu clocks to be used in the cpufreq driver.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 48c4a93..c65c040 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -316,9 +316,10 @@ static struct samsung_fixed_factor_clock exynos5420_fixed_factor_clks[] __initda
 
 static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 	MUX(none, "mout_mspll_kfc", mspll_cpu_p, SRC_TOP7, 8, 2),
-	MUX(none, "mout_mspll_cpu", mspll_cpu_p, SRC_TOP7, 12, 2),
-	MUX(none, "mout_apll", apll_p, SRC_CPU, 0, 1),
-	MUX(none, "mout_cpu", cpu_p, SRC_CPU, 16, 1),
+	MUX_A(none, "mout_mspll_cpu", mspll_cpu_p, SRC_TOP7, 12, 2,
+			"mout_mspll_cpu"),
+	MUX_A(none, "mout_apll", apll_p, SRC_CPU, 0, 1, "mout_apll"),
+	MUX_A(none, "mout_cpu", cpu_p, SRC_CPU, 16, 1, "mout_cpu"),
 	MUX(none, "mout_kpll", kpll_p, SRC_KFC, 0, 1),
 	MUX(none, "mout_cpu_kfc", kfc_p, SRC_KFC, 16, 1),
 
@@ -373,7 +374,7 @@ static struct samsung_mux_clock exynos5420_mux_clks[] __initdata = {
 
 	MUX(none, "sclk_mpll", mpll_p, SRC_TOP6, 0, 1),
 	MUX(none, "sclk_vpll", vpll_p, SRC_TOP6, 4, 1),
-	MUX(none, "sclk_spll", spll_p, SRC_TOP6, 8, 1),
+	MUX_A(none, "sclk_spll", spll_p, SRC_TOP6, 8, 1, "mout_spll"),
 	MUX(none, "sclk_ipll", ipll_p, SRC_TOP6, 12, 1),
 	MUX(none, "sclk_rpll", rpll_p, SRC_TOP6, 16, 1),
 	MUX(none, "sclk_epll", epll_p, SRC_TOP6, 20, 1),
-- 
1.7.9.5
