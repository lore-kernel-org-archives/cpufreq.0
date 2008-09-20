From: Sven Wegener <sven.wegener@stealer.net>
Subject: [PATCH] cpufreq: Don't export governors for default governor
Date: Sat, 20 Sep 2008 16:50:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.0809201643470.22510@titan.stealer.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754009AbYITOuo@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

We don't need to export the governors for use as the default governor,
because the default governor will be built-in anyway and we can access
the symbol directly.

This also fixes the following sparse warnings:

drivers/cpufreq/cpufreq_conservative.c:578:25: warning: symbol 'cpufreq_gov_conservative' was not declared. Should it be static?
drivers/cpufreq/cpufreq_ondemand.c:582:25: warning: symbol 'cpufreq_gov_ondemand' was not declared. Should it be static?
drivers/cpufreq/cpufreq_performance.c:39:25: warning: symbol 'cpufreq_gov_performance' was not declared. Should it be static?
drivers/cpufreq/cpufreq_powersave.c:38:25: warning: symbol 'cpufreq_gov_powersave' was not declared. Should it be static?
drivers/cpufreq/cpufreq_userspace.c:190:25: warning: symbol 'cpufreq_gov_userspace' was not declared. Should it be static?

Signed-off-by: Sven Wegener <sven.wegener@stealer.net>
---
 drivers/cpufreq/cpufreq_conservative.c |    4 +++-
 drivers/cpufreq/cpufreq_ondemand.c     |    4 +++-
 drivers/cpufreq/cpufreq_performance.c  |    4 +++-
 drivers/cpufreq/cpufreq_powersave.c    |    4 +++-
 drivers/cpufreq/cpufreq_userspace.c    |    4 +++-
 5 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index c1dd266..cf0ab1b 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -576,13 +576,15 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 	return 0;
 }
 
+#ifndef CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
+static
+#endif
 struct cpufreq_governor cpufreq_gov_conservative = {
 	.name			= "conservative",
 	.governor		= cpufreq_governor_dbs,
 	.max_transition_latency	= TRANSITION_LATENCY_LIMIT,
 	.owner			= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_conservative);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index aaa9e19..35e63e9 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -626,13 +626,15 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 	return 0;
 }
 
+#ifndef CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND
+static
+#endif
 struct cpufreq_governor cpufreq_gov_ondemand = {
 	.name			= "ondemand",
 	.governor		= cpufreq_governor_dbs,
 	.max_transition_latency = TRANSITION_LATENCY_LIMIT,
 	.owner			= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_ondemand);
 
 static int __init cpufreq_gov_dbs_init(void)
 {
diff --git a/drivers/cpufreq/cpufreq_performance.c b/drivers/cpufreq/cpufreq_performance.c
index e8e1451..7e2e515 100644
--- a/drivers/cpufreq/cpufreq_performance.c
+++ b/drivers/cpufreq/cpufreq_performance.c
@@ -36,12 +36,14 @@ static int cpufreq_governor_performance(struct cpufreq_policy *policy,
 	return 0;
 }
 
+#ifdef CONFIG_CPU_FREQ_GOV_PERFORMANCE_MODULE
+static
+#endif
 struct cpufreq_governor cpufreq_gov_performance = {
 	.name		= "performance",
 	.governor	= cpufreq_governor_performance,
 	.owner		= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_performance);
 
 
 static int __init cpufreq_gov_performance_init(void)
diff --git a/drivers/cpufreq/cpufreq_powersave.c b/drivers/cpufreq/cpufreq_powersave.c
index 88d2f44..e6db5fa 100644
--- a/drivers/cpufreq/cpufreq_powersave.c
+++ b/drivers/cpufreq/cpufreq_powersave.c
@@ -35,12 +35,14 @@ static int cpufreq_governor_powersave(struct cpufreq_policy *policy,
 	return 0;
 }
 
+#ifndef CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
+static
+#endif
 struct cpufreq_governor cpufreq_gov_powersave = {
 	.name		= "powersave",
 	.governor	= cpufreq_governor_powersave,
 	.owner		= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_powersave);
 
 static int __init cpufreq_gov_powersave_init(void)
 {
diff --git a/drivers/cpufreq/cpufreq_userspace.c b/drivers/cpufreq/cpufreq_userspace.c
index 32244aa..1442bba 100644
--- a/drivers/cpufreq/cpufreq_userspace.c
+++ b/drivers/cpufreq/cpufreq_userspace.c
@@ -187,6 +187,9 @@ static int cpufreq_governor_userspace(struct cpufreq_policy *policy,
 }
 
 
+#ifndef CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE
+static
+#endif
 struct cpufreq_governor cpufreq_gov_userspace = {
 	.name		= "userspace",
 	.governor	= cpufreq_governor_userspace,
@@ -194,7 +197,6 @@ struct cpufreq_governor cpufreq_gov_userspace = {
 	.show_setspeed	= show_speed,
 	.owner		= THIS_MODULE,
 };
-EXPORT_SYMBOL(cpufreq_gov_userspace);
 
 static int __init cpufreq_gov_userspace_init(void)
 {
