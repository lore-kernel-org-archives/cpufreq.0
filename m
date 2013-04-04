From: dirk.brandewie@gmail.com
Subject: [PATCH] cpufreq/intel_pstate: Set timer timeout correctly
Date: Thu,  4 Apr 2013 10:35:35 -0700
Message-ID: <1365096935-16730-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer;
        bh=p9VUks6XO7KDqH5MSUnH2or3jcUPYqEfnpn7yo9N2gY=;
        b=XfkskP1+HHbo08pr+kDFTITeVf2qOGcb1+Sw+DQlUatQjTDcq5iq57mH+Y8REvQmZ3
         dBSKJZ67HLUd4Kfh47ylVAVmSQHbId4tihCTJve8s3RrxaQZRRFTWk0w3lCjavDeI8gZ
         I+PfK5u3efdp24oha1uBwVml9ntK6MTKfwzi9PTFEahenl++/zvNVi55BfzGjgwu0b62
         ZQQBN3Hc3mzno2SAVjjE4gkXKx3Zjb2GbNfhBX3YRJoaO2/Z5UzYj3dAsKvbvhqbL10n
         V8WR1+32CTWDSqzexv6+9aoajYtmYPWD3ucjgK03XHDOC21AxNsWYr7cfPNgP29jXHSv
         fuQQ==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

The current calculation of the delay time is wrong and a cut and paste
error from a previous experimental driver.  This can result in the
timeout being set to jiffies + 1 which setup the driver to race with
it's self if the apic timer interrupt happen at just the right time.


https://bugzilla.redhat.com/show_bug.cgi?id=920289

Reported-by: Adam Williamson <awilliam@redhat.com>
Reported-by: Parag Warudkar <parag.lkml@gmail.com>

Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
---
 drivers/cpufreq/intel_pstate.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index 43ffe1c..4d6b988 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -502,7 +502,6 @@ static inline void intel_pstate_set_sample_time(struct cpudata *cpu)
 
 	sample_time = cpu->pstate_policy->sample_rate_ms;
 	delay = msecs_to_jiffies(sample_time);
-	delay -= jiffies % delay;
 	mod_timer_pinned(&cpu->timer, jiffies + delay);
 }
 
-- 
1.7.7.6

