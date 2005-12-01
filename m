From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at driver
	initialization
Date: Fri, 2 Dec 2005 00:34:11 +0100
Message-ID: <20051201233411.GA5563@inferi.kami.home>
References: <11333087111183-git-send-email-malattia@linux.it>
	<438D9111.2000306@tremplin-utc.net>
	<20051130223038.GD3620@inferi.kami.home>
	<438E38B3.3080009@tremplin-utc.net>
	<20051201193147.GB4432@inferi.kami.home>
	<438F659B.3070103@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="pf9I7BMVVzbSWLtt"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <438F659B.3070103@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2005 at 10:05:31PM +0100, Eric Piel wrote:
> 01.12.2005 20:31, Mattia Dongili wrote/a =E9crit:
> >ok, updated patch attached (with a shiny diffstat!!). Looks a lot
> >nicer now :)
> >
> >Oh, what do you think of the request to report out-of-range frequencies
> >and set CPUFREQ_ETERNAL instead of setting an arbitrary high value? If
> >ok, shall I use my email address instead of the list's?
> >
> I was about to say this is fairly reasonable... until I tried it on my=20
> laptop and notice that _I_ got this message :-( Transition measured:=20
> 4500 nSec. It's probably because the clock source on my laptop is the=20
> TSC, which on this old processor stops during transition. Therefore,=20

Hehe, oh that was the reason you tried pmtimer measurement, right? :)

> So what about putting it to 500 uSec, knowing that on my 1GHz PIII it=20
> took something like 200uSec, it should be safe everywhere:

Fine with me. Following your suggested code, I only changed the order
of the assigment and the printk because it might still be interesting to
see the measured value without having to enable cpufreq_debug.

So, to summarize:
the attached patch introduces runtime latency measurement for many
speedstep based processors instead of using CPUFREQ_ETERNAL. It includes
some sanity checks in case the measured value is out of range and
assigns a safe value of 500uSec that should still be enough on
problematics chipsets (current testing report values ~200uSec).

Signed-off-by: Mattia Dongili <malattia@linux.it>
--=20
mattia
:wq!

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="measure_transition_latency-3.diff"

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
index d368b3f..cfefc37 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
@@ -320,13 +320,16 @@ EXPORT_SYMBOL_GPL(speedstep_detect_proce
 unsigned int speedstep_get_freqs(unsigned int processor,
 				  unsigned int *low_speed,
 				  unsigned int *high_speed,
+				  unsigned int *transition_latency,
 				  void (*set_state) (unsigned int state))
 {
 	unsigned int prev_speed;
 	unsigned int ret = 0;
 	unsigned long flags;
+	struct timeval tv1, tv2;
 
-	if ((!processor) || (!low_speed) || (!high_speed) || (!set_state))
+	if ((!processor) || (!low_speed) || (!high_speed)
+			|| (!set_state) || (!transition_latency))
 		return -EINVAL;
 
 	dprintk("trying to determine both speeds\n");
@@ -337,7 +340,7 @@ unsigned int speedstep_get_freqs(unsigne
 		return -EIO;
 
 	dprintk("previous speed is %u\n", prev_speed);
-	
+
 	local_irq_save(flags);
 
 	/* switch to low state */
@@ -350,8 +353,15 @@ unsigned int speedstep_get_freqs(unsigne
 
 	dprintk("low speed is %u\n", *low_speed);
 
+	/* start latency measurement */
+	do_gettimeofday(&tv1);
+
 	/* switch to high state */
 	set_state(SPEEDSTEP_HIGH);
+
+	/* end latency measurement */
+	do_gettimeofday(&tv2);
+
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
 		ret = -EIO;
@@ -369,6 +379,23 @@ unsigned int speedstep_get_freqs(unsigne
 	if (*high_speed != prev_speed)
 		set_state(SPEEDSTEP_LOW);
 
+	*transition_latency = (tv2.tv_sec - tv1.tv_sec) * USEC_PER_SEC +
+		tv2.tv_usec - tv1.tv_usec;
+	dprintk("transition latency is %u uSec\n", *transition_latency);
+
+	/* convert uSec to nSec and add 20% for safety reasons */
+	*transition_latency *= 1200;
+
+	/* check if the latency measurement is too high or too low
+	 * and set it to a safe value (500uSec) in that case
+	 */
+	if (*transition_latency > 10000000 || *transition_latency < 50000) {
+		printk (KERN_WARNING "speedstep: frequency transition measured seems out of "
+				"range (%u nSec), falling back to a safe one of %u nSec.\n",
+				*transition_latency, 500000);
+		*transition_latency = 500000;
+	}
+
  out:
 	local_irq_restore(flags);
 	return (ret);
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

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--pf9I7BMVVzbSWLtt--

