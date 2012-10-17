From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] cpufreq: Debugging options for the cpufreq subsystem
Date: Wed, 17 Oct 2012 10:50:24 +0530
Message-ID: <bf2567a3c3b6f35c606ea8d71722048eefb0c45a.1350451100.git.viresh.kumar@linaro.org>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
In-Reply-To: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
References: <3b38cb8ab136e5af3a70fceb7d77ad9fc889eb3f.1350451100.git.viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: rjw-KKrjLPT3xs0@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cpufreq-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pdsw-power-team-5wv7dgnIgG8@public.gmane.org

This adds Kconfig options for DEBUG and VERBOSE_DEBUG to the cpufreq subsystem,
This is pretty useful for developers who want to debug cpufreq subsystem and
don't want to editing the Makefile manually each time they want to debug.

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/cpufreq/Kconfig  | 14 ++++++++++++++
 drivers/cpufreq/Makefile |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index e24a2a1..b9ee95c 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -17,6 +17,20 @@ config CPU_FREQ
 
 if CPU_FREQ
 
+config CPUFREQ_DEBUG
+        bool "cpufreq debugging"
+        help
+	  This is an option for use by developers; most people should say N
+	  here. This enables cpufreq core and debugging.
+
+config CPUFREQ_VDEBUG
+        bool "cpufreq verbose debugging"
+        depends on CPUFREQ_DEBUG != n
+        help
+	  This is an option for use by developers; most people should say N
+	  here.  This enables deeper (more verbose) debugging of the cpufreq
+	  core and drivers.
+
 config CPU_FREQ_TABLE
 	tristate
 
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index fe4cd26..df4cfc8 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -1,3 +1,7 @@
+# CPUfreq core & drivers debugging
+ccflags-$(CONFIG_CPUFREQ_DEBUG)		:= -DDEBUG
+ccflags-$(CONFIG_CPUFREQ_VDEBUG)	+= -DVERBOSE_DEBUG
+
 # CPUfreq core
 obj-$(CONFIG_CPU_FREQ)			+= cpufreq.o
 # CPUfreq stats
-- 
1.7.12.rc2.18.g61b472e
