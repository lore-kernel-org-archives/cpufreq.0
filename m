From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 12/15] cpufreq: sa11**: initialize .owner field with THIS_MODULE
Date: Wed, 31 Jul 2013 19:49:21 +0530
Message-ID: <24a297bc16b61b2577266b8a8f4ab2ac7b83f03d.1375279948.git.viresh.kumar@linaro.org>
References: <cover.1375279948.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <cover.1375279948.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1375279948.git.viresh.kumar@linaro.org>
References: <cover.1375279948.git.viresh.kumar@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: linaro-kernel@lists.linaro.org, patches@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, arnd.bergmann@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>

CPUFreq core does following at multiple places:
module_{get|put}(cpufreq_driver->owner)).

This is done to make sure module doesn't get unloaded if it is currently in use.
This will work only if the .owner field of cpufreq driver is initialized with a
valid pointer.

This field wasn't initialized for this driver, lets initialize it with
THIS_MODULE.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/sa1100-cpufreq.c | 1 +
 drivers/cpufreq/sa1110-cpufreq.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/cpufreq/sa1100-cpufreq.c b/drivers/cpufreq/sa1100-cpufreq.c
index cff18e8..f41dbd7 100644
--- a/drivers/cpufreq/sa1100-cpufreq.c
+++ b/drivers/cpufreq/sa1100-cpufreq.c
@@ -233,6 +233,7 @@ static struct cpufreq_driver sa1100_driver __refdata = {
 	.target		= sa1100_target,
 	.get		= sa11x0_getspeed,
 	.init		= sa1100_cpu_init,
+	.owner		= THIS_MODULE,
 	.name		= "sa1100",
 };
 
diff --git a/drivers/cpufreq/sa1110-cpufreq.c b/drivers/cpufreq/sa1110-cpufreq.c
index 39c90b6..61627fb 100644
--- a/drivers/cpufreq/sa1110-cpufreq.c
+++ b/drivers/cpufreq/sa1110-cpufreq.c
@@ -349,6 +349,7 @@ static struct cpufreq_driver sa1110_driver __refdata = {
 	.target		= sa1110_target,
 	.get		= sa11x0_getspeed,
 	.init		= sa1110_cpu_init,
+	.owner		= THIS_MODULE,
 	.name		= "sa1110",
 };
 
-- 
1.7.12.rc2.18.g61b472e

