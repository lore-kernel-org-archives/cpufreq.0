From: Sean Young <sean@mess.org>
Subject: Re: [PATCH] AMD Elan SC520 cpufreq driver
Date: Sun, 3 Apr 2005 18:27:01 +0200
Message-ID: <20050403162700.GA21169@levin.pad.mess.org>
References: <20050329213658.GA12868@levin.pad.mess.org>
	<20050329220432.GA4018@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050329220432.GA4018@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@ZenII.linux.org.uk

On Wed, Mar 30, 2005 at 12:04:32AM +0200, Dominik Brodowski wrote:
> > +#include <linux/slab.h>
> 
> What do you need slab.h for?

-snip-

Thanks for the input. Here is a patch against the latest snapshot
(cpufreq-2005-04-03.diff) which fixes the issues.


Sean

diff -urpN linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig /tmp/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig
--- linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig	2005-04-03 18:21:00.652590000 +0200
+++ /tmp/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/Kconfig	2005-04-03 17:52:41.949832072 +0200
@@ -23,7 +23,7 @@ config X86_ACPI_CPUFREQ
 	  If in doubt, say N.
 
 config ELAN_CPUFREQ
-	tristate "AMD Elan SC500 and SC410"
+	tristate "AMD Elan SC400 and SC410"
 	select CPU_FREQ_TABLE
 	depends on X86_ELAN
 	---help---
diff -urpN linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c /tmp/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c
--- linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c	2005-04-03 18:21:00.709581336 +0200
+++ /tmp/linux-2.6.9/arch/i386/kernel/cpu/cpufreq/sc520_freq.c	2005-04-03 17:52:58.789272088 +0200
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/init.h>
 
-#include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/cpufreq.h>
 
@@ -25,11 +24,13 @@
 #include <asm/timex.h>
 #include <asm/io.h>
 
-#define MMCR_BASE       0xfffef000      /* The default base address */
+#define MMCR_BASE	0xfffef000	/* The default base address */
 #define OFFS_CPUCTL	0x2   /* CPU Control Register */
 
 static __u8 __iomem *cpuctl;
 
+#define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "sc520_freq", msg)
+
 static struct cpufreq_frequency_table sc520_freq_table[] = {
 	{0x01,	100000},
 	{0x02,	133000},
@@ -53,7 +54,8 @@ static unsigned int sc520_freq_get_cpu_f
 static void sc520_freq_set_cpu_state (unsigned int state)
 {
 
-	struct cpufreq_freqs    freqs;
+	struct cpufreq_freqs	freqs;
+	u8 clockspeed_reg;
 
 	freqs.old = sc520_freq_get_cpu_frequency(0);
 	freqs.new = sc520_freq_table[state].frequency;
@@ -61,10 +63,15 @@ static void sc520_freq_set_cpu_state (un
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
-	printk(KERN_INFO "sc520_freq: attempting to set frequency to %i kHz\n",
+	dprintk("attempting to set frequency to %i kHz\n",
 			sc520_freq_table[state].frequency);
 
-	*cpuctl = sc520_freq_table[state].index;
+	local_irq_disable();
+
+	clockspeed_reg = *cpuctl & ~0x03;
+	*cpuctl = clockspeed_reg | sc520_freq_table[state].index;
+
+	local_irq_enable();
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 };
@@ -105,14 +112,14 @@ static int sc520_freq_cpu_init(struct cp
 
 	/* cpuinfo and default policy values */
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
-	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	policy->cpuinfo.transition_latency = 1000; /* 1ms */
 	policy->cur = sc520_freq_get_cpu_frequency(0);
 
 	result = cpufreq_frequency_table_cpuinfo(policy, sc520_freq_table);
 	if (result)
 		return (result);
 
-        cpufreq_frequency_table_get_attr(sc520_freq_table, policy->cpu);
+	cpufreq_frequency_table_get_attr(sc520_freq_table, policy->cpu);
 
 	return 0;
 }
@@ -148,10 +155,10 @@ static int __init sc520_freq_init(void)
 	struct cpuinfo_x86 *c = cpu_data;
 
 	/* Test if we have the right hardware */
-	if (c->x86_vendor != X86_VENDOR_AMD ||
-		c->x86 != 4 || c->x86_model != 9) {
-		printk(KERN_INFO "sc520_freq: error: no Elan SC520 processor found!\n");
-                return -ENODEV;
+	if(c->x86_vendor != X86_VENDOR_AMD ||
+				c->x86 != 4 || c->x86_model != 9) {
+		dprintk("no Elan SC520 processor found!\n");
+		return -ENODEV;
 	}
 	cpuctl = ioremap((unsigned long)(MMCR_BASE + OFFS_CPUCTL), 1);
 	if(!cpuctl) {
