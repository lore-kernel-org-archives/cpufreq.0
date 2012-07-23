From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH] conservative: Initialise the cpu field of the this_dbs_info
Date: Mon, 23 Jul 2012 13:05:20 +0530
Message-ID: <1343028920-4712-1-git-send-email-amit.daniel@samsung.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=sender:from:to:cc:subject:date:message-id:x-mailer;
        bh=tbwQBcrnXOl0mRr+SmfOswz4GT5q1PD67ROG/TfbQss=;
        b=R/3deUceY3IMDHI6lSSkhtlCfh3lweQFHL4z9vMbcxtjLh0LYo96eyGkjyBxxSEYKz
         ioWJgbG8hWomho+UTTSshcPCIliRoEmwGjjJVYACKd3UxcDNHDw/gyBxLeL2kadLvJJU
         ro/eptBMEIrq0SJ8dEobEHrncdbBiFJaF/qcSdamUkqZjv7lgAiZ7OcygAgATElD3kEK
         Kk7FD7tYSfPolSTtvi/4bx9+CyrZH4PC4Nnj9HURv8TMDktnrbw14tuMnQ2nh6vW49WI
         wphoHqh99rFM92FifVyrP0CAjSrWsP8O1KpWuoCeFdtLdiinJ2RGm6ga7qj/kWeOW3Tq
         WysA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: rjw@sisk.pl, linux-pm@vger.kernel.org, amit.kachhap@linaro.org, linux-kernel@vger.kernel.org

This patch initialises the cpu field of this_dbs_info structure. This
change is similar to existing ondemand governor.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 drivers/cpufreq/cpufreq_conservative.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 235a340..a1563d7 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -504,6 +504,7 @@ static int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 				j_dbs_info->prev_cpu_nice =
 						kcpustat_cpu(j).cpustat[CPUTIME_NICE];
 		}
+		this_dbs_info->cpu = cpu;
 		this_dbs_info->down_skip = 0;
 		this_dbs_info->requested_freq = policy->cur;
 
-- 
1.7.1

