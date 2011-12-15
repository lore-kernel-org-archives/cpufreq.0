From: Richard Zhao <richard.zhao@linaro.org>
Subject: [RFC V1 2/4] dts/imx6q: add cpufreq property
Date: Thu, 15 Dec 2011 19:16:36 +0800
Message-ID: <1323947798-25251-2-git-send-email-richard.zhao@linaro.org>
References: <1323947798-25251-1-git-send-email-richard.zhao@linaro.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1323947798-25251-1-git-send-email-richard.zhao@linaro.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, cpufreq@vger.kernel.org
Cc: linux@arm.linux.org.uk, davej@redhat.com, kernel@pengutronix.de, shawn.guo@linaro.org, eric.miao@linaro.org, linaro-dev@lists.linaro.org, patches@linaro.org, Richard Zhao <richard.zhao@linaro.org>

Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
---
 arch/arm/boot/dts/imx6q.dtsi |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q.dtsi b/arch/arm/boot/dts/imx6q.dtsi
index 263e8f3..9e9943b 100644
--- a/arch/arm/boot/dts/imx6q.dtsi
+++ b/arch/arm/boot/dts/imx6q.dtsi
@@ -29,6 +29,8 @@
 			compatible = "arm,cortex-a9";
 			reg = <0>;
 			next-level-cache = <&L2>;
+			cpu_freqs = <996000000 792000000 396000000 198000000>;
+			cpu_volts = <1225000 1100000 950000 850000>;
 		};
 
 		cpu@1 {
-- 
1.7.5.4


