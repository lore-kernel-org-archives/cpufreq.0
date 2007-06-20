From: Venki Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] ondemand: fix tickless accounting and software coordination
	bug
Date: Wed, 20 Jun 2007 14:26:24 -0700
Message-ID: <20070620212624.GC2109@linux-os.sc.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>


With tickless kernel and software coordination os P-states, ondemand
can look at wrong idle statistics. This can happen when ondemand sampling
is happening on CPU 0 and due to software coordination sampling also looks at
utilization of CPU 1. If CPU 1 is in tickless state at that moment, its idle
statistics will not be uptodate and CPU 0 thinks CPU 1 is idle for less
amount of time than it actually is.

This can be resolved by looking at all the busy times of CPUs, which is
accurate, even with tickless, and use that to determine idle time in a
round about way (total time - busy time).

Thanks to Arjan for originally reporting the ondemand bug on
Lenovo T61.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

Index: linux-2.6.22-rc-mm/drivers/cpufreq/cpufreq_ondemand.c
===================================================================
--- linux-2.6.22-rc-mm.orig/drivers/cpufreq/cpufreq_ondemand.c
+++ linux-2.6.22-rc-mm/drivers/cpufreq/cpufreq_ondemand.c
@@ -96,15 +96,25 @@ static struct dbs_tuners {
 
 static inline cputime64_t get_cpu_idle_time(unsigned int cpu)
 {
-	cputime64_t retval;
+	cputime64_t idle_time;
+	cputime64_t cur_jiffies;
+	cputime64_t busy_time;
 
-	retval = cputime64_add(kstat_cpu(cpu).cpustat.idle,
-			kstat_cpu(cpu).cpustat.iowait);
+	cur_jiffies = jiffies64_to_cputime64(get_jiffies_64());
+	busy_time = cputime64_add(kstat_cpu(cpu).cpustat.user,
+			kstat_cpu(cpu).cpustat.system);
 
-	if (dbs_tuners_ins.ignore_nice)
-		retval = cputime64_add(retval, kstat_cpu(cpu).cpustat.nice);
+	busy_time = cputime64_add(busy_time, kstat_cpu(cpu).cpustat.irq);
+	busy_time = cputime64_add(busy_time, kstat_cpu(cpu).cpustat.softirq);
+	busy_time = cputime64_add(busy_time, kstat_cpu(cpu).cpustat.steal);
 
-	return retval;
+	if (!dbs_tuners_ins.ignore_nice) {
+		busy_time = cputime64_add(busy_time,
+				kstat_cpu(cpu).cpustat.nice);
+	}
+
+	idle_time = cputime64_sub(cur_jiffies, busy_time);
+	return idle_time;
 }
 
 /*
@@ -339,7 +349,8 @@ static void dbs_check_cpu(struct cpu_dbs
 	cur_jiffies = jiffies64_to_cputime64(get_jiffies_64());
 	total_ticks = (unsigned int) cputime64_sub(cur_jiffies,
 			this_dbs_info->prev_cpu_wall);
-	this_dbs_info->prev_cpu_wall = cur_jiffies;
+	this_dbs_info->prev_cpu_wall = get_jiffies_64();
+
 	if (!total_ticks)
 		return;
 	/*
