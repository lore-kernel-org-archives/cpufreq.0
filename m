From: dirk.brandewie@gmail.com
Subject: [PATCH 3/7] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Tue,  5 Feb 2013 10:24:02 -0800
Message-ID: <1360088646-19104-4-git-send-email-dirk.brandewie@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=nFZbTLAg8NjODJkF68mtZx/hMu5giZbsoX2elfbhcNU=;
        b=DZyOevycjGVFJDSdTyJgswX5JhRcxUT6qJ/3yw+JzHEYZarJni6E+DNsUMzpHjBHZy
         wEI0U04ulDQo0eZxvln6On1mV3M75aQxlGll7v3B0dObU5JPXHWC/IJsa5G/o/zARKSk
         RSCrNkx2I/vfqr7EvoU+TJ1aKsRbNQuSQW8+hGTZDM+07uzkj+EcZOl/o+GKNGaMSK9k
         z7h13Hkcxr8OaNFFP2ItYhYwmavkP96ZfMfBZG1xZ3Mlgxl3ZafvXcUiIfjrrlTelbaj
         tyCUD4IPmHbZsmM/vLfsODH7Ywn0JtDlyAhfDjN6t4mJ9op3E+i2bNcxE4R2L9G8nuku
         u6gQ==
In-Reply-To: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org
Cc: Dirk Brandewie <dirk.brandewie@gmail.com>, Dirk Brandewie <dirk.j.brandewie@intel.com>

From: Dirk Brandewie <dirk.brandewie@gmail.com>

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
index 96bc302..d8daa4b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1787,7 +1787,7 @@ int cpufreq_update_policy(unsigned int cpu)
 
 	/* BIOS might change freq behind our back
 	  -> ask driver for current freq and notify governors about a change */
-	if (cpufreq_driver->get) {
+	if (cpufreq_driver->get && cpufreq_driver->target) {
 		policy.cur = cpufreq_driver->get(cpu);
 		if (!data->cur) {
 			pr_debug("Driver did not initialize current freq");
-- 
1.7.7.6
