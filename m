From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: new p4-clockmod capable CPUs
Date: Mon, 2 Oct 2006 04:06:12 +0200
Message-ID: <20061002020612.GA23059@isilmar.linta.de>
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
To: cpufreq@lists.linux.org.uk, venkatesh.pallipadi@intel.com

Hi!

A couple of people have contacted me during my absence from Linux coding
regarding new p4-clockmod capable CPUs. These are:

Intel(R) Celeron(R) M CPU 410
cpu family      : 6
model           : 14
stepping        : 8

Intel(R) CPU T2050 [dualcore?]
cpu family      : 6
model           : 14
stepping        : 8
flags		: ... est ...

Intel(R) Xeon(TM) CPU @ 2.00 GHz [dualcore?]
cpu family      : 6
model           : 14
stepping        : 8
flags		: ... est ...

Intel(R) Core(TM)2 CPU [dualcore!]
cpu family      : 6
model           : 15
stepping        : 6
flags		: ... est ...


A few questions to the Intel guys:

- Is the method in pentiumM_get_frequency() for these CPUs?
- Is the p4-clockmod algorithm valid (though mostly useless) for these CPUs? 
- Is the TSC running continuously even if doing p4-clockmod-type modulation
  on these CPUs?

Iffff the answer is "yes" for all these CPUs, I suggest the following patch
on top of the speedstep-centrino-acpi-cpufreq-integration patchset (for I
suggest acpi-cpufreq and not speedstep-centrino any longer):



From: Dominik Brodowski <linux@dominikbrodowski.net>

Several more Intel CPUs are now capable using the p4-clockmod cpufreq
driver. As it is of limited use most of the time, print a big bold warning
if a better cpufreq driver might be available.

Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>

diff --git a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
index 304d2ea..6d1faef 100644
--- a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
+++ b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c
@@ -163,29 +163,24 @@ static int cpufreq_p4_verify(struct cpuf
 
 static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
 {
-	if ((c->x86 == 0x06) && (c->x86_model == 0x09)) {
-		/* Pentium M (Banias) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
-		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
-	}
-
-	if ((c->x86 == 0x06) && (c->x86_model == 0x0D)) {
-		/* Pentium M (Dothan) */
-		printk(KERN_WARNING PFX "Warning: Pentium M detected. "
-		       "The speedstep_centrino module offers voltage scaling"
-		       " in addition of frequency scaling. You should use "
-		       "that instead of p4-clockmod, if possible.\n");
-		/* on P-4s, the TSC runs with constant frequency independent whether
-		 * throttling is active or not. */
+	if (c->x86 == 0x06) switch (c->x86_model) {
+	case 0x0D: /* Pentium M (Dothan) */
+	case 0x0E: /* Celeron, Xeon */
+	case 0x0F: /* Core Duo */
 		p4clockmod_driver.flags |= CPUFREQ_CONST_LOOPS;
+		/* fall through */
+	case 0x09: /* Pentium M (Banias) */
+		if (cpu_has(c, X86_FEATURE_EST))
+			printk(KERN_WARNING PFX "Warning: EST-capable CPU detected. "
+			       "The acpi-cpufreq module offers voltage scaling"
+			       " in addition of frequency scaling. You should use "
+			       "that instead of p4-clockmod, if possible.\n");
 		return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
+		break;
 	}
 
 	if (c->x86 != 0xF) {
-		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <linux@brodo.de>\n");
+		printk(KERN_WARNING PFX "Unknown p4-clockmod-capable CPU. Please send an e-mail to <cpufreq@lists.linux.org.uk>\n");
 		return 0;
 	}
