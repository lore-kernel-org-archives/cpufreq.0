From: dirk.brandewie@gmail.com
Subject: [PATCH 1/2] cpufreq/intel_pstate: Do not load on VM that do not report max P state.
Date: Tue,  5 Mar 2013 14:15:26 -0800
Message-ID: <1362521727-20666-2-git-send-email-dirk.brandewie@gmail.com>
References: <1362521727-20666-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=ZjdM6ZRLXlf7tfsAQFuzWlvJcKe2fXSFEV4xLrDDVcE=;
        b=LtFO3zaP6+kEtWSHH8qSF09XRH8d2ApzReulda1hnJ0WBO2eYJVnoFy+oFyNju8ipN
         WVCwzPAaWVWz2IWV1DtYkhtBUr5/dSTGns6DR2rrCG1qN1GsE+i/PlEIwZJsaREEVqg8
         a6dwFhkCjduTdaMyI9Ou7FJRGu1XhzB3BSXv4NSPjuBPJk4d1dOoiicUe9zw4G91B7JS
         rw7/uB8pZbR8MYIQb9KvAVK6dUKs3aznYJgoA2hgvsT+TK6ycYnvHSNdphvs3qnfb4Mv
         gGqLsXikshYfk3Va+VAZ7nBXdTWtByo7tR1Rx3yJVzzbcXAQZCcUUlfpk1a0ToS+FLTQ
         92kQ==
In-Reply-To: <1362521727-20666-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: konrad.wilk@oracle.com, jwboyer@redhat.com, Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

It seems some VMs support the P state MSRs but return zeros. Fail
gracefully if we are running in this environment.

https://bugzilla.redhat.com/show_bug.cgi?id=916833

Reported-by: jwboyer@redhat.com
Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 096fde0..2bfd083 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -662,6 +662,9 @@ static int intel_pstate_set_policy(struct cpufreq_policy *policy)
 
 	cpu = all_cpu_data[policy->cpu];
 
+	if (!policy->cpuinfo.max_freq)
+		return -ENODEV;
+
 	intel_pstate_get_min_max(cpu, &min, &max);
 
 	limits.min_perf_pct = (policy->min * 100) / policy->cpuinfo.max_freq;
-- 
1.7.7.6
