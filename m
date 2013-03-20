From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Add function to check that all MSR's are valid
Date: Wed, 20 Mar 2013 09:17:24 -0700
Message-ID: <1363796244-6658-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=J+h3mYs5KrB4v3lf6sb341+XS4sEYjiuTyFrPVtk46k=;
        b=GYq8Cog3YPSBQhliB5T8sxE04uT42F/JR4vS2s9YEAdId1UIt66pVgCU392UPBsT8b
         9qInrkWyJpa1CJyr5QTFdaMtC0yBLxl1eWsqYfS9NJRiQjhJkXbIdWTyV3rrnlFKQgIs
         yEICuXnan+UzVJqVh5cCZxt8100oWNyYT7BXTaI3m+s3E02gkkdvn1JoXWhGOYxA/T9+
         EixAZWLbQCxKZTvP+MPHilCQMr0xFXlXfBAqQjg3faExv9W0IvdJCfs7sAU9YMi/IRPS
         xFUrafjxd3dcnFRPUlvSLJadhTEoi5SKUPHn/jbgA2yJUHUjxSsjjW21+W8M6O3H6Auj
         Llyg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Some VMs seem to try to implement some MSRs but not all the registers
the driver needs.  Check to make sure all the MSR that we need are
available. If any of the required MSRs are not available refuse to
load.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index f6dd1e7..cd9c5f4 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -752,6 +752,29 @@ static struct cpufreq_driver intel_pstate_driver = {
 
 static int __initdata no_load;
 
+static int intel_pstate_msrs_not_valid(void)
+{
+	/* Check that all the msr's we are using are valid. */
+	u64 aperf, mperf, tmp;
+
+	rdmsrl(MSR_IA32_APERF, aperf);
+	rdmsrl(MSR_IA32_MPERF, mperf);
+
+	if (!intel_pstate_min_pstate() ||
+		!intel_pstate_max_pstate() ||
+		!intel_pstate_turbo_pstate())
+		return -ENODEV;
+
+	rdmsrl(MSR_IA32_APERF, tmp);
+	if (!(tmp - aperf))
+		return -ENODEV;
+
+	rdmsrl(MSR_IA32_MPERF, tmp);
+	if (!(tmp - mperf))
+		return -ENODEV;
+
+	return 0;
+}
 static int __init intel_pstate_init(void)
 {
 	int cpu, rc = 0;
@@ -764,6 +787,9 @@ static int __init intel_pstate_init(void)
 	if (!id)
 		return -ENODEV;
 
+	if (intel_pstate_msrs_not_valid())
+		return -ENODEV;
+
 	pr_info("Intel P-state driver initializing.\n");
 
 	all_cpu_data = vmalloc(sizeof(void *) * num_possible_cpus());
-- 
1.7.7.6

