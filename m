From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] cpu freq groups (policy->cpus) in ondemand governor
Date: Tue, 26 Oct 2004 11:39:49 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041026113949.A20518@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@redhat.com
Cc: linux@dominikbrodowski.de, cpufreq@www.linux.org.uk


The following patch makes ondemand governor aware of policy->cpus.

policy->cpus mask lets multiple cpu use the same policy (useful where cpus 
share the frequency state), a recent change in cpufreq core.

Now ondemand governor looks at all cpus in policy->cpus and takes its 
frequency increase/decrease decisions based on most lightly loaded cpu in 
the group. This patch will not affect systems where policy->cpus contain
only one cpu.

Signed-off-by:: "Venkatesh Pallipadi" <venkatesh.pallipadi@intel.com>

--- linux-2.6.9-latest//drivers/cpufreq/cpufreq_ondemand.c.org	2004-10-22 16:26:29.000000000 -0700
+++ linux-2.6.9-latest//drivers/cpufreq/cpufreq_ondemand.c	2004-10-22 19:33:35.000000000 -0700
@@ -227,10 +227,14 @@ static void dbs_check_cpu(int cpu)
 	static int down_skip[NR_CPUS];
 	struct cpu_dbs_info_s *this_dbs_info;
 
+	struct cpufreq_policy *policy;
+	unsigned int j;
+
 	this_dbs_info = &per_cpu(cpu_dbs_info, cpu);
 	if (!this_dbs_info->enable)
 		return;
 
+	policy = this_dbs_info->cur_policy;
 	/* 
 	 * The default safe range is 20% to 80% 
 	 * Every sampling_rate, we check
@@ -244,12 +248,33 @@ static void dbs_check_cpu(int cpu)
 	 * Frequency reduction happens at minimum steps of 
 	 * 5% of max_frequency 
 	 */
+
 	/* Check for frequency increase */
 	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
 		kstat_cpu(cpu).cpustat.iowait;
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_up;
 	this_dbs_info->prev_cpu_idle_up = total_idle_ticks;
+	
+
+	for_each_cpu_mask(j, policy->cpus) {
+		unsigned int tmp_idle_ticks;
+		struct cpu_dbs_info_s *j_dbs_info;
+
+		if (j == cpu)
+			continue;
+
+		j_dbs_info = &per_cpu(cpu_dbs_info, j);
+		/* Check for frequency increase */
+		total_idle_ticks = kstat_cpu(j).cpustat.idle +
+			kstat_cpu(j).cpustat.iowait;
+		tmp_idle_ticks = total_idle_ticks -
+			j_dbs_info->prev_cpu_idle_up;
+		j_dbs_info->prev_cpu_idle_up = total_idle_ticks;
+
+		if (tmp_idle_ticks < idle_ticks)
+			idle_ticks = tmp_idle_ticks;
+	}
 
 	/* Scale idle ticks by 100 and compare with up and down ticks */
 	idle_ticks *= 100;
@@ -257,8 +282,7 @@ static void dbs_check_cpu(int cpu)
 			sampling_rate_in_HZ(dbs_tuners_ins.sampling_rate);
 
 	if (idle_ticks < up_idle_ticks) {
-		__cpufreq_driver_target(this_dbs_info->cur_policy,
-			this_dbs_info->cur_policy->max, 
+		__cpufreq_driver_target(policy, policy->max, 
 			CPUFREQ_RELATION_H);
 		down_skip[cpu] = 0;
 		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
@@ -270,12 +294,34 @@ static void dbs_check_cpu(int cpu)
 	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
 		return;
 
+	total_idle_ticks = kstat_cpu(cpu).cpustat.idle +
+		kstat_cpu(cpu).cpustat.iowait;
 	idle_ticks = total_idle_ticks -
 		this_dbs_info->prev_cpu_idle_down;
+	this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+
+	for_each_cpu_mask(j, policy->cpus) {
+		unsigned int tmp_idle_ticks;
+		struct cpu_dbs_info_s *j_dbs_info;
+
+		if (j == cpu)
+			continue;
+
+		j_dbs_info = &per_cpu(cpu_dbs_info, j);
+		/* Check for frequency increase */
+		total_idle_ticks = kstat_cpu(j).cpustat.idle +
+			kstat_cpu(j).cpustat.iowait;
+		tmp_idle_ticks = total_idle_ticks -
+			j_dbs_info->prev_cpu_idle_down;
+		j_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+
+		if (tmp_idle_ticks < idle_ticks)
+			idle_ticks = tmp_idle_ticks;
+	}
+
 	/* Scale idle ticks by 100 and compare with up and down ticks */
 	idle_ticks *= 100;
 	down_skip[cpu] = 0;
-	this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
 
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
@@ -283,14 +329,14 @@ static void dbs_check_cpu(int cpu)
 			sampling_rate_in_HZ(freq_down_sampling_rate);
 
 	if (idle_ticks > down_idle_ticks ) {
-		freq_down_step = (5 * this_dbs_info->cur_policy->max) / 100;
+		freq_down_step = (5 * policy->max) / 100;
 
 		/* max freq cannot be less than 100. But who knows.... */
 		if (unlikely(freq_down_step == 0))
 			freq_down_step = 5;
 
-		__cpufreq_driver_target(this_dbs_info->cur_policy,
-			this_dbs_info->cur_policy->cur - freq_down_step, 
+		__cpufreq_driver_target(policy,
+			policy->cur - freq_down_step, 
 			CPUFREQ_RELATION_H);
 		return;
 	}
@@ -326,6 +372,7 @@ static int cpufreq_governor_dbs(struct c
 {
 	unsigned int cpu = policy->cpu;
 	struct cpu_dbs_info_s *this_dbs_info;
+	unsigned int j;
 
 	this_dbs_info = &per_cpu(cpu_dbs_info, cpu);
 
@@ -342,14 +389,18 @@ static int cpufreq_governor_dbs(struct c
 			break;
 		 
 		down(&dbs_sem);
-		this_dbs_info->cur_policy = policy;
+		for_each_cpu_mask(j, policy->cpus) {
+			struct cpu_dbs_info_s *j_dbs_info;
+			j_dbs_info = &per_cpu(cpu_dbs_info, j);
+			j_dbs_info->cur_policy = policy;
 		
-		this_dbs_info->prev_cpu_idle_up = 
-				kstat_cpu(cpu).cpustat.idle +
-				kstat_cpu(cpu).cpustat.iowait;
-		this_dbs_info->prev_cpu_idle_down = 
-				kstat_cpu(cpu).cpustat.idle +
-				kstat_cpu(cpu).cpustat.iowait;
+			j_dbs_info->prev_cpu_idle_up = 
+				kstat_cpu(j).cpustat.idle +
+				kstat_cpu(j).cpustat.iowait;
+			j_dbs_info->prev_cpu_idle_down = 
+				kstat_cpu(j).cpustat.idle +
+				kstat_cpu(j).cpustat.iowait;
+		}
 		this_dbs_info->enable = 1;
 		sysfs_create_group(&policy->kobj, &dbs_attr_group);
 		dbs_enable++;
