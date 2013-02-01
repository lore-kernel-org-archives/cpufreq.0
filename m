From: dirk.brandewie@gmail.com
Subject: [PATCH 2/6] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Fri,  1 Feb 2013 10:45:37 -0800
Message-ID: <1359744343-18690-4-git-send-email-dirk.brandewie@gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=UEDAkgI7hr0Fp87ZHGM2p5VJrM735JColbMLtEiyYjU=;
        b=b32PstrgK60IowgjUYVJE6cK9G9cx9IdY/XPS8NS6Jb4efPwnn7SSZH6rPRUmV/qhh
         9dyKszvpA4q4aVJZGU8dxFpnKIq8Eh0cHz7jFZbvPHYeXVoJrG4EIKd/ZhQR8Yei9Asq
         EjfVztCTkrzPA74IhNcVSfe22QoLE+NveMncBN4T9El5k1AbIzohimpXuPmCiV2CW6Dx
         uqnlY/pXQlVnCQPkEvhbVgXtsTEJwBSwwAvDqnoVbDbTa5Q6MsWa32YJ0AdtuXTxaPwh
         VHrEt7NISnb72mcKnwT7+PjsWGXw+ZIZce4C1wMXw04w32Qyd8GyG2Cj5rgKOQ0VZRSD
         Athw==
In-Reply-To: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.j.brandewie@intel.com>

Scaling drivers that implement cpufreq_driver.setpolicy() have
internal governors and may/will change the current operating frequency
very frequently this will cause cpufreq_out_of_sync() to be called
every time. Only call cpufreq_driver.get() for drivers that implement
cpufreq_driver.target()

Signed-off-by: Dirk Brandewie <dirk.j.brandewie@intel.com>
---
 drivers/cpufreq/cpufreq.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 1c037f0..493cd50 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1794,7 +1794,7 @@ int cpufreq_update_policy(unsigned int cpu)
 
 	/* BIOS might change freq behind our back
 	  -> ask driver for current freq and notify governors about a change */
-	if (cpufreq_driver->get) {
+	if (cpufreq_driver->get && cpufreq_driver->target) {
 		policy.cur = cpufreq_driver->get(cpu);
 		if (!data->cur) {
 			pr_debug("Driver did not initialize current freq");
-- 
1.7.7.6
