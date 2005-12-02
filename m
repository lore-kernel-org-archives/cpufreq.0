From: Felix Braun <Felix.Braun@mail.mcgill.ca>
Subject: [PATCH 2.6.14] cpufreq: don't suggest speedstep-centrino for
 Dothan-based Celeron-M processors
Date: Fri, 2 Dec 2005 14:57:11 +0100
Message-ID: <20051202145711.33191cef@tilion.getrex.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq@lists.linux.org.uk

Hi there,

I recently bought a laptop which is reported by Intel's CPUid tool as a
Celeron-M 373. Linux identifies this processor like this (/proc/cpuinfo)

processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 13
model name	: Intel(R) Celeron(R) M processor         1.00GHz
stepping	: 8
cpu MHz		: 999.915
cache size	: 512 KB
fdiv_bug	: no
hlt_bug		: no
f00f_bug	: no
coma_bug	: no
fpu		: yes
fpu_exception	: yes
cpuid level	: 2
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr
pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe
bogomips	: 2001.80

I would like to use CPU frequency scaling to increase my battery life. As
this processor can't do EnhancedSpeedStep (Celerons seem to be unable to
do so in general) I've been using the p4-clockmod driver.

However, as my processor is based on the Dothan architecture (cpu_family
6, model 13), I get a warning that I should use speedstep_centrino
instead. This warning is misleading because I have a Celeron. Therefore, I
suggest the following patch to silence this warning.

================
We only have a Pentium-M (Dothan) if the cache size is 2048K. Don't print
the warning for Dothan-based Celeron-M processors which have a cache size
of 512K or 1024K.

Signed-off-by: Felix Braun <Felix.Braun@mail.McGill.ca>

--- a/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c  2005-12-01 23:47:01 +0100
+++ b/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c  2005-12-01 23:50:11 +0100
@@ -171,7 +171,8 @@
                return speedstep_get_processor_frequency(SPEEDSTEP_PROCESSOR_PM);
        }
 
-       if ((c->x86 == 0x06) && (c->x86_model == 0x0D)) {
+       if ((c->x86 == 0x06) && (c->x86_model == 0x0D)
+                       && (c->x86_cache_size == 2048)) {
                /* Pentium M (Dothan) */
                printk(KERN_WARNING PFX "Warning: Pentium M detected. "
                       "The speedstep_centrino module offers voltage scaling"
