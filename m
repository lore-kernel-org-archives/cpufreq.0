From: Venki Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] ondemand: add a check to avoid negative load calculation
Date: Wed, 20 Jun 2007 14:24:52 -0700
Message-ID: <20070620212451.GB2109@linux-os.sc.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>



Due to rounding and inexact jiffy accounting, idle_ticks can sometimes
be higher than total_ticks. Make sure those cases are handled as
zero load case.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.22-rc-mm/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.22-rc-mm.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.22-rc-mm/drivers/cpufreq/cpufreq_ondemand.c
@@ -325,7 +325,7 @@ static struct attribute_group dbs_attr_g
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
 	unsigned int idle_ticks, total_ticks;
-	unsigned int load;
+	unsigned int load = 0;
 	cputime64_t cur_jiffies;
 
 	struct cpufreq_policy *policy;
@@ -370,7 +370,8 @@ static void dbs_check_cpu(struct cpu_dbs
 		if (tmp_idle_ticks < idle_ticks)
 			idle_ticks = tmp_idle_ticks;
 	}
-	load = (100 * (total_ticks - idle_ticks)) / total_ticks;
+	if (likely(total_ticks > idle_ticks))
+		load = (100 * (total_ticks - idle_ticks)) / total_ticks;
 
 	/* Check for frequency increase */
 	if (load > dbs_tuners_ins.up_threshold) {
