From: Borislav Petkov <bp@alien8.de>
Subject: [PATCH] cpufreq: Correct header guards typo
Date: Tue,  2 Apr 2013 14:26:15 +0200
Message-ID: <1364905575-10234-1-git-send-email-bp@alien8.de>
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364905587; bh=aULLe0Bq3TWNeqz0IUsjzMDtrbsz3nWSnKNkbhv17ZE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ACKKTN8MNMaKAuT7Orp3yeF2Wr2
	iyx7jTpCp3bQfuE/acFjV+M9BH8VbLfc1e3IZkuY5uhPGW/OADa1mvp12aWIV9h1i3p
	s0j7zTcc5fx6SeS+utIMRLZDIcfPBJ8MW0sHxcziIUagDf6AXVVdaTskEppFXQdIeiQ
	n/pmYCA1PU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alien8.de; s=alien8;
	t=1364905577; bh=aULLe0Bq3TWNeqz0IUsjzMDtrbsz3nWSnKNkbhv17ZE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=jP3XAL6OaFIlMCqnErvLjJJw6BV
	NBzZqzXMBaS41wd1VhwHgTymjkpGP3ql+VpQ8EehOXHydz433Q20Qq+FzfWgY2iAmr6
	pop8oeThJ9mvB7Px+R5EIkRbyEuTKT1XUvcAQ+fRVDbil2NNQg0CoE+Y37ZluCvwW17
	vbL/g3JKjE=
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@suse.de>

From: Borislav Petkov <bp@suse.de>

It should be "governor".

Signed-off-by: Borislav Petkov <bp@suse.de>
---
 drivers/cpufreq/cpufreq_governor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
index 513cc8234e5e..65937697cab3 100644
--- a/drivers/cpufreq/cpufreq_governor.h
+++ b/drivers/cpufreq/cpufreq_governor.h
@@ -14,8 +14,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef _CPUFREQ_GOVERNER_H
-#define _CPUFREQ_GOVERNER_H
+#ifndef _CPUFREQ_GOVERNOR_H
+#define _CPUFREQ_GOVERNOR_H
 
 #include <linux/cpufreq.h>
 #include <linux/kobject.h>
@@ -263,4 +263,4 @@ int cpufreq_governor_dbs(struct cpufreq_policy *policy,
 		struct common_dbs_data *cdata, unsigned int event);
 void gov_queue_work(struct dbs_data *dbs_data, struct cpufreq_policy *policy,
 		unsigned int delay, bool all_cpus);
-#endif /* _CPUFREQ_GOVERNER_H */
+#endif /* _CPUFREQ_GOVERNOR_H */
-- 
1.8.2.135.g7b592fa

