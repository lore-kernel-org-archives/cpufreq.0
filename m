From: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Subject: [PATCH]: cpufreq: p4-clockmod: print EST-capable warning message only once
Date: Tue, 15 Feb 2011 17:44:11 +0000 (UTC)
Message-ID: <20110215174117.2327.1187.sendpatchset@nchumbalkar.americas.hpqcorp.net>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: Naga Chumbalkar <nagananda.chumbalkar@hp.com>, cpufreq@vger.kernel.org

Print the message only once. I see it 16 times on a 2P box with 16 logical CPUs.

Signed-off-by: Naga Chumbalkar <nagananda.chumbalkar@hp.com>

diff --git a/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c b/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
index bd1cac7..52c9364 100644
--- a/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/p4-clockmod.c
@@ -158,9 +158,9 @@ static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
 {
 	if (c->x86 == 0x06) {
 		if (cpu_has(c, X86_FEATURE_EST))
-			printk(KERN_WARNING PFX "Warning: EST-capable CPU "
-			       "detected. The acpi-cpufreq module offers "
-			       "voltage scaling in addition of frequency "
+			printk_once(KERN_WARNING PFX "Warning: EST-capable "
+			       "CPU detected. The acpi-cpufreq module offers "
+			       "voltage scaling in addition to frequency "
 			       "scaling. You should use that instead of "
 			       "p4-clockmod, if possible.\n");
 		switch (c->x86_model) {
