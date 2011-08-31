From: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Subject: [PATCH] cpufreq: pcc-cpufreq: sanity check to prevent a NULL pointer dereference
Date: Wed, 31 Aug 2011 20:08:45 +0000 (UTC)
Message-ID: <20110831200910.27633.20372.sendpatchset@nchumbalkar.americas.cpqcorp.net>
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk
Cc: Naga Chumbalkar <nagananda.chumbalkar@hp.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, stable@kernel.org

If, for whatever reason, "pr" ends up being NULL we would end up in a PANIC 
as seen below:

Loading CPUFreq modules[  437.661360] BUG: unable to handle kernel NULL pointer
dereference at (null)
IP: [<ffffffffa0434314>] pcc_cpufreq_cpu_init+0x74/0x220 [pcc_cpufreq]

It's better to prevent the PANIC by failing the driver, and allowing the system to boot.

Signed-off-by: Naga Chumbalkar <nagananda.chumbalkar@hp.com>
Cc: stable@kernel.org

diff --git a/drivers/cpufreq/pcc-cpufreq.c b/drivers/cpufreq/pcc-cpufreq.c
index 7b0603e..cdc02ac 100644
--- a/drivers/cpufreq/pcc-cpufreq.c
+++ b/drivers/cpufreq/pcc-cpufreq.c
@@ -261,6 +261,9 @@ static int pcc_get_offset(int cpu)
 	pr = per_cpu(processors, cpu);
 	pcc_cpu_data = per_cpu_ptr(pcc_cpu_info, cpu);
 
+	if (!pr)
+		return -ENODEV;
+
 	status = acpi_evaluate_object(pr->handle, "PCCP", NULL, &buffer);
 	if (ACPI_FAILURE(status))
 		return -ENODEV;
