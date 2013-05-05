From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH] Cpufreq: Fix incorrect dependecies for ARM SA11xx drivers
Date: Sun,  5 May 2013 16:18:08 +0400
Message-ID: <1367756288-13422-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru; s=mail2;
	h=Message-Id:Date:Subject:Cc:To:From; bh=RJ03ulJt30vnqWODcbPXfnRfTLlOV5VgLt7n8HCdrI8=;
	b=NcEXI5Gcx+elKpynwP5DDz3BRTByih9nUcL+NQwK0prNtrI3vFzA3zhtwPti1OYzAGGecQSjjDxFeY4n8b3PGXCLQ0TIpnjmlDUrXoqpzAxEvlLwhpNvzm3CrftUKzRa94qxp+OD1c3mC4p+JPpcQX+np5pNuBrBEXoWMBT8Z/8=;
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Alexander Shiyan <shc_work@mail.ru>


Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 drivers/cpufreq/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index a1488f5..534fcb8 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -47,7 +47,7 @@ config CPU_FREQ_STAT_DETAILS
 
 choice
 	prompt "Default CPUFreq governor"
-	default CPU_FREQ_DEFAULT_GOV_USERSPACE if CPU_FREQ_SA1100 || CPU_FREQ_SA1110
+	default CPU_FREQ_DEFAULT_GOV_USERSPACE if ARM_SA1100_CPUFREQ || ARM_SA1110_CPUFREQ
 	default CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 	help
 	  This option sets which CPUFreq governor shall be loaded at
-- 
1.8.1.5

