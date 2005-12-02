From: Felix Braun <Felix.Braun@mail.mcgill.ca>
Subject: [PATCH 2.6.14 1/2] cpufreq_conservative units weirdness
Date: Fri, 2 Dec 2005 13:59:56 +0100
Message-ID: <20051202135956.5d7299c1@tilion.getrex.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq@lists.linux.org.uk

Hi there,

I've recently been looking through the cpufreq_conservative driver (mainly
because I thought that it was adapting awfully slowly to the changes in my
load. It seems to me that there is some confusion regarding the units of
transition_latency (in nS) and the sampling_rate (in uS). 

At least the comments don't seem to match my understanding of what the
code is doing. I have always used the term "sampling rate" to describe a
frequency, i.e. higher sampling rate means more samples per second. The
way it is used in the code, sampling_rate describes a sampling interval,
i.e. higher sampling_rate means fewer samples.

This first patch is supposed to change the comments to describe, what is
actually going on.

------

Make the comments describe what the code actually does.

Signed-off-by: Felix Braun <Felix.Braun@mail.McGill.ca>
----

diff -ruN a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
--- a/drivers/cpufreq/cpufreq_conservative.c	2005-10-28 10:42:33.000000000 +0200
+++ b/drivers/cpufreq/cpufreq_conservative.c	2005-12-02 13:19:48.000000000 +0100
@@ -44,10 +44,11 @@
 
 /* 
  * The polling frequency of this governor depends on the capability of 
- * the processor. Default polling frequency is 1000 times the transition
+ * the processor. Default polling frequency is 100000 times the transition
  * latency of the processor. The governor will work on any processor with 
- * transition latency <= 10mS, using appropriate sampling 
- * rate.
+ * transition latency <= 10mS, using an appropriate sampling interval.
+ * The "sampling_rate" used is actually a sampling interval. This means that
+ * CPU speed is adjusted more often if this number is lower.
  * For CPUs with transition latency > 10mS (mostly drivers with CPUFREQ_ETERNAL)
  * this governor will not work.
  * All times here are in uS.
@@ -324,15 +325,14 @@
 	
 	/* 
 	 * The default safe range is 20% to 80% 
-	 * Every sampling_rate, we check
+	 * Every sampling_rate microseconds, we check
 	 * 	- If current idle time is less than 20%, then we try to 
 	 * 	  increase frequency
-	 * Every sampling_rate*sampling_down_factor, we check
+	 * Every sampling_rate*sampling_down_factor microseconds, we check
 	 * 	- If current idle time is more than 80%, then we try to
 	 * 	  decrease frequency
 	 *
-	 * Any frequency increase takes it to the maximum frequency. 
-	 * Frequency reduction happens at minimum steps of 
+	 * Any frequency change (both up and down) happens at minimum steps of 
 	 * 5% (default) of max_frequency 
 	 */
 
diff -ruN a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
--- a/drivers/cpufreq/cpufreq_ondemand.c	2005-12-02 13:28:39.000000000 +0100
+++ b/drivers/cpufreq/cpufreq_ondemand.c	2005-12-02 13:25:31.000000000 +0100
@@ -41,8 +41,9 @@
  * The polling frequency of this governor depends on the capability of 
  * the processor. Default polling frequency is 1000 times the transition
  * latency of the processor. The governor will work on any processor with 
- * transition latency <= 10mS, using appropriate sampling 
- * rate.
+ * transition latency <= 10mS, using appropriate sampling interval.
+ * The "sampling_rate" used is actually a sampling interval. This means that
+ * CPU speed is adjusted more often if this number is lower.
  * For CPUs with transition latency > 10mS (mostly drivers with CPUFREQ_ETERNAL)
  * this governor will not work.
  * All times here are in uS.
@@ -256,9 +257,9 @@
 
 	policy = this_dbs_info->cur_policy;
 	/* 
-	 * Every sampling_rate, we check, if current idle time is less
+	 * Every sampling_rate uS, we check, if current idle time is less
 	 * than 20% (default), then we try to increase frequency
-	 * Every sampling_rate*sampling_down_factor, we look for a the lowest
+	 * Every sampling_rate*sampling_down_factor uS, we look for a the lowest
 	 * frequency which can sustain the load while keeping idle time over
 	 * 30%. If such a frequency exist, we try to decrease to this frequency.
 	 *
