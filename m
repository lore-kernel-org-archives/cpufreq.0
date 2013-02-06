From: dirk.brandewie@gmail.com
Subject: [PATCH 2/5] cpufreq: Only call cpufreq_out_of_sync() with drivers that implement cpufreq_driver.target()
Date: Wed,  6 Feb 2013 09:02:10 -0800
Message-ID: <1360170133-5066-4-git-send-email-dirk.brandewie@gmail.com>
References: <1360170133-5066-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=DtJUvhp2fBh+8gm/8z66NSlsBcbNyh13WDYAW4PsqH4=;
        b=n7ccq9nB5eMdwTeic+gffS94WjRnxjgjt1k8rtRdFPtC6GwoC6sW43TYb3JNxpSqWz
         lz9oyHKXctfteru8Zq0Aqqwo2D1muAOhxF8cCT42XDdR2yJo+OhGRhOf5NH47E0oVbY3
         tzszTByTcENpo16s2h0nNBvf4nsR4SjAdwsBHieY2X1ASnYc5OJhqkp7vuK7qUDw9wxl
         Xm3ZHQQNMYbMb+IdsYKeMRstbYdDw3twr3vYFaK3pafZkwGPLERIKpLGm1S4/PWcYyKr
         UqF3I5yb8yrghaJnfZX07nr3bumYsUzOI+J/ElPovH0jJYbj0Xl4+tsFf2udiNnYtMFX
         kqGA==
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
