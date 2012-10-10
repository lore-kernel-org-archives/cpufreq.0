From: Ulf Hansson <ulf.hansson@stericsson.com>
Subject: [PATCH 1/8] ARM: ux500: Remove cpufreq platform device
Date: Wed, 10 Oct 2012 13:42:22 +0200
Message-ID: <1349869349-8070-2-git-send-email-ulf.hansson@stericsson.com>
References: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1349869349-8070-1-git-send-email-ulf.hansson@stericsson.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, Philippe Begnic <philippe.begnic@st.com>, Rickard Andersson <rickard.andersson@stericsson.com>, Jonas Aberg <jonas.aberg@stericsson.com>, Vincent Guittot <vincent.guittot@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>

From: Ulf Hansson <ulf.hansson@linaro.org>

The cpufreq device is already added from the prcmu driver as
a mfd child device.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Jonas Aaberg <jonas.aberg@stericsson.com>
---
 arch/arm/mach-ux500/cpu-db8500.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mach-ux500/cpu-db8500.c b/arch/arm/mach-ux500/cpu-db8500.c
index bcdfe6b..41b2779 100644
--- a/arch/arm/mach-ux500/cpu-db8500.c
+++ b/arch/arm/mach-ux500/cpu-db8500.c
@@ -214,9 +214,6 @@ struct device * __init u8500_init_devices(struct ab8500_platform_data *ab8500)
 	db8500_add_gpios(parent);
 	db8500_add_usb(parent, usb_db8500_rx_dma_cfg, usb_db8500_tx_dma_cfg);
 
-	platform_device_register_data(parent,
-		"cpufreq-u8500", -1, NULL, 0);
-
 	for (i = 0; i < ARRAY_SIZE(platform_devs); i++)
 		platform_devs[i]->dev.parent = parent;
 
@@ -236,9 +233,6 @@ struct device * __init u8500_of_init_devices(void)
 
 	db8500_add_usb(parent, usb_db8500_rx_dma_cfg, usb_db8500_tx_dma_cfg);
 
-	platform_device_register_data(parent,
-		"cpufreq-u8500", -1, NULL, 0);
-
 	u8500_dma40_device.dev.parent = parent;
 
 	/*
-- 
1.7.10

