From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] fix cpufreq flag handling
Date: Fri, 14 May 2004 17:42:51 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040514154251.GA11757@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

Does anyone have a spare paper bag for me? 

(!flags & SOME_FLAG) 
is totally different to
(!(flags & SOME_FLAG))
and only the latter is valid... 

 arch/i386/kernel/timers/timer_tsc.c |    4 ++--
 drivers/cpufreq/cpufreq.c           |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff -ruN linux-original/arch/i386/kernel/timers/timer_tsc.c linux/arch/i386/kernel/timers/timer_tsc.c
--- linux-original/arch/i386/kernel/timers/timer_tsc.c	2004-05-14 13:09:52.000000000 +0200
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2004-05-14 17:02:38.706248520 +0200
@@ -388,13 +388,13 @@
 	if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
 	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new) ||
 	    (val == CPUFREQ_RESUMECHANGE)) {
-		if (!freq->flags & CPUFREQ_CONST_LOOPS)
+		if (!(freq->flags & CPUFREQ_CONST_LOOPS))
 			cpu_data[freq->cpu].loops_per_jiffy = cpufreq_scale(loops_per_jiffy_ref, ref_freq, freq->new);
 #ifndef CONFIG_SMP
 		if (cpu_khz)
 			cpu_khz = cpufreq_scale(cpu_khz_ref, ref_freq, freq->new);
 		if (use_tsc) {
-			if (!freq->flags & CPUFREQ_CONST_LOOPS) {
+			if (!(freq->flags & CPUFREQ_CONST_LOOPS)) {
 				fast_gettimeoffset_quotient = cpufreq_scale(fast_gettimeoffset_ref, freq->new, ref_freq);
 				set_cyc2ns_scale(cpu_khz/1000);
 			}
diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-05-14 13:10:09.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-05-14 17:07:41.039286912 +0200
@@ -600,7 +600,7 @@
 	if (!cpu_policy)
 		return -EINVAL;
 
-	if (!cpufreq_driver->flags & CPUFREQ_CONST_LOOPS) {
+	if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
 		unsigned int cur_freq = 0;
 
 		if (cpufreq_driver->get)
