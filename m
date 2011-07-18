From: Matthew Garrett <mjg@redhat.com>
Subject: [PATCH v4 4/7] ACPI: Add fixups for AMD P-state figures
Date: Mon, 18 Jul 2011 12:37:39 -0400
Message-ID: <1311007062-2050-5-git-send-email-mjg@redhat.com>
References: <1311007062-2050-1-git-send-email-mjg@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1311007062-2050-1-git-send-email-mjg@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: davej@redhat.com, linux-kernel@vger.kernel.org, borislav.petkov@amd.com, mark.langsdorf@amd.com, andreas.herrmann3@amd.com, Matthew Garrett <mjg@redhat.com>

Some AMD systems may round the frequencies in ACPI tables to 100MHz
boundaries. We can obtain the real frequencies from MSRs, so add a quirk
to fix these frequencies up on AMD systems.

Signed-off-by: Matthew Garrett <mjg@redhat.com>
---
 arch/x86/include/asm/msr-index.h |    1 +
 drivers/acpi/processor_perflib.c |   30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 1772978..1449569 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -234,6 +234,7 @@
 
 #define MSR_IA32_PERF_STATUS		0x00000198
 #define MSR_IA32_PERF_CTL		0x00000199
+#define MSR_AMD_PSTATE_DEF_BASE		0xc0010064
 #define MSR_AMD_PERF_STATUS		0xc0010063
 #define MSR_AMD_PERF_CTL		0xc0010062
 
diff --git a/drivers/acpi/processor_perflib.c b/drivers/acpi/processor_perflib.c
index 85b3237..aed97d7 100644
--- a/drivers/acpi/processor_perflib.c
+++ b/drivers/acpi/processor_perflib.c
@@ -302,6 +302,34 @@ static int acpi_processor_get_performance_control(struct acpi_processor *pr)
 	return result;
 }
 
+#ifdef CONFIG_X86
+/*
+ * Some AMDs have 50MHz frequency multiples, but only provide 100MHz rounding
+ * in their ACPI data. Calculate the real values and fix up the _PSS data.
+ */
+static void amd_fixup_frequency(struct acpi_processor_px *px, int i)
+{
+	u32 hi, lo, fid, did;
+	int index = px->control & 0x00000007;
+
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return;
+
+	if ((boot_cpu_data.x86 == 0x10 && boot_cpu_data.x86_model < 10)
+	    || boot_cpu_data.x86 == 0x11) {
+		rdmsr(MSR_AMD_PSTATE_DEF_BASE + index, lo, hi);
+		fid = lo & 0x3f;
+		did = (lo >> 6) & 7;
+		if (boot_cpu_data.x86 == 0x10)
+			px->core_frequency = (100 * (fid + 0x10)) >> did;
+		else
+			px->core_frequency = (100 * (fid + 8)) >> did;
+	}
+}
+#else
+static void amd_fixup_frequency(struct acpi_processor_px *px, int i) {};
+#endif
+
 static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 {
 	int result = 0;
@@ -356,6 +384,8 @@ static int acpi_processor_get_performance_states(struct acpi_processor *pr)
 			goto end;
 		}
 
+		amd_fixup_frequency(px, i);
+
 		ACPI_DEBUG_PRINT((ACPI_DB_INFO,
 				  "State [%d]: core_frequency[%d] power[%d] transition_latency[%d] bus_master_latency[%d] control[0x%x] status[0x%x]\n",
 				  i,
-- 
1.7.6
