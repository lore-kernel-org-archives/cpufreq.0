From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 1/2] cpufreq: Improve debug prints
Date: Wed, 17 Oct 2012 11:47:06 +0530
Message-ID: <CAKohpom6xHUmu2uYijdNVJHj6sFwJhYUYvXy+dN1a+WqzqTjZA@mail.gmail.com>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
	<1350452374.3072.19.camel@joe-AO722>
	<CAKohpo=LL+wPcb97KNQvHbX0fzhnRBZjPsHXTj1PdYObuVVTgw@mail.gmail.com>
	<1350453876.3072.23.camel@joe-AO722>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1350453876.3072.23.camel@joe-AO722>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rjw@sisk.pl, Joe Perches <joe@perches.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org, pdsw-power-team@arm.com

On 17 October 2012 11:34, Joe Perches <joe@perches.com> wrote:
> I believe you are quoting KBUILD_MODNAME

Yes. :(
Far better output with this. Thanks.

@Rafael: Please consider below patch instead:

From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 17 Oct 2012 10:38:31 +0530
Subject: [PATCH] cpufreq: Improve debug prints

With debug options on, it is difficult to locate cpufreq core's debug prints.
Fix this by prefixing debug prints with KBUILD_MODNAME.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/cpufreq.c             | 2 ++
 drivers/cpufreq/cpufreq_performance.c | 2 ++
 drivers/cpufreq/cpufreq_powersave.c   | 2 ++
 drivers/cpufreq/cpufreq_userspace.c   | 2 ++
 drivers/cpufreq/freq_table.c          | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index db6e337..0504b8b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -15,6 +15,8 @@
  *
  */

+#define pr_fmt(fmt) KBUILD_MODNAME": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
diff --git a/drivers/cpufreq/cpufreq_performance.c
b/drivers/cpufreq/cpufreq_performance.c
index f13a8a9..57951dc 100644
--- a/drivers/cpufreq/cpufreq_performance.c
+++ b/drivers/cpufreq/cpufreq_performance.c
@@ -10,6 +10,8 @@
  *
  */

+#define pr_fmt(fmt) KBUILD_MODNAME": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/cpufreq.h>
diff --git a/drivers/cpufreq/cpufreq_powersave.c
b/drivers/cpufreq/cpufreq_powersave.c
index 4c2eb51..c4540cf 100644
--- a/drivers/cpufreq/cpufreq_powersave.c
+++ b/drivers/cpufreq/cpufreq_powersave.c
@@ -10,6 +10,8 @@
  *
  */

+#define pr_fmt(fmt) KBUILD_MODNAME": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/cpufreq.h>
diff --git a/drivers/cpufreq/cpufreq_userspace.c
b/drivers/cpufreq/cpufreq_userspace.c
index bedac1a..c0eb546 100644
--- a/drivers/cpufreq/cpufreq_userspace.c
+++ b/drivers/cpufreq/cpufreq_userspace.c
@@ -11,6 +11,8 @@
  *
  */

+#define pr_fmt(fmt) KBUILD_MODNAME": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/smp.h>
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 90431cb..8bcc930 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -9,6 +9,8 @@
  *
  */

+#define pr_fmt(fmt) KBUILD_MODNAME": " fmt
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/init.h>
