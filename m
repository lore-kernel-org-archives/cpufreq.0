From: Eric Lammerts <eric@lammerts.org>
Subject: p4-clockmod: remove "use speedstep_centrino" message on Celeron M
Date: Wed, 25 Jan 2006 19:48:04 -0500 (EST)
Message-ID: <Pine.LNX.4.58.0601251934560.6928@vivaldi.madbase.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@lists.linux.org.uk, zwane@commfireservices.com


Hi,
On Celeron M systems, p4-clockmod says I should use
speedstep_centrino. But the Celeron M doesn't have the Enhanced
SpeedStep feature that the Pentium M has (and speedstep_centrino
needs).

This patch suppresses the printk if Enhanced SpeedStep is not
available.

cheers,

Eric


Signed-off-by: Eric Lammerts <eric@lammerts.org>

--- linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c.orig	2006-01-26 01:24:57.000000000 +0100
+++ linux-2.6.15.1/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2006-01-26 01:39:22.000000000 +0100
@@ -165,19 +165,23 @@
 {
 	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
 		/* Pentium M (Banias) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
+		if(cpu_has(c, X86_FEATURE_EST)) {
+			printk(KERN_WARNING PFX "Warning: Pentium M detected. "
+			       "The speedstep_centrino module offers voltage scaling"
+			       " in addition of frequency scaling. You should use "
+			       "that instead of p4-clockmod, if possible.\n");
+		}
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
 	}

 	if ((c->x86 == 0x06) && (c->x86_model == 0x0D)) {
 		/* Pentium M (Dothan) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
+		if(cpu_has(c, X86_FEATURE_EST)) {
+			printk(KERN_WARNING PFX "Warning: Pentium M detected. "
+			       "The speedstep_centrino module offers voltage scaling"
+			       " in addition of frequency scaling. You should use "
+			       "that instead of p4-clockmod, if possible.\n");
+		}
 		/* on P-4s, the TSC runs with constant frequency independent whether
 		 * throttling is active or not. */
 		p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
