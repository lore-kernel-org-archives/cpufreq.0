From: Severi Salminen <severi.salminen@iki.fi>
Subject: [PATCH] Allow any governor to be used as default
Date: Tue, 29 May 2007 23:11:58 +0300
Message-ID: <465C890E.5040300@iki.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040700090309060106030305"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.
--------------040700090309060106030305
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This patch allows the user to select any cpufreq governor as the default
governor - not just 'performance' or 'userspave'. This patch is inspired
by and based on the patch provided in this bug:

http://bugme.osdl.org/show_bug.cgi?id=8384

The above patch, however, doesn't allow the selection of 'ondemand' or
'conservative'.

I added the necessary descriptions and options to Kconfig, made relevant
functions non-static and updated cpufreq.h.

In order to allow the selection of 'ondemand' or 'conservative' I had to
rename a function cpufreq_gov_dbs() in cpufreq_ondemand.c and
cpufreq_conservative.c to prevent name collision - the function has to
be non-static. The functions are now cpufreq_gov_ondemand() and
cpufreq_gov_conservative(). I think this is more in line with the naming
of other governors.

Those two files also have functions cpufreq_gov_dbs_init() and
cpufreq_gov_dbs_exit(). They could also be renamed for consistency but
it is not necessary as they are both static. I didn't touch them in this
patch.

This patch works on 2.6.21.2.

PS. This is my first patch so any feedback concerning anything is welcome.

Signed-off-by: Severi Salminen <severi.salminen@iki.fi>

---

diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_conservative.c
linux-2.6.21.2/drivers/cpufreq/cpufreq_conservative.c
--- linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_conservative.c
2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/cpufreq_conservative.c	2007-05-24
16:16:17.000000000 +0300
@@ -551,7 +551,7 @@
 	return 0;
 }

-static struct cpufreq_governor cpufreq_gov_dbs = {
+struct cpufreq_governor cpufreq_gov_conservative = {
 	.name		= "conservative",
 	.governor	= cpufreq_governor_dbs,
 	.owner		= THIS_MODULE,
@@ -559,7 +559,7 @@

 static int __init cpufreq_gov_dbs_init(void)
 {
-	return cpufreq_register_governor(&cpufreq_gov_dbs);
+	return cpufreq_register_governor(&cpufreq_gov_conservative);
 }

 static void __exit cpufreq_gov_dbs_exit(void)
@@ -567,7 +567,7 @@
 	/* Make sure that the scheduled work is indeed not running */
 	flush_scheduled_work();

-	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+	cpufreq_unregister_governor(&cpufreq_gov_conservative);
 }


diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_ondemand.c
linux-2.6.21.2/drivers/cpufreq/cpufreq_ondemand.c
--- linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_ondemand.c	2007-05-24
00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/cpufreq_ondemand.c	2007-05-24
16:15:42.000000000 +0300
@@ -573,7 +573,7 @@
 	return 0;
 }

-static struct cpufreq_governor cpufreq_gov_dbs = {
+struct cpufreq_governor cpufreq_gov_ondemand = {
 	.name = "ondemand",
 	.governor = cpufreq_governor_dbs,
 	.owner = THIS_MODULE,
@@ -586,12 +586,12 @@
 		printk(KERN_ERR "Creation of kondemand failed\n");
 		return -EFAULT;
 	}
-	return cpufreq_register_governor(&cpufreq_gov_dbs);
+	return cpufreq_register_governor(&cpufreq_gov_ondemand);
 }

 static void __exit cpufreq_gov_dbs_exit(void)
 {
-	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+	cpufreq_unregister_governor(&cpufreq_gov_ondemand);
 	destroy_workqueue(kondemand_wq);
 }

diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_powersave.c
linux-2.6.21.2/drivers/cpufreq/cpufreq_powersave.c
--- linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_powersave.c
2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/cpufreq_powersave.c	2007-05-24
15:18:49.000000000 +0300
@@ -35,7 +35,7 @@
 	return 0;
 }

-static struct cpufreq_governor cpufreq_gov_powersave = {
+struct cpufreq_governor cpufreq_gov_powersave = {
 	.name		= "powersave",
 	.governor	= cpufreq_governor_powersave,
 	.owner		= THIS_MODULE,
diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/Kconfig
linux-2.6.21.2/drivers/cpufreq/Kconfig
--- linux-2.6.21.2-vanilla/drivers/cpufreq/Kconfig	2007-05-24
00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/Kconfig	2007-05-24 16:20:06.000000000
+0300
@@ -66,6 +66,14 @@
 	  the frequency statically to the highest frequency supported by
 	  the CPU.

+config CPU_FREQ_DEFAULT_GOV_POWERSAVE
+        bool "powersave"
+        select CPU_FREQ_GOV_POWERSAVE
+        help
+          Use the CPUFreq governor 'powersave' as default. This sets
+          the frequency statically to the lowest frequency supported by
+          the CPU.
+
 config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	bool "userspace"
 	select CPU_FREQ_GOV_USERSPACE
@@ -75,6 +83,22 @@
 	  program shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.

+config CPU_FREQ_DEFAULT_GOV_ONDEMAND
+        bool "ondemand"
+        select CPU_FREQ_GOV_ONDEMAND
+        help
+          Use the CPUFreq governor 'ondemand' as default. This governor
+          does a periodic polling and changes frequency based on the
+          CPU utilization.
+
+config CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
+        bool "conservative"
+        select CPU_FREQ_GOV_CONSERVATIVE
+        help
+          Use the CPUFreq governor 'conservative' as default. This governor
+          does a periodic polling and changes frequency based on the
+          CPU utilization.
+
 endchoice

 config CPU_FREQ_GOV_PERFORMANCE
diff -ur linux-2.6.21.2-vanilla/include/linux/cpufreq.h
linux-2.6.21.2/include/linux/cpufreq.h
--- linux-2.6.21.2-vanilla/include/linux/cpufreq.h	2007-05-24
00:33:55.000000000 +0300
+++ linux-2.6.21.2/include/linux/cpufreq.h	2007-05-24 15:45:38.000000000
+0300
@@ -283,9 +283,18 @@
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 extern struct cpufreq_governor cpufreq_gov_performance;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_performance
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE)
+extern struct cpufreq_governor cpufreq_gov_powersave;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_powersave
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND)
+extern struct cpufreq_governor cpufreq_gov_ondemand;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_ondemand
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE)
+extern struct cpufreq_governor cpufreq_gov_conservative;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_conservative
 #endif



--------------040700090309060106030305
Content-Type: text/plain;
 name="cpufreq.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="cpufreq.patch"

diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_conservative.c linux-2.6.21.2/drivers/cpufreq/cpufreq_conservative.c
--- linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_conservative.c	2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/cpufreq_conservative.c	2007-05-24 16:16:17.000000000 +0300
@@ -551,7 +551,7 @@
 	return 0;
 }
 
-static struct cpufreq_governor cpufreq_gov_dbs = {
+struct cpufreq_governor cpufreq_gov_conservative = {
 	.name		= "conservative",
 	.governor	= cpufreq_governor_dbs,
 	.owner		= THIS_MODULE,
@@ -559,7 +559,7 @@
 
 static int __init cpufreq_gov_dbs_init(void)
 {
-	return cpufreq_register_governor(&cpufreq_gov_dbs);
+	return cpufreq_register_governor(&cpufreq_gov_conservative);
 }
 
 static void __exit cpufreq_gov_dbs_exit(void)
@@ -567,7 +567,7 @@
 	/* Make sure that the scheduled work is indeed not running */
 	flush_scheduled_work();
 
-	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+	cpufreq_unregister_governor(&cpufreq_gov_conservative);
 }
 
 
diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_ondemand.c linux-2.6.21.2/drivers/cpufreq/cpufreq_ondemand.c
--- linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_ondemand.c	2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/cpufreq_ondemand.c	2007-05-24 16:15:42.000000000 +0300
@@ -573,7 +573,7 @@
 	return 0;
 }
 
-static struct cpufreq_governor cpufreq_gov_dbs = {
+struct cpufreq_governor cpufreq_gov_ondemand = {
 	.name = "ondemand",
 	.governor = cpufreq_governor_dbs,
 	.owner = THIS_MODULE,
@@ -586,12 +586,12 @@
 		printk(KERN_ERR "Creation of kondemand failed\n");
 		return -EFAULT;
 	}
-	return cpufreq_register_governor(&cpufreq_gov_dbs);
+	return cpufreq_register_governor(&cpufreq_gov_ondemand);
 }
 
 static void __exit cpufreq_gov_dbs_exit(void)
 {
-	cpufreq_unregister_governor(&cpufreq_gov_dbs);
+	cpufreq_unregister_governor(&cpufreq_gov_ondemand);
 	destroy_workqueue(kondemand_wq);
 }
 
diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_powersave.c linux-2.6.21.2/drivers/cpufreq/cpufreq_powersave.c
--- linux-2.6.21.2-vanilla/drivers/cpufreq/cpufreq_powersave.c	2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/cpufreq_powersave.c	2007-05-24 15:18:49.000000000 +0300
@@ -35,7 +35,7 @@
 	return 0;
 }
 
-static struct cpufreq_governor cpufreq_gov_powersave = {
+struct cpufreq_governor cpufreq_gov_powersave = {
 	.name		= "powersave",
 	.governor	= cpufreq_governor_powersave,
 	.owner		= THIS_MODULE,
diff -ur linux-2.6.21.2-vanilla/drivers/cpufreq/Kconfig linux-2.6.21.2/drivers/cpufreq/Kconfig
--- linux-2.6.21.2-vanilla/drivers/cpufreq/Kconfig	2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/drivers/cpufreq/Kconfig	2007-05-24 16:20:06.000000000 +0300
@@ -66,6 +66,14 @@
 	  the frequency statically to the highest frequency supported by
 	  the CPU.
 
+config CPU_FREQ_DEFAULT_GOV_POWERSAVE
+        bool "powersave"
+        select CPU_FREQ_GOV_POWERSAVE
+        help
+          Use the CPUFreq governor 'powersave' as default. This sets
+          the frequency statically to the lowest frequency supported by
+          the CPU.
+
 config CPU_FREQ_DEFAULT_GOV_USERSPACE
 	bool "userspace"
 	select CPU_FREQ_GOV_USERSPACE
@@ -75,6 +83,22 @@
 	  program shall be able to set the CPU dynamically without having
 	  to enable the userspace governor manually.
 
+config CPU_FREQ_DEFAULT_GOV_ONDEMAND
+        bool "ondemand"
+        select CPU_FREQ_GOV_ONDEMAND
+        help
+          Use the CPUFreq governor 'ondemand' as default. This governor
+          does a periodic polling and changes frequency based on the 
+          CPU utilization.
+
+config CPU_FREQ_DEFAULT_GOV_CONSERVATIVE
+        bool "conservative"
+        select CPU_FREQ_GOV_CONSERVATIVE
+        help
+          Use the CPUFreq governor 'conservative' as default. This governor
+          does a periodic polling and changes frequency based on the 
+          CPU utilization.
+
 endchoice
 
 config CPU_FREQ_GOV_PERFORMANCE
diff -ur linux-2.6.21.2-vanilla/include/linux/cpufreq.h linux-2.6.21.2/include/linux/cpufreq.h
--- linux-2.6.21.2-vanilla/include/linux/cpufreq.h	2007-05-24 00:33:55.000000000 +0300
+++ linux-2.6.21.2/include/linux/cpufreq.h	2007-05-24 15:45:38.000000000 +0300
@@ -283,9 +283,18 @@
 #ifdef CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
 extern struct cpufreq_governor cpufreq_gov_performance;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_performance
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE)
+extern struct cpufreq_governor cpufreq_gov_powersave;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_powersave
 #elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE)
 extern struct cpufreq_governor cpufreq_gov_userspace;
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND)
+extern struct cpufreq_governor cpufreq_gov_ondemand;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_ondemand
+#elif defined(CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE)
+extern struct cpufreq_governor cpufreq_gov_conservative;
+#define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_conservative
 #endif
 
 

--------------040700090309060106030305
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040700090309060106030305--

