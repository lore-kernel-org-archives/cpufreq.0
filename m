From: Hanjun Guo <hanjun.guo@linaro.org>
Subject: [PATCH 2/3] cpufreq / pxa2xx: Fix __init attribute locations
Date: Tue, 13 Aug 2013 18:20:09 +0800
Message-ID: <1376389210-11470-2-git-send-email-hanjun.guo@linaro.org>
References: <1376389210-11470-1-git-send-email-hanjun.guo@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1376389210-11470-1-git-send-email-hanjun.guo@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, linaro-acpi@lists.linaro.org, Hanjun Guo <hanjun.guo@linaro.org>

__init belongs after the return type on functions, not before it.

Signed-off-by: Hanjun Guo <hanjun.guo@linaro.org>
---
 drivers/cpufreq/pxa2xx-cpufreq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/pxa2xx-cpufreq.c b/drivers/cpufreq/pxa2xx-cpufreq.c
index fb3981a..8749eaf 100644
--- a/drivers/cpufreq/pxa2xx-cpufreq.c
+++ b/drivers/cpufreq/pxa2xx-cpufreq.c
@@ -191,7 +191,7 @@ static int pxa_cpufreq_change_voltage(pxa_freqs_t *pxa_freq)
 	return ret;
 }
 
-static __init void pxa_cpufreq_init_voltages(void)
+static void __init pxa_cpufreq_init_voltages(void)
 {
 	vcc_core = regulator_get(NULL, "vcc_core");
 	if (IS_ERR(vcc_core)) {
@@ -207,7 +207,7 @@ static int pxa_cpufreq_change_voltage(pxa_freqs_t *pxa_freq)
 	return 0;
 }
 
-static __init void pxa_cpufreq_init_voltages(void) { }
+static void __init pxa_cpufreq_init_voltages(void) { }
 #endif
 
 static void find_freq_tables(struct cpufreq_frequency_table **freq_table,
-- 
1.7.9.5

