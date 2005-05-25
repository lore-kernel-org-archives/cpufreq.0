From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] cpufreq-stats driver updates
Date: Wed, 25 May 2005 14:46:50 -0700
Message-ID: <20050525144650.B9092@unix-os.sc.intel.com>
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
Cc: cpufreq@lists.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.net>, Rajesh Shah <rajesh.shah@intel.com>


Attached patch has two minor updates for cpufreq_stats driver.

Please apply.
Thanks,
Venki

Changes to the cpufreq stats driver:
* Changes the way P-state transition table looks in /sysfs providing more 
  clear output
* Changes the time unit in the output from HZ to clock_t

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>


diff -purN linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_stats.c linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_stats.c
--- linux-2.6.12-rc4-mm2/drivers/cpufreq/cpufreq_stats.c	2005-03-01 23:37:54.000000000 -0800
+++ linux-2.6.12-rc4-mm2-ondemand/drivers/cpufreq/cpufreq_stats.c	2005-05-19 01:59:27.006675488 -0700
@@ -19,6 +19,7 @@
 #include <linux/percpu.h>
 #include <linux/kobject.h>
 #include <linux/spinlock.h>
+#include <asm/cputime.h>
 
 static spinlock_t cpufreq_stats_lock;
 
@@ -29,20 +30,14 @@ static struct freq_attr _attr_##_name = 
 	.show = _show,\
 };
 
-static unsigned long
-delta_time(unsigned long old, unsigned long new)
-{
-	return (old > new) ? (old - new): (new + ~old + 1);
-}
-
 struct cpufreq_stats {
 	unsigned int cpu;
 	unsigned int total_trans;
-	unsigned long long last_time;
+	unsigned long long  last_time;
 	unsigned int max_state;
 	unsigned int state_num;
 	unsigned int last_index;
-	unsigned long long *time_in_state;
+	cputime64_t *time_in_state;
 	unsigned int *freq_table;
 #ifdef CONFIG_CPU_FREQ_STAT_DETAILS
 	unsigned int *trans_table;
@@ -60,12 +55,16 @@ static int
 cpufreq_stats_update (unsigned int cpu)
 {
 	struct cpufreq_stats *stat;
+	unsigned long long cur_time;
+
+	cur_time = get_jiffies_64();
 	spin_lock(&cpufreq_stats_lock);
 	stat = cpufreq_stats_table[cpu];
 	if (stat->time_in_state)
-		stat->time_in_state[stat->last_index] +=
-			delta_time(stat->last_time, jiffies);
-	stat->last_time = jiffies;
+		stat->time_in_state[stat->last_index] =
+			cputime64_add(stat->time_in_state[stat->last_index],
+				      cputime_sub(cur_time, stat->last_time));
+	stat->last_time = cur_time;
 	spin_unlock(&cpufreq_stats_lock);
 	return 0;
 }
@@ -90,8 +89,8 @@ show_time_in_state(struct cpufreq_policy
 		return 0;
 	cpufreq_stats_update(stat->cpu);
 	for (i = 0; i < stat->state_num; i++) {
-		len += sprintf(buf + len, "%u %llu\n",
-			stat->freq_table[i], stat->time_in_state[i]);
+		len += sprintf(buf + len, "%u %llu\n", stat->freq_table[i], 
+			(unsigned long long)cputime64_to_clock_t(stat->time_in_state[i]));
 	}
 	return len;
 }
@@ -107,16 +106,30 @@ show_trans_table(struct cpufreq_policy *
 	if(!stat)
 		return 0;
 	cpufreq_stats_update(stat->cpu);
+	len += snprintf(buf + len, PAGE_SIZE - len, "   From  :    To\n");
+	len += snprintf(buf + len, PAGE_SIZE - len, "         : ");
+	for (i = 0; i < stat->state_num; i++) {
+		if (len >= PAGE_SIZE)
+			break;
+		len += snprintf(buf + len, PAGE_SIZE - len, "%9u ",
+				stat->freq_table[i]);
+	}
+	if (len >= PAGE_SIZE)
+		return len;
+
+	len += snprintf(buf + len, PAGE_SIZE - len, "\n");
+
 	for (i = 0; i < stat->state_num; i++) {
 		if (len >= PAGE_SIZE)
 			break;
-		len += snprintf(buf + len, PAGE_SIZE - len, "%9u:\t",
+
+		len += snprintf(buf + len, PAGE_SIZE - len, "%9u: ",
 				stat->freq_table[i]);
 
 		for (j = 0; j < stat->state_num; j++)   {
 			if (len >= PAGE_SIZE)
 				break;
-			len += snprintf(buf + len, PAGE_SIZE - len, "%u\t",
+			len += snprintf(buf + len, PAGE_SIZE - len, "%9u ",
 					stat->trans_table[i*stat->max_state+j]);
 		}
 		len += snprintf(buf + len, PAGE_SIZE - len, "\n");
@@ -197,7 +210,7 @@ cpufreq_stats_create_table (struct cpufr
 		count++;
 	}
 
-	alloc_size = count * sizeof(int) + count * sizeof(long long);
+	alloc_size = count * sizeof(int) + count * sizeof(cputime64_t);
 
 #ifdef CONFIG_CPU_FREQ_STAT_DETAILS
 	alloc_size += count * count * sizeof(int);
@@ -224,7 +237,7 @@ cpufreq_stats_create_table (struct cpufr
 	}
 	stat->state_num = j;
 	spin_lock(&cpufreq_stats_lock);
-	stat->last_time = jiffies;
+	stat->last_time = get_jiffies_64();
 	stat->last_index = freq_table_get_index(stat, policy->cur);
 	spin_unlock(&cpufreq_stats_lock);
 	cpufreq_cpu_put(data);
