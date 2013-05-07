From: dirk.brandewie@gmail.com
Subject: [PATCH 3/6] cpufreq/intel_pstate: fix ffmpeg regression
Date: Tue,  7 May 2013 08:20:27 -0700
Message-ID: <1367940030-19311-4-git-send-email-dirk.j.brandewie@gmail.com>
References: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=bUCtxchrkKri5iw80cpoV/BfB+V1EuoJO4MI12OkOyY=;
        b=ROCxbWlT+MAxYxoHzBVDYrcKK7gg0+ia0FS8hdjQ/TLBJTbs1A5BsSZLqbXxr0stkt
         WeFKCMaapQP2PeRPa54ozgWQz+yIsWrhp63UuN8GIMVKKiktbGtLtz/8oTmC+2UtIeUl
         vsolYIvXv9pokVMdf94OJKReCbyHcuXCk2uYiEywfwEHXSwAqoy45swv6vzjb2B6CfdE
         Ks9t86I0p+8hYaI4w29W2pONl8r/QaT88XvbRF9Ut6c7VJKP9/4uQW3Q+6QPkbKUXNCn
         KGA/JGAOy8pQvdfwaRcYpDcUZfRMOzUOgqETFHoDTEe7Y3FLpK4TCPlSHBdCCPFPSNCU
         Dn7A==
In-Reply-To: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, stable@vger.kernel.org

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

The ffmpeg benchmark in the phoronix test suite has threads on
multiple cores that rely on the progress on of threads on other cores
and ping pong back and forth fast enough to make the core appear less
busy than it "should" be.  If the core has been at minimum p-state for
a while bump the pstate up to kick the core to see if it is in this
ping pong state.  If the core is truly idle the p-state will be
reduced at the next sample time.  If the core makes more progress it
will send more work to the thread bringing both threads out of the
ping pong scenario and the p-state will be selected normally.

This fixes a performance regression of approximately 30%

Cc: stable@vger.kernel.org
Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index c0c98c2..97fbac2 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -551,22 +551,16 @@ static void intel_pstate_timer_func(unsigned long __data)
 	struct cpudata *cpu = (struct cpudata *) __data;
 
 	intel_pstate_sample(cpu);
+	intel_pstate_adjust_busy_pstate(cpu);
 
-	if (!cpu->idle_mode)
-		intel_pstate_adjust_busy_pstate(cpu);
-	else
-		intel_pstate_adjust_idle_pstate(cpu);
-
-#if defined(XPERF_FIX)
 	if (cpu->pstate.current_pstate == cpu->pstate.min_pstate) {
 		cpu->min_pstate_count++;
 		if (!(cpu->min_pstate_count % 5)) {
 			intel_pstate_set_pstate(cpu, cpu->pstate.max_pstate);
-			intel_pstate_idle_mode(cpu);
 		}
 	} else
 		cpu->min_pstate_count = 0;
-#endif
+
 	intel_pstate_set_sample_time(cpu);
 }
 
-- 
1.7.7.6
