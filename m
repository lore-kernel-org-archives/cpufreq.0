From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/include/linux cpufreq.h,1.46,1.47
Date: Tue, 20 Jan 2004 17:03:36 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1AizHs-0007s3-3S@flint.arm.linux.org.uk>
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/include/linux
In directory flint:/tmp/cvs-serv30228/linux/include/linux

Modified Files:
	cpufreq.h 
Log Message:
Merge with latest davej cpufreq bk tree.

Index: cpufreq.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/include/linux/cpufreq.h,v
retrieving revision 1.46
retrieving revision 1.47
diff -u -r1.46 -r1.47
--- cpufreq.h	5 Nov 2003 18:27:44 -0000	1.46
+++ cpufreq.h	20 Jan 2004 17:03:32 -0000	1.47
@@ -57,7 +57,7 @@
 struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
-	unsigned int		transition_latency; /* in 10^(-9) s */
+	unsigned int		transition_latency; /* in 10^(-9) s = nanoseconds */
 };
 
 struct cpufreq_real_policy {
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
