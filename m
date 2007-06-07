From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Proper register access
Date: Thu, 07 Jun 2007 22:31:24 +0200
Message-ID: <46686B1C.9060009@interia.pl>
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


In previous commit I used u32 for u16 register.
This code will work only when ACPI block address is set.
For now it is only for VT8235 and VT8237.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
index 2841735..8eca59d 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -247,7 +247,7 @@ static void longhaul_setstate(unsigned int table_index)
 	struct cpufreq_freqs freqs;
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
-	u32 bm_status = 0;
+	u16 bm_status = 0;
 	u32 bm_timeout = 1000;
 	unsigned int dir = 0;
 
@@ -281,14 +281,14 @@ static void longhaul_setstate(unsigned int table_index)
 	outb(0xFE,0x21);	/* TMR0 only */
 
 	/* Wait while PCI bus is busy. */
-	if (longhaul_flags & USE_NORTHBRIDGE
-	    || ((pr != NULL) && pr->flags.bm_control)) {
-		bm_status = inl(acpi_regs_addr);
+	if (acpi_regs_addr && (longhaul_flags & USE_NORTHBRIDGE
+	    || ((pr != NULL) && pr->flags.bm_control))) {
+		bm_status = inw(acpi_regs_addr);
 		bm_status &= 1 << 4;
 		while (bm_status && bm_timeout) {
-			outl(1 << 4, acpi_regs_addr);
+			outw(1 << 4, acpi_regs_addr);
 			bm_timeout--;
-			bm_status = inl(acpi_regs_addr);
+			bm_status = inw(acpi_regs_addr);
 			bm_status &= 1 << 4;
 		}
 	}
-- 


----------------------------------------------------------------------
Kasia Cichopek eksponuje biust  
>>> http://link.interia.pl/f1a6f
