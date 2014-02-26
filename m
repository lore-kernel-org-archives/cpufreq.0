From: Rashika Kheria <rashika.kheria@gmail.com>
Subject: [PATCH] drivers: cpufreq: Remove unused function in cpufreq.c
Date: Wed, 26 Feb 2014 21:16:25 +0530
Message-ID: <20140226154625.GA10701@rashika>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version:content-type
         :content-disposition:content-transfer-encoding:user-agent;
        bh=2V7aQWWiBs6aXdeYjmQVQnfvaAefq829rFzpDXAtK9A=;
        b=0zg3Yjbl57xExduL2dXkc8rtTAO+hmklqiKIcq9+2o4koqWk8WAEI7EvWvFLhoWngS
         Lp6Wpo9k+hgY81mH/QQVHo0soLgqkXVouJMcfw+G1EsV5wMnzIeTgcB2mRytk0/X5Gxe
         dHhuT46bjfRNSgXD8YdainsUh80iYP5SLBkY9ood2Vt8DIFReFFe284rDqHwRq82Ny/N
         jujmwjWg4xPyNNm3w1mi2TYguqP1qnFErYwI/4NSxlHeZ0bp/RXGHUqwTB7rERdXRoE4
         yuSQ4sxh+3dXQDpAzt5Q0rsGhZAjmNG9YwEYLQA49mKtuzsrw2udkRCLcs2ZF2y4t0EC
         uIEQ==
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: linux-kernel@vger.kernel.org
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, josh@joshtriplett.org

Remove unused function show_boost() in drivers/cpufreq/cpufreq.c.

This eliminates the following warning in drivers/cpufreq/cpufreq.c:
drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for =E2=
=80=98show_boost=E2=80=99 [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
---
 drivers/cpufreq/cpufreq.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 08ca8c9..6dce474 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -352,12 +352,6 @@ EXPORT_SYMBOL_GPL(cpufreq_notify_post_transition);
 /*********************************************************************
  *                          SYSFS INTERFACE                          *
  *********************************************************************=
/
-ssize_t show_boost(struct kobject *kobj,
-				 struct attribute *attr, char *buf)
-{
-	return sprintf(buf, "%d\n", cpufreq_driver->boost_enabled);
-}
-
 static ssize_t store_boost(struct kobject *kobj, struct attribute *att=
r,
 				  const char *buf, size_t count)
 {
--=20
1.7.9.5
