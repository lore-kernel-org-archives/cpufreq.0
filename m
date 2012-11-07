From: Joshua Emele <jemele@gmail.com>
Subject: [PATCH 2/4] cpufreq: OMAP: for omap3 devices, specify the iva clock name
Date: Tue,  6 Nov 2012 17:47:39 -0800
Message-ID: <1352252861-18384-3-git-send-email-jemele@gmail.com>
References: <1352252861-18384-1-git-send-email-jemele@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
        bh=g9SxezQF5gVv1kCP2gSK2/Lf5+t9hZWonKHi7ZODNKE=;
        b=jRWNlz++0IYA+/MDzY7bYcqqjdUlTP/MVlP47lrHmpgAP7ZiMauOmXKhuC2+j/i/tx
         EdK67hHSM/7WuTefycH4pUL4Qltb9itdUOjgaMJvnK8avTEb0PGSu3c7xnA/66McOqy7
         CLvRjwuNO5yteAl+W/TBlmbqRgl2Et140BtqDRAvZpnxK4P+lVjynUzMYPbz3Zaqa5SR
         t3HGeNtD6Ti3YJfgxJC5Wtuvy2Jo+Ybr2qBDy3G9BeTvqsGpMxoAPXofXU2Wu95Acxha
         8Ntvf9k8rH8mLZPpQ6N9VpFhCf45998kiqhJYVVP3XxQ+ZDlVJ+jRXCp1dQNXbByc4Ot
         gM6A==
In-Reply-To: <1352252861-18384-1-git-send-email-jemele@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Hilman <khilman@ti.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-omap@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joshua Emele <jemele@gmail.com>


Signed-off-by: Joshua Emele <jemele@gmail.com>
---
 drivers/cpufreq/omap-cpufreq.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/omap-cpufreq.c b/drivers/cpufreq/omap-cpufreq.c
index 1621208..d8a751f 100644
--- a/drivers/cpufreq/omap-cpufreq.c
+++ b/drivers/cpufreq/omap-cpufreq.c
@@ -335,9 +335,10 @@ static int __init omap_cpufreq_init(void)
 {
 	if (cpu_is_omap24xx())
 		mpu_clk_name = "virt_prcm_set";
-	else if (cpu_is_omap34xx())
+	else if (cpu_is_omap34xx()) {
 		mpu_clk_name = "dpll1_ck";
-	else if (cpu_is_omap44xx())
+		iva_clk_name = "dpll2_ck";
+	} else if (cpu_is_omap44xx())
 		mpu_clk_name = "dpll_mpu_ck";
 
 	if (!mpu_clk_name) {
-- 
1.7.6.5
