From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH 4/4] cpufreq "cpu group" awareness: remove FIXME in
	speedstep-ich
Date: Sun, 5 Sep 2004 20:23:18 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040905182318.GD7886@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk, davej@codemonkey.org.uk

Remove the FIXME in speedstep-ich.

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-09-05 14:02:52.425927160 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2004-09-05 14:05:00.900396072 +0200
@@ -311,16 +311,12 @@
 	unsigned int speed;
 	cpumask_t cpus_allowed;
 
-
-	/* capability check */
-	if (policy->cpu != 0) /* FIXME: better support for SMT in cpufreq core. Up until then, it's better to register only one CPU */
-		return -ENODEV;
-
 	/* only run on CPU to be set, or on its sibling */
-	cpus_allowed = current->cpus_allowed;
 #ifdef CONFIG_SMP
 	policy->cpus = cpu_sibling_map[policy->cpu];
 #endif
+
+	cpus_allowed = current->cpus_allowed;
 	set_cpus_allowed(current, policy->cpus);
 
 	/* detect low and high frequency */
