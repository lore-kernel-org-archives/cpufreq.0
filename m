From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] cpufreq: Update Documentation for cpus and related_cpus
Date: Thu, 31 Jan 2013 07:33:53 +0530
Message-ID: <5bacee23a68ff51390df30ac58c93edd244222f8.1359597694.git.viresh.kumar@linaro.org>
Return-path: <linux-pm-owner@vger.kernel.org>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, robin.randhawa@arm.com, Steve.Bannister@arm.com, Liviu.Dudau@arm.com, fabio.baltieri@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>

Documentation related to cpus and related_cpus is confusing and not very clear.
Over that CPUFreq core has seen much changes recently. Lets update documentation
and comments for cpus and related_cpus.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/cpu-freq/cpu-drivers.txt | 6 ++++++
 Documentation/cpu-freq/user-guide.txt  | 8 ++++----
 include/linux/cpufreq.h                | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/cpu-freq/cpu-drivers.txt b/Documentation/cpu-freq/cpu-drivers.txt
index c436096..72f70b1 100644
--- a/Documentation/cpu-freq/cpu-drivers.txt
+++ b/Documentation/cpu-freq/cpu-drivers.txt
@@ -111,6 +111,12 @@ policy->governor		must contain the "default policy" for
 For setting some of these values, the frequency table helpers might be
 helpful. See the section 2 for more information on them.
 
+SMP systems normally have same clock source for a group of cpus. For these the
+.init() would be called only once for the first online cpu. Here the .init()
+routine must initialize policy->cpus with mask of all possible cpus (Online +
+Offline) that share the clock. Then the core would copy this mask onto
+policy->related_cpus and will reset policy->cpus to carry only online cpus.
+
 
 1.3 verify
 ------------
diff --git a/Documentation/cpu-freq/user-guide.txt b/Documentation/cpu-freq/user-guide.txt
index 04f6b32..ff2f283 100644
--- a/Documentation/cpu-freq/user-guide.txt
+++ b/Documentation/cpu-freq/user-guide.txt
@@ -190,11 +190,11 @@ scaling_max_freq		show the current "policy limits" (in
 				first set scaling_max_freq, then
 				scaling_min_freq.
 
-affected_cpus :			List of CPUs that require software coordination
-				of frequency.
+affected_cpus :			List of Online CPUs that require software
+				coordination of frequency.
 
-related_cpus :			List of CPUs that need some sort of frequency
-				coordination, whether software or hardware.
+related_cpus :			List of Online + Offline CPUs that need software
+				coordination of frequency.
 
 scaling_driver :		Hardware driver for cpufreq.
 
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index b60f6ba..04d2e84 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -86,8 +86,10 @@ struct cpufreq_real_policy {
 };
 
 struct cpufreq_policy {
-	cpumask_var_t		cpus;	/* CPUs requiring sw coordination */
-	cpumask_var_t		related_cpus; /* CPUs with any coordination */
+	/* CPUs sharing clock, require sw coordination */
+	cpumask_var_t		cpus;	/* Online CPUs only */
+	cpumask_var_t		related_cpus; /* Online + Offline CPUs */
+
 	unsigned int		shared_type; /* ANY or ALL affected CPUs
 						should set cpufreq */
 	unsigned int		cpu;    /* cpu nr of registered CPU */
-- 
1.7.12.rc2.18.g61b472e

