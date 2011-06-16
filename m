From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH] powernow-k8: Don't try to transition if the pstate
 is incorrect or there is no freq for it.
Date: Thu, 16 Jun 2011 10:28:29 -0400
Message-ID: <20110616142829.GB5576@dumpdata.com>
References: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1308164520-14145-1-git-send-email-konrad.wilk@oracle.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, davej@redhat.com, x86@kernel.org, cpufreq@vger.kernel.org, bp@alien8.de, andre.przywara@amd.com, Mark.Langsdorf@amd.com
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com


And as mentioned, the other patch that just deals with pstates.

From 0f3bc30b6bc7dad62e3b77063b69df44ca9a9f8e Mon Sep 17 00:00:00 2001
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Wed, 15 Jun 2011 11:08:02 -0400
Subject: [PATCH] [CPUFREQ] powernow-k8: Don't try to transition if the pstate is incorrect or there is no freq for it.

This patch auguments the pstate transition code to error out
(instead of returning 0) when a incorrect pstate is provided.

It also checks whether the frequency for the pstate is
incorrect and if so errors out.

Suggested-by: Borislav Petkov <bp@alien8.de>
CC: andre.przywara@amd.com
CC: Mark.Langsdorf@amd.com
Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/cpufreq/powernow-k8.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index fe53572..047c7b11 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1103,11 +1103,15 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
 	/* get MSR index for hardware pstate transition */
 	pstate = index & HW_PSTATE_MASK;
 	if (pstate > data->max_hw_pstate)
-		return 0;
+		return -EINVAL;
+
 	freqs.old = find_khz_freq_from_pstate(data->powernow_table,
 			data->currpstate);
 	freqs.new = find_khz_freq_from_pstate(data->powernow_table, pstate);
 
+	if (freqs.new == CPUFREQ_ENTRY_INVALID)
+		return -EINVAL;
+
 	for_each_cpu(i, data->available_cores) {
 		freqs.cpu = i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-- 
1.7.5.4

