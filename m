From: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Subject: [PATCH] cpufreq: Fix _OSC UUID in pcc-cpufreq
Date: Tue, 26 Apr 2011 17:05:18 +0000 (UTC)
Message-ID: <20110426170002.2270.66607.sendpatchset@nchumbalkar.americas.hpqcorp.net>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: Naga Chumbalkar <nagananda.chumbalkar@hp.com>, cpufreq@vger.kernel.org

UUID needs to be written out the way it is described in
Sec 18.5.124 of ACPI 4.0a Specification.

Platform firmware's use of this UUID/_OSC is optional, which is
why we didn't notice this bug earlier.

Signed-off-by: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
---
diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
index 755a31e..907c8e6 100644
--- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
@@ -39,7 +39,7 @@
 
 #include <acpi/processor.h>
 
-#define PCC_VERSION 	"1.00.00"
+#define PCC_VERSION	"1.10.00"
 #define POLL_LOOPS 	300
 
 #define CMD_COMPLETE 	0x1
@@ -102,7 +102,7 @@ static struct acpi_generic_address doorbell;
 static u64 doorbell_preserve;
 static u64 doorbell_write;
 
-static u8 OSC_UUID[16] = {0x63, 0x9B, 0x2C, 0x9F, 0x70, 0x91, 0x49, 0x1f,
+static u8 OSC_UUID[16] = {0x9F, 0x2C, 0x9B, 0x63, 0x91, 0x70, 0x1f, 0x49,
 			  0xBB, 0x4F, 0xA5, 0x98, 0x2F, 0xA1, 0xB5, 0x46};
 
 struct pcc_cpu {
