From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 1/2] : provide disable_cpufreq() function to disable the API.
Date: Tue, 13 Mar 2012 19:18:39 -0400
Message-ID: <1331680720-18268-2-git-send-email-konrad.wilk@oracle.com>
References: <1331680720-18268-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1331680720-18268-1-git-send-email-konrad.wilk@oracle.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, JBeulich@suse.com
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

useful for disabling cpufreq altogether. The cpu frequency
scaling drivers and cpu frequency governors will fail to register.

Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/cpufreq/cpufreq.c |   24 ++++++++++++++++++++++++
 include/linux/cpufreq.h   |    2 ++
 2 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 622013f..7f2f149 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -126,6 +126,15 @@ static int __init init_cpufreq_transition_notifier_list(void)
 }
 pure_initcall(init_cpufreq_transition_notifier_list);
 
+static int off __read_mostly;
+int cpufreq_disabled(void)
+{
+	return off;
+}
+void disable_cpufreq(void)
+{
+	off = 1;
+}
 static LIST_HEAD(cpufreq_governor_list);
 static DEFINE_MUTEX(cpufreq_governor_mutex);
 
@@ -1441,6 +1450,9 @@ int __cpufreq_driver_target(struct cpufreq_policy *policy,
 {
 	int retval = -EINVAL;
 
+	if (cpufreq_disabled())
+		return -ENODEV;
+
 	pr_debug("target for CPU %u: %u kHz, relation %u\n", policy->cpu,
 		target_freq, relation);
 	if (cpu_online(policy->cpu) && cpufreq_driver->target)
@@ -1549,6 +1561,9 @@ int cpufreq_register_governor(struct cpufreq_governor *governor)
 	if (!governor)
 		return -EINVAL;
 
+	if (cpufreq_disabled())
+		return -ENODEV;
+
 	mutex_lock(&cpufreq_governor_mutex);
 
 	err = -EBUSY;
@@ -1572,6 +1587,9 @@ void cpufreq_unregister_governor(struct cpufreq_governor *governor)
 	if (!governor)
 		return;
 
+	if (cpufreq_disabled())
+		return;
+
 #ifdef CONFIG_HOTPLUG_CPU
 	for_each_present_cpu(cpu) {
 		if (cpu_online(cpu))
@@ -1814,6 +1832,9 @@ int cpufreq_register_driver(struct cpufreq_driver *driver_data)
 	unsigned long flags;
 	int ret;
 
+	if (cpufreq_disabled())
+		return -ENODEV;
+
 	if (!driver_data || !driver_data->verify || !driver_data->init ||
 	    ((!driver_data->setpolicy) && (!driver_data->target)))
 		return -EINVAL;
@@ -1901,6 +1922,9 @@ static int __init cpufreq_core_init(void)
 {
 	int cpu;
 
+	if (cpufreq_disabled())
+		return -ENODEV;
+
 	for_each_possible_cpu(cpu) {
 		per_cpu(cpufreq_policy_cpu, cpu) = -1;
 		init_rwsem(&per_cpu(cpu_policy_rwsem, cpu));
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 6216115..8ff4427 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -35,6 +35,7 @@
 #ifdef CONFIG_CPU_FREQ
 int cpufreq_register_notifier(struct notifier_block *nb, unsigned int list);
 int cpufreq_unregister_notifier(struct notifier_block *nb, unsigned int list);
+extern void disable_cpufreq(void);
 #else		/* CONFIG_CPU_FREQ */
 static inline int cpufreq_register_notifier(struct notifier_block *nb,
 						unsigned int list)
@@ -46,6 +47,7 @@ static inline int cpufreq_unregister_notifier(struct notifier_block *nb,
 {
 	return 0;
 }
+static inline void disable_cpufreq(void) { }
 #endif		/* CONFIG_CPU_FREQ */
 
 /* if (cpufreq_driver->target) exists, the ->governor decides what frequency
-- 
1.7.9.48.g85da4d

