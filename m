From: John Clemens <john@deater.net>
Subject: [PATCH] pmac_cpufreq scaling_available_frequencies support..
Date: Sun, 6 Feb 2005 01:37:15 -0500 (EST)
Message-ID: <Pine.LNX.4.61.0502060129030.15763@pianoman.cluster.toy>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, cpufreq@ZenII.linux.org.uk


Hi, just a ping about this patch I sent back in ... err.. 2.6.8 days. 
I've updated it to 2.6.10 and wonder if there's any interest in it at all. 
(I certainly use it all the time, but hey..).  The define cleanups may be 
unnecessary and can easily be dropped....looking at them now I'm not sure 
why i made them, actually.  If there's interest I'll update to bk and drop 
the define stuff.  If not, well, it's archived in the list if anyone wants 
it in the future.

cheers,
john.c

-- 
John Clemens                      http://www.deater.net/john
john at deater.net      "I Hate Quotes" -- Samuel L. Clemens

--- linux-2.6.10/arch/ppc/platforms/pmac_cpufreq.c	2004-12-24 16:34:58.000000000 -0500
+++ linux-2.6.10-patched/arch/ppc/platforms/pmac_cpufreq.c	2005-02-06 01:19:24.410722752 -0500
@@ -75,14 +75,12 @@
  static u32 slew_done_gpio;


-#define PMAC_CPU_LOW_SPEED	1
-#define PMAC_CPU_HIGH_SPEED	0
-
  /* There are only two frequency states for each processor. Values
   * are in kHz for the time being.
   */
-#define CPUFREQ_HIGH                  PMAC_CPU_HIGH_SPEED
-#define CPUFREQ_LOW                   PMAC_CPU_LOW_SPEED
+
+#define CPUFREQ_HIGH                  0
+#define CPUFREQ_LOW                   1

  static struct cpufreq_frequency_table pmac_cpu_freqs[] = {
  	{CPUFREQ_HIGH, 		0},
@@ -90,6 +88,11 @@
  	{0,			CPUFREQ_TABLE_END},
  };

+static struct freq_attr* pmac_cpu_freqs_attr[] = {
+	&cpufreq_freq_attr_scaling_available_freqs,
+	NULL,
+};
+
  static inline void wakeup_decrementer(void)
  {
  	set_dec(tb_ticks_per_jiffy);
@@ -292,16 +295,16 @@
  	struct cpufreq_freqs freqs;

  	freqs.old = cur_freq;
-	freqs.new = (speed_mode == PMAC_CPU_HIGH_SPEED) ? hi_freq : low_freq;
+	freqs.new = (speed_mode == CPUFREQ_HIGH) ? hi_freq : low_freq;
  	freqs.cpu = smp_processor_id();

  	if (freqs.old == freqs.new)
  		return 0;

  	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-	set_speed_proc(speed_mode == PMAC_CPU_LOW_SPEED);
+	set_speed_proc(speed_mode == CPUFREQ_LOW);
  	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	cur_freq = (speed_mode == PMAC_CPU_HIGH_SPEED) ? hi_freq : low_freq;
+	cur_freq = (speed_mode == CPUFREQ_HIGH) ? hi_freq : low_freq;

  	return 0;
  }
@@ -339,6 +342,8 @@
  	policy->cpuinfo.transition_latency	= CPUFREQ_ETERNAL;
  	policy->cur = cur_freq;

+	cpufreq_frequency_table_get_attr(pmac_cpu_freqs, policy->cpu);
+
  	return cpufreq_frequency_table_cpuinfo(policy, &pmac_cpu_freqs[0]);
  }

@@ -360,6 +365,7 @@
  	.init		= pmac_cpufreq_cpu_init,
  	.name		= "powermac",
  	.owner		= THIS_MODULE,
+	.attr		= pmac_cpu_freqs_attr,
  };
