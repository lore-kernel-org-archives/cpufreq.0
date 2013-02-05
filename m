From: Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 3/3] arm: kirkwood: Enable cpufreq and ondemand on kirkwood_defconfig
Date: Tue,  5 Feb 2013 20:55:15 +0100
Message-ID: <1360094115-14999-4-git-send-email-andrew@lunn.ch>
References: <1360094115-14999-1-git-send-email-andrew@lunn.ch>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1360094115-14999-1-git-send-email-andrew@lunn.ch>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Cooper <jason@lakedaemon.net>, rjw@sisk.pl
Cc: linux ARM <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org, viresh.kumar@linaro.org, Andrew Lunn <andrew@lunn.ch>

Now that we have a cpufreq driver for kirkwood, enable it in
kirkwood_defconfig and set the default governer to ondemand.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Jason Cooper <jason@lakedaemon.net>
---
 arch/arm/configs/kirkwood_defconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/kirkwood_defconfig b/arch/arm/configs/kirkwood_defconfig
index 93f3794..6ecb7de 100644
--- a/arch/arm/configs/kirkwood_defconfig
+++ b/arch/arm/configs/kirkwood_defconfig
@@ -55,6 +55,9 @@ CONFIG_AEABI=y
 # CONFIG_OABI_COMPAT is not set
 CONFIG_ZBOOT_ROM_TEXT=0x0
 CONFIG_ZBOOT_ROM_BSS=0x0
+CONFIG_CPU_FREQ=y
+CONFIG_CPU_FREQ_STAT_DETAILS=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_IDLE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
-- 
1.7.10.4

