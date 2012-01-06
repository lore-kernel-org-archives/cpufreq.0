From: Antti P Miettinen <amiettinen@nvidia.com>
Subject: [PATCH 3/6] cpufreq: Export user_policy min/max
Date: Fri,  6 Jan 2012 12:03:51 +0200
Message-ID: <1325844234-478-4-git-send-email-amiettinen@nvidia.com>
References: <1325844234-478-1-git-send-email-amiettinen@nvidia.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1325844234-478-1-git-send-email-amiettinen@nvidia.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: cpufreq@vger.kernel.org

Add sysfs nodes for user_policy min and max settings.

Signed-off-by: Antti P Miettinen <amiettinen@nvidia.com>
---
 drivers/cpufreq/cpufreq.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 8c2df34..e63b29f 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -364,6 +364,8 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
 show_one(scaling_min_freq, min);
 show_one(scaling_max_freq, max);
 show_one(scaling_cur_freq, cur);
+show_one(policy_min_freq, user_policy.min);
+show_one(policy_max_freq, user_policy.max);
 
 static int __cpufreq_set_policy(struct cpufreq_policy *data,
 				struct cpufreq_policy *policy);
@@ -582,6 +584,8 @@ cpufreq_freq_attr_rw(scaling_min_freq);
 cpufreq_freq_attr_rw(scaling_max_freq);
 cpufreq_freq_attr_rw(scaling_governor);
 cpufreq_freq_attr_rw(scaling_setspeed);
+cpufreq_freq_attr_ro(policy_min_freq);
+cpufreq_freq_attr_ro(policy_max_freq);
 
 static struct attribute *default_attrs[] = {
 	&cpuinfo_min_freq.attr,
@@ -595,6 +599,8 @@ static struct attribute *default_attrs[] = {
 	&scaling_driver.attr,
 	&scaling_available_governors.attr,
 	&scaling_setspeed.attr,
+	&policy_min_freq.attr,
+	&policy_max_freq.attr,
 	NULL
 };
 
-- 
1.7.4.1

