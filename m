From: dirk.brandewie@gmail.com
Subject: [PATCH 6/6] cpufreq/intel_pstate: remove #ifdef MODULE compile fence
Date: Tue,  7 May 2013 08:20:30 -0700
Message-ID: <1367940030-19311-7-git-send-email-dirk.j.brandewie@gmail.com>
References: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=caOZNp+cg71pl4z76HpI3J7gwB7oWsxoS7kDc8+2t5M=;
        b=HTAriFNA5sfUjX9Is+zznGvq0HnUZosQ/DKX/QvUmL/NrLPwe4gFJpRYHBzydy8n29
         +QVMzB0KNh764LAGBLxrZmjvGhnBOLCOcRrugy9uhMgwwccLX+13ceW1doCHAYT+KDyB
         dqRWVhENrOfIj8WTwzAcK6fGwLWlpL9UOjrnyCXIOKZtz19dSXa4+mIw9dr3q3F4BV1E
         ayP60J/1iSsnsAKUkqcfOKDvG2g3ddNNtEUI1gkwlF8dg+90NmqF0NWv4XaJSQ4sVYUA
         d8951qNNwhmZE8bcbc7LoXtIlP7OJ7tP1hSNt4JZmeLLgXyauyys1ON087oOpRGpB7GN
         wk5Q==
In-Reply-To: <1367940030-19311-1-git-send-email-dirk.j.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

The driver can no longer be built as a module remove the compile fence
around cpufreq tracing call.

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/intel_pstate.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index c7bd91f..50a29df 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -391,9 +391,8 @@ static void intel_pstate_set_pstate(struct cpudata *cpu, int pstate)
 	if (pstate == cpu->pstate.current_pstate)
 		return;
 
-#ifndef MODULE
 	trace_cpu_frequency(pstate * 100000, cpu->cpu);
-#endif
+
 	cpu->pstate.current_pstate = pstate;
 	wrmsrl(MSR_IA32_PERF_CTL, pstate << 8);
 
-- 
1.7.7.6
