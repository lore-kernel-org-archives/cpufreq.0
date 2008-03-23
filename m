From: Alessandro Guido <alessandro.guido@gmail.com>
Subject: [PATCH] Allow use of the powersave governor as the default one
Date: Sun, 23 Mar 2008 17:43:43 +0100
Message-ID: <200803231743.43974.alessandro.guido@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757972AbYCWQoF@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:from:to:subject:date:user-agent:cc:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=g2lTzYMo/tbLOPnpN6cteOvT/+NepSR5CPFFOjpOyfo=;
        b=VCJRRVu/yW77MNkkyF5R/qes8Qznl98+Ra2+VoDmjA3K77H7HL3QRFqqNBrs+fzQ0n/BwddvWgraA+L5LYg3MNM2TaoJNVMr4m6FGwSMNIqwQYAljylUFaN69TcNMUAhIuUH1ZtJxV1Il3KmNEM1qmigUyzI+Xz57gj4rReCWn4=
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: cpufreq@lists.linux.org.uk

Allow use of the powersave cpufreq governor as the default one for
EMBEDDED configs.

Signed-off-by: Alessandro Guido <alessandro.guido@gmail.com>
--- 
 drivers/cpufreq/Kconfig             |    9 +++++++++
 drivers/cpufreq/cpufreq_powersave.c |    8 ++++++--
 include/linux/cpufreq.h             |    3 +++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index c159ae6..5f076ae 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -69,6 +69,15 @@ config CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 	  the frequency statically to the highest frequency supported by
 	  the CPU.
 
+config CPU_FREQ_DEFAULT_GOV_POWERSAVE
+	bool "powersave"
+	depends on EMBEDDED
+	select CPU_FREQ_GOV_POWERSAVE
+	help
+	  Use the CPUFreq governor 'powersave' as default. This sets
+	  the frequency statically to the lowest frequency supported by
+	  the CPU.
+
 config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	bool "userspace"
 	select CPU_FREQ_GOV_USERSPACE
diff --git a/drivers/cpufreq/cpufreq_powersave.c b/drivers/cpufreq/cpufreq_powersave.c
index 13fe06b..88d2f44 100644
--- a/drivers/cpufreq/cpufreq_powersave.c
+++ b/drivers/cpufreq/cpufreq_powersave.c
@@ -35,12 +35,12 @@ static int cpufreq_governor_powersave(struct cpufreq_policy *policy,
 	return 0;
 }
 
-static struct cpufreq_governor cpufreq_gov_powersave = {
+struct cpufreq_governor cpufreq_gov_powersave = {
 	.name		= "powersave",
 	.governor	= cpufreq_governor_powersave,
 	.owner		= THIS_MODULE,
 };
-
+EXPORT_SYMBOL(cpufreq_gov_powersave);
 
 static int __init cpufreq_gov_powersave_init(void)
 {
@@ -58,5 +58,9 @@ MODULE_AUTHOR("Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION("CPUfreq policy governor 'powersave'");
 MODULE_LICENSE("GPL");
 
+#ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE
+fs_initcall(cpufreq_gov_powersave_init);
+#else
 module_init(cpufreq_gov_powersave_init);
+#endif
 module_exit(cpufreq_gov_powersave_exit);
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index ddd8652..dc31a40 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -307,6 +307,9 @@ extern struct cpufreq_governor cpufreq_gov_performance;
 #endif
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 #define CPUFREQ_DEFAULT_GOVERNOR	(&cpufreq_gov_performance)
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE)
+extern struct cpufreq_governor cpufreq_gov_powersave;
+#define CPUFREQ_DEFAULT_GOVERNOR	(&cpufreq_gov_powersave)
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	(&cpufreq_gov_userspace)
