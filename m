From: dirk.brandewie@gmail.com
Subject: [PATCH 5/6] cpufreq/intel_pstate: Remove unused code
Date: Tue,  7 May 2013 08:20:29 -0700
Message-ID: <1367940030-19311-6-git-send-email-dirk.j.brandewie@gmail.com>
References: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=WtXYcCsFgnGYnUxpxmGKbmcr5N8epOZ0OlLGOaR6CSc=;
        b=m9ovFXgVTfdjRPWfMsOmC8P+mvMYxRCbBmT/fim8tyDmzLh0ONqJxvMt2ZnGACLHMa
         cW0F2+l2fDZnptWcLRgm7zRxKqGIrTYDEyFWos+J49dy0cKAhmZeKMZ3tdl2KRjbaHDw
         Ikp47ZWU3wxFtf6ppap3UjvJQpi3my0fSno5bh8gZzohKX/JZ65HDJKdKpK0l+L+aZuF
         glUgZu4YXWi5byelr4Di83P0RBPh2uRqM4QQJa2ID9lO6/qvgm3pcgqIWLQPrkg5ua+i
         e8LvdbmyxJRGj1AHZIZZrv09OriLvVXtIwuLUO9OE6MrulQOYSPPzC8iBnM+LLOs69rF
         8Z0A==
In-Reply-To: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Remove call to intel_pstate_get_min_max() the values returned are not
used.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index fc9b187..c7bd91f 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -579,15 +579,12 @@ static unsigned int intel_pstate_get(unsigned int cpu_num)
 static int intel_pstate_set_policy(struct cpufreq_policy *policy)
 {
 	struct cpudata *cpu;
-	int min, max;
 
 	cpu = all_cpu_data[policy->cpu];
 
 	if (!policy->cpuinfo.max_freq)
 		return -ENODEV;
 
-	intel_pstate_get_min_max(cpu, &min, &max);
-
 	limits.min_perf_pct = (policy->min * 100) / policy->cpuinfo.max_freq;
 	limits.min_perf_pct = clamp_t(int, limits.min_perf_pct, 0 , 100);
 	limits.min_perf = div_fp(int_tofp(limits.min_perf_pct), int_tofp(100));
-- 
1.7.7.6

