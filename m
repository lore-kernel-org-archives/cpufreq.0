From: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Subject: [PATCH] pcc-cpufreq: remove duplicate statements
Date: Fri, 28 Jan 2011 00:16:39 +0000 (UTC)
Message-ID: <20110128001423.6480.33744.sendpatchset@nchumbalkar.americas.hpqcorp.net>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: Naga Chumbalkar <nagananda.chumbalkar@hp.com>

Remove a couple of assigment statements that appear twice.

Signed-off-by: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
---
 arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
index 4f6f679..ec46bad 100644
--- a/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/pcc-cpufreq.c
@@ -315,8 +315,6 @@ static int __init pcc_cpufreq_do_osc(acpi_handle *handle)
 
 	input.count = 4;
 	input.pointer = in_params;
-	input.count = 4;
-	input.pointer = in_params;
 	in_params[0].type               = ACPI_TYPE_BUFFER;
 	in_params[0].buffer.length      = 16;
 	in_params[0].buffer.pointer     = OSC_UUID;
-- 
1.7.1.2

