From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/4] cpufreq: Use cpufreq-cpu0 driver for Exynos3250
Date: Fri, 13 Jun 2014 15:08:09 +0900
Message-ID: <1402639693-31108-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, shawn.guo@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, viresh.kumar@linaro.org, thomas.ab@samsung.com, heiko@sntech.de, kyungmin.park@samsung.com, cw00.choi@samsung.com

This patchset use cpufreq-cpu0 driver to support Exynos3250 cpufreq. So, this
patchset is based on following patchset[1] by Thomas Abraham.
 [1] http://www.spinics.net/lists/linux-samsung-soc/msg31593.html

Chanwoo Choi (4):
  clk: samsung: exynos3250: Use cpu-clock provider type to support cpufreq
  clk: samsung: Add support for cpu clocks of Exynos3250
  Documentation: devicetree: Add cpu clock configuration data binding for Exynos3250
  ARM: dts: Exynos: Add cpu clock table and armclk divider table for Exynos3250

 .../devicetree/bindings/clock/exynos3250-clock.txt | 32 ++++++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi                  | 28 +++++++++++++++++++
 drivers/clk/samsung/clk-cpu.c                      | 31 +++++++++++++++++----
 drivers/clk/samsung/clk-exynos3250.c               | 14 +++++++---
 4 files changed, 96 insertions(+), 9 deletions(-)

-- 
1.8.0
