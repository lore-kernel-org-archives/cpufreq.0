From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] fix cpu frequency detection in
	arch/i386/kernel/timers/timer_tsc.c::recalibrate_cpu_khz()
Date: Mon, 19 Dec 2005 11:59:55 +0100
Message-ID: <20051219105955.GC6233@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Andrew Morton <akpm@osdl.org>
Cc: cpufreq@lists.linux.org.uk, Larry Finger <Larry.Finger@lwfinger.net>

Hi,

When we re-calibrate the frequency, it is likely that an
interrupt (as for example the main system clock) will be triggered
by the system.  Therefore the calibration may not be accurate.
This will also provide a fix to bug #5266.

Many thanks to Larry Finger for helping resolving this issue.

From: Larry Finger
Signed-off-by: Bruno Ducrot <ducrot@poupinou.org>

 linux-2.6.14.3/arch/i386/kernel/timers/timer_tsc.c |    2 ++
 1 files changed, 2 insertions(+)

--- linux-2.6.14.3/arch/i386/kernel/timers/timer_tsc.c	2005/12/19 10:51:22	1.1
+++ linux-2.6.14.3/arch/i386/kernel/timers/timer_tsc.c	2005/12/19 10:52:03
@@ -325,7 +325,9 @@ int recalibrate_cpu_khz(void)
 	unsigned int cpu_khz_old = cpu_khz;
 
 	if (cpu_has_tsc) {
+		local_irq_disable();
 		init_cpu_khz();
+		local_irq_enable();
 		cpu_data[0].loops_per_jiffy =
 		    cpufreq_scale(cpu_data[0].loops_per_jiffy,
 			          cpu_khz_old,
-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
