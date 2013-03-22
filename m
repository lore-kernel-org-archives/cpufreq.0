From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Fix calculation of current frequency
Date: Fri, 22 Mar 2013 10:51:05 -0700
Message-ID: <1363974665-22049-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=P6t96hto9jYs82rm1Vv3aXYm7qqyBqPRlFq+P6EdOLY=;
        b=MKpA7XyOT8p8VMj8ob/9cXitklXhsbC5kxotjVKYt5zVTpsVmTEDxy7m+Tky+5kcZp
         M1cmVCWh3oRK4xc/Lit47s1JnPNV5IoL9s3G6LOpJmD1AIBuNBcWIazzuiV8pGbikkTM
         AR9CboGutDdrxGqEHppNgXz02QNtLM03+TC5/o2endGD1MrKpvmbgC7+I7hxO+c7bFUk
         xVfEY2IiDy18WpwS1FAO2wSmUImpnngJNs7pJH3Dbx7OP3L2vdUtvmMjLvxj10u9dKWh
         29MJu55XaALVkXGS0jI9yOuuII9SfYQTTE2M6AfdBqyIEQhnoY5jYzvYMAHZuUw+pI/0
         GkdA==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Use the correct pstate value to calculate the effective frequency.

https://bugzilla.redhat.com/show_bug.cgi?id=923942
Reported-by: Satish Balay <balay@fastmail.fm>

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index e84af66..ad72922 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -454,7 +454,7 @@ static inline void intel_pstate_calc_busy(struct cpudata *cpu,
 					sample->idletime_us * 100,
 					sample->duration_us);
 	core_pct = div64_u64(sample->aperf * 100, sample->mperf);
-	sample->freq = cpu->pstate.turbo_pstate * core_pct * 1000;
+	sample->freq = cpu->pstate.max_pstate * core_pct * 1000;
 
 	sample->core_pct_busy = div_s64((sample->pstate_pct_busy * core_pct),
 					100);
-- 
1.7.7.6
