From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: [PATCH 3/3] powernow-k8: Don't try to transition if the pstate is incorrect
Date: Thu, 16 Jun 2011 15:36:40 -0400
Message-ID: <1308253000-6289-4-git-send-email-konrad.wilk@oracle.com>
References: <1308253000-6289-1-git-send-email-konrad.wilk@oracle.com>
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1308253000-6289-1-git-send-email-konrad.wilk@oracle.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, x86@kernel.org, cpufreq@vger.kernel.org, davej@redhat.com, bp@alien8.de, Mark.Langsdorf@amd.com, andre.przywara@amd.com
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

This patch augments the pstate transition code to error out
(instead of returning 0) when an incorrect pstate is provided.

Suggested-by: Borislav Petkov <bp@alien8.de>
CC: andre.przywara@amd.com
CC: Mark.Langsdorf@amd.com
Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
---
 drivers/cpufreq/powernow-k8.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
index 287c56f..bce576d 100644
--- a/drivers/cpufreq/powernow-k8.c
+++ b/drivers/cpufreq/powernow-k8.c
@@ -1104,7 +1104,8 @@ static int transition_frequency_pstate(struct powernow_k8_data *data,
 	/* get MSR index for hardware pstate transition */
 	pstate = index & HW_PSTATE_MASK;
 	if (pstate > data->max_hw_pstate)
-		return 0;
+		return -EINVAL;
+
 	freqs.old = find_khz_freq_from_pstate(data->powernow_table,
 			data->currpstate);
 	freqs.new = find_khz_freq_from_pstate(data->powernow_table, pstate);
-- 
1.7.4.1

