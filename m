From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH 2/2 updated] Measure transition latency at driver
	initialization
Date: Fri, 2 Dec 2005 21:59:41 +0100
Message-ID: <20051202205941.GE3598@inferi.kami.home>
References: <11333087111183-git-send-email-malattia@linux.it>
	<438D9111.2000306@tremplin-utc.net>
	<20051130223038.GD3620@inferi.kami.home>
	<438E38B3.3080009@tremplin-utc.net>
	<20051201193147.GB4432@inferi.kami.home>
	<438F659B.3070103@tremplin-utc.net>
	<20051201233411.GA5563@inferi.kami.home> <439031F0.2090607@lifl.fr>
	<4792.83.103.117.254.1133530475.squirrel@picard.linux.it>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4792.83.103.117.254.1133530475.squirrel@picard.linux.it>
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
To: Eric Piel <Eric.Piel@lifl.fr>
Cc: CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Eric Piel <eric.piel@tremplin-utc.net>, Dominik Brodowski <linux@dominikbrodowski.net>, davej@redhat.com


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2005 at 02:34:35PM +0100, Mattia Dongili wrote:
> On Fri, December 2, 2005 12:37 pm, Eric Piel said:
> > 12/02/2005 12:34 AM, Mattia Dongili wrote/a =C3=A9crit:
> [...]
> >> problematics chipsets (current testing report values ~200uSec).
> > Again, I though it was done... and then Ville showed that's it's plainly
> > wrong to assume anything with speedstep-smi: it could take up to 1
> > second to change of frequency or few uSec. So we should probably back
> > out the smi part.
> >
> > What I propose: modify slightly the interface of speedstep_get_freqs():
> >   * if transition_latency is NULL, we don't try to update the transition
> > latency,
> > * otherwise we so as usual.
> > Then, in speedstep-smi we can call speedstep_get_freqs() with NULL,
> > voila :-)
>=20
> Ok, I had something similar in mind when thinking about creating a more
> general function/interface for latency measurement. We will surely need
> some way to disable it.
>
> Updated patch will follow soon.

here it is:
the attached patch introduces runtime latency measurement for ICH[234]
based chipsets instead of using CPUFREQ_ETERNAL. It includes
some sanity checks in case the measured value is out of range and
assigns a safe value of 500uSec that should still be enough on
problematics chipsets (current testing report values ~200uSec). The
measurement is currently done in speedstep_get_freqs in order to avoid
further unnecessary transitions and in the hope it'll come handy for SMI
also.

Signed-off-by: Mattia Dongili <malattia@linux.it>

 speedstep-ich.c |    4 ++--
 speedstep-lib.c |   32 +++++++++++++++++++++++++++++++-
 speedstep-lib.h |    1 +
 speedstep-smi.c |    1 +
 4 files changed, 35 insertions(+), 3 deletions(-)

--=20
mattia
:wq!

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="measure_transition_latency-4.diff"

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
index d368b3f..7c47005 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
@@ -320,11 +320,13 @@ EXPORT_SYMBOL_GPL(speedstep_detect_proce
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
 
 	if ((!processor) || (!low_speed) || (!high_speed) || (!set_state))
 		return -EINVAL;
@@ -337,7 +339,7 @@ unsigned int speedstep_get_freqs(unsigne
 		return -EIO;
 
 	dprintk("previous speed is %u\n", prev_speed);
-	
+
 	local_irq_save(flags);
 
 	/* switch to low state */
@@ -350,8 +352,17 @@ unsigned int speedstep_get_freqs(unsigne
 
 	dprintk("low speed is %u\n", *low_speed);
 
+	/* start latency measurement */
+	if (transition_latency)
+		do_gettimeofday(&tv1);
+
 	/* switch to high state */
 	set_state(SPEEDSTEP_HIGH);
+
+	/* end latency measurement */
+	if (transition_latency)
+		do_gettimeofday(&tv2);
+
 	*high_speed = speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
 		ret = -EIO;
@@ -369,6 +380,25 @@ unsigned int speedstep_get_freqs(unsigne
 	if (*high_speed != prev_speed)
 		set_state(SPEEDSTEP_LOW);
 
+	if (transition_latency) {
+		*transition_latency = (tv2.tv_sec - tv1.tv_sec) * USEC_PER_SEC +
+			tv2.tv_usec - tv1.tv_usec;
+		dprintk("transition latency is %u uSec\n", *transition_latency);
+
+		/* convert uSec to nSec and add 20% for safety reasons */
+		*transition_latency *= 1200;
+
+		/* check if the latency measurement is too high or too low
+		 * and set it to a safe value (500uSec) in that case
+		 */
+		if (*transition_latency > 10000000 || *transition_latency < 50000) {
+			printk (KERN_WARNING "speedstep: frequency transition measured seems out of "
+					"range (%u nSec), falling back to a safe one of %u nSec.\n",
+					*transition_latency, 500000);
+			*transition_latency = 500000;
+		}
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
index 2718fb6..28cc5d5 100644
--- a/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
@@ -269,6 +269,7 @@ static int speedstep_cpu_init(struct cpu
 		result = speedstep_get_freqs(speedstep_processor,
 				&speedstep_freqs[SPEEDSTEP_LOW].frequency,
 				&speedstep_freqs[SPEEDSTEP_HIGH].frequency,
+				NULL,
 				&speedstep_set_state);
 
 		if (result) {

--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--pWyiEgJYm5f9v55/--

