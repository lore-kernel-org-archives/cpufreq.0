From: Dominik Brodowski <linux@brodo.de>
Subject: Re: patch for P4 TSC problem
Date: Thu, 4 Dec 2003 19:23:08 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031204182308.GC4475@brodo.de>
References: <571ACEFD467F7749BC50E0A98C17CDD8D5FE20@pdsmsx403.ccr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <571ACEFD467F7749BC50E0A98C17CDD8D5FE20@pdsmsx403.ccr.corp.intel.com>
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
To: "Li, Shaohua" <shaohua.li@intel.com>
Cc: johnstul@us.ibm.com, cpufreq@www.linux.org.uk

Hi,

On Thu, Dec 04, 2003 at 04:47:30PM +0800, Li, Shaohua wrote:
> TSC frequency doesn't change under P4 and above when CPU frequency
> changes, which caused some problems. Attached patch will handle this
> problem. How about it?

That information is fantastic. Finally the cause of the "lost-ticks" 
which appears on P4 processors is known. 

About the patch: Because of a few, partly unrelated reasons, namely
- cpufreq_register_notifier() shouldn't be called during time_init() 
	because it shouldn't be called while we're in atomic context
- the p4 detection code should only be used when cpufreq is used
- also cyc2us and loops_per_jiffy are affected (I think)
- the patch had an invalid header
I'd prefer the patch posted below.

	Dominik


--- linux/arch/i386/kernel/timers/timer_tsc.c.original	2003-12-04 19:12:23.386582200 +0100
+++ linux/arch/i386/kernel/timers/timer_tsc.c	2003-12-04 19:21:07.494905624 +0100
@@ -306,9 +306,17 @@
 }
 #endif
 
+
 #ifdef CONFIG_CPU_FREQ
+/* If the CPU frequency is scaled, TSC-based delays will need a different
+ * loops_per_jiffy value to function properly. An exception to this
+ * are modern Intel Pentium 4 processors, where the TSC runs at a constant
+ * speed independent of frequency scaling. 
+ */
+
 static unsigned int  ref_freq = 0;
 static unsigned long loops_per_jiffy_ref = 0;
+static unsigned int  variable_tsc = 1;
 
 #ifndef CONFIG_SMP
 static unsigned long fast_gettimeoffset_ref = 0;
@@ -333,12 +341,15 @@
 
 	if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
 	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new)) {
-		cpu_data[freq->cpu].loops_per_jiffy = cpufreq_scale(loops_per_jiffy_ref, ref_freq, freq->new);
+		if (variable_tsc)
+			cpu_data[freq->cpu].loops_per_jiffy = cpufreq_scale(loops_per_jiffy_ref, ref_freq, freq->new);
 #ifndef CONFIG_SMP
 		if (use_tsc) {
-			fast_gettimeoffset_quotient = cpufreq_scale(fast_gettimeoffset_ref, freq->new, ref_freq);
 			cpu_khz = cpufreq_scale(cpu_khz_ref, ref_freq, freq->new);
-			set_cyc2ns_scale(cpu_khz/1000);
+			if (variable_tsc) {
+				fast_gettimeoffset_quotient = cpufreq_scale(fast_gettimeoffset_ref, freq->new, ref_freq);
+				set_cyc2ns_scale(cpu_khz/1000);
+			}
 		}
 #endif
 	}
@@ -350,7 +361,19 @@
 static struct notifier_block time_cpufreq_notifier_block = {
 	.notifier_call	= time_cpufreq_notifier
 };
-#endif
+
+
+static int __init cpufreq_tsc(void)
+{
+	/* P4 and above CPU TSC freq doesn't change when CPU frequency changes*/
+	if ((boot_cpu_data.x86 >= 15) && (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
+		variable_tsc_freq = 0;
+
+	return cpufreq_register_notifier(&time_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
+}
+core_initcall(cpufreq_tsc);
+
+#endif 
 
 
 static int __init init_tsc(char* override)
@@ -392,10 +415,6 @@
  	 *	some CPU's have a TSC. Thats never worked and nobody has
  	 *	moaned if you have the only one in the world - you fix it!
  	 */
- 
-#ifdef CONFIG_CPU_FREQ
-	cpufreq_register_notifier(&time_cpufreq_notifier_block, CPUFREQ_TRANSITION_NOTIFIER);
-#endif
 
 	count2 = LATCH; /* initialize counter for mark_offset_tsc() */
