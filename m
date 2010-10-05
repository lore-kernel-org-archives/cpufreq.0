From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 4/5] cpupowerutils: Add get_cpu_info(..) func to cpuid.h
Date: Tue,  5 Oct 2010 14:23:13 +0200
Message-ID: <1286281394-14699-5-git-send-email-trenn@suse.de>
References: <1286281394-14699-1-git-send-email-trenn@suse.de>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1286281394-14699-1-git-send-email-trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trenn@suse.de, cpufreq@vger.kernel.org, linux@dominikbrodowski.net

In fact the info is fetch through /proc/cpuinfo and not through cpuid for now.
This call can fetch:
	cpu_info->vendor
	cpu_info->family
	cpu_info->model
	cpu_info->stepping
	cpu_info->cpuid_level
	cpu_info->ext_cpuid_level

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: Dominik Brodowski <linux@dominikbrodowski.net>
CC: cpufreq@vger.kernel.org
---
 lib/cpuid.h |   86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 86 insertions(+), 0 deletions(-)

diff --git a/lib/cpuid.h b/lib/cpuid.h
index 5f179db..c00c58d 100644
--- a/lib/cpuid.h
+++ b/lib/cpuid.h
@@ -3,6 +3,22 @@
 
 #include <stdint.h>
 
+enum cpupower_cpu_vendor {X86_VENDOR_UNKNOWN = 0, X86_VENDOR_INTEL,
+			  X86_VENDOR_AMD, X86_VENDOR_MAX};
+
+static const char *cpu_vendor_table[] = {
+	"Unknown", "GenuineIntel", "AuthenticAMD",
+};
+
+struct cpupower_cpu_info {
+	enum cpupower_cpu_vendor vendor;
+	unsigned int family;
+	unsigned int model;
+	unsigned int stepping;
+	unsigned int cpuid_level;
+	uint32_t     ext_cpuid_level;
+};
+
 static inline void __cpuid(unsigned int *eax, unsigned int *ebx,
 				unsigned int *ecx, unsigned int *edx)
 {
@@ -62,4 +78,74 @@ static inline unsigned int cpuid_edx(unsigned int op)
 	return edx;
 }
 
+/* get_cpu_info
+ *
+ * Extract CPU vendor, family, model, stepping info from /proc/cpuinfo
+ *
+ * Returns 0 on success or a negativ error code
+ *
+ * TBD: Should there be a cpuid alternative for this if /proc is not mounted?
+ */
+int get_cpu_info(unsigned int cpu, struct cpupower_cpu_info *cpu_info)
+{
+	FILE *fp;
+	char value[64];
+	unsigned int proc, x;
+	unsigned int unknown = 0xffffff;
+
+	cpu_info->vendor		= X86_VENDOR_UNKNOWN;
+	cpu_info->family		= unknown;
+	cpu_info->model			= unknown;
+	cpu_info->stepping		= unknown;
+	cpu_info->cpuid_level		= cpuid_eax(0);
+	cpu_info->ext_cpuid_level	= cpuid_eax(0x80000000);
+
+
+	fp = fopen("/proc/cpuinfo", "r");
+	if (!fp)
+		return -EIO;
+
+	while (!feof(fp)) {
+		if (!fgets(value, 64, fp))
+			continue;
+		value[63 - 1] = '\0';
+
+		if (!strncmp(value, "processor\t: ", 12)) {
+			sscanf(value, "processor\t: %u", &proc);
+		}
+		if (proc != cpu)
+			continue;
+
+		/* Get CPU vendor */
+		if (!strncmp(value, "vendor_id", 9))
+			for (x = 1; x < X86_VENDOR_MAX; x++) {
+				if (strstr(value, cpu_vendor_table[x]))
+					cpu_info->vendor = x;
+			}
+		/* Get CPU family, etc. */
+		else if (!strncmp(value, "cpu family\t: ", 13)) {
+			sscanf(value, "cpu family\t: %u",
+			       &cpu_info->family);
+		}
+		else if (!strncmp(value, "model\t\t: ", 9)) {
+			sscanf(value, "model\t\t: %u",
+			       &cpu_info->model);
+		}
+		else if (!strncmp(value, "stepping\t: ", 10)) {
+			sscanf(value, "stepping\t: %u",
+			       &cpu_info->stepping);
+
+			/* Exit -> all values must have been set */
+			if (cpu_info->vendor == X86_VENDOR_UNKNOWN ||
+			    cpu_info->family == unknown ||
+			    cpu_info->model == unknown ||
+			    cpu_info->stepping == unknown)
+				return -EINVAL;
+
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
 #endif /* _CPUFREQ_CPUID_H */
-- 
1.6.4.2

