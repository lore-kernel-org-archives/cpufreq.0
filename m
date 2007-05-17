From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH][4/4] Longhaul - Check ACPI "BM DMA in progress" bit
Date: Thu, 17 May 2007 22:39:02 +0200
Message-ID: <464CBD66.4040908@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


It is good idea to wait for PCI bus to become idle before
frequency change. Thanks to ACPI it is possible. It makes
sense only when northbridge support is in use because it is
only case in which we can disable arbiter after check if PCI
bus is busy.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -254,6 +254,8 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 	struct cpufreq_freqs freqs;
 	unsigned long flags;
 	unsigned int pic1_mask, pic2_mask;
+	u32 bm_status = 0;
+	u32 bm_timeout = 100000;
 
 	if (old_ratio == clock_ratio_index)
 		return;
@@ -284,6 +286,18 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 	outb(0xFF,0xA1);	/* Overkill */
 	outb(0xFE,0x21);	/* TMR0 only */
 
+	/* Wait while PCI bus is busy. */
+	if (longhaul_flags & USE_NORTHBRIDGE
+	    || ((pr != NULL) && pr->flags.bm_control)) {
+		acpi_get_register(ACPI_BITREG_BUS_MASTER_STATUS, &bm_status);
+		while (bm_status && bm_timeout) {
+			acpi_set_register(ACPI_BITREG_BUS_MASTER_STATUS, 1);
+			bm_timeout--;
+			acpi_get_register(ACPI_BITREG_BUS_MASTER_STATUS,
+					  &bm_status);
+		}
+	}
+
 	if (longhaul_flags & USE_NORTHBRIDGE) {
 		/* Disable AGP and PCI arbiters */
 		outb(3, 0x22);
@@ -335,6 +349,10 @@ static void longhaul_setstate(unsigned int clock_ratio_index)
 
 	freqs.new = calc_speed(longhaul_get_cpu_mult());
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
+	if (!bm_timeout)
+		printk(KERN_INFO PFX "Warning: Timeout while waiting for "
+			"idle PCI bus.\n");
 }
 
 /*
-- 



----------------------------------------------------------------------
NIE KUPUJ!!!
...zanim nie porownasz cen >> http://link.interia.pl/f1a5e
