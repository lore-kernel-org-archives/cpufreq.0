From: Rashika Kheria <rashika.kheria@gmail.com>
Subject: =?UTF-8?q?=5BPATCH=20v3=5D=20drivers=3A=20cpufreq=3A=20Mark=20function=20as=20static=20in=20cpufreq=2Ec?=
Date: Wed, 26 Feb 2014 22:12:42 +0530
Message-ID: <1393432962-3647-1-git-send-email-rashika.kheria@gmail.com>
References: <20140226154625.GA10701@rashika>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-type:content-transfer-encoding;
        bh=7L8/6x/YhRWVz9L3L0qsSZ7jgADqY4HMDDgjGwXwV8A=;
        b=SQ9/mOef1KfkJgu3M/sfdRWGbdCctiAuTRqYpqzK1hgfnK/veu2JG4fxnNiYSSy6jc
         do9Jh92+c7pz4yVS5seAFpRrxfLzJYJo/YF+rzZTEoZczPMz+/vg7cC2nJgQ9Q4VMxa9
         Byk82aXtrl2rL/MFBfUOg9uzx4qkBmk9xJrrJQEvVFrG8Un+Zn3gkpNSHUvkj3Kp3teD
         QutO0jXQUoZVA272XVclvhB0DF1xRgW+CRMfo0LVhxahv5SJZBdDoLGWPjCsvkWTwQyQ
         Br+5GXfv1HVACvUc7ULP31Re+H1ZfYWGjYE+F42vWv+Ky+5bd6HGvs6/3/2FkQRs/JZ8
         4VIw==
In-Reply-To: <20140226154625.GA10701@rashika>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: josh@joshtriplett.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

Mark function as static in cpufreq.c because it is not
used outside this file.

This eliminates the following warning in cpufreq.c:
drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for =E2=
=80=98show_boost=E2=80=99 [-Wmissing-prototypes]

Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>
---
Changes since v1:
Incorrect Fix
Changes since v2:
Show Changelog

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

