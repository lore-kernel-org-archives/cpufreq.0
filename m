From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] cpufreq / intel_pstate: use vzalloc() instead of vmalloc()/memset(0)
Date: Mon, 13 May 2013 16:03:43 +0800
Message-ID: <CAPgLHd9Z99KvdBghVqr++9G5eBx5hKA13LmPUpc=K_X3N+uhiQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to:cc
         :content-type;
        bh=vNT0K9rVn2sdGl9Cfe42Da2kQo0yMAV/ZZ/UkUmGbLw=;
        b=qIJ+PYNa0GlljypFz8blL+A3M390/Z59JK/pKi74Auaok53wCYeM4MMyB+RhWWTVT/
         aDVYhR5hsz7LUEdl4wm38gQl5gZLXfFAXUvPNIOBQ+7FHT3H5IgLw3HLSC78TgdCSlzB
         ITodTX6cL4k+N3QWqUyOg6Ko5p7Ad6U6W3uSAz8KkgM+qitBhwjeFLsNw6OxsWVSJQd1
         lTW94e6mWsavZSokYN8coF3pMvQ4EarJilWYJ7NKlVGWpvQHzsP2M84K8kOFMA6SQme/
         dd0T9IrESPTDAqmC8u0722le2bq/cq9Rp0xhZLPYkaLZoTS85H1pS3pwsX1erXERPu6N
         hKUw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, viresh.kumar@linaro.org
Cc: yongjun_wei@trendmicro.com.cn, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use vzalloc() instead of vmalloc() and memset(0).

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/cpufreq/intel_pstate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstate.c
index cc3a8e6..f59aecb 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -788,10 +788,9 @@ static int __init intel_pstate_init(void)
 
 	pr_info("Intel P-state driver initializing.\n");
 
-	all_cpu_data = vmalloc(sizeof(void *) * num_possible_cpus());
+	all_cpu_data = vzalloc(sizeof(void *) * num_possible_cpus());
 	if (!all_cpu_data)
 		return -ENOMEM;
-	memset(all_cpu_data, 0, sizeof(void *) * num_possible_cpus());
 
 	rc = cpufreq_register_driver(&intel_pstate_driver);
 	if (rc)

