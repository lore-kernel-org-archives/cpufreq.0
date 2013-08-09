From: Mark Brown <broonie@kernel.org>
Subject: [PATCH] cpufreq: cpufreq-cpu0: NULL is a valid regulator
Date: Fri,  9 Aug 2013 19:06:32 +0100
Message-ID: <1376071592-18930-1-git-send-email-broonie@kernel.org>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: cpufreq@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

Since NULL could in theory be a valid regulator we ought to check for
IS_ERR() rather than for NULL. In practice this is unlikely to be an
issue but it's better for neatness.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 drivers/cpufreq/cpufreq-cpu0.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
index ad1fde2..09cd3a7 100644
--- a/drivers/cpufreq/cpufreq-cpu0.c
+++ b/drivers/cpufreq/cpufreq-cpu0.c
@@ -69,7 +69,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 
 	cpufreq_notify_transition(policy, &freqs, CPUFREQ_PRECHANGE);
 
-	if (cpu_reg) {
+	if (!IS_ERR(cpu_reg)) {
 		rcu_read_lock();
 		opp = opp_find_freq_ceil(cpu_dev, &freq_Hz);
 		if (IS_ERR(opp)) {
@@ -90,7 +90,7 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 		 freqs.new / 1000, volt ? volt / 1000 : -1);
 
 	/* scaling up?  scale voltage before frequency */
-	if (cpu_reg && freqs.new > freqs.old) {
+	if (!IS_ERR(cpu_reg) && freqs.new > freqs.old) {
 		ret = regulator_set_voltage_tol(cpu_reg, volt, tol);
 		if (ret) {
 			pr_err("failed to scale voltage up: %d\n", ret);
@@ -102,14 +102,14 @@ static int cpu0_set_target(struct cpufreq_policy *policy,
 	ret = clk_set_rate(cpu_clk, freq_exact);
 	if (ret) {
 		pr_err("failed to set clock rate: %d\n", ret);
-		if (cpu_reg)
+		if (!IS_ERR(cpu_reg))
 			regulator_set_voltage_tol(cpu_reg, volt_old, tol);
 		freqs.new = freqs.old;
 		goto post_notify;
 	}
 
 	/* scaling down?  scale voltage after frequency */
-	if (cpu_reg && freqs.new < freqs.old) {
+	if (!IS_ERR(cpu_reg) && freqs.new < freqs.old) {
 		ret = regulator_set_voltage_tol(cpu_reg, volt, tol);
 		if (ret) {
 			pr_err("failed to scale voltage down: %d\n", ret);
@@ -210,7 +210,6 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
 		}
 		pr_warn("failed to get cpu0 regulator: %ld\n",
 			PTR_ERR(cpu_reg));
-		cpu_reg = NULL;
 	}
 
 	cpu_clk = devm_clk_get(cpu_dev, NULL);
-- 
1.8.4.rc1

