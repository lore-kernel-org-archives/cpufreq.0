From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH][1/4] Longhaul - Use all kinds of support
Date: Thu, 17 May 2007 22:33:46 +0200
Message-ID: <464CBC2A.6020604@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


This patch is removing southbridge support as separate
kind of support. Instead it is used to make other kinds
of support more stable. Also northbridge and ACPI C3
support both will be used if both are available.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   33 ++++++++++--------------------
 1 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -55,7 +55,6 @@
 /* Flags */
 #define USE_ACPI_C3		(1 << 1)
 #define USE_NORTHBRIDGE		(1 << 2)
-#define USE_VT8235		(1 << 3)
 
 static int cpu_model;
 static unsigned int numscales=16;
@@ -627,7 +626,7 @@ static int enable_arbiter_disable(void)
 	return 0;
 }
 
-static int longhaul_setup_vt8235(void)
+static int longhaul_setup_southbridge(void)
 {
 	struct pci_dev *dev;
 	u8 pci_cmd;
@@ -657,7 +656,6 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 	char *cpuname=NULL;
 	int ret;
 	u32 lo, hi;
-	int vt8235_present;
 
 	/* Check what we have on this motherboard */
 	switch (c->x86_model) {
@@ -755,7 +753,7 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 	};
 
 	/* Doesn't hurt */
-	vt8235_present = longhaul_setup_vt8235();
+	longhaul_setup_southbridge();
 
 	/* Find ACPI data for processor */
 	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
@@ -765,35 +763,26 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 	/* Check ACPI support for C3 state */
 	if (pr != NULL && longhaul_version == TYPE_POWERSAVER) {
 		cx = &pr->power.states[ACPI_STATE_C3];
-		if (cx->address > 0 && cx->latency <= 1000) {
+		if (cx->address > 0 && cx->latency <= 1000)
 			longhaul_flags |= USE_ACPI_C3;
-			goto print_support_type;
-		}
 	}
 	/* Check if northbridge is friendly */
-	if (enable_arbiter_disable()) {
+	if (enable_arbiter_disable())
 		longhaul_flags |= USE_NORTHBRIDGE;
-		goto print_support_type;
-	}
-	/* Use VT8235 southbridge if present */
-	if (longhaul_version == TYPE_POWERSAVER && vt8235_present) {
-		longhaul_flags |= USE_VT8235;
-		goto print_support_type;
-	}
+
 	/* Check ACPI support for bus master arbiter disable */
-	if ((pr == NULL) || !(pr->flags.bm_control)) {
+	if (!(longhaul_flags & USE_ACPI_C3
+	     || longhaul_flags & USE_NORTHBRIDGE)
+	    && ((pr == NULL) || !(pr->flags.bm_control))) {
 		printk(KERN_ERR PFX
 			"No ACPI support. Unsupported northbridge.\n");
 		return -ENODEV;
 	}
 
-print_support_type:
 	if (longhaul_flags & USE_NORTHBRIDGE)
-		printk (KERN_INFO PFX "Using northbridge support.\n");
-	else if (longhaul_flags & USE_VT8235)
-		printk (KERN_INFO PFX "Using VT8235 support.\n");
-	else
-		printk (KERN_INFO PFX "Using ACPI support.\n");
+		printk(KERN_INFO PFX "Using northbridge support.\n");
+	if (longhaul_flags & USE_ACPI_C3)
+		printk(KERN_INFO PFX "Using ACPI support.\n");
 
 	ret = longhaul_get_ranges();
 	if (ret != 0)
-- 




----------------------------------------------------------------------
Po meczu.....kurde...:)
>>> http://link.interia.pl/f1a72
