From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH] cpufreq: cpu0: make THERMAL_CPU support optional
Date: Sat,  1 Feb 2014 16:50:09 -0600
Message-ID: <1391295009-10844-1-git-send-email-robherring2@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=gI6KSKbK1kwQLEE3dPwUAoKcuC9wkDwBbD7QARiAYLQ=;
        b=GDI0d5/l060Y8Ks9EREFm/Kjjo2VoR640C2zNuSo9OGb70qzCHqzHc1oU9sq06Ifev
         8gIbYycwPu81LlGTOS1n1LTgP2zceQhCbqD5S/2OlIz7mNJqwPv2UvINpTaf4rS86qIm
         K4MpetcfGNY4fjW7Vb4yycUuSU6bJTQWTDnYp7ZcEOJti2Kckwe0almUlKTxZ/X0iYP9
         +avYUW0nqIOVrxkAaC91y4IThKsf/Ksj+iC+Ge3MdgN6W2VRQljwraAe5Q2JpjO3L2XE
         6V5EDTQX+zTnmE5ycDX0MOxE/QdYYpCpzChF/t4JmZqFLT3RBo7Ef5yOLQ5E1mhZ7UYZ
         522A==
Sender: cpufreq-owner@vger.kernel.org
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

The cpufreq-cpu0 driver does not require thermal zone support, and it
should be selectable independently. Add a new kconfig option to enable
this feature.

Reported-by: Olof Johansson <olof@lixom.net>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/cpufreq/Kconfig | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index 4b029c0..a197a04a 100644
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
@@ -194,6 +194,14 @@ config GENERIC_CPUFREQ_CPU0
 
 	  If in doubt, say N.
 
+config GENERIC_CPUFREQ_CPU0_THERMAL
+	bool "Thermal zone support for Generic CPU0 cpufreq"
+	depends on GENERIC_CPUFREQ_CPU0
+	select THERMAL
+	select THERMAL_CPU
+	help
+	  This adds thermal support to the generic cpufreq driver for CPU0.
+
 menu "x86 CPU frequency scaling drivers"
 depends on X86
 source "drivers/cpufreq/Kconfig.x86"
-- 
1.8.3.2

