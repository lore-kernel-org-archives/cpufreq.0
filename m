From: Eric Piel <Eric.Piel@tremplin-utc.net>
Subject: [PATCH] [1/3] ondemand governor clean-up
Date: Wed, 11 May 2005 14:23:36 +0200
Message-ID: <4281F948.3060507@tremplin-utc.net>
References: <200503140829.04750.lkml@kcore.org>	<42354400.7070500@tremplin-utc.net>	<20050511013334.GB8039@redhat.com>
	<20050511023448.GA25506@redhat.com>
	<4281F837.5070608@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040308080307060803080102"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <4281F837.5070608@tremplin-utc.net>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@zenii.linux.org.uk, linux@dominikbrodowski.net

This is a multi-part message in MIME format.
--------------040308080307060803080102
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Ondemand governor clean-up, it factorises the idle ticks measurement.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
--

--------------040308080307060803080102
Content-Type: text/x-patch;
	name="ondemand-cleanup-factorise-idle-measurement-2.6.11-20050511.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="ondemand-cleanup-factorise-idle-measurement-2.6.11-20050511.patch"

--- linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c.cpufreq-20050501	2005-05-11 13:03:21.000000000 +0200
+++ linux-2.6.11/drivers/cpufreq/cpufreq_ondemand.c	2005-05-11 13:19:55.000000000 +0200
@@ -222,7 +222,6 @@ static struct attribute_group dbs_attr_g
 static void dbs_check_cpu(int cpu)
 {
 	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int total_idle_ticks;
 	unsigned int freq_down_step;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
@@ -251,20 +250,11 @@ static void dbs_check_cpu(int cpu)
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
@@ -286,7 +276,7 @@ static void dbs_check_cpu(int cpu)
 		__cpufreq_driver_target(policy, policy->max, 
 			CPUFREQ_RELATION_H);
 		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+		this_dbs_info->prev_cpu_idle_down = this_dbs_info->prev_cpu_idle_up;
 		return;
 	}
 
@@ -295,19 +285,11 @@ static void dbs_check_cpu(int cpu)
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
@@ -329,7 +311,7 @@ static void dbs_check_cpu(int cpu)
 	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
 			usecs_to_jiffies(freq_down_sampling_rate);
 
-	if (idle_ticks > down_idle_ticks ) {
+	if (idle_ticks > down_idle_ticks) {
 		freq_down_step = (5 * policy->max) / 100;
 
 		/* max freq cannot be less than 100. But who knows.... */

--------------040308080307060803080102
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--------------040308080307060803080102--

