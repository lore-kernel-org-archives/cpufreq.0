From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Models of Nehemiah
Date: Thu, 08 Feb 2007 23:12:02 +0100
Message-ID: <45CBA032.8030604@interia.pl>
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


Borowed from VIA driver.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -713,15 +713,15 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 		switch (c->x86_mask) {
 		case 0 ... 1:
 			cpu_model = CPU_NEHEMIAH;
-			cpuname = "C3 'Nehemiah A' [C5N]";
+			cpuname = "C3 'Nehemiah A' [C5XLOE]";
 			break;
 		case 2 ... 4:
 			cpu_model = CPU_NEHEMIAH;
-			cpuname = "C3 'Nehemiah B' [C5N]";
+			cpuname = "C3 'Nehemiah B' [C5XLOH]";
 			break;
 		case 5 ... 15:
 			cpu_model = CPU_NEHEMIAH_C;
-			cpuname = "C3 'Nehemiah C' [C5N]";
+			cpuname = "C3 'Nehemiah C' [C5P]";
 			break;
 		}
 		break;

----------------------------------------------------------------------
Nawet 50MB w jednym liscie>>> http://link.interia.pl/f19e7
