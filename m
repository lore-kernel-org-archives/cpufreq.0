From: Axel Lin <axel.lin@gmail.com>
Subject: [PATCH 1/2] cpufreq: exynos4210: make needlessly global symbols
 static
Date: Fri, 08 Jul 2011 14:20:44 +0800
Message-ID: <1310106044.27158.0.camel@phoenix>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=subject:from:to:cc:content-type:date:message-id:mime-version
         :x-mailer:content-transfer-encoding;
        bh=oSNrMoxQhu0hDaUedfbfarSzIez3tJ0qXduB2aSCzN8=;
        b=abJ3XmpP1SKRi6CQlUJ/qwryXV9uqw0K0dorePLePIidqvkAe40xwAANa4qwz67Yby
         s6ZgkkjQz5vHnk7+YdO5OW+V/17BKR3hkBlXoycNnbeKHFkZgB+qmI6x9yJN26l2W4aW
         QqeK3QRB4ryLC87tJL1pXQMVwFc+P9rhhWwQ4=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

The following symbols are needlessly defined global:
  exynos4_verify_speed
  exynos4_getspeed
  exynos4_set_clkdiv

Make them static.

Signed-off-by: Axel Lin <axel.lin@gmail.com>
---
 drivers/cpufreq/exynos4210-cpufreq.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
index 54025fc..b7c3a84 100644
--- a/drivers/cpufreq/exynos4210-cpufreq.c
+++ b/drivers/cpufreq/exynos4210-cpufreq.c
@@ -191,17 +191,17 @@ static unsigned int exynos4_apll_pms_table[CPUFREQ_LEVEL_END] = {
 	((200 << 16) | (6 << 8) | 4),
 };
 
-int exynos4_verify_speed(struct cpufreq_policy *policy)
+static int exynos4_verify_speed(struct cpufreq_policy *policy)
 {
 	return cpufreq_frequency_table_verify(policy, exynos4_freq_table);
 }
 
-unsigned int exynos4_getspeed(unsigned int cpu)
+static unsigned int exynos4_getspeed(unsigned int cpu)
 {
 	return clk_get_rate(cpu_clk) / 1000;
 }
 
-void exynos4_set_clkdiv(unsigned int div_index)
+static void exynos4_set_clkdiv(unsigned int div_index)
 {
 	unsigned int tmp;
 
-- 
1.7.4.1



