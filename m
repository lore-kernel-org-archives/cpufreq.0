From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: fix HT oops on speedstep-ich system
Date: Mon, 19 Jul 2004 14:10:27 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040719121026.GA8901@dominikbrodowski.de>
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

Bugfix for #3012 @ http://bugme.osdl.org/show_bug.cgi?id=3012

The speedstep-ich driver only registers for CPU0 (which is a sane thing to
do). However, cpufreq_notify_transition() currently assumes the CPU
specified in the freqs.cpu parameter has actually been registered with the
CPUfreq core. This is obviously not the case for HT speedstep-ich CPUs,
causing an OOPS. The long-term solution will be to merge the "cpufreq 
CPU group awareness patches" already RFC'ed to this list; but they still 
need a bit of polishing and testing.

Thanks to Boris Fersing for reporting the bug and testing this fix.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/drivers/cpufreq/cpufreq.c linux/drivers/cpufreq/cpufreq.c
--- linux-original/drivers/cpufreq/cpufreq.c	2004-07-16 10:07:44.000000000 +0200
+++ linux/drivers/cpufreq/cpufreq.c	2004-07-16 10:13:57.757431680 +0200
@@ -1059,7 +1059,8 @@
 		 * is not equal to what the cpufreq core thinks is "old frequency".
 		 */
 		if (!(cpufreq_driver->flags & CPUFREQ_CONST_LOOPS)) {
-			if ((likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
+			if ((likely(cpufreq_cpu_data[freqs->cpu])) &&
+			    (likely(cpufreq_cpu_data[freqs->cpu]->cur)) &&
 			    (unlikely(freqs->old != cpufreq_cpu_data[freqs->cpu]->cur)))
 			{
 				if (cpufreq_driver->flags & CPUFREQ_PANIC_OUTOFSYNC)
@@ -1077,7 +1078,8 @@
 	case CPUFREQ_POSTCHANGE:
 		adjust_jiffies(CPUFREQ_POSTCHANGE, freqs);
 		notifier_call_chain(&cpufreq_transition_notifier_list, CPUFREQ_POSTCHANGE, freqs);
-		cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
+		if (likely(cpufreq_cpu_data[freqs->cpu]))
+			cpufreq_cpu_data[freqs->cpu]->cur = freqs->new;
 		break;
 	}
 	up_read(&cpufreq_notifier_rwsem);
