From: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Subject: [PATCH] cpufreq: fix sign check of an unsigned variable in cpufreq-cpu0
Date: Mon, 25 Feb 2013 12:32:19 +0100 (CET)
Message-ID: <Pine.LNX.4.64.1302251227140.3030@axis700.grange>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

A "< 0" test for an unsigned variable is meaningless, change the variable
to signed.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
---

stable?

 drivers/cpufreq/cpufreq-cpu0.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index 52bf36d..e7bad3c 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -44,7 +44,8 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 {
 	struct cpufreq_freqs freqs;
 	struct opp *opp;
-	unsigned long freq_Hz, volt = 0, volt_old = 0, tol = 0;
+	unsigned long volt = 0, volt_old = 0, tol = 0;
+	long freq_Hz;
 	unsigned int index, cpu;
 	int ret;
 
-- 
1.7.2.5

