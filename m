From: Pavel Machek <pavel@ucw.cz>
Subject: powernow-k8, more updates
Date: Wed, 17 Mar 2004 13:04:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040317120409.GA482@elf.ucw.cz>
References: <99F2150714F93F448942F9A9F112634C1126A014@txexmtae.amd.com>
	<20040317100745.GA15284@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040317100745.GA15284@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi!

[Cc-ed cpufreq list again]

Here are few typo fixes [I believe they are applicable to dominik's
latest version]; I cleaned up puinfo_x86 stuff in check_supported_cpu
(no ifdefs any more!) and introduced fill_powernow_table helper. It
makes code nicer, and makes overriding tables way easier (and you get
all the normal checks for your overrident table, so its harder to mess
it up). Notice that values are now for my arima (1.8GHz), and I
basically guessed them, Paul might have better values. Oh and I now
print out frequencies to the user, so that dmesg output is
informative.

Please apply,
								Pavel

--- clean-mm/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-03-17 11:51:48.000000000 +0100
+++ linux-mm/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-03-17 12:58:11.000000000 +0100
@@ -7,7 +7,7 @@
  *  Support : paul.devriendt@amd.com
  *
  *  Based on the powernow-k7.c module written by Dave Jones.
- *  (C) 2003 Dave Jones <davej@codemonkey.ork.uk> on behalf of SuSE Labs
+ *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs
  *  (C) 2004 Dominik Brodowski <linux@brodo.de>
  *  (C) 2004 Pavel Machek <pavel@suse.cz>
  *  Licensed under the terms of the GNU GPL License version 2.
@@ -44,7 +44,7 @@
 #define DEBUG
 
 #define PFX "powernow-k8: "
-#define VERSION "version 1.20.06paul - March 16th, 2004"
+#define VERSION "version 1.20.06pavel - March 17th, 2004"
 #include "powernow-k8.h"
 
 /* serialize freq changes  */
@@ -118,7 +118,7 @@
 	return;
 }
 
-/* the voltage stabalization time */
+/* the voltage stabilization time */
 static inline void count_off_vst(struct powernow_k8_data *data)
 {
 	udelay(data->vstable * VST_UNITS_20US);
@@ -413,16 +413,9 @@
 static inline int check_supported_cpu(unsigned int cpu)
 {
 	cpumask_t oldmask = CPU_MASK_ALL;
-#ifdef CONFIG_SMP
-	struct cpuinfo_x86 *c = &cpu_data[cpu];
-#endif
-	struct cpuinfo_x86 *c = cpu_data;
 	u32 eax, ebx, ecx, edx;
 	unsigned int rc = 0;
 
-	if (c->x86_vendor != X86_VENDOR_AMD)
-		return 0;
-
 	oldmask = current->cpus_allowed;
 	set_cpus_allowed(current, cpumask_of_cpu(cpu));
 	schedule();
@@ -432,6 +425,9 @@
 		goto out;
 	}
 
+	if (current_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		goto out;
+
 	eax = cpuid_eax(CPUID_PROCESSOR_SIGNATURE);
 	if ((eax & CPUID_XFAM_MOD) == ATHLON64_XFAM_MOD) {
 		dprintk(KERN_DEBUG PFX "AMD Althon 64 Processor found\n");
@@ -461,8 +457,7 @@
  out:
 	set_cpus_allowed(current, oldmask);
 	schedule();
-
-	return (rc);
+	return rc;
 }
 
 static int check_pst_table(struct powernow_k8_data *data, struct pst_s *pst, u8 maxvid)
@@ -502,13 +497,62 @@
 	return 0;
 }
 
+static inline int fill_powernow_table(struct powernow_k8_data *data, struct pst_s *pst, u8 maxvid)
+{
+	struct cpufreq_frequency_table *powernow_table;
+	unsigned int j;
+
+	if (data->batps)
+		printk(KERN_INFO PFX "only %d pstates on battery\n", data->batps);
+
+	if (data->numps < 2) {
+		printk(KERN_ERR PFX "no p states to transition\n");
+		return -ENODEV;
+	}
+
+	if (check_pst_table(data, pst, maxvid))
+		return -EINVAL;
+
+	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) 
+				  * (data->numps + 1)), GFP_KERNEL);
+	if (!powernow_table) {
+		printk(KERN_ERR PFX "powernow_table memory alloc failure\n");
+		return -ENOMEM;
+	}
+
+	for (j = 0; j < data->numps; j++) {
+		powernow_table[j].index = pst[j].fid; /* lower 8 bits */
+		powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
+		powernow_table[j].frequency = find_khz_freq_from_fid(pst[j].fid);
+
+		printk(KERN_INFO PFX "   %d : fid %x (%d MHz), vid %x\n", j,
+		       pst[j].fid, powernow_table[j].frequency/1000, pst[j].vid);
+
+	}
+	powernow_table[data->numps].frequency = CPUFREQ_TABLE_END;
+	powernow_table[data->numps].index = 0;
+
+	if (query_current_values_with_pending_wait(data)) {
+		kfree(powernow_table);
+		return -EIO;
+	}
+
+	printk(KERN_INFO PFX "cfid %x, cvid %x\n", data->currfid, data->currvid);
+	data->powernow_table = powernow_table;
+
+	for (j = 0; j < data->numps; j++)
+		if ((pst[j].fid==data->currfid) && (pst[j].vid==data->currvid))
+			return 0;
+
+	printk(KERN_ERR PFX "currfid/vid do not match PST, ignoring\n");
+	return 0;
+}
+
 /* Find and validate the PSB/PST table in BIOS. */
 static inline int find_psb_table(struct powernow_k8_data *data)
 {
-	struct cpufreq_frequency_table *powernow_table;
 	struct psb_s *psb;
-	struct pst_s *pst;
-	unsigned int i, j;
+	unsigned int i;
 	u32 mvs;
 	u8 maxvid;
 
@@ -545,10 +589,6 @@
 		data->vidmvs = 1 << mvs;
 		data->batps = ((psb->flags2) >> 6) & 3;
 
-		if (data->batps)
-			printk(KERN_INFO PFX "only %d pstates on battery\n",
-                               data->batps );
-
 		dprintk(KERN_INFO PFX "ramp voltage offset: %d\n", data->rvo);
 		dprintk(KERN_INFO PFX "isochronous relief time: %d\n", data->irt);
 		dprintk(KERN_INFO PFX "maximum voltage step: %d - %x\n",
@@ -569,100 +609,38 @@
 
 		data->numps = psb->numpstates;
 		dprintk(KERN_INFO PFX "numpstates: %x\n", data->numps);
-		if (data->numps < 2) {
-			printk(KERN_ERR PFX "no p states to transition\n");
-			return -ENODEV;
-		}
-
-		pst = (struct pst_s *)(psb + 1);
-		if (check_pst_table(data, pst, maxvid))
-			return -EINVAL;
-
-		powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) 
-					  * (data->numps + 1)), GFP_KERNEL);
-		if (!powernow_table) {
-			printk(KERN_ERR PFX "powernow_table memory alloc failure\n");
-			return -ENOMEM;
-		}
 
-		for (j = 0; j < data->numps; j++) {
-			printk(KERN_INFO PFX "   %d : fid %x, vid %x\n", j,
-				       pst[j].fid, pst[j].vid);
-
-			powernow_table[j].index = pst[j].fid; /* lower 8 bits */
-			powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
-			powernow_table[j].frequency = find_khz_freq_from_fid(pst[j].fid);
-
-		}
-		powernow_table[data->numps].frequency = CPUFREQ_TABLE_END;
-		powernow_table[data->numps].index = 0;
-
-		if (query_current_values_with_pending_wait(data)) {
-			kfree(powernow_table);
-			return -EIO;
-		}
-
-		printk(KERN_INFO PFX "cfid %x, cvid %x\n", data->currfid, data->currvid);
-		data->powernow_table = powernow_table;
-
-		for (j = 0; j < data->numps; j++)
-			if ((pst[j].fid==data->currfid) && (pst[j].vid==data->currvid))
-				return 0;
-
-		printk(KERN_ERR PFX "currfid/vid do not match PST, ignoring\n");
-		return 0;
+		return fill_powernow_table(data, (struct pst_s *)(psb + 1), maxvid);
 	}
 
 	printk(KERN_ERR PFX "BIOS error - no PSB\n");
 
 #if 0
+ override:
         /*
 	 * hack for machines without a PSB - as an example values for
-	 * 2.0/1.8/0.8 GHz are hardcoded. You need to assert that these
+	 * 1.8/1.6/0.8 GHz are hardcoded. You need to assert that these
 	 * values are correct and supported by your CPU / motherboard
+	 *
+	 * Use at your own risk.
 	 */
-	/* use this hack at your own risk                             */
+	printk(KERN_ALERT PFX "Overriding BIOS provided tables with hardcoded values\n");
+
 	data->vstable = 5;
 	data->rvo = 2;
 	data->irt = 2;
 	mvs = 1;
 	data->vidmvs = 1 << mvs;
-	data->batps = data->numps = 3;
+	data->batps = 0;
+	data->numps = 3;
 	data->plllock = 2;
 
-	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table)
-				  * (data->numps + 1)), GFP_KERNEL);
-	if (!powernow_table)
-		return -ENOMEM;
-
-        powernow_table[0].index = 0x00;        /* 800 MHz */
-        powernow_table[0].index |= 0x12 << 8;  /* 1.100v */
-
-        powernow_table[0].frequency = find_khz_freq_from_fid(powernow_table[0].index & 0x0f );
-
-        powernow_table[1].index = 0x0a;        /* 1.8 GHz */
-        powernow_table[1].index |= 0x03 << 8;  /* 1.475v */
-
-        powernow_table[1].frequency = find_khz_freq_from_fid(powernow_table[1].index & 0x0f );
-
-        powernow_table[2].index = 0x0c;        /* 2.0 GHz */
-        powernow_table[2].index |= 0x02 << 8;  /* 1.500v */
-
-        powernow_table[2].frequency =  find_khz_freq_from_fid(powernow_table[2].index & 0x0f );
-
-	powernow_table[data->numps].frequency = CPUFREQ_TABLE_END;
-	powernow_table[data->numps].index = 0;
-
-	if (query_current_values_with_pending_wait(data)) {
-		kfree(powernow_table);
-		return 1;
+	{
+		struct pst_s override[3] = {{ .vid = 0x10, .fid = 0x00 },
+					    { .vid = 0x03, .fid = 0x08 },
+					    { .vid = 0x02, .fid = 0x0a }};
+		return fill_powernow_table(data, override, 0);
 	}
-	printk(KERN_INFO PFX "currfid %x, currvid %x\n",
-	       data->currfid, data->currvid);
-
-	data->powernow_table = powernow_table;
-
-	return 0;
 #endif
 
 	return -ENODEV;
--- clean-mm/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2004-03-17 11:50:45.000000000 +0100
+++ linux-mm/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2004-03-17 12:05:35.000000000 +0100
@@ -98,7 +98,7 @@
 #define STOP_GRANT_5NS 1 /* min poss memory access latency for voltage change */
 #define PLL_LOCK_CONVERSION (1000/5) /* ms to ns, then divide by clock period */
 #define MAXIMUM_VID_STEPS 1  /* Current cpus only allow a single step of 25mV */
-#define VST_UNITS_20US 20   /* Voltage Stabalization Time is in units of 20us */
+#define VST_UNITS_20US 20   /* Voltage Stabilization Time is in units of 20us */
 
 /*
  * Most values of interest are enocoded in a single field of the _PSS
Binary files clean-mm/arch/i386/kernel/cpu/cpufreq/powernow-k8.o and linux-mm/arch/i386/kernel/cpu/cpufreq/powernow-k8.o differ



-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
