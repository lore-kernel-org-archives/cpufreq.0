From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] cpufreq: ppc: Add missing #include <asm/smp.h>
Date: Thu, 17 Apr 2014 11:53:25 +0200
Message-ID: <1397728407-13909-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

If CONFIG_SMP=n, <linux/smp.h> does not include <asm/smp.h>, causing:

drivers/cpufreq/ppc-corenet-cpufreq.c: In function 'corenet_cpufreq_cpu_init':
drivers/cpufreq/ppc-corenet-cpufreq.c:173:3: error: implicit declaration of function 'get_hard_smp_processor_id' [-Werror=implicit-function-declaration]

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/cpufreq/ppc-corenet-cpufreq.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/ppc-corenet-cpufreq.c b/drivers/cpufreq/ppc-corenet-cpufreq.c
index b7e677be1df0..e78f9c806de4 100644
--- a/drivers/cpufreq/ppc-corenet-cpufreq.c
+++ b/drivers/cpufreq/ppc-corenet-cpufreq.c
@@ -22,6 +22,8 @@
 #include <linux/smp.h>
 #include <sysdev/fsl_soc.h>
 
+#include <asm/smp.h>
+
 /**
  * struct cpu_data - per CPU data struct
  * @parent: the parent node of cpu clock
-- 
1.7.9.5

