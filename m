From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] cpufreq: core: Fix typo in comment describing show_bios_limit()
Date: Tue,  9 Oct 2012 12:32:48 +0530
Message-ID: <718816abb84888e786c8bc478104668440b77324.1349766028.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, Viresh Kumar <viresh.kumar@linaro.org>

show_bios_limit is mistakenly written as show_scaling_driver in a comment
describing purpose of show_bios_limit() routine.

Fix it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index fb8a527..021973b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -581,7 +581,7 @@ static ssize_t show_scaling_setspeed(struct cpufreq_pol=
icy *policy, char *buf)
 }
=20
 /**
- * show_scaling_driver - show the current cpufreq HW/BIOS limitation
+ * show_bios_limit - show the current cpufreq HW/BIOS limitation
  */
 static ssize_t show_bios_limit(struct cpufreq_policy *policy, char *buf)
 {
--=20
1.7.12.rc2.18.g61b472e

