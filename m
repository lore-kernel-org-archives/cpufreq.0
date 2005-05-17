From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] ondemand,conservative minor bug-fix and cleanup
Date: Mon, 16 May 2005 17:15:36 -0700
Message-ID: <20050516171535.A15038@unix-os.sc.intel.com>
References: <200503140829.04750.lkml@kcore.org>
	<42354400.7070500@tremplin-utc.net>
	<20050511013334.GB8039@redhat.com>
	<20050511023448.GA25506@redhat.com>
	<4281F837.5070608@tremplin-utc.net>
	<4283E3B3.3070501@tremplin-utc.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4283E3B3.3070501@tremplin-utc.net>;
	from Eric.Piel@tremplin-utc.net on Fri, May 13, 2005 at
	01:16:03AM +0200
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
Content-Transfer-Encoding: 7bit
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: Dave Jones <davej@redhat.com>, cpufreq@zenii.linux.org.uk, Alexander Clouter <alex-kernel@digriz.org.uk>, linux@dominikbrodowski.net, Rajesh Shah <rajesh.shah@intel.com>


> Hi Dave,
> 
> I've just noticed that while I was rediffiing the patches, you had 
> integrated the 3 patches of Alexander for the ondemand governor... which 
> conflict with mine!
> 

> Please, let me know what you are planning to do. If you agree I can 
> simply send you my 3 patches against the 20050511 tree minus CPUFREQ-18 
> and CPUFREQ-19. IMHO, this would put the ondemand governor in the best 
> shape.
> 
> Eric
> 

Looks like all the Alexander's changes have made it to the mm (2.6.12-rc4-mm2)
tree and Eric's changes hasn't.

Attached patch fixes some minor issues with Alexander's patch and related 
cleanup in both ondemand and conservative governor.

I will follow this up with Eric's patches rebased with latest base kernel in
a day or two.

Please Apply.

Thanks,
Venki



With addition of ignore-nice, there were some minor bugs in ondemand and 
conservative governor. Attached patch fixes it and also does some minor cleanup
related to idle time calculation.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_conservative.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_conservative.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_conservative.c	2005-05-17 05:50:03.659777464 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_conservative.c	2005-05-17 07:54:13.463235192 -0700
@@ -89,6 +89,15 @@ static struct dbs_tuners dbs_tuners_ins 
 	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
 };
 
+static inline unsigned int get_cpu_idle_time(unsigned int cpu)
+{
+	return	kstat_cpu(cpu).cpustat.idle +
+		kstat_cpu(cpu).cpustat.iowait +
+		( !dbs_tuners_ins.ignore_nice ? 
+		  kstat_cpu(cpu).cpustat.nice :
+		  0);
+}
+
 /************************** sysfs interface ************************/
 static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
 {
@@ -221,16 +230,10 @@ static ssize_t store_ignore_nice(struct 
 	dbs_tuners_ins.ignore_nice = input;
 
 	/* we need to re-evaluate prev_cpu_idle_up and prev_cpu_idle_down */
-	for_each_cpu_mask(j, policy->cpus) {
+	for_each_online_cpu(j) {
 		struct cpu_dbs_info_s *j_dbs_info;
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
-		j_dbs_info->cur_policy = policy;
-
-		j_dbs_info->prev_cpu_idle_up =
-			kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait +
-			( !dbs_tuners_ins.ignore_nice
-			  ? kstat_cpu(j).cpustat.nice : 0 );
+		j_dbs_info->prev_cpu_idle_up = get_cpu_idle_time(j);
 		j_dbs_info->prev_cpu_idle_down = j_dbs_info->prev_cpu_idle_up;
 	}
 	up(&dbs_sem);
@@ -335,11 +338,7 @@ static void dbs_check_cpu(int cpu)
 	 */
 
 	/* Check for frequency increase */
-	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
-	  /* consider 'nice' tasks as 'idle' time too if required */
-	  if (dbs_tuners_ins.ignore_nice == 0)
-		total_idle_ticks += kstat_cpu(cpu).cpustat.nice;
+	total_idle_ticks = get_cpu_idle_time(cpu);
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_up;
 	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
@@ -354,11 +353,7 @@ static void dbs_check_cpu(int cpu)
 
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
-		total_idle_ticks = kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait;
-		  /* consider 'nice' too? */
-		  if (dbs_tuners_ins.ignore_nice == 0)
-			   total_idle_ticks += kstat_cpu(j).cpustat.nice;
+		total_idle_ticks = get_cpu_idle_time(j);
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_up;
 		j_dbs_info->prev_cpu_idle_up = total_idle_ticks;
@@ -373,6 +368,8 @@ static void dbs_check_cpu(int cpu)
 		usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
 
 	if (idle_ticks < up_idle_ticks) {
+		down_skip[cpu] = 0;
+		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
 		/* if we are already at full speed then break out early */
 		if (requested_freq[cpu] == policy->max)
 			return;
@@ -389,8 +386,6 @@ static void dbs_check_cpu(int cpu)
 
 		__cpufreq_driver_target(policy, requested_freq[cpu], 
 			CPUFREQ_RELATION_H);
-		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
 		return;
 	}
 
@@ -399,11 +394,7 @@ static void dbs_check_cpu(int cpu)
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
 
-	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
-	  /* consider 'nice' too? */
-	  if (dbs_tuners_ins.ignore_nice == 0)
-		  total_idle_ticks += kstat_cpu(cpu).cpustat.nice;
+	total_idle_ticks = this_dbs_info->prev_cpu_idle_up;
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_down;
 	this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -417,11 +408,7 @@ static void dbs_check_cpu(int cpu)
 
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
-		total_idle_ticks = kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait;
-		  /* consider 'nice' too? */
-		  if (dbs_tuners_ins.ignore_nice == 0)
-			total_idle_ticks += kstat_cpu(j).cpustat.nice;
+		total_idle_ticks = j_dbs_info->prev_cpu_idle_up;
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_down;
 		j_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -516,11 +503,7 @@ static int cpufreq_governor_dbs(struct c
 			j_dbs_info = &per_cpu(cpu_dbs_info, j);
 			j_dbs_info->cur_policy = policy;
 		
-			j_dbs_info->prev_cpu_idle_up = 
-				kstat_cpu(j).cpustat.idle +
-				kstat_cpu(j).cpustat.iowait +
-				( !dbs_tuners_ins.ignore_nice
-				  ? kstat_cpu(j).cpustat.nice : 0 );
+			j_dbs_info->prev_cpu_idle_up = get_cpu_idle_time(j);
 			j_dbs_info->prev_cpu_idle_down
 				= j_dbs_info->prev_cpu_idle_up;
 		}
diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c	2005-05-17 07:19:56.154993584 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c	2005-05-17 07:54:10.257722504 -0700
@@ -88,6 +88,15 @@ static struct dbs_tuners dbs_tuners_ins 
 	.sampling_down_factor 	= DEF_SAMPLING_DOWN_FACTOR,
 };
 
+static inline unsigned int get_cpu_idle_time(unsigned int cpu)
+{
+	return	kstat_cpu(cpu).cpustat.idle +
+		kstat_cpu(cpu).cpustat.iowait +
+		( !dbs_tuners_ins.ignore_nice ? 
+		  kstat_cpu(cpu).cpustat.nice :
+		  0);
+}
+
 /************************** sysfs interface ************************/
 static ssize_t show_sampling_rate_max(struct cpufreq_policy *policy, char *buf)
 {
@@ -220,16 +229,10 @@ static ssize_t store_ignore_nice(struct 
 	dbs_tuners_ins.ignore_nice = input;
 
 	/* we need to re-evaluate prev_cpu_idle_up and prev_cpu_idle_down */
-	for_each_cpu_mask(j, policy->cpus) {
+	for_each_online_cpu(j) {
 		struct cpu_dbs_info_s *j_dbs_info;
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
-		j_dbs_info->cur_policy = policy;
-
-		j_dbs_info->prev_cpu_idle_up =
-			kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait +
-			( !dbs_tuners_ins.ignore_nice
-			  ? kstat_cpu(j).cpustat.nice : 0 );
+		j_dbs_info->prev_cpu_idle_up = get_cpu_idle_time(j);
 		j_dbs_info->prev_cpu_idle_down = j_dbs_info->prev_cpu_idle_up;
 	}
 	up(&dbs_sem);
@@ -322,15 +325,10 @@ static void dbs_check_cpu(int cpu)
 	 */
 
 	/* Check for frequency increase */
-	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
-	  /* consider 'nice' tasks as 'idle' time too if required */
-	  if (dbs_tuners_ins.ignore_nice == 0)
-		total_idle_ticks += kstat_cpu(cpu).cpustat.nice;
+	total_idle_ticks = get_cpu_idle_time(cpu);
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_up;
 	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
-	
 
 	for_each_cpu_mask(j, policy->cpus) {
 		unsigned int tmp_idle_ticks;
@@ -341,11 +339,7 @@ static void dbs_check_cpu(int cpu)
 
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
 		/* Check for frequency increase */
-		total_idle_ticks = kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait;
-		  /* consider 'nice' too? */
-		  if (dbs_tuners_ins.ignore_nice == 0)
-			   total_idle_ticks += kstat_cpu(j).cpustat.nice;
+		total_idle_ticks = get_cpu_idle_time(j);
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_up;
 		j_dbs_info->prev_cpu_idle_up = total_idle_ticks;
@@ -360,14 +354,14 @@ static void dbs_check_cpu(int cpu)
 			usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
 
 	if (idle_ticks < up_idle_ticks) {
+		down_skip[cpu] = 0;
+		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
 		/* if we are already at full speed then break out early */
 		if (policy->cur == policy->max)
 			return;
 		
 		__cpufreq_driver_target(policy, policy->max, 
 			CPUFREQ_RELATION_H);
-		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
 		return;
 	}
 
@@ -376,11 +370,7 @@ static void dbs_check_cpu(int cpu)
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
 
-	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
-		kstat_cpu(cpu).cpustat.iowait;
-	  /* consider 'nice' too? */
-	  if (dbs_tuners_ins.ignore_nice == 0)
-		  total_idle_ticks += kstat_cpu(cpu).cpustat.nice;
+	total_idle_ticks = this_dbs_info->prev_cpu_idle_up;
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_down;
 	this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -393,12 +383,8 @@ static void dbs_check_cpu(int cpu)
 			continue;
 
 		j_dbs_info = &per_cpu(cpu_dbs_info, j);
-		/* Check for frequency increase */
-		total_idle_ticks = kstat_cpu(j).cpustat.idle +
-			kstat_cpu(j).cpustat.iowait;
-		  /* consider 'nice' too? */
-		  if (dbs_tuners_ins.ignore_nice == 0)
-			total_idle_ticks += kstat_cpu(j).cpustat.nice;
+		/* Check for frequency decrease */
+		total_idle_ticks = j_dbs_info->prev_cpu_idle_up;
 		tmp_idle_ticks = total_idle_ticks -
 			j_dbs_info->prev_cpu_idle_down;
 		j_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -414,7 +400,7 @@ static void dbs_check_cpu(int cpu)
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
 	down_idle_ticks = (100 - dbs_tuners_ins.down_threshold) *
-			usecs_to_jiffies(freq_down_sampling_rate);
+		usecs_to_jiffies(freq_down_sampling_rate);
 
 	if (idle_ticks > down_idle_ticks ) {
 		/* if we are already at the lowest speed then break out early
@@ -488,11 +474,7 @@ static int cpufreq_governor_dbs(struct c
 			j_dbs_info = &per_cpu(cpu_dbs_info, j);
 			j_dbs_info->cur_policy = policy;
 		
-			j_dbs_info->prev_cpu_idle_up = 
-				kstat_cpu(j).cpustat.idle +
-				kstat_cpu(j).cpustat.iowait +
-				( !dbs_tuners_ins.ignore_nice
-				  ? kstat_cpu(j).cpustat.nice : 0 );
+			j_dbs_info->prev_cpu_idle_up = get_cpu_idle_time(j);
 			j_dbs_info->prev_cpu_idle_down
 				= j_dbs_info->prev_cpu_idle_up;
 		}
