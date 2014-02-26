From: Rashika Kheria <rashika.kheria@gmail.com>
Subject: =?UTF-8?q?=5BPATCH=20v2=5D=20drivers=3A=20cpufreq=3A=20Mark=20function=20as=20static=20in=20cpufreq=2Ec?=
Date: Wed, 26 Feb 2014 22:08:26 +0530
Message-ID: <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
References: <linux-pm@vger.kernel.org20140226154625.GA10701@rashika>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-type:content-transfer-encoding;
        bh=6Xd+RDmz10LHOFcBrWv9KMlQ4DTePCLUQu7YfrNmawU=;
        b=lPYze3LmAE4v09isEOMkYbtfs5xkzjMhUGLtV7szuNP7QKzXXqhUdvlNHhQSHQ6Bwc
         eY4Zeq7lcVR+EFlpEHCIKLHi/8lcS1b4vMepjCPu768yB5M5y+sOqhWFWtFWecmR1jw6
         QqTaI+V9WYdJV1PVtxYW4+CYiwcgRGoE3oFeAfOWxoiaanTsppK72Jb3qBvu2+x2KxCU
         LbjAIursQ1nLXtyi/t67Dr+ODkiT6+I3z5AeTML2agreWY1nyuZt3bo1ZYNogtWdLXjt
         c9VMiLCm/vhnOYOUUe1pYIhzJlngJvVbTrTkB15TR42JAHy/qZOug+CAg8DF0OoSc7iN
         rSaw==
In-Reply-To: <linux-pm@vger.kernel.org20140226154625.GA10701@rashika>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: josh@joshtriplett.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org

Mark function as static in cpufreq.c because it is not
used outside this file.

This eliminates the following warning in cpufreq.c:
drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for =E2=
=80=98show_boost=E2=80=99 [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
---
 drivers/cpufreq/cpufreq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 08ca8c9..54fd670 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -352,7 +352,7 @@ EXPORT_SYMBOL_GPL(cpufreq_notify_post_transition);
 /*********************************************************************
  *                          SYSFS INTERFACE                          *
  *********************************************************************=
/
-ssize_t show_boost(struct kobject *kobj,
+static ssize_t show_boost(struct kobject *kobj,
 				 struct attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d\n", cpufreq_driver->boost_enabled);
--=20
1.7.9.5

