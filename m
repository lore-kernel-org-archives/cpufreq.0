From: Pavel Machek <pavel@ucw.cz>
Subject: powernow-k8 updates
Date: Fri, 26 Mar 2004 13:01:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040326120151.GA3102@elf.ucw.cz>
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
To: linux@dominikbrodowski.de, paul.devriendt@amd.com, Cpufreq mailing list <cpufreq@www.linux.org.uk>

Hi!

Few updates, enable ACPI, add common printing function, fix typo, move
"pst out of sequence" where it belongs, fix formating in
powernow-k8.h. I'm not quite sure what this is against, so this is
"eyes only".
								Pavel

--- tmp/linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-03-26 12:51:45.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	2004-03-26 12:28:01.000000000 +0100
@@ -33,6 +33,9 @@
 #include <asm/io.h>
 #include <asm/delay.h>
 
+#ifdef CONFIG_ACPI
+#define CONFIG_X86_POWERNOW_K8_ACPI
+#endif
 #ifdef CONFIG_X86_POWERNOW_K8_ACPI
 
 #include <linux/acpi.h>
@@ -42,7 +45,7 @@
 
 
 #define PFX "powernow-k8: "
-#define VERSION "version 1.20.07 - March 18, 2004"
+#define VERSION "version 1.20.08b - March 20, 2004"
 #include "powernow-k8.h"
 
 /* serialize freq changes  */
@@ -63,6 +66,12 @@
 	return 1000 * find_freq_from_fid(fid);
 }
 
+/* Return a voltage in miliVolts, given an input vid */
+static inline u32 find_milivolts_from_vid(struct powernow_k8_data *data, u32 vid)
+{
+	return 1550-vid*25;
+}
+
 /* Return the vco fid for an input fid */
 static u32 convert_fid_to_vco_fid(u32 fid)
 {
@@ -498,16 +507,36 @@
 	return 0;
 }
 
+static void print_basics(struct powernow_k8_data *data)
+{
+	int j;
+	for (j = 0; j < data->numps; j++) {
+		printk(KERN_INFO PFX "   %d : fid %x (%d MHz), vid %x (%d mV)\n", j,
+		       data->powernow_table[j].index & 0xff, 
+		       data->powernow_table[j].frequency/1000, 
+		       data->powernow_table[j].index >> 8, 
+		       find_milivolts_from_vid(data, data->powernow_table[j].index >> 8));
+	}
+	if (data->batps)
+		printk(KERN_INFO PFX "Only %d pstates on battery\n", data->batps);
+}
+
 static inline int fill_powernow_table(struct powernow_k8_data *data, struct pst_s *pst, u8 maxvid)
 {
 	struct cpufreq_frequency_table *powernow_table;
 	unsigned int j;
 
 	if (data->batps) {    /* use ACPI support to get full speed on mains power */
-		printk(KERN_INFO PFX "only %d pstates on battery\n", data->batps);
+		printk(KERN_WARNING PFX "Only %d pstates usable (use ACPI driver for full range\n", data->batps);
 		data->numps = data->batps;
 	}
 
+	for ( j=1; j<data->numps; j++ )
+		if (pst[j-1].fid >= pst[j].fid) {
+			printk(KERN_ERR PFX "PST out of sequence\n");
+			return -EINVAL;
+		}
+
 	if (data->numps < 2) {
 		printk(KERN_ERR PFX "no p states to transition\n");
 		return -ENODEV;
@@ -527,10 +556,6 @@
 		powernow_table[j].index = pst[j].fid; /* lower 8 bits */
 		powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
 		powernow_table[j].frequency = find_khz_freq_from_fid(pst[j].fid);
-
-		printk(KERN_INFO PFX "   %d : fid %x (%d MHz), vid %x\n", j,
-		       pst[j].fid, powernow_table[j].frequency/1000, pst[j].vid);
-
 	}
 	powernow_table[data->numps].frequency = CPUFREQ_TABLE_END;
 	powernow_table[data->numps].index = 0;
@@ -540,14 +565,15 @@
 		return -EIO;
 	}
 
-	printk(KERN_INFO PFX "cfid %x, cvid %x\n", data->currfid, data->currvid);
+	dprintk(KERN_INFO PFX "cfid %x, cvid %x\n", data->currfid, data->currvid);
 	data->powernow_table = powernow_table;
+	print_basics(data);
 
 	for (j = 0; j < data->numps; j++)
 		if ((pst[j].fid==data->currfid) && (pst[j].vid==data->currvid))
 			return 0;
 
-	printk(KERN_ERR PFX "currfid/vid do not match PST, ignoring\n");
+	dprintk(KERN_ERR PFX "currfid/vid do not match PST, ignoring\n");
 	return 0;
 }
 
@@ -616,6 +642,17 @@
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
 
+	/*
+	 * If you see this message, complain to BIOS manufacturer. If
+	 * he tells you "we do not support Linux" or some similar
+	 * nonsense, remember that Windows 2000 uses the same legacy
+	 * mechanism that the old Linux PSB driver uses. Tell them it
+	 * is broken with Windows 2000.
+	 *
+	 * The reference to the AMD documentation is chapter 9 in the
+	 * BIOS and Kernel Developer's Guide, which is available on
+	 * www.amd.com
+	 */
 	printk(KERN_ERR PFX "BIOS error - no PSB\n");
 
 #if 1
@@ -632,17 +669,17 @@
 	data->irt = 2;
 	mvs = 1;
 	data->vidmvs = 1 << mvs;
-	data->batps = 3;
-	data->numps = 3;
+	data->batps = 4;
+	data->numps = 4;
 	data->plllock = 2;
 	{
-		struct pst_s override[3] = {{ .vid = 0x12, .fid = 0x00 },   /* 0.8GHz @ 1.100v */
+		struct pst_s override[4] = {{ .vid = 0x12, .fid = 0x00 },   /* 0.8GHz @ 1.100v */
 					    { .vid = 0x06, .fid = 0x08 },   /* 1.6GHz @ 1.400v */
-					    { .vid = 0x02, .fid = 0x0a }};  /* 1.8GHz @ 1.500v */
+					    { .vid = 0x04, .fid = 0x0a },   /* 1.8GHz @ 1.450v */
+					    { .vid = 0x02, .fid = 0x0c }};  /* 2.0GHz @ 1.500v */
 		return fill_powernow_table(data, override, 0);
  	}
 #endif
-
 	return -ENODEV;
 }
 
@@ -664,6 +701,7 @@
 static int powernow_k8_cpu_init_acpi(struct powernow_k8_data *data) 
 { 
 	int i;
+	int cntlofreq = 0;
 	struct cpufreq_frequency_table *powernow_table;
 
 	if (acpi_processor_register_performance(&data->acpi_data, data->cpu)) {
@@ -683,8 +721,6 @@
 		goto err_out;
 	}
 
-	/* FIXME: more tests? */
-
 	/* fill in data->powernow_table */
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) 
 				  * (data->acpi_data.state_count + 1)), GFP_KERNEL);
@@ -704,12 +740,19 @@
 		powernow_table[i].frequency = find_khz_freq_from_fid(fid);
 
 		/* verify frequency is OK */
-		if (powernow_table[i].frequency > (MAX_FREQ * 1000)) {
+		if ((powernow_table[i].frequency > (MAX_FREQ * 1000)) ||
+		    (powernow_table[i].frequency < (MIN_FREQ * 1000))) {
 			dprintk(KERN_INFO PFX "invalid freq %u kHz\n", powernow_table[i].frequency);
 			powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
 			continue;
 		}
 
+		/* verify only 1 entry from the lo frequency table */
+		if ((fid < HI_FID_TABLE_BOTTOM) && (cntlofreq++)) {
+			printk(KERN_ERR PFX "Too many lo freq table entries\n");
+			goto err_out;
+		}
+
 		if (powernow_table[i].frequency != (data->acpi_data.states[i].core_frequency * 1000)) {
 			printk(KERN_INFO PFX "invalid freq entries %u kHz vs. %u kHz\n", 
 			       powernow_table[i].frequency, 
@@ -719,11 +762,13 @@
 		}
 	}
 	powernow_table[data->acpi_data.state_count].frequency = CPUFREQ_TABLE_END;
-
+	powernow_table[data->acpi_data.state_count].index = 0;
 	data->powernow_table = powernow_table;
 
 	/* fill in data */
 	data->numps = data->acpi_data.state_count;
+	print_basics(data);
+
 	powernow_k8_acpi_pst_values(data, 0);
 
 	return 0;
@@ -899,8 +944,7 @@
 
 	data->cpu = pol->cpu;
 
-	if (powernow_k8_cpu_init_acpi(data))
-	{
+	if (powernow_k8_cpu_init_acpi(data)) {
 		/* 
 		 * Use the PSB BIOS structure. This is only availabe on
 		 * an UP version, and is deprecated by AMD.
@@ -912,9 +956,8 @@
 			return -ENODEV;
 		}
 
-		if ((num_online_cpus() != 1) ||
-		    (num_possible_cpus() != 1)) {
-			printk(KERN_INFO PFX "multiprocessor systems not supported by PSB BIOS structure\n");
+		if ((num_online_cpus() != 1) || (num_possible_cpus() != 1)) {
+			printk(KERN_INFO PFX "MP systems not supported by PSB BIOS structure\n");
 			kfree(data);
 			return 0;
 		}
@@ -971,7 +1014,7 @@
 	}
 	cpufreq_frequency_table_get_attr(data->powernow_table, pol->cpu);
 
-	printk(KERN_INFO PFX "init, curr fid %x vid %x\n", data->currfid, data->currvid);
+	dprintk(KERN_INFO PFX "init, curr fid %x vid %x\n", data->currfid, data->currvid);
 
 	powernow_data[pol->cpu] = data;
 
@@ -1017,7 +1060,6 @@
 	.attr = powernow_k8_attr,
 };
 
-
 /* driver entry point for init */
 static int __init powernowk8_init(void)
 {
@@ -1031,7 +1073,8 @@
 	}
 
 	if (supported_cpus == num_online_cpus()) {
-		printk(KERN_INFO PFX "Found %d AMD Athlon 64 / Opteron processors (" VERSION ")\n", supported_cpus);
+		printk(KERN_INFO PFX "Found %d AMD Athlon 64 / Opteron processors (" VERSION ")\n",
+		       supported_cpus);
 		return cpufreq_register_driver(&cpufreq_amd64_driver);
 	}
 
--- tmp/linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2004-03-26 12:51:45.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	2004-03-26 12:44:27.000000000 +0100
@@ -6,36 +6,32 @@
  */
 
 struct powernow_k8_data {
-	unsigned int			cpu;
+	unsigned int	cpu;
 
-	u32				numps;	/* number of p-states */
-	u32				batps; 	/* number of p-states 
-						 * supported on battery */
+	u32	numps;	/* number of p-states */
+	u32	batps; 	/* number of p-states supported on battery */
 
 	/* these values are constant when the PSB is used to determine
 	 * vid/fid pairings, but are modified during the ->target() call
 	 * when ACPI is used */
-	u32				rvo;	/* ramp voltage offset */
-	u32				irt;	/* isochronous relief time */
-	u32				vidmvs;	/* usable value calculated 
-						 * from mvs */
-	u32				vstable;/* voltage stabilization time, 
-						 * units 20 us */
-	u32 				plllock;/* pll lock time, 
-						 * units 1 us */
+	u32	rvo;	 /* ramp voltage offset */
+	u32	irt;	 /* isochronous relief time */
+	u32	vidmvs;	 /* usable value calculated from mvs */
+	u32	vstable; /* voltage stabilization time, units 20 us */
+	u32 	plllock; /* pll lock time, units 1 us */
 
 	/* keep track of the current fid / vid */
-	u32				currvid;
-	u32				currfid;
+	u32	currvid;
+	u32	currfid;
 
 	/* the powernow_table includes all frequency and vid/fid pairings:
 	 * fid are the lower 8 bits of the index, vid are the upper 8 bits.
 	 * frequency is in kHz */
 	struct cpufreq_frequency_table	*powernow_table;
 
+#ifdef CONFIG_X86_POWERNOW_K8_ACPI
 	/* the acpi table needs to be kept. it's only available if ACPI was
 	 * used to determine valid frequency/vid/fid states */
-#ifdef CONFIG_X86_POWERNOW_K8_ACPI
 	struct acpi_processor_performance acpi_data;
 #endif
 };
@@ -78,6 +74,19 @@
 #define MSR_S_HI_CURRENT_VID      0x0000001f
 #define MSR_C_HI_STP_GNT_BENIGN   0x00000001
 
+/*
+   There are restrictions frequencies have to follow:
+   - only 1 entry in the low fid table ( <=1.4GHz )
+   - lowest entry in the high fid table must be >= 2 * the
+     entry in the low fid table
+   - lowest entry in the high fid table must be a <= 200MHz +
+     2 * the entry in the low fid table
+   - the parts can only step at 200 MHz intervals, so 1.9 GHz is
+     never valid
+   - lowest frequency must be >= interprocessor hypertransport link
+     speed (only applies to MP systems obviously)
+ */
+
 /* fids (frequency identifiers) are arranged in 2 tables - lo and hi */
 #define LO_FID_TABLE_TOP           6   /* fid values marking the boundary    */
 #define HI_FID_TABLE_BOTTOM        8   /* between the low and high tables    */

-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
