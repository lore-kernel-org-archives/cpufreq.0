From: dirk.brandewie@gmail.com
Subject: [PATCH 2/5] cpufreq: Only call cpufreq_out_of_sync() for driver that implement cpufreq_driver.target()
Date: Wed,  6 Feb 2013 09:02:09 -0800
Message-ID: <1360170133-5066-3-git-send-email-dirk.brandewie@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=DtJUvhp2fBh+8gm/8z66NSlsBcbNyh13WDYAW4PsqH4=;
        b=Mb1NSkKAtI5FJsYjuZyXJ57kqiY97YUa9WLBZSDyZps9gy2aNYXAUm70SmZrWAq0Wa
         CJMArjzYv3a3BZWIxnunlABePErFMpLTL7vszQWyIhCpc3EHk7WJjLuELgANB6FfxJaT
         waKiOsUVSyWhgzBFvtEtX7pE5T7V1XldWvIn95CvOuFAviCQX+nmpQbv0dGImzEqoM0q
         sc1wxnYLcdfvQdS7pIXaElX1vYXqpmj6/7q38npEkYYSzof24ugaMmyeX/z0fDFZU7Q4
         znOLLzKOQU4pHa7gLFtrC9BgP3q4do0pcGanD3v/R4x1Y0mej/2P+K4115zR0YzJEwMa
         sBKw==
In-Reply-To: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

Scaling drivers that implement cpufreq_driver.setpolicy() have
internal governors that do not signal changes via
cpufreq_notify_transition() so the frequncy in the policy will almost
certainly be different than the current frequncy.  Only call
cpufreq_out_of_sync() when the underlying driver implements
cpufreq_driver.target()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index bb45f93..0ba0344 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1798,7 +1798,7 @@ int cpufreq_update_policy(unsigned int cpu)
 			pr_debug("Driver did not initialize current freq");
 			data->cur = policy.cur;
 		} else {
-			if (data->cur != policy.cur)
+			if (data->cur != policy.cur && driver->target)
 				cpufreq_out_of_sync(cpu, data->cur,
 								policy.cur);
 		}
-- 
1.7.7.6
