From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Option to disable ACPI C3 support
Date: Sun, 08 Jul 2007 21:51:26 +0200
Message-ID: <4691403E.9010606@interia.pl>
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


On some motherboards ACPI C3 is available, but it isn't
causing frequency transition on VIA Nehemiah. Longhaul
wasn't working at all earlier, but due to
scaling_cur_speed returning true CPU frequency now, it
looks like CPU is getting stuck at highest frequency
since 2.6.21. I didn't find a reason. Halt is causing 
frequency transition.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -75,6 +75,7 @@ static unsigned int longhaul_index;
 
 /* Module parameters */
 static int scale_voltage;
+static int disable_acpi_c3;
 
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longhaul", msg)
 
@@ -844,6 +845,9 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 		if (cx->address > 0 && cx->latency <= 1000)
 			longhaul_flags |= USE_ACPI_C3;
 	}
+	/* Disable if it isn't working */
+	if (disable_acpi_c3)
+		longhaul_flags &= ~USE_ACPI_C3;
 	/* Check if northbridge is friendly */
 	if (enable_arbiter_disable())
 		longhaul_flags |= USE_NORTHBRIDGE;
@@ -952,6 +956,9 @@ static void __exit longhaul_exit(void)
 	kfree(longhaul_table);
 }
 
+module_param (disable_acpi_c3, int, 0644);
+MODULE_PARM_DESC(disable_acpi_c3, "Don't use ACPI C3 support");
+
 module_param (scale_voltage, int, 0644);
 MODULE_PARM_DESC(scale_voltage, "Scale voltage of processor");
 
-- 



------------------------------------------------------------
Ks.Jankowski u Mela Gibsona 

>>>http://link.interia.pl/f1aec
