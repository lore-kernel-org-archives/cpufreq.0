From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] [3/5] ondemand,conservative governor idle_tick clean-up
Date: Wed, 18 May 2005 13:37:09 -0700
Message-ID: <20050518133709.D22282@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Alexander Clouter <alex-kernel@digriz.org.uk>, cpufreq@lists.linux.org.uk, Eric Piel <Eric.Piel@tremplin-utc.net>, linux@dominikbrodowski.net, Rajesh Shah <rajesh.shah@intel.com>


[PATCH] [3/5] ondemand,conservative governor idle_tick clean-up

Ondemand and conservative governor clean-up, it factorises the idle ticks 
measurement.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_conservative.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_conservative.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_conservative.c	2005-05-18 05:50:05.202746408 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_conservative.c	2005-05-18 07:43:42.756320728 -0700
@@ -297,7 +297,6 @@ static struct attribute_group dbs_attr_g
 static void dbs_check_cpu(int cpu)
 {
 	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int total_idle_ticks;
 	unsigned int freq_step;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
@@ -338,19 +337,12 @@ static void dbs_check_cpu(int cpu)
 	 */
 
 	/* Check for frequency increase */
-	total_idle_ticks = get_cpu_idle_time(cpu);
-	idle_ticks = total_idle_ticks -
-		this_dbs_info->prev_cpu_idle_up;
-	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
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
 		total_idle_ticks = get_cpu_idle_time(j);
@@ -400,20 +392,12 @@ static void dbs_check_cpu(int cpu)
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
 
-	total_idle_ticks = this_dbs_info->prev_cpu_idle_up;
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
-		/* Check for frequency increase */
 		total_idle_ticks = j_dbs_info->prev_cpu_idle_up;
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_down;
@@ -432,7 +416,7 @@ static void dbs_check_cpu(int cpu)
 	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
 			usecs_to_jiffies(freq_down_sampling_rate);
 
-	if (idle_ticks > down_idle_ticks ) {
+	if (idle_ticks > down_idle_ticks) {
 		/* if we are already at the lowest speed then break out early
 		 * or if we 'cannot' reduce the speed as the user might want
 		 * freq_step to be zero */
diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c	2005-05-18 05:50:05.203746256 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c	2005-05-18 07:35:08.879441888 -0700
@@ -296,7 +296,6 @@ static struct attribute_group dbs_attr_g
 static void dbs_check_cpu(int cpu)
 {
 	unsigned int idle_ticks, up_idle_ticks, down_idle_ticks;
-	unsigned int total_idle_ticks;
 	unsigned int freq_down_step;
 	unsigned int freq_down_sampling_rate;
 	static int down_skip[NR_CPUS];
@@ -325,20 +324,12 @@ static void dbs_check_cpu(int cpu)
 	 */
 
 	/* Check for frequency increase */
-	total_idle_ticks = get_cpu_idle_time(cpu);
-	idle_ticks = total_idle_ticks -
-		this_dbs_info->prev_cpu_idle_up;
-	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
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
-		/* Check for frequency increase */
 		total_idle_ticks = get_cpu_idle_time(j);
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_up;
@@ -376,18 +367,11 @@ static void dbs_check_cpu(int cpu)
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
 
-	total_idle_ticks = this_dbs_info->prev_cpu_idle_up;
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
 		/* Check for frequency decrease */
 		total_idle_ticks = j_dbs_info->prev_cpu_idle_up;
@@ -408,7 +392,7 @@ static void dbs_check_cpu(int cpu)
 	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
 		usecs_to_jiffies(freq_down_sampling_rate);
 
-	if (idle_ticks > down_idle_ticks ) {
+	if (idle_ticks > down_idle_ticks) {
 		/* if we are already at the lowest speed then break out early
 		 * or if we 'cannot' reduce the speed as the user might want
 		 * freq_step to be zero */
