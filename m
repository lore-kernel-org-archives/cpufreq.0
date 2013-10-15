From: Evgeny Kapaev <orener300@gmail.com>
Subject: [PATCH] Remove unnecessary braces
Date: Tue, 15 Oct 2013 21:42:52 +0400
Message-ID: <20131015174251.GA4366@eee-laptop>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:user-agent;
        bh=4qLOIuFWkeUvoScca/B2yyztsiDLPqgA601aNHv/1bA=;
        b=A1KcIo9BdpHI7ej3NNyTvV0UhEFgrp4AKuyDXIkDfdnWEsGWUepdAukOeaKCoTgfTZ
         3ug4cOYzYhiieVOoPFUvhcs3V7JvC4MdCs+pXHjajfzU3fvepzQrXXp/eJRR7hSP42Tr
         k03mrgDPVbQZOSKXo8nN5rK449itwxx2tThsyGDgUJ5Gvu3cfZv+dIZT9aLD/vZURSt4
         np3M5dnHWKRp/6XpIEaieYhe4zTku8/iBX7Vy3AIGeoDLG0TU6lR30SJiNxUamTrn/tp
         Pc5edw3oAkl3GDqnJELucIfFxeH9N6ft1j1TNF1IFY6gnWB41tBZ903i7fhY//bSFCA2
         vimA==
Content-Disposition: inline
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org
Cc: rjw@sisk.pl, viresh.kumar@linaro.org

As per coding style, braces {} are not necessary for single statement block

Signed-off-by: Evgeny Kapaev <orener300@gmail.com>
---
 drivers/cpufreq/speedstep-centrino.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpufreq/speedstep-centrino.c b/drivers/cpufreq/speedstep-centrino.c
index f897d51..98797a6 100644
--- a/drivers/cpufreq/speedstep-centrino.c
+++ b/drivers/cpufreq/speedstep-centrino.c
@@ -373,9 +373,8 @@ static int centrino_cpu_init(struct cpufreq_policy *policy)
 		return -ENODEV;
 	}
 
-	if (centrino_cpu_init_table(policy)) {
+	if (centrino_cpu_init_table(policy))
 		return -ENODEV;
-	}
 
 	/* Check to see if Enhanced SpeedStep is enabled, and try to
 	   enable it if not. */
-- 
1.8.1.2

