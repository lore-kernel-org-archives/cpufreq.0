From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2] cpufreq: cpu0: drop selecting of THERMAL and THERMAL_CPU
Date: Tue, 11 Feb 2014 12:33:52 -0600
Message-ID: <1392143632-15405-1-git-send-email-robherring2@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=U/4kwsGvsbgzJts8Ipr87a1B6dw9c0JPRuDOBxuFnc4=;
        b=ktu+lGWv6diuvScXl1qizGVizyyvoou1Wddyf/Oi+a8c26tVOJjvLwbvL78cCctwhW
         ePtDJfaKHfrUJ69fXPztDBi5PMw6Iw/M/2nopVjVF9oAIeCssQC8OM70me4K5iC01kbZ
         wZFJ0MNTtjqX/w8oUNAIhCYlesYMFXu1PYO/lxGcEl/VLl5taI0Up+2IpyyMO/bddoym
         VoQd2YLe2hmGSOmtRmzXzPFiR2ZpnDBCaSbUetAPBC3YYlU+8yaYHb03bDjtIlst2CGy
         6ucMf+kg9yrLD+g4FMHrjMrKRj4tWdtFC3Kr5/VJV0FWyTZAxIn9ihIfaFw3j9YvTjwV
         sz2Q==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, cpufreq@vger.kernel.org

From: Rob Herring <robh@kernel.org>

The addition of THERMAL and THERMAL_CPU selections causes a kconfig
warning on highbank platforms:

warning: (ARM_HIGHBANK_CPUFREQ) selects GENERIC_CPUFREQ_CPU0 which has
unmet direct dependencies (ARCH_HAS_CPUFREQ && CPU_FREQ && HAVE_CLK &&
 REGULATOR && OF && THERMAL && CPU_THERMAL)

The cpufreq-cpu0 driver does not require thermal zone support to
function as highbank does not need these, so drop selecting of THERMAL
and CPU_THERMAL.

Reported-by: Olof Johansson <olof@lixom.net>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
- just drop selecting THERMAL and THERMAL_CPU instead of a new kconfig
  option

Dropping REGULATOR doesn't build w/o some empty regulator functions, so
that's 3.15 material.

Rob

 drivers/cpufreq/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 4b029c0..d100926 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -185,7 +185,7 @@ config CPU_FREQ_GOV_CONSERVATIVE
 
 config GENERIC_CPUFREQ_CPU0
 	tristate "Generic CPU0 cpufreq driver"
-	depends on HAVE_CLK && REGULATOR && OF && THERMAL && CPU_THERMAL
+	depends on HAVE_CLK && REGULATOR && OF
 	select PM_OPP
 	help
 	  This adds a generic cpufreq driver for CPU0 frequency management.
-- 
1.8.3.2
