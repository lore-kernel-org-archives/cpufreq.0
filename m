From: Rob Weryk <rjweryk@uwo.ca>
Subject: [PATCH] cpufreq: allow ondemand governor as default
Date: Thu, 03 Mar 2005 20:13:59 -0500
Message-ID: <20050304011359.GA32684@aquarid.physics.uwo.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@ZenII.linux.org.uk


Hi,

The patch below (against 2.6.11) allows the ondemand cpufreq
governor to be selected as the default.  If it's acceptable,
please apply.

(I'm not subscribed, so please cc me on replies, thanks.)

Signed-off-by: Rob Weryk <rjweryk@uwo.ca>


diff -ur linux-2.6.11/drivers/cpufreq/Kconfig robbie-2.6.11/drivers/cpufreq/Kconfig
--- linux-2.6.11/drivers/cpufreq/Kconfig	2005-03-02 14:08:42.000000000 -0500
+++ robbie-2.6.11/drivers/cpufreq/Kconfig	2005-03-02 14:29:28.000000000 -0500
@@ -69,6 +69,13 @@
 	  program shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.
 
+config CPU_FREQ_DEFAULT_GOV_ONDEMAND
+	bool "ondemand"
+	select CPU_FREQ_GOV_ONDEMAND
+	help
+	  Use the CPUFreq governor 'ondemand' as default.  This dynamically
+	  adjusts the CPU frequency based on the CPU use.
+
 endchoice
 
 config CPU_FREQ_GOV_PERFORMANCE
diff -ur linux-2.6.11/include/linux/cpufreq.h robbie-2.6.11/include/linux/cpufreq.h
--- linux-2.6.11/include/linux/cpufreq.h	2005-03-02 14:08:47.000000000 -0500
+++ robbie-2.6.11/include/linux/cpufreq.h	2005-03-02 14:21:52.000000000 -0500
@@ -264,6 +264,9 @@
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND)
+extern struct cpufreq_governor cpufreq_gov_dbs;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_dbs
 #endif
