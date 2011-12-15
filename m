From: Richard Zhao <richard.zhao@linaro.org>
Subject: [RFC V1 3/4] arm/imx6q: register arm_clk as cpu to clkdev
Date: Thu, 15 Dec 2011 19:16:37 +0800
Message-ID: <1323947798-25251-3-git-send-email-richard.zhao@linaro.org>
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

cpufreq needs cpu clock to change frequency.

Signed-off-by: Richard Zhao <richard.zhao@linaro.org>
---
 arch/arm/mach-imx/clock-imx6q.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-imx/clock-imx6q.c b/arch/arm/mach-imx/clock-imx6q.c
index 039a7ab..72acbc2 100644
--- a/arch/arm/mach-imx/clock-imx6q.c
+++ b/arch/arm/mach-imx/clock-imx6q.c
@@ -1911,6 +1911,7 @@ static struct clk_lookup lookups[] = {
 	_REGISTER_CLOCK(NULL, "gpmi_io_clk", gpmi_io_clk),
 	_REGISTER_CLOCK(NULL, "usboh3_clk", usboh3_clk),
 	_REGISTER_CLOCK(NULL, "sata_clk", sata_clk),
+	_REGISTER_CLOCK(NULL, "cpu", arm_clk),
 };
 
 int imx6q_set_lpm(enum mxc_cpu_pwr_mode mode)
-- 
1.7.5.4


