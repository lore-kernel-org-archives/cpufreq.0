From: John Clemens <clemej@alum.rpi.edu>
Subject: scaling_available_frequenies support for pmac_cpufreq
Date: Sat, 24 Jul 2004 15:19:29 -0400 (EDT)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <Pine.LNX.4.58.0407241508110.24401@pianoman.cluster.toy>
Reply-To: clemej@alum.rpi.edu
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk, benh@kernel.crashing.org


Hi Ben and list..

apologies if this has already been done, i haven't been following for a
while.  Here's a little patch to add scaling_available_frequencies to
pmac_cpufreq, seems to work well on my iBook G3...

~# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
900000 400000

but some double checking would be welcome.

I also cleaned up the use of PMAC_CPU_*_SPEED and standardized on
CPUFREQ_*, etc.., which point to the same thing.  Apply part or all at
your whim..

john.c

-- 
John Clemens          http://www.deater.net/john
john@deater.net     ICQ: 7175925, IM: PianoManO8
      "I Hate Quotes" -- Samuel L. Clemens


--- linux-2.6.7/arch/ppc/platforms/pmac_cpufreq.c	2004-06-16 01:19:36.000000000 -0400
+++ linux-2.6.7-pmac-cpufreq/arch/ppc/platforms/pmac_cpufreq.c	2004-07-24 14:53:40.809901240 -0400
@@ -66,14 +66,12 @@
 static u32 frequency_gpio;
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
@@ -81,6 +79,11 @@
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
@@ -262,7 +265,7 @@
 	int rc;

 	freqs.old = cur_freq;
-	freqs.new = (speed_mode == PMAC_CPU_HIGH_SPEED) ? hi_freq : low_freq;
+	freqs.new = (speed_mode == CPUFREQ_HIGH) ? hi_freq : low_freq;
 	freqs.cpu = smp_processor_id();

 	if (freqs.old == freqs.new)
@@ -276,7 +279,7 @@
 	else
 		rc = cpu_750fx_cpu_speed(speed_mode);
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-	cur_freq = (speed_mode == PMAC_CPU_HIGH_SPEED) ? hi_freq : low_freq;
+	cur_freq = (speed_mode == CPUFREQ_HIGH) ? hi_freq : low_freq;

 	return rc;
 }
@@ -314,7 +317,9 @@
 	policy->cpuinfo.transition_latency	= CPUFREQ_ETERNAL;
 	policy->cur = cur_freq;

-	return cpufreq_frequency_table_cpuinfo(policy, &pmac_cpu_freqs[0]);
+	cpufreq_frequency_table_get_attr(pmac_cpu_freqs, policy->cpu);
+
+	return cpufreq_frequency_table_cpuinfo(policy, pmac_cpu_freqs);
 }

 static u32 __pmac read_gpio(struct device_node *np)
@@ -335,6 +340,7 @@
 	.init		= pmac_cpufreq_cpu_init,
 	.name		= "powermac",
 	.owner		= THIS_MODULE,
+	.attr		= pmac_cpu_freqs_attr,
 };
