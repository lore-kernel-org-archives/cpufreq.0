From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] replace for_each_cpu with for_each_cpu_mask
Date: Fri, 11 Jun 2004 12:09:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040611100912.GG1095@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Thu, Jun 10, 2004 at 06:44:34PM +0200, Dominik Brodowski wrote:
> On Thu, Jun 10, 2004 at 05:37:11PM +0200, Bruno Ducrot wrote:
> > What about
> >     for_each_cpu_mask(i, affected_cpu_map) {
> >             ...
> >     }
> > instead?
>
> That's indeed shorter -- don't know why whoever converted p4-clockmod
> to the
> new sibling mask did use for_each_cpu_mask...

Something like that should be ok, I guess.


 arch/i386/kernel/cpu/cpufreq/p4-clockmod.c |   28 +++++++++++-----------------
 1 files changed, 11 insertions(+), 17 deletions(-)

--- linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004/06/10 19:54:23	1.1
+++ linux-2.6.7-rc3-mm1/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2004/06/10 19:57:00
@@ -132,34 +132,28 @@ static int cpufreq_p4_target(struct cpuf
 #endif
 
 	/* notifiers */
-	for_each_cpu(i) {
-		if (cpu_isset(i, affected_cpu_map)) {
-			freqs.cpu = i;
-			cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
-		}
+	for_each_cpu_mask(i, affected_cpu_map) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 	}
 
 	/* run on each logical CPU, see section 13.15.3 of IA32 Intel Architecture Software
 	 * Developer's Manual, Volume 3 
 	 */
-	for_each_cpu(i) {
-		if (cpu_isset(i, affected_cpu_map)) {
-			cpumask_t this_cpu = cpumask_of_cpu(i);
+	for_each_cpu_mask(i, affected_cpu_map) {
+		cpumask_t this_cpu = cpumask_of_cpu(i);
 
-			set_cpus_allowed(current, this_cpu);
-			BUG_ON(smp_processor_id() != i);
+		set_cpus_allowed(current, this_cpu);
+		BUG_ON(smp_processor_id() != i);
 
-			cpufreq_p4_setdc(i, p4clockmod_table[newstate].index);
-		}
+		cpufreq_p4_setdc(i, p4clockmod_table[newstate].index);
 	}
 	set_cpus_allowed(current, cpus_allowed);
 
 	/* notifiers */
-	for_each_cpu(i) {
-		if (cpu_isset(i, affected_cpu_map)) {
-			freqs.cpu = i;
-			cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
-		}
+	for_each_cpu_mask(i, affected_cpu_map) {
+		freqs.cpu = i;
+		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 	}
 
 	return 0;


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
