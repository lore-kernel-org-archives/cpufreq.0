From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] [2/5] ondemand,
	conservative governor store the idle ticks for all cpus
Date: Wed, 18 May 2005 13:35:54 -0700
Message-ID: <20050518133554.C22282@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Alexander Clouter <alex-kernel@digriz.org.uk>, cpufreq@lists.linux.org.uk, Eric Piel <Eric.Piel@tremplin-utc.net>, linux@dominikbrodowski.net, Rajesh Shah <rajesh.shah@intel.com>


[PATCH] [2/5] ondemand,conservative governor store the idle ticks for all cpus

Ondemand, conservative governor did not store prev_cpu_idle_up into 
prev_cpu_idle_down for other CPUs than the current CPU.

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_conservative.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_conservative.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_conservative.c	2005-05-18 05:09:01.948218016 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_conservative.c	2005-05-18 05:05:24.522271784 -0700
@@ -369,7 +369,13 @@ static void dbs_check_cpu(int cpu)
 
 	if (idle_ticks < up_idle_ticks) {
 		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+		for_each_cpu_mask(j, policy->cpus) {
+			struct cpu_dbs_info_s *j_dbs_info;
+
+			j_dbs_info = &per_cpu(cpu_dbs_info, j);
+			j_dbs_info->prev_cpu_idle_down = 
+					j_dbs_info->prev_cpu_idle_up;
+		}
 		/* if we are already at full speed then break out early */
 		if (requested_freq[cpu] == policy->max)
 			return;
diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_ondemand.c	2005-05-18 05:09:01.949217864 -0700
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_ondemand.c	2005-05-18 05:03:51.773371760 -0700
@@ -355,7 +355,13 @@ static void dbs_check_cpu(int cpu)
 
 	if (idle_ticks < up_idle_ticks) {
 		down_skip[cpu] = 0;
-		this_dbs_info->prev_cpu_idle_down = total_idle_ticks;
+		for_each_cpu_mask(j, policy->cpus) {
+			struct cpu_dbs_info_s *j_dbs_info;
+
+			j_dbs_info = &per_cpu(cpu_dbs_info, j);
+			j_dbs_info->prev_cpu_idle_down = 
+					j_dbs_info->prev_cpu_idle_up;
+		}
 		/* if we are already at full speed then break out early */
 		if (policy->cur == policy->max)
 			return;
