From: John Tobias <john.tobias.ph@gmail.com>
Subject: [PATCH v4 2/2] cpufreq: imx6q-cpufreq driver depends on SOC_IMX6Q/SOC_IMX6SL
Date: Thu,  9 Jan 2014 18:39:52 -0800
Message-ID: <1389321592-33220-2-git-send-email-john.tobias.ph@gmail.com>
References: <1389321592-33220-1-git-send-email-john.tobias.ph@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b33s1M+eepWS1TCidtjb2ibyr5g4nPFajG1B4ESgCIc=;
        b=L5O6oMVHMcRuggg3c9DysCyYUuVhHFdBDGF+oDi+pUOyK3U+5f/f/I1z6vsFHAYgZb
         cmX2bAOscMNUyGCXfj9J3ssUr+5C3Odgc+iwGwn8hlpSaidbGBMfU245TwkuQWIKCC8w
         GEEYFHL5b/LZwIzJ9sGbkHJVd751W2X0pIkGw52uA4RYaz547tNYH13G9k8HSPS2v6VF
         qZqf4PqttFccnPc7jtM3NA1GdqVyAdT2y5A+RGCMMpvLIrXIlTBRICOD1B2p9oiJFqY5
         IfY/PXqP7+fFk1kLejy3fZt+g5UD73ggSp80v4LoFMwRpLS6Lptk4xIz2Tgrx+XLz2+h
         x/jQ==
In-Reply-To: <1389321592-33220-1-git-send-email-john.tobias.ph@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@rjwysocki.net, viresh.kumar@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, festevam@gmail.com
Cc: John Tobias <john.tobias.ph@gmail.com>

The ARCH_HAS_CPUFREQ, HAVE_IMX_ANATOP and PM_OPP are moved up to ARCH_MCX.
The driver should show if the SOC_IMX6Q and/or SOC_IMX6SL is/are selected.

Signed-off-by: John Tobias <john.tobias.ph@gmail.com>
---
 drivers/cpufreq/Kconfig.arm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
index 3ba5dcc..230c663 100644
--- a/drivers/cpufreq/Kconfig.arm
+++ b/drivers/cpufreq/Kconfig.arm
@@ -80,7 +80,7 @@ config ARM_HIGHBANK_CPUFREQ
 
 config ARM_IMX6Q_CPUFREQ
 	tristate "Freescale i.MX6 cpufreq support"
-	depends on ARCH_MXC
+	depends on SOC_IMX6Q || SOC_IMX6SL
 	depends on REGULATOR_ANATOP
 	help
 	  This adds cpufreq driver support for Freescale i.MX6 series SoCs.
-- 
1.8.3.2
