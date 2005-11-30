From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2/2] Measure transition latency at driver initialization
Date: Wed, 30 Nov 2005 23:30:38 +0100
Message-ID: <20051130223038.GD3620@inferi.kami.home>
References: <11333087111183-git-send-email-malattia@linux.it>
	<438D9111.2000306@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="aVD9QWMuhilNxW9f"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <438D9111.2000306@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Eric!

On Wed, Nov 30, 2005 at 12:46:25PM +0100, Eric Piel wrote:
> As stated before, the whole idea is probably good, at least it should 
> finally get rid of CPUFREQ_ETERNAL transition. BTW, maybe some other 
> drivers could benefit of the same approach :-)

grepping around I've just seen that CPUFREQ_ETERNAL is much more in use
than I expected! It's a shame so few people can benefit from
ondemand/conservative governors...

> However, I disagree a bit with the implementation:
> * don't make it a module parameter: either this aproach works and the 
> module should always use it or it doesn't. The problem with parameters 
> is that only few users will end up using this feature.

Yes, sorry. The intention was to make it available without breaking (hmm?)
current setups.

> * You should add a test to check that the transition measurement didn't 
> go wrong. It would be a pitty that a user burns his CPU simply because 
> the resolution of gettimeofday() was not good enough ;-) cf in the code
> 
> * At initialisation, the driver already changes twice of frequency (in 
> speedstep_get_freqs()). No need to change twice more to measure the 

I have a patch ready that does it in speedstep_get_freqs but it
looks ugly, it adds a lot of do_gettimeofay's around... It's probably
still not optimal and maybe trying to think of it as a more general
solution (from which all of the drivers could also benefit) should
result in nicer code.
I also had to modify speedstep-smi that still doesn't benefit 100% of
the times of the feature.

> transitions! We should put the time measurement inside 
> speedstep_get_freqs() or inside __speedstep_set_state(). Just check if 
> transition_latency == CPUFREQ_ETERNAL, if so, do the measurement.

well, in speedstep_get_freqs the above check is not really necessary, as
the only current paths reaching that function will return true.

Oh, and do you think __speedstep_set_state should remain? The reason I
added it was to avoid disabling interrupts twice. The attached
implementation without it is in fact a little less precise (values
have increased of ~25-30uSec on my PIIIM)

[...]
> > 	dprintk("read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
> >-
> >+	
> Watch out not to insert non needed tabs ;-)

Yup! I also have removed some this time ;)

Signed-off-by: Mattia Dongili <malattia@linux.it>
-- 
mattia
:wq!

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="measure_transition_latency.diff"

diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
index 77efe8e..b425cd3 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
@@ -329,10 +329,11 @@ static int speedstep_cpu_init(struct cpu
 	cpus_allowed = current->cpus_allowed;
 	set_cpus_allowed(current, policy->cpus);
 
-	/* detect low and high frequency */
+	/* detect low and high frequency and transition latency */
 	result = speedstep_get_freqs(speedstep_processor,
 				     &speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				     &speedstep_freqs[SPEEDSTEP_HIGH].frequency,
+				     &policy->cpuinfo.transition_latency,
 				     &speedstep_set_state);
 	set_cpus_allowed(current, cpus_allowed);
 	if (result)
@@ -349,7 +350,6 @@ static int speedstep_cpu_init(struct cpu
 
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
index d368b3f..9661d9e 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
@@ -19,6 +19,8 @@
 #include <asm/msr.h>
 #include "speedstep-lib.h"
 
+#define MAX(a,b)	((a)>(b) ? (a) : (b))
+
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "speedstep-lib", msg)
 
 #ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
@@ -320,13 +322,17 @@ EXPORT_SYMBOL_GPL(speedstep_detect_proce
 unsigned int speedstep_get_freqs(unsigned int processor,
 				  unsigned int *low_speed,
 				  unsigned int *high_speed,
+				  unsigned int *transition_latency,
 				  void (*set_state) (unsigned int state))
 {
 	unsigned int prev_speed;
 	unsigned int ret = 0;
 	unsigned long flags;
+	unsigned int latency;
+	struct timeval tv1, tv2;
 
-	if ((!processor) || (!low_speed) || (!high_speed) || (!set_state))
+	if ((!processor) || (!low_speed) || (!high_speed)
+			|| (!set_state) || (!transition_latency))
 		return -EINVAL;
 
 	dprintk("trying to determine both speeds\n");
@@ -337,37 +343,72 @@ unsigned int speedstep_get_freqs(unsigne
 		return -EIO;
 
 	dprintk("previous speed is %u\n", prev_speed);
-	
+
 	local_irq_save(flags);
 
+	do_gettimeofday(&tv1);
 	/* switch to low state */
 	set_state(SPEEDSTEP_LOW);
+	do_gettimeofday(&tv2);
+
 	*low_speed = speedstep_get_processor_frequency(processor);
 	if (!*low_speed) {
 		ret = -EIO;
 		goto out;
 	}
 
-	dprintk("low speed is %u\n", *low_speed);
+	latency = (tv2.tv_sec - tv1.tv_sec) * USEC_PER_SEC +
+		tv2.tv_usec - tv1.tv_usec;
 
+	dprintk("low speed is %u - latency is %u\n",
+			*low_speed, latency);
+
+	do_gettimeofday(&tv1);
 	/* switch to high state */
 	set_state(SPEEDSTEP_HIGH);
+	do_gettimeofday(&tv2);
+
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
 		ret = -EIO;
 		goto out;
 	}
 
-	dprintk("high speed is %u\n", *high_speed);
+	*transition_latency = (tv2.tv_sec - tv1.tv_sec) * USEC_PER_SEC +
+		tv2.tv_usec - tv1.tv_usec;
+
+	dprintk("high speed is %u - latency is %u\n",
+			*high_speed, *transition_latency);
 
 	if (*low_speed == *high_speed) {
 		ret = -ENODEV;
 		goto out;
 	}
 
-	/* switch to previous state, if necessary */
-	if (*high_speed != prev_speed)
+	/* switch to previous state, if necessary
+	 * and measure the latency, we want at
+	 * least 2 samples
+	 */
+	if (*high_speed != prev_speed) {
+		do_gettimeofday(&tv1);
 		set_state(SPEEDSTEP_LOW);
+		do_gettimeofday(&tv2);
+		latency = (tv2.tv_sec - tv1.tv_sec) * USEC_PER_SEC +
+			tv2.tv_usec - tv1.tv_usec;
+	}
+
+	/* convert uSec to nSec and add 20% for safety reasons */
+	*transition_latency = MAX(latency, *transition_latency) * 1200;
+
+	/* sanytize the latency measurement if too high or too low
+	 * and ask for reports of out-of-range values
+	 */
+	if (*transition_latency > 10000000 || *transition_latency < 50000) {
+		printk (KERN_ERR "CPUFreq: measured latency in frequency transition out "
+				"of range, please report the following value to "
+				"cpufreq@lists.linux.org.uk\n%u nSec\n", *transition_latency);
+		*transition_latency = CPUFREQ_ETERNAL;
+	}
 
  out:
 	local_irq_restore(flags);
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
index 261a2c9..6a727fd 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.h
@@ -44,4 +44,5 @@ extern unsigned int speedstep_get_proces
 extern unsigned int speedstep_get_freqs(unsigned int processor,
 	  unsigned int *low_speed,
 	  unsigned int *high_speed,
+	  unsigned int *transition_latency,
 	  void (*set_state) (unsigned int state));
diff --git a/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c b/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
index 2718fb6..52d7c91 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
@@ -260,15 +260,21 @@ static int speedstep_cpu_init(struct cpu
 		return -EINVAL;
 	}
 
+	/* set default policy values */
+	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+
 	/* detect low and high frequency */
 	result = speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				&speedstep_freqs[SPEEDSTEP_HIGH].frequency);
+
 	if (result) {
 		/* fall back to speedstep_lib.c dection mechanism: try both states out */
 		dprintk("could not detect low and high frequencies by SMI call.\n");
 		result = speedstep_get_freqs(speedstep_processor,
 				&speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				&speedstep_freqs[SPEEDSTEP_HIGH].frequency,
+			        &policy->cpuinfo.transition_latency,
 				&speedstep_set_state);
 
 		if (result) {
@@ -286,9 +292,6 @@ static int speedstep_cpu_init(struct cpu
 		(speed == speedstep_freqs[SPEEDSTEP_LOW].frequency) ? "low" : "high",
 		(speed / 1000));
 
-	/* cpuinfo and default policy values */
-	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = speed;
 
 	result = cpufreq_frequency_table_cpuinfo(policy, speedstep_freqs);

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--aVD9QWMuhilNxW9f--

