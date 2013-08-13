From: tianyu.lan@intel.com
Subject: [PATCH] ACPI/Cpureq: Using cpufreq_freq_attr_rw macro to define CPB(Core Performance Boost) attribute
Date: Tue, 13 Aug 2013 10:05:53 +0800
Message-ID: <1376359553-5671-1-git-send-email-tianyu.lan@intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, lenb@kernel.org
Cc: Lan Tianyu <tianyu.lan@intel.com>, cpufreq@vger.kernel.org, linux-acpi@vger.kernel.org

From: Lan Tianyu <tianyu.lan@intel.com>

Standardise the defintion of attribute cpb in the acpi-cpufreq driver
via cpufreq_freq_attr_rw macro.

Signed-off-by: Lan Tianyu <tianyu.lan@intel.com>
---
 drivers/cpufreq/acpi-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/acpi-cpufreq.c b/drivers/cpufreq/acpi-cpufreq.c
index e673670..414ee4d 100644
--- a/drivers/cpufreq/acpi-cpufreq.c
+++ b/drivers/cpufreq/acpi-cpufreq.c
@@ -197,7 +197,7 @@ static ssize_t show_cpb(struct cpufreq_policy *policy, char *buf)
 	return sprintf(buf, "%u\n", boost_enabled);
 }
 
-static struct freq_attr cpb = __ATTR(cpb, 0644, show_cpb, store_cpb);
+cpufreq_freq_attr_rw(cpb);
 #endif
 
 static int check_est_cpu(unsigned int cpuid)
-- 
1.8.4.rc0.1.g8f6a3e5.dirty

