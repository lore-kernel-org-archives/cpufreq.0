From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 10:50:23 +0530
Message-ID: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: rjw@sisk.pl
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com, Viresh Kumar <viresh.kumar@linaro.org>

With debug options on, it is difficult to locate cpufreq core's debug print=
s.
Fix this by prefixing debug prints with:

"cpufreq: "

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c             | 2 ++
 drivers/cpufreq/cpufreq_performance.c | 2 ++
 drivers/cpufreq/cpufreq_powersave.c   | 2 ++
 drivers/cpufreq/cpufreq_userspace.c   | 2 ++
 drivers/cpufreq/freq_table.c          | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index db6e337..bcbc99d 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -15,6 +15,8 @@
  *
  */
=20
+#define pr_fmt(fmt) "cpufreq: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
diff --git a/drivers/cpufreq/cpufreq_performance.c b/drivers/cpufreq/cpufre=
q_performance.c
index f13a8a9..67e3232 100644
--- a/drivers/cpufreq/cpufreq_performance.c
+++ b/drivers/cpufreq/cpufreq_performance.c
@@ -10,6 +10,8 @@
  *
  */
=20
+#define pr_fmt(fmt) "cpufreq: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/cpufreq.h>
diff --git a/drivers/cpufreq/cpufreq_powersave.c b/drivers/cpufreq/cpufreq_=
powersave.c
index 4c2eb51..eb974b6 100644
--- a/drivers/cpufreq/cpufreq_powersave.c
+++ b/drivers/cpufreq/cpufreq_powersave.c
@@ -10,6 +10,8 @@
  *
  */
=20
+#define pr_fmt(fmt) "cpufreq: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/cpufreq.h>
diff --git a/drivers/cpufreq/cpufreq_userspace.c b/drivers/cpufreq/cpufreq_=
userspace.c
index bedac1a..6d7ccdb 100644
--- a/drivers/cpufreq/cpufreq_userspace.c
+++ b/drivers/cpufreq/cpufreq_userspace.c
@@ -11,6 +11,8 @@
  *
  */
=20
+#define pr_fmt(fmt) "cpufreq: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/smp.h>
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 90431cb..246949c 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -9,6 +9,8 @@
  *
  */
=20
+#define pr_fmt(fmt) "cpufreq: " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
--=20
1.7.12.rc2.18.g61b472e

