From: aeriksson@fastmail.fm
Subject: speedstep capability checks
Date: Sun, 14 Mar 2004 16:20:15 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk


Hi, 

I'm one of the few who has a laptop (Dell L400) which doesn't announce
its speedstep capability to the OS the way is should. I made this
patch which turns my workaround into a compile time config option
which, if enabled, need to be explicitly enabled with a module
parameter. That should be non-invasive enough to allow it to be
included (I think).

Please have a look at the attached patch (against current cvs), and
indicate which improvements may be needed to allow it to be included.

/Anders


diff -u -b -B -w -p -r1.12 Kconfig
--- linux/arch/i386/kernel/cpufreq/Kconfig      20 Jan 2004 17:03:31 -0000      1.12
+++ linux/arch/i386/kernel/cpufreq/Kconfig      14 Mar 2004 15:11:37 -0000
@@ -163,6 +163,15 @@ config X86_SPEEDSTEP_LIB
        depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD || X86_SPEEDSTEP_PII
X4)
        default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD || X86_SPEEDSTEP_PIIX4)
 
+config X86_SPEEDSTEP_RELAXED_CAP_CHECK
+       bool "Relaxed speedstep capability checks"
+       depends on X86_SPEEDSTEP_LIB
+       help
+         Don't perform all checks for a speedstep capable system which would 
+         normally be done. Some ancient systems, though speedstep capable,
+         don't always indicate that they are speedstep capable. This option
+         let's the probing code bypass those checks.
+         
 config X86_P4_CLOCKMOD
        tristate "Intel Pentium 4 clock modulation"
        depends on CPU_FREQ_TABLE
diff -u -b -B -w -p -r1.3 speedstep-lib.c
--- linux/arch/i386/kernel/cpufreq/speedstep-lib.c      20 Jan 2004 17:03:31 -0000      1.3
+++ linux/arch/i386/kernel/cpufreq/speedstep-lib.c      14 Mar 2004 15:11:39 -0000
@@ -10,6 +10,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h> 
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/pci.h>
@@ -30,6 +31,12 @@
 #define dprintk(msg...) do { } while(0)
 #endif
 
+#ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
+static int relaxed_check = 0;
+#else
+#define relaxed_check 0
+#endif
+
 /*********************************************************************
  *                   GET PROCESSOR CORE SPEED IN KHZ                 *
  *********************************************************************/
@@ -254,7 +261,7 @@ unsigned int speedstep_detect_processor 
                 */
                rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
                dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", ms
r_lo, msr_hi);
-               if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
+               if ((msr_hi & (1<<18)) && (relaxed_check ? 1 : (msr_hi & (3<<24)))) {
                        if (c->x86_mask == 0x01)
                                return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
                        else
@@ -323,6 +330,11 @@ unsigned int speedstep_get_freqs(unsigne
        return (ret);
 }
 EXPORT_SYMBOL_GPL(speedstep_get_freqs);
+
+#ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
+module_param(relaxed_check, int, 0444);
+MODULE_PARM_DESC(relaxed_check, "Don't do all checks for speedstep capability.");
+#endif
 
 MODULE_AUTHOR ("Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION ("Library for Intel SpeedStep 1 or 2 cpufreq drivers.");
