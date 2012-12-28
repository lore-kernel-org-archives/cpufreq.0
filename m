From: Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH] Fix problem with cpufreq_pndemand or cpufreq_conservative
Date: Fri, 28 Dec 2012 16:17:24 -0600
Message-ID: <50DE1A74.4040607@lwfinger.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:content-type:content-transfer-encoding;
        bh=vMvUG2rHlaTwqicABW4On7xlTEc1tvtl2Dpoh/jGNtI=;
        b=yU6iUVc9YLJHy++9zIBZcSftIuzt7gAXTrelzl16qNS33Ay8F7toCCq3jiZ5txZeAp
         kQ+B7+It3/maCSIKirV5ZmBUf2OlzGFhQOKD240myomaM1wFXuvMxkgAtZZnyCXWJuqs
         8rxbtySqHOwrlgVQ38UdpsWgmQhHWXWnQ4t1dYCSqV/J7oMBwGXKIbHktd2cToScr2RQ
         epeCk5gHrnDw+XMsmZs3WLvelo4RfzRD7QNuKC+oDAwPSmCaZlNugMo59A+xgx9ffkSI
         CZ0XhrrlHvpGs/ZAbZf6ccvDS4q0hHYXTLJqhuCJSQayK2ABRHRRFT3F9DkKz1+a6t7Q
         8o0g==
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: viresh kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Since commit 2aacdff entitled "cpufreq: Move common part from governors to 
separate file", whenever the drivers that depend on this new file 
(cpufreq_ondemand or cpufreq_conservative) are built as modules, a new module 
named cpufreq_governor is created. It seems that kmake is smart enough to create 
a separate module whenever more than one module includes the same object file. 
As drivers/cpufreq/cpufreq_governor.c contains no MODULE directives, the 
resulting module has no license specified, which results in logging of a "module 
license 'unspecified' taints kernel". In addition, a number of globals are 
exported GPL only, and are therefore not available.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---

This particular patch is the simplest possible; however, it hides the intent. I 
have prepared the longer version that makes the reason clearer by adding a new 
configuration variable that is dependent on the other two, and rearranges 
drivers/cpufreq/Makefile. That version could be submitted if that is what is 
desired. The changes to cpufreq_governor.c are the same as in this version.

Larry


       cpufreq_governor.c |    5 +++++
       1 file changed, 5 insertions(+)
---
Index: wireless-testing-new/drivers/cpufreq/cpufreq_governor.c
===================================================================
--- wireless-testing-new.orig/drivers/cpufreq/cpufreq_governor.c
+++ wireless-testing-new/drivers/cpufreq/cpufreq_governor.c
@@ -25,6 +25,7 @@
  #include <linux/tick.h>
  #include <linux/types.h>
  #include <linux/workqueue.h>
+#include <linux/module.h>

  #include "cpufreq_governor.h"

@@ -316,3 +317,7 @@ second_time:
  	return 0;
  }
  EXPORT_SYMBOL_GPL(cpufreq_governor_dbs);
+MODULE_AUTHOR("Alexander Clouter <alex@digriz.org.uk>");
+MODULE_DESCRIPTION("'cpufreq_governor' - A mini-module containing "
+		"common code for cpufreq_conservative and cpufreq_ondemand");
+MODULE_LICENSE("GPL");






