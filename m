From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Simplier minmult
Date: Wed, 07 Feb 2007 22:53:29 +0100
Message-ID: <45CA4A59.1040703@interia.pl>
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


Simple cleanup in code which is setting minmult.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   23 ++++++++---------------
 1 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -358,22 +358,15 @@ static int __init longhaul_get_ranges(void)
 	 * C3 is booting at max anyway. */
 	maxmult = mult;
 	/* Get min multiplier */
-	switch (longhaul_version) {
-	case TYPE_LONGHAUL_V1:
-	case TYPE_LONGHAUL_V2:
-		minmult = 30;
+	switch (cpu_model) {
+	case CPU_NEHEMIAH:
+		minmult = 50;
 		break;
-
-	case TYPE_POWERSAVER:
-		/* Ezra-T */
-		if (cpu_model == CPU_EZRA_T)
-			minmult = 30;
-		/* Nehemiah */
-		else if (cpu_model == CPU_NEHEMIAH)
-			minmult = 50;
-		/* Nehemiah C */
-		else if (cpu_model == CPU_NEHEMIAH_C)
-			minmult = 40;
+	case CPU_NEHEMIAH_C:
+		minmult = 40;
+		break;
+	default:
+		minmult = 30;
 		break;
 	}

----------------------------------------------------------------------
Oficjalne konto pocztowe europejskich internautow! 
>>> http://link.interia.pl/f19e8
