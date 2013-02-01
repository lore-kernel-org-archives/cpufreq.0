From: dirk.brandewie@gmail.com
Subject: [PATCH 2/6] cpufreq: Only query drivers that implement cpufreq_driver.target()
Date: Fri,  1 Feb 2013 10:45:36 -0800
Message-ID: <1359744343-18690-3-git-send-email-dirk.brandewie@gmail.com>
References: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
         :references;
        bh=+9j+RTvhdabSxnKxzwBvKnaN6QPhg6E0m5wFsTK6l7I=;
        b=bjYL19l8QmaGI28PlzZOU/UQ7aZa9MBnTsXtztTvC9V6BkoYwVy4XhD58mW/cIck1t
         YKjOYjxmNq6gofgK0AwRoKpjD2njkVyUF6f2qCRp23aep7TunESvotjPi7mQUCRMyClR
         KMY5P5pKPsgwMfBkYXfJsJb63YLxLnqjOdz+Jjwg1hEZwOk7iZ2oyybTPFuvc+ITG+e6
         yGhyzVyTYFle0ZjHR0NZpsKxe4kc7RW3NW4iJ5OQ9Uub0+gHCCrJIF9M/WJhQuG6Zqkh
         8v9VrhT/kcV515X6gSyERjP2dNJRJ3I5IlNqPyeFVO8cD60ozMx/px1y50wLYG3Yy/vI
         KILQ==
In-Reply-To: <1359744343-18690-1-git-send-email-dirk.brandewie@gmail.com>
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
