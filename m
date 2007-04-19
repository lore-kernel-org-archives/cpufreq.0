From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Revert ACPI C3 on Longhaul ver. 2
Date: Thu, 19 Apr 2007 08:28:03 +0200
Message-ID: <11769640832644-git-send-email-rafalbilski@interia.pl>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

Support for Longhaul ver. 2 broke driver for VIA C3 Eden
600MHz with Samuel 2 core. Processor is not able to switch
frequency anymore. I don't know much about this issue at
the moment, but until (if ever) I will know why, this part
should be reversed. I hope it isn't to late to include it in
2.6.21.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
index a1f1b71..2b030d6 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -758,7 +758,7 @@ static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 				NULL, (void *)&pr);
 
 	/* Check ACPI support for C3 state */
-	if (pr != NULL && longhaul_version != TYPE_LONGHAUL_V1) {
+	if (pr != NULL && longhaul_version == TYPE_POWERSAVER) {
 		cx = &pr->power.states[ACPI_STATE_C3];
 		if (cx->address > 0 && cx->latency <= 1000) {
 			longhaul_flags |= USE_ACPI_C3;
-- 
1.5.0.6


----------------------------------------------------------------------
Playery MP3 za drogie?
Sprawdz, kto ma najtaniej >> http://link.interia.pl/f1a63
