From: venkatesh.pallipadi@intel.com
Subject: [patch 4/6] cpufreq_ondemand: Parameterize down differential
Date: Thu, 17 Jul 2008 13:55:58 -0700
Message-ID: <20080717205616.373739000@intel.com>
References: <20080717205554.214645000@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline; filename=add_down_differential.patch
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
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

Use a parameter for down differential, instead of hardcoded 10%. Follow-on
patch changes the down-differential dynamically, based on whether
we are using idle micro-accounting or not.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

---
 drivers/cpufreq/cpufreq_ondemand.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.orig/drivers/cpufreq/cpufreq_ondemand.c	2008-07-17 13:12:26.000000000 -0700
+++ linux-2.6/drivers/cpufreq/cpufreq_ondemand.c	2008-07-17 13:17:06.000000000 -0700
@@ -24,6 +24,7 @@
  * It helps to keep variable names smaller, simpler
  */
 
+#define DEF_FREQUENCY_DOWN_DIFFERENTIAL		(10)
 #define DEF_FREQUENCY_UP_THRESHOLD		(80)
 #define MIN_FREQUENCY_UP_THRESHOLD		(11)
 #define MAX_FREQUENCY_UP_THRESHOLD		(100)
@@ -86,10 +87,12 @@ static struct workqueue_struct	*kondeman
 static struct dbs_tuners {
 	unsigned int sampling_rate;
 	unsigned int up_threshold;
+	unsigned int down_differential;
 	unsigned int ignore_nice;
 	unsigned int powersave_bias;
 } dbs_tuners_ins = {
 	.up_threshold = DEF_FREQUENCY_UP_THRESHOLD,
+	.down_differential = DEF_FREQUENCY_DOWN_DIFFERENTIAL,
 	.ignore_nice = 0,
 	.powersave_bias = 0,
 };
@@ -424,9 +427,13 @@ static void dbs_check_cpu(struct cpu_dbs
 	 * can support the current CPU usage without triggering the up
 	 * policy. To be safe, we focus 10 points under the threshold.
 	 */
-	if (max_load_freq < (dbs_tuners_ins.up_threshold - 10) * policy->cur) {
+	if (max_load_freq <
+	    (dbs_tuners_ins.up_threshold - dbs_tuners_ins.down_differential) *
+	     policy->cur) {
 		unsigned int freq_next;
-		freq_next = max_load_freq / (dbs_tuners_ins.up_threshold - 10);
+		freq_next = max_load_freq /
+				(dbs_tuners_ins.up_threshold -
+				 dbs_tuners_ins.down_differential);
 
 		if (!dbs_tuners_ins.powersave_bias) {
 			__cpufreq_driver_target(policy, freq_next,

-- 
