From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH][1/2] ondemand governor cleanup
Date: Sun, 06 Mar 2005 19:41:33 +0100
Message-ID: <422B4EDD.206@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080501000309000800050504"
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@zenii.linux.org.uk

This is a multi-part message in MIME format.
--------------080501000309000800050504
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Here is a cleanup patch for the ondemand governor (as found in 2.6.11). 
In dbs_check_cpu(), first the idle ticks of the current CPU are measured 
and then the idle ticks of all the associated CPUs. This patch 
factorises the code: all the idle ticks are measured in the same loop.

Note: this was tested only on a computer with one CPU, I don't own any 
hardware with several CPUs which stick to the same frequency.

Eric

--
Ondemand governor cleanup, it factorises the idle ticks measurement.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
--

--------------080501000309000800050504
Content-Type: text/x-patch;
	name="ondemand-cleanup-factorise-idle-measurement-2.6.11.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-cleanup-factorise-idle-measurement-2.6.11.patch"

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.bak	2005-02-06 23:35:41.000000000 +0100
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-03-06 19:04:12.000000000 +0100
@@ -223,7 +223,6 @@ static struct attribute_group dbs_attr_g
 static void dbs_check_cpu(int cpu)
 {
 	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int total_idle_ticks;
 	unsigned int freq_down_step;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
@@ -252,20 +251,11 @@ static void dbs_check_cpu(int cpu)
 	 */
 
 	/* Check for frequency increase */
-	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
-	idle_ticks = total_idle_ticks -
-		this_dbs_info->prev_cpu_idle_up;
-	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
-	
-
+	idle_ticks = UINT_MAX;
 	for_each_cpu_mask(j, policy->cpus) {
-		unsigned int tmp_idle_ticks;
+		unsigned int tmp_idle_ticks, total_idle_ticks;
 		struct cpu_dbs_info_s *j_dbs_info;
 
-		if (j == cpu)
-			continue;
-
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
 		total_idle_ticks = kstat_cpu(j).cpustat.idle +
@@ -287,7 +277,7 @@ static void dbs_check_cpu(int cpu)
 		__cpufreq_driver_target(policy, policy->max, 
 			CPUFREQ_RELATION_H);
 		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+		this_dbs_info->prev_cpu_idle_down = this_dbs_info->prev_cpu_idle_up;
 		return;
 	}
 
@@ -296,19 +286,11 @@ static void dbs_check_cpu(int cpu)
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
 
-	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
-	idle_ticks = total_idle_ticks -
-		this_dbs_info->prev_cpu_idle_down;
-	this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
-
+	idle_ticks = UINT_MAX;
 	for_each_cpu_mask(j, policy->cpus) {
-		unsigned int tmp_idle_ticks;
+		unsigned int tmp_idle_ticks, total_idle_ticks;
 		struct cpu_dbs_info_s *j_dbs_info;
 
-		if (j == cpu)
-			continue;
-
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
 		total_idle_ticks = kstat_cpu(j).cpustat.idle +
@@ -330,7 +312,7 @@ static void dbs_check_cpu(int cpu)
 	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
 			sampling_rate_in_HZ(freq_down_sampling_rate);
 
-	if (idle_ticks > down_idle_ticks ) {
+	if (idle_ticks > down_idle_ticks) {
 		freq_down_step = (5 * policy->max) / 100;
 
 		/* max freq cannot be less than 100. But who knows.... */

--------------080501000309000800050504
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------080501000309000800050504--

