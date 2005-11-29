From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 2/2] Measure transition latency at driver initialization
Date: Wed, 30 Nov 2005 00:58:31 +0100
Message-ID: <11333087111183-git-send-email-malattia@linux.it>
References: <11333087112659-git-send-email-malattia@linux.it>
Reply-To: Mattia Dongili <malattia@linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <11333087112659-git-send-email-malattia@linux.it>
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
To: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com

Signed-off-by: Mattia Dongili <malattia@linux.it>

---

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |   90 +++++++++++++++++++++++---
 1 files changed, 78 insertions(+), 12 deletions(-)

applies-to: 802a6f1c8699b27a187d801cf69a599409a6b5a4
1d29940b03826b73b9660abc348b8d2ede587587
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
index 17b7864..a931849 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -42,6 +42,8 @@ static unsigned int speedstep_processor 
 
 static u32 pmbase;
 
+static int measure_latency;
+
 /*
  *   There are only two frequency states for each processor. Values
  * are in kHz for the time being.
@@ -85,23 +87,20 @@ static int speedstep_find_register (void
 }
 
 /**
- * speedstep_set_state - set the SpeedStep state
+ * __speedstep_set_state - set the SpeedStep state
  * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
  *
  *   Tries to change the SpeedStep state.
+ *   NOTE: it doesn't disable interrupts use speedstep_set_state instead.
  */
-static void speedstep_set_state (unsigned int state)
+static void __speedstep_set_state (unsigned int state)
 {
 	u8 pm2_blk;
 	u8 value;
-	unsigned long flags;
 
 	if (state > 0x1)
 		return;
 
-	/* Disable IRQs */
-	local_irq_save(flags);
-
 	/* read state */
 	value = inb(pmbase + 0x50);
 
@@ -128,11 +127,8 @@ static void speedstep_set_state (unsigne
 	/* check if transition was successful */
 	value = inb(pmbase + 0x50);
 
-	/* Enable IRQs */
-	local_irq_restore(flags);
-
 	dprintk("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
-
+	
 	if (state == (value & 0x1)) {
 		dprintk("change to %u MHz succeeded\n", (speedstep_get_processor_frequency(speedstep_processor) / 1000));
 	} else {
@@ -142,6 +138,68 @@ static void speedstep_set_state (unsigne
 	return;
 }
 
+/**
+ * speedstep_measure_latency - measure latency usec
+ *
+ * Returns: the detected latency.
+ */
+static long speedstep_measure_latency (void)
+{
+	unsigned long flags;
+	unsigned int cur_speed = 0;
+	int state = 0;
+	struct timeval t1, t2;
+
+	cur_speed = speedstep_get_processor_frequency(speedstep_processor);
+	/* find out in which order we have to switch frequencies
+	 * to really switch and measure latency time.
+	 */
+	if (speedstep_freqs[SPEEDSTEP_LOW].frequency == cur_speed) {
+		state = SPEEDSTEP_HIGH;
+	} else {
+		state = SPEEDSTEP_LOW;
+	}
+
+	/* Disable IRQs */
+	local_irq_save(flags);
+
+	do_gettimeofday(&t1);
+
+	__speedstep_set_state(state);
+
+	do_gettimeofday(&t2);
+
+	/* restore the previous frequency */
+	__speedstep_set_state(!state);
+
+	/* Enable IRQs */
+	local_irq_restore(flags);
+
+	return (t2.tv_sec - t1.tv_sec) * USEC_PER_SEC +
+		t2.tv_usec - t1.tv_usec;
+}
+
+/**
+ * speedstep_set_state - set the SpeedStep state
+ * @state: new processor frequency state (SPEEDSTEP_LOW or SPEEDSTEP_HIGH)
+ *
+ *   Tries to change the SpeedStep state.
+ */
+static void speedstep_set_state (unsigned int state)
+{
+	unsigned long flags;
+
+	/* Disable IRQs */
+	local_irq_save(flags);
+
+	__speedstep_set_state(state);
+	
+	/* Enable IRQs */
+	local_irq_restore(flags);
+
+	return;
+}
+
 
 /**
  * speedstep_activate - activate SpeedStep control in the chipset
@@ -320,6 +378,7 @@ static int speedstep_cpu_init(struct cpu
 {
 	int result = 0;
 	unsigned int speed;
+	unsigned int transition_latency = CPUFREQ_ETERNAL;
 	cpumask_t cpus_allowed;
 
 	/* only run on CPU to be set, or on its sibling */
@@ -334,7 +393,7 @@ static int speedstep_cpu_init(struct cpu
 	result = speedstep_get_freqs(speedstep_processor,
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
-				     &speedstep_set_state);
+				     &__speedstep_set_state);
 	set_cpus_allowed(current, cpus_allowed);
 	if (result)
 		return result;
@@ -348,9 +407,14 @@ static int speedstep_cpu_init(struct cpu
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "high",
 		(speed / 1000));
 
+	if (measure_latency) {
+		transition_latency = speedstep_measure_latency() * 1000;
+		dprintk("measured transition latency is %u mS\n", transition_latency);
+	}
+	
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	policy->cpuinfo.transition_latency = transition_latency;
 	policy->cur = speed;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
@@ -434,6 +498,8 @@ static void __exit speedstep_exit(void)
 	cpufreq_unregister_driver(&speedstep_driver);
 }
 
+module_param(measure_latency, int, 0444);
+MODULE_PARM_DESC(measure_latency, "Try to measure transition latency.");
 
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>, Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION ("Speedstep driver for Intel mobile processors on chipsets with ICH-M southbridges.");
---
0.99.9.GIT
