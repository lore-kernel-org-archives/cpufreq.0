From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/2] cpufreq acpi: only call _PPC after cpufreq ACPI init
	funcs got called already
Date: Fri, 25 Jul 2008 15:58:57 +0200
Message-ID: <1216994337-6613-3-git-send-email-trenn@suse.de>
References: <1216994337-6613-1-git-send-email-trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1216994337-6613-1-git-send-email-trenn@suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: davej@codemonkey.org.uk
Cc: akpm@osdl.org, cpufreq@lists.linux.org.uk, Andrew Morton <akpm@linux-foundation.org>, miguel@novell.com

Ingo Molnar provided a fix to not call _PPC at processor driver
initialization time.  Git commit #e4233dec749a3519069d9390561b5636a75c7579

But it can still happen that _PPC is called at processor driver
initialization time.

This patch should make sure that this is not possible anymore.

It got tested on a T61. There on some boots it still happens that
the frequency gets limited to the lowest. For now it seems to work for
Miguel with this patch:
https://bugzilla.novell.com/show_bug.cgi?id=374099


Signed-off-by: Thomas Renninger <trenn@suse.de>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Acked-by: Ingo Molnar <mingo@elte.hu>
Tested-by: Miguel de Icaza <miguel@novell.com>
---
 arch/powerpc/platforms/cell/cbe_cpufreq_pmi.c |    7 +++++++
 drivers/acpi/processor_perflib.c              |   16 ++++++++++++++--
 drivers/cpufreq/cpufreq.c                     |    3 +++
 include/linux/cpufreq.h                       |    1 +
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/cell/cbe_cpufreq_pmi.c b/arch/powerpc/platforms/cell/cbe_cpufreq_pmi.c
index 69288f6..8f0ca69 100644
--- a/arch/powerpc/platforms/cell/cbe_cpufreq_pmi.c
+++ b/arch/powerpc/platforms/cell/cbe_cpufreq_pmi.c
@@ -96,6 +96,13 @@ static int pmi_notifier(struct notifier_block *nb,
 	struct cpufreq_frequency_table *cbe_freqs;
 	u8 node;
 
+	/* 
+	 * Should this really be called for CPUFREQ_ADJUST, CPUFREQ_INCOMPATIBLE
+	 * and CPUFREQ_NOTIFY policy events?
+	 */
+	if (event == CPUFREQ_START)
+		return 0;
+
 	cbe_freqs = cpufreq_frequency_get_table(policy->cpu);
 	node = cbe_cpu_to_node(policy->cpu);
 
diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 4d16f59..e08e0d9 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -64,7 +64,14 @@ static DEFINE_MUTEX(performance_mutex);
  * policy is adjusted accordingly.
  */
 
-static unsigned int ignore_ppc = 0;
+/*
+ * ignore_ppc:
+ * -1 -> cpufreq low level drivers not initialized -> _PSS, etc. not called yet
+ *       ignore _PPC
+ *  0 -> cpufreq low level drivers initialized -> consider _PPC values
+ *  1 -> ignore _PPC totally -> forced by user through boot param
+ */
+static unsigned int ignore_ppc = -1;
 module_param(ignore_ppc, uint, 0644);
 MODULE_PARM_DESC(ignore_ppc, "If the frequency of your machine gets wrongly" \
 		 "limited by BIOS, this should help");
@@ -72,7 +79,7 @@ MODULE_PARM_DESC(ignore_ppc, "If the frequency of your machine gets wrongly" \
 #define PPC_REGISTERED   1
 #define PPC_IN_USE       2
 
-static int acpi_processor_ppc_status = 0;
+static int acpi_processor_ppc_status;
 
 static int acpi_processor_ppc_notifier(struct notifier_block *nb,
 				       unsigned long event, void *data)
@@ -81,6 +88,11 @@ static int acpi_processor_ppc_notifier(struct notifier_block *nb,
 	struct acpi_processor *pr;
 	unsigned int ppc = 0;
 
+	if (event == CPUFREQ_START && ignore_ppc <= 0) {
+		ignore_ppc = 0;
+		return 0;
+	}
+
 	if (ignore_ppc)
 		return 0;
 
diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index cc3baf1..06c095c 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -825,6 +825,9 @@ static int cpufreq_add_dev(struct sys_device *sys_dev)
 	policy->user_policy.min = policy->cpuinfo.min_freq;
 	policy->user_policy.max = policy->cpuinfo.max_freq;
 
+	blocking_notifier_call_chain(&cpufreq_policy_notifier_list,
+				     CPUFREQ_START, policy);
+
 #ifdef CONFIG_SMP
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index e7e91db..07cb761 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -109,6 +109,7 @@ struct cpufreq_policy {
 #define CPUFREQ_ADJUST		(0)
 #define CPUFREQ_INCOMPATIBLE	(1)
 #define CPUFREQ_NOTIFY		(2)
+#define CPUFREQ_START		(3)
 
 #define CPUFREQ_SHARED_TYPE_NONE (0) /* None */
 #define CPUFREQ_SHARED_TYPE_HW	 (1) /* HW does needed coordination */
-- 
1.5.4.5
