From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c,1.3,1.4 cpu-sa1110.c,1.9,1.10
Date: Tue, 19 Aug 2003 14:39:05 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6hV-0005kT-CB@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100
In directory flint:/tmp/cvs-serv22028/linux/arch/arm/mach-sa1100

Modified Files:
	cpu-sa1100.c cpu-sa1110.c 
Log Message:
sync with latest davej version

Index: cpu-sa1100.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1100.c,v
retrieving revision 1.3
retrieving revision 1.4
diff -u -r1.3 -r1.4
--- cpu-sa1100.c	22 Oct 2001 11:53:46 -0000	1.3
+++ cpu-sa1100.c	19 Aug 2003 13:38:31 -0000	1.4
@@ -90,9 +90,7 @@
 
 #include <asm/hardware.h>
 
-extern unsigned int sa11x0_freq_to_ppcr(unsigned int khz);
-extern unsigned int sa11x0_validatespeed(unsigned int khz);
-
+#include "generic.h"
 
 typedef struct {
 	int speed;
@@ -103,11 +101,11 @@
 } sa1100_dram_regs_t;
 
 
-
+static struct cpufreq_driver sa1100_driver;
 
 static sa1100_dram_regs_t sa1100_dram_settings[] =
 {
-	/* { mdcnfg, mdcas0, mdcas1, mdcas2 } */ /* clock frequency */
+	/* speed,     mdcnfg,     mdcas0,     mdcas1,     mdcas2  clock frequency */
 	{  59000, 0x00dc88a3, 0xcccccccf, 0xfffffffc, 0xffffffff }, /*  59.0 MHz */
 	{  73700, 0x011490a3, 0xcccccccf, 0xfffffffc, 0xffffffff }, /*  73.7 MHz */
 	{  88500, 0x014e90a3, 0xcccccccf, 0xfffffffc, 0xffffffff }, /*  88.5 MHz */
@@ -127,28 +125,25 @@
 	{ 0, 0, 0, 0, 0 } /* last entry */
 };
 
-
-
-
 static void sa1100_update_dram_timings(int current_speed, int new_speed)
 {
 	sa1100_dram_regs_t *settings = sa1100_dram_settings;
 
 	/* find speed */
-	while(settings->speed != 0) {
+	while (settings->speed != 0) {
 		if(new_speed == settings->speed)
 			break;
 		
 		settings++;
 	}
 
-	if(settings->speed == 0) {
+	if (settings->speed == 0) {
 		panic("%s: couldn't find dram setting for speed %d\n",
 		      __FUNCTION__, new_speed);
 	}
 
 	/* No risk, no fun: run with interrupts on! */
-	if(new_speed > current_speed) {
+	if (new_speed > current_speed) {
 		/* We're going FASTER, so first relax the memory
 		 * timings before changing the core frequency 
 		 */
@@ -181,61 +176,73 @@
 	}
 }
 
-
-
-
-static int sa1100_dram_notifier(struct notifier_block *nb, 
-				unsigned long val, void *data)
+static int sa1100_target(struct cpufreq_policy *policy,
+			 unsigned int target_freq,
+			 unsigned int relation)
 {
-	struct cpufreq_info *ci = data;
-	
-	switch(val) {
-	case CPUFREQ_MINMAX:
-		cpufreq_updateminmax(data, sa1100_dram_settings->speed, -1);
-		break;
+	unsigned int cur = sa11x0_getspeed();
+	unsigned int new_ppcr;
 
-	case CPUFREQ_PRECHANGE:
-		if(ci->new_freq > ci->old_freq)
-			sa1100_update_dram_timings(ci->old_freq, ci->new_freq);
+	struct cpufreq_freqs freqs;
+	switch(relation){
+	case CPUFREQ_RELATION_L:
+		new_ppcr = sa11x0_freq_to_ppcr(target_freq);
+		if (sa11x0_ppcr_to_freq(new_ppcr) > policy->max)
+			new_ppcr--;
 		break;
-
-	case CPUFREQ_POSTCHANGE:
-		if(ci->new_freq < ci->old_freq)
-			sa1100_update_dram_timings(ci->old_freq, ci->new_freq);
+	case CPUFREQ_RELATION_H:
+		new_ppcr = sa11x0_freq_to_ppcr(target_freq);
+		if ((sa11x0_ppcr_to_freq(new_ppcr) > target_freq) &&
+		    (sa11x0_ppcr_to_freq(new_ppcr - 1) >= policy->min))
+			mew_ppcr--;
 		break;
-		
-	default:
-		printk(KERN_INFO "%s: ignoring unknown notifier type (%ld)\n",
-		       __FUNCTION__, val);
 	}
 
-	return 0;
-}
+	freqs.old = cur;
+	freqs.new = sa11x0_ppcr_to_freq(new_ppcr);
+	freqs.cpu = 0;
 
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
 
+	if (freqs.new > cur)
+		sa1100_update_dram_timings(cur, freqs.new);
 
+	PPCR = new_ppcr;
 
-static struct notifier_block sa1100_dram_block = {
-	notifier_call: sa1100_dram_notifier,
-};
+	if (freqs.new < cur)
+		sa1100_update_dram_timings(cur, freqs.new);
 
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
 
-static void sa1100_setspeed(unsigned int khz)
-{
-	PPCR = sa11x0_freq_to_ppcr(khz);
+	return 0;
 }
 
-static int __init sa1100_dram_init(void)
+static int __init sa1100_cpu_init(struct cpufreq_policy *policy)
 {
-	int ret = -ENODEV;
-
-	if ((processor_id & CPU_SA1100_MASK) == CPU_SA1100_ID) {
-		ret = cpufreq_register_notifier(&sa1100_dram_block);
+	if (policy->cpu != 0)
+		return -EINVAL;
+	policy->cur = policy->min = policy->max = sa11x0_getspeed();
+	policy->policy = CPUFREQ_POLICY_POWERSAVE;
+	policy->cpuinfo.min_freq = 59000;
+	policy->cpuinfo.max_freq = 287000;
+	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	return 0;
+}
 
-		cpufreq_setfunctions(sa11x0_validatespeed, sa1100_setspeed);
-	}
+static struct cpufreq_driver sa1100_driver = {
+	.verify		= sa11x0_verify_speed,
+	.target		= sa1100_target,
+	.init		= sa1100_cpu_init,
+	.name		= "sa1100",
+};
 
-	return ret;
+static int __init sa1100_dram_init(void)
+{
+	cpufreq_gov_userspace_init();
+ 	if ((processor_id & CPU_SA1100_MASK) == CPU_SA1100_ID)
+		return cpufreq_register_driver(&sa1100_driver);
+	else
+		return -ENODEV;
 }
 
-__initcall(sa1100_dram_init);
+arch_initcall(sa1100_dram_init);

Index: cpu-sa1110.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/arm/mach-sa1100/cpu-sa1110.c,v
retrieving revision 1.9
retrieving revision 1.10
diff -u -r1.9 -r1.10
--- cpu-sa1110.c	6 Jul 2002 16:53:18 -0000	1.9
+++ cpu-sa1110.c	19 Aug 2003 13:38:32 -0000	1.10
@@ -24,14 +24,15 @@
 #include <linux/init.h>
 
 #include <asm/hardware.h>
+#include <asm/mach-types.h>
 #include <asm/io.h>
 #include <asm/system.h>
 
+#include "generic.h"
+
 #undef DEBUG
 
-extern unsigned int sa11x0_freq_to_ppcr(unsigned int khz);
-extern unsigned int sa11x0_validatespeed(unsigned int khz);
-extern unsigned int sa11x0_getspeed(void);
+static struct cpufreq_driver sa1110_driver;
 
 struct sdram_params {
 	u_char  rows;		/* bits				 */
@@ -50,53 +51,53 @@
 };
 
 static struct sdram_params tc59sm716_cl2_params __initdata = {
-	rows:		    12,
-	tck:		    10,
-	trcd:		    20,
-	trp:		    20,
-	twr:		    10,
-	refresh:	 64000,
-	cas_latency:	     2,
+	.rows			= 12,
+	.tck			= 10,
+	.trcd			= 20,
+	.trp			= 20,
+	.twr			= 10,
+	.refresh		= 64000,
+	.cas_latency		= 2,
 };
 
 static struct sdram_params tc59sm716_cl3_params __initdata = {
-	rows:		    12,
-	tck:		     8,
-	trcd:		    20,
-	trp:		    20,
-	twr:		     8,
-	refresh:	 64000,
-	cas_latency:	     3,
+	.rows			= 12,
+	.tck			= 8,
+	.trcd			= 20,
+	.trp			= 20,
+	.twr			= 8,
+	.refresh		= 64000,
+	.cas_latency		= 3,
 };
 
 static struct sdram_params samsung_k4s641632d_tc75 __initdata = {
-	rows:		    14,
-	tck:		     9,
-	trcd:		    27,
-	trp:		    20,
-	twr:		     9,
-	refresh:	 64000,
-	cas_latency:	     3,
+	.rows			= 14,
+	.tck			= 9,
+	.trcd			= 27,
+	.trp			= 20,
+	.twr			= 9,
+	.refresh		= 64000,
+	.cas_latency		= 3,
 };
 
 static struct sdram_params samsung_km416s4030ct __initdata = {
-	rows:		    13,
-	tck:		     8,
-	trcd:		    24,	/* 3 CLKs */
-	trp:		    24,	/* 3 CLKs */
-	twr:		    16,	/* Trdl: 2 CLKs */
-	refresh:	 64000,
-	cas_latency:	     3,
+	.rows			= 13,
+	.tck			= 8,
+	.trcd			= 24,	/* 3 CLKs */
+	.trp			= 24,	/* 3 CLKs */
+	.twr			= 16,	/* Trdl: 2 CLKs */
+	.refresh		= 64000,
+	.cas_latency		= 3,
 };
 
 static struct sdram_params wbond_w982516ah75l_cl3_params __initdata = {
-	rows:		    16,
-	tck:		     8,
-	trcd:		    20,
-	trp:		    20,
-	twr:		     8,
-	refresh:	 64000,
-	cas_latency:	     3,
+	.rows			= 16,
+	.tck			= 8,
+	.trcd			= 20,
+	.trp			= 20,
+	.twr			= 8,
+	.refresh		= 64000,
+	.cas_latency		= 3,
 };
 
 static struct sdram_params sdram_params;
@@ -209,19 +210,39 @@
 }
 
 /*
- * Ok, set the CPU frequency.  Since we've done the validation
- * above, we can match for an exact frequency.  If we don't find
- * an exact match, we will to set the lowest frequency to be safe.
+ * Ok, set the CPU frequency.  
  */
-static void sa1110_setspeed(unsigned int khz)
+static int sa1110_target(struct cpufreq_policy *policy,
+			 unsigned int target_freq,
+			 unsigned int relation)
 {
 	struct sdram_params *sdram = &sdram_params;
+	struct cpufreq_freqs freqs;
 	struct sdram_info sd;
 	unsigned long flags;
 	unsigned int ppcr, unused;
 
-	ppcr = sa11x0_freq_to_ppcr(khz);
-	sdram_calculate_timing(&sd, khz, sdram);
+	switch(relation){
+	case CPUFREQ_RELATION_L:
+		ppcr = sa11x0_freq_to_ppcr(target_freq);
+		if (sa11x0_ppcr_to_freq(ppcr) > policy->max)
+			ppcr--;
+		break;
+	case CPUFREQ_RELATION_H:
+		ppcr = sa11x0_freq_to_ppcr(target_freq);
+		if (ppcr && (sa11x0_ppcr_to_freq(ppcr) > target_freq) &&
+		    (sa11x0_ppcr_to_freq(ppcr-1) >= policy->min))
+			ppcr--;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	freqs.old = sa11x0_getspeed();
+	freqs.new = sa11x0_ppcr_to_freq(ppcr);
+	freqs.cpu = 0;
+
+	sdram_calculate_timing(&sd, freqs.new, sdram);
 
 #if 0
 	/*
@@ -229,7 +250,7 @@
 	 * and errata, but they seem to work.  Need to get a storage
 	 * scope on to the SDRAM signals to work out why.
 	 */
-	if (khz < 147500) {
+	if (policy->max < 147500) {
 		sd.mdrefr |= MDREFR_K1DB2;
 		sd.mdcas[0] = 0xaaaaaa7f;
 	} else {
@@ -239,6 +260,9 @@
 	sd.mdcas[1] = 0xaaaaaaaa;
 	sd.mdcas[2] = 0xaaaaaaaa;
 #endif
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
+
 	/*
 	 * The clock could be going away for some time.  Set the SDRAMs
 	 * to refresh rapidly (every 64 memory clock cycles).  To get
@@ -256,7 +280,7 @@
 	 * the programming.
 	 */
 	local_irq_save(flags);
-	asm("mcr p15, 0, %0, c10, c4" : : "r" (0));
+	asm("mcr p15, 0, %0, c7, c10, 4" : : "r" (0));
 	udelay(10);
 	__asm__ __volatile__("
 		b	2f
@@ -281,9 +305,32 @@
 	/*
 	 * Now, return the SDRAM refresh back to normal.
 	 */
-	sdram_update_refresh(khz, sdram);
+	sdram_update_refresh(freqs.new, sdram);
+
+	cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
+
+	return 0;
 }
 
+static int __init sa1110_cpu_init(struct cpufreq_policy *policy)
+{
+	if (policy->cpu != 0)
+		return -EINVAL;
+	policy->cur = policy->min = policy->max = sa11x0_getspeed();
+	policy->policy = CPUFREQ_POLICY_POWERSAVE;
+	policy->cpuinfo.min_freq = 59000;
+	policy->cpuinfo.max_freq = 287000;
+	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
+	return 0;
+}
+
+static struct cpufreq_driver sa1110_driver = {
+	.verify		= sa11x0_verify_speed,
+	.target		= sa1110_target,
+	.init		= sa1110_cpu_init,
+	.name		= "sa1110",
+};
+
 static int __init sa1110_clk_init(void)
 {
 	struct sdram_params *sdram = NULL;
@@ -298,27 +345,19 @@
 		sdram = &samsung_km416s4030ct;
 
 	if (sdram) {
-		struct cpufreq_driver cpufreq_driver;
-
 		printk(KERN_DEBUG "SDRAM: tck: %d trcd: %d trp: %d"
 			" twr: %d refresh: %d cas_latency: %d\n",
 			sdram->tck, sdram->trcd, sdram->trp,
 			sdram->twr, sdram->refresh, sdram->cas_latency);
 
+		cpufreq_gov_userspace_init();
+ 
 		memcpy(&sdram_params, sdram, sizeof(sdram_params));
 
-		sa1110_setspeed(sa11x0_getspeed());
-
-		cpufreq_driver.freq.min = 59000;
-		cpufreq_driver.freq.max = 287000;
-		cpufreq_driver.freq.cur = sa11x0_getspeed();
-		cpufreq_driver.validate = &sa11x0_validatespeed;
-		cpufreq_driver.setspeed = &sa1110_setspeed;
-
-		return cpufreq_register(cpufreq_driver);
+		return cpufreq_register_driver(&sa1110_driver);
 	}
 
 	return 0;
 }
 
-__initcall(sa1110_clk_init);
+arch_initcall(sa1110_clk_init);
