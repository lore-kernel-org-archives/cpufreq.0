From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH 5/8] core: remove unneeded #ifdefs in include/linux/cpufreq.h
Date: Wed, 19 Nov 2003 19:32:55 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031119183255.GG20576@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

There's no need for some #ifdefs in cpufreq.h

 include/linux/cpufreq.h |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff -ruN linux-original/include/linux/cpufreq.h linux/include/linux/cpufreq.h
--- linux-original/include/linux/cpufreq.h	2003-11-19 17:06:19.265547160 +0100
+++ linux/include/linux/cpufreq.h	2003-11-19 18:34:45.694847288 +0100
@@ -231,17 +231,18 @@
 /* the proc_intf.c needs this */
 int cpufreq_parse_governor (char *str_governor, unsigned int *policy, struct cpufreq_governor **governor);
 
-#if defined(CONFIG_CPU_FREQ_GOV_USERSPACE) || defined(CONFIG_CPU_FREQ_GOV_USERSPACE_MODULE)
+
 /*********************************************************************
  *                      CPUFREQ USERSPACE GOVERNOR                   *
  *********************************************************************/
 int cpufreq_gov_userspace_init(void);
 
+#ifdef CONFIG_CPU_FREQ_24_API
+
 int cpufreq_setmax(unsigned int cpu);
 int cpufreq_set(unsigned int kHz, unsigned int cpu);
 unsigned int cpufreq_get(unsigned int cpu);
 
-#ifdef CONFIG_CPU_FREQ_24_API
 
 /* /proc/sys/cpu */
 enum {
@@ -289,8 +290,6 @@
 
 #endif /* CONFIG_CPU_FREQ_24_API */
 
-#endif /* CONFIG_CPU_FREQ_GOV_USERSPACE */
-
 
 /*********************************************************************
  *                       CPUFREQ DEFAULT GOVERNOR                    *
@@ -305,6 +304,7 @@
 #define CPUFREQ_DEFAULT_GOVERNOR	&cpufreq_gov_userspace
 #endif
 
+
 /*********************************************************************
  *                     FREQUENCY TABLE HELPERS                       *
  *********************************************************************/
@@ -318,7 +318,6 @@
 				    * order */
 };
 
-#if defined(CONFIG_CPU_FREQ_TABLE) || defined(CONFIG_CPU_FREQ_TABLE_MODULE)
 int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 				    struct cpufreq_frequency_table *table);
 
@@ -340,5 +339,4 @@
 void cpufreq_frequency_table_put_attr(unsigned int cpu);
 
 
-#endif /* CONFIG_CPU_FREQ_TABLE */
 #endif /* _LINUX_CPUFREQ_H */
