From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCH] cpufreq: speedstep-centrino should only decode MSR on
	certain CPUs
Date: Sat, 4 Sep 2004 09:55:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040904075507.GA3438@dominikbrodowski.de>
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
To: davej@codemonkey.org.uk, jeremy@goop.org, cpufreq@www.linux.org.uk

The encoding of the MSR only works as described in extract_clock() on
certain EST-enabled CPUs. So, limit the actual MSR check to these
CPUs.

Signed-off-by: Dominik Brodowski <linux@brodo.de>

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-08-30 22:50:56.000000000 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.c	2004-09-04 09:48:49.044458312 +0200
@@ -77,7 +77,7 @@
 
 /* Operating points for current CPU */
 static struct cpu_model *centrino_model;
-static int centrino_cpu;
+static const struct cpu_id *centrino_cpu;
 
 #ifdef CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE
 
@@ -289,7 +289,9 @@
 	 * for centrino, as some DSDTs are buggy.
 	 * Ideally, this can be done using the acpi_data structure.
 	 */
-	if (centrino_cpu) {
+	if ((centrino_cpu == &cpu_ids[CPU_BANIAS]) ||
+	    (centrino_cpu == &cpu_ids[CPU_DOTHAN_A1]) ||
+	    (centrino_cpu == &cpu_ids[CPU_DOTHAN_B0])) {
 		msr = (msr >> 8) & 0xff;
 		return msr * 100000;
 	}
@@ -457,7 +459,7 @@
 			break;
 
 	if (i != N_IDS)
-		centrino_cpu = 1;
+		centrino_cpu = &cpu_ids[i];
 
 	if (centrino_cpu_init_acpi(policy)) {
 		if (policy->cpu != 0)
