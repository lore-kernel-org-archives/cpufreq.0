From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep capability checks
Date: Tue, 16 Mar 2004 08:38:47 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040316073847.GA7597@dominikbrodowski.de>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315210950.GC15243@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040315210950.GC15243@redhat.com>
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
Cc: Arjan van de Ven <arjanv@redhat.com>, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk

On Mon, Mar 15, 2004 at 09:09:50PM +0000, Dave Jones wrote:
> On Mon, Mar 15, 2004 at 03:15:17PM +0100, Dominik Brodowski wrote:
>  > @@ -265,6 +272,12 @@
>  >  		ebx = cpuid_ebx(0x00000001);
>  >  
>  >  		ebx &= 0x000000FF;
>  > +
>  > +		/* Arjan reported a strange mobile PIII-M where ebx is
>  > +		   0x07 */
>  > +		if ((ebx == 0x07) && relaxed_check)
>  > +			return SPEEDSTEP_PROCESSOR_PIII_T;
>  > +
>  >  		if (ebx != 0x06)
>  >  			return 0;
> 
> Any reason we can't just check the ebx==0x07, guarded with appropriate
> checks on model/stepping/brand ? The relaxed_check stuff does seem quite ugly to me.

First of all, this hunk isn't there in the last revision of the patch [also
attached here for your convenience] as this was a workaround which falsely
enabled SpeedStep on a Celeron, and running SpeedStep on Celerons might
cause hardware damage.

For the other "relaxed_check": An Intel document says that all 
SpeedStep-capable Coppermines succeed the check, and all 
non-SpeedStep-capable Coppermines fail the check -- see
http://www.intel.com/support/processors/sb/cs-003779-prd24.htm

So, Anders' CPU reports itself to be non-SpeedStep-capable. However,
SpeedStep runs fine on his CPU. We can't enable SpeedStep on all CPUs [even
of the same stepping (model/brand are the same anyway)] as we don't know if
all of them work fine if running SpeedStep on them -- or if it causes
(permanent) hardware failure! Some, who know it works from running a
different OS, and possibly a specific vendor-provided driver on their
notebook, might want to skip this test and try out their luck. But then they
know what they're doing, and that they're risking their own hardware.

	Dominik

A few SpeedStep-capable systems don't perform according to specification: the
CPUID and/or some MSRs don't tell us the CPU is SpeedStep capable even though
it definitely is. Allow a relaxed checking for one such issue by a module 
parameter only available if a config option is turned on. This is done to 
avoid the risk of doing invalid speedstep instructions on systems which do 
not support it, and which might even lead to (hardware) failure.

Patch originally from Anders Eriksson - aeriksson at fastmail (dot) fm

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig linux/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-original/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-03-15 20:39:02.713752552 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/Kconfig	2004-03-15 19:50:16.000000000 +0100
@@ -176,6 +176,16 @@
 	depends on (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
 	default (X86_SPEEDSTEP_ICH || X86_SPEEDSTEP_SMI || X86_P4_CLOCKMOD)
 
+config X86_SPEEDSTEP_RELAXED_CAP_CHECK
+	bool "Relaxed speedstep capability checks"
+	depends on (X86_SPEEDSTEP_SMI || X86_SPEEDSTEP_ICH)
+	help
+	  Don't perform all checks for a speedstep capable system which would 
+	  normally be done. Some ancient or strange systems, though speedstep 
+	  capable, don't always indicate that they are speedstep capable. This 
+	  option let's the probing code bypass some of those checks if the
+	  parameter "relaxed_check=1" is passed to the module.
+
 config X86_LONGRUN
 	tristate "Transmeta LongRun"
 	depends on CPU_FREQ
diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-15 20:39:02.737748904 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-15 20:39:41.176905264 +0100
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
@@ -265,6 +272,7 @@
 		ebx = cpuid_ebx(0x00000001);
 
 		ebx &= 0x000000FF;
+
 		if (ebx != 0x06)
 			return 0;
 
@@ -292,7 +300,7 @@
 		 */
 		rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
 		dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
-		if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
+		if ((msr_hi & (1<<18)) && (relaxed_check ? 1 : (msr_hi & (3<<24)))) {
 			if (c->x86_mask == 0x01)
 				return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
 			else
@@ -362,6 +370,11 @@
 }
 EXPORT_SYMBOL_GPL(speedstep_get_freqs);
 
+#ifdef CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK
+module_param(relaxed_check, int, 0444);
+MODULE_PARM_DESC(relaxed_check, "Don't do all checks for speedstep capability.");
+#endif
+
 MODULE_AUTHOR ("Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION ("Library for Intel SpeedStep 1 or 2 cpufreq drivers.");
 MODULE_LICENSE ("GPL");
