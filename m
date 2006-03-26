From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: [PATCH 004/007] cpufreq_conservative: alternative initialise
	approach
Date: Sun, 26 Mar 2006 11:56:16 +0200
Message-ID: <20060326095616.GE17358@dominikbrodowski.de>
References: <20060326095338.GA17358@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060326095338.GA17358@dominikbrodowski.de>
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
Content-Transfer-Encoding: 7bit
To: davej@redhat.com, cpufreq@lists.linux.org.uk

From: Alexander Clouter <alex@digriz.org.uk>

Venki, author of cpufreq_ondemand, came up with a neater way to remove the
initialiser code from the main loop of my code and out to the point when the
governor is actually initialised.

Not only does it look but it also feels cleaner, plus its simpler to
understand.  It also saves a bunch of pointless conditional statements in the
main loop.

Signed-off-by: Alexander Clouter <alex-kernel@digriz.org.uk>
Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

---

 drivers/cpufreq/cpufreq_conservative.c |   55 ++++++++++----------------------
 1 files changed, 18 insertions(+), 37 deletions(-)

a159b82770ab84e1b5e0306fa65e158188492b16
diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
index 7498f25..a152d2c 100644
--- a/drivers/cpufreq/cpufreq_conservative.c
+++ b/drivers/cpufreq/cpufreq_conservative.c
@@ -65,6 +65,8 @@ struct cpu_dbs_info_s {
 	unsigned int 		prev_cpu_idle_up;
 	unsigned int 		prev_cpu_idle_down;
 	unsigned int 		enable;
+	unsigned int		down_skip;
+	unsigned int		requested_freq;
 };
 static DEFINE_PER_CPU(struct cpu_dbs_info_s, cpu_dbs_info);
 
@@ -297,35 +299,12 @@ static void dbs_check_cpu(int cpu)
 	unsigned int tmp_idle_ticks, total_idle_ticks;
 	unsigned int freq_step;
 	unsigned int freq_down_sampling_rate;
-	static unsigned short down_skip[NR_CPUS];
-	static unsigned int requested_freq[NR_CPUS];
-	static unsigned int init_flag = NR_CPUS;
 	struct cpu_dbs_info_s *this_dbs_info = &per_cpu(cpu_dbs_info, cpu);
 	struct cpufreq_policy *policy;
 
 	if (!this_dbs_info->enable)
 		return;
 
-	if ( init_flag != 0 ) {
-		for_each_cpu(init_flag) {
-			down_skip[init_flag] = 0;
-			/* I doubt a CPU exists with a freq of 0hz :) */
-			requested_freq[init_flag] = 0;
-		}
-		init_flag = 0;
-	}
-	
-	/*
-	 * If its a freshly initialised cpu we setup requested_freq.  This
-	 * check could be avoided if we did not care about a first time
-	 * stunted increase in CPU speed when there is a load.  I feel we
-	 * should be initialising this to something.  The removal of a CPU
-	 * is not a problem, after a short time the CPU should settle down
-	 * to a 'natural' frequency.
-	 */
-	if (requested_freq[cpu] == 0)
-		requested_freq[cpu] = this_dbs_info->cur_policy->cur;
-
 	policy = this_dbs_info->cur_policy;
 
 	/* 
@@ -360,12 +339,12 @@ static void dbs_check_cpu(int cpu)
 			usecs_to_jiffies(dbs_tuners_ins.sampling_rate);
 
 	if (idle_ticks < up_idle_ticks) {
-		down_skip[cpu] = 0;
+		this_dbs_info->down_skip = 0;
 		this_dbs_info->prev_cpu_idle_down =
 			this_dbs_info->prev_cpu_idle_up;
 
 		/* if we are already at full speed then break out early */
-		if (requested_freq[cpu] == policy->max)
+		if (this_dbs_info->requested_freq == policy->max)
 			return;
 		
 		freq_step = (dbs_tuners_ins.freq_step * policy->max) / 100;
@@ -374,18 +353,18 @@ static void dbs_check_cpu(int cpu)
 		if (unlikely(freq_step == 0))
 			freq_step = 5;
 		
-		requested_freq[cpu] += freq_step;
-		if (requested_freq[cpu] > policy->max)
-			requested_freq[cpu] = policy->max;
+		this_dbs_info->requested_freq += freq_step;
+		if (this_dbs_info->requested_freq > policy->max)
+			this_dbs_info->requested_freq = policy->max;
 
-		__cpufreq_driver_target(policy, requested_freq[cpu], 
+		__cpufreq_driver_target(policy, this_dbs_info->requested_freq,
 			CPUFREQ_RELATION_H);
 		return;
 	}
 
 	/* Check for frequency decrease */
-	down_skip[cpu]++;
-	if (down_skip[cpu] < dbs_tuners_ins.sampling_down_factor)
+	this_dbs_info->down_skip++;
+	if (this_dbs_info->down_skip < dbs_tuners_ins.sampling_down_factor)
 		return;
 
 	/* Check for frequency decrease */
@@ -399,7 +378,7 @@ static void dbs_check_cpu(int cpu)
 
 	/* Scale idle ticks by 100 and compare with up and down ticks */
 	idle_ticks *= 100;
-	down_skip[cpu] = 0;
+	this_dbs_info->down_skip = 0;
 
 	freq_down_sampling_rate = dbs_tuners_ins.sampling_rate *
 		dbs_tuners_ins.sampling_down_factor;
@@ -412,7 +391,7 @@ static void dbs_check_cpu(int cpu)
 		 * or if we 'cannot' reduce the speed as the user might want
 		 * freq_step to be zero
 		 */
-		if (requested_freq[cpu] == policy->min
+		if (this_dbs_info->requested_freq == policy->min
 				|| dbs_tuners_ins.freq_step == 0)
 			return;
 
@@ -422,11 +401,11 @@ static void dbs_check_cpu(int cpu)
 		if (unlikely(freq_step == 0))
 			freq_step = 5;
 
-		requested_freq[cpu] -= freq_step;
-		if (requested_freq[cpu] < policy->min)
-			requested_freq[cpu] = policy->min;
+		this_dbs_info->requested_freq -= freq_step;
+		if (this_dbs_info->requested_freq < policy->min)
+			this_dbs_info->requested_freq = policy->min;
 
-		__cpufreq_driver_target(policy, requested_freq[cpu],
+		__cpufreq_driver_target(policy, this_dbs_info->requested_freq,
 				CPUFREQ_RELATION_H);
 		return;
 	}
@@ -489,6 +468,8 @@ static int cpufreq_governor_dbs(struct c
 				= j_dbs_info->prev_cpu_idle_up;
 		}
 		this_dbs_info->enable = 1;
+		this_dbs_info->down_skip = 0;
+		this_dbs_info->requested_freq = policy->cur;
 		sysfs_create_group(&policy->kobj, &dbs_attr_group);
 		dbs_enable++;
 		/*
-- 
1.2.4
