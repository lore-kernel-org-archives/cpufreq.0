From: Stratos Karafotis <stratosk@semaphore.gr>
Subject: [PATCH] cpufreq: Break out early when frequency equals target_freq
Date: Tue, 29 Apr 2014 23:28:33 +0300
Message-ID: <53600B71.2050904@semaphore.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Many drivers keep frequencies in frequency table in ascending
or descending order. When governor tries to change to policy->min
or policy->max respectively then the cpufreq_frequency_table_target
could return on first iteration. This will save some iteration cycles.

So, break out early when a frequency in cpufreq_frequency_table
equals to target one.

Testing this during kernel compilation using ondemand governor
with a frequency table in ascending order, the
cpufreq_frequency_table_target returned early on the first
iteration at about 30% of times called.

Signed-off-by: Stratos Karafotis <stratosk@semaphore.gr>
---
 drivers/cpufreq/freq_table.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 8e518c6..1632981 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -137,9 +137,13 @@ int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
 		i = pos - table;
 		if ((freq < policy->min) || (freq > policy->max))
 			continue;
+		if (freq == target_freq) {
+			optimal.driver_data = i;
+			break;
+		}
 		switch (relation) {
 		case CPUFREQ_RELATION_H:
-			if (freq <= target_freq) {
+			if (freq < target_freq) {
 				if (freq >= optimal.frequency) {
 					optimal.frequency = freq;
 					optimal.driver_data = i;
@@ -152,7 +156,7 @@ int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
 			}
 			break;
 		case CPUFREQ_RELATION_L:
-			if (freq >= target_freq) {
+			if (freq > target_freq) {
 				if (freq <= optimal.frequency) {
 					optimal.frequency = freq;
 					optimal.driver_data = i;
-- 
1.9.0
