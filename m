From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k8.c, 1.1.2.1,
	1.1.2.2 powernow-k8.h, 1.1, 1.1.2.1
Date: Tue, 02 Mar 2004 10:07:54 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1Ay6oc-0001CP-01@flint.arm.linux.org.uk>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv4605

Modified Files:
      Tag: LINUX_2_4
	powernow-k8.c powernow-k8.h 
Log Message:
Lastest powernow-k8 driver from paul.devriendt@amd.com

Index: powernow-k8.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.c,v
retrieving revision 1.1.2.1
retrieving revision 1.1.2.2
diff -u -r1.1.2.1 -r1.1.2.2
--- powernow-k8.c	30 Sep 2003 11:25:51 -0000	1.1.2.1
+++ powernow-k8.c	2 Mar 2004 10:07:50 -0000	1.1.2.2
@@ -1,5 +1,5 @@
 /*
- *   (c) 2003 Advanced Micro Devices, Inc.
+ *   (c) 2003, 2004 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
  *  GNU general public license version 2. See "../../../COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
@@ -11,10 +11,12 @@
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
  *
+ *  Valuable input gratefully received from Dave Jones, Pavel Machek, Dominik
[...1128 lines suppressed...]
+		printk(KERN_ERR PFX "failing init, change pending bit set\n");
 		return -EIO;
 	}
 
@@ -1002,13 +807,10 @@
 }
 
 /* driver entry point for term */
-static void __exit
-drv_exit(void)
+static void __exit drv_exit(void)
 {
-	dprintk(KERN_INFO PFX "drv_exit\n");
-
+	dprintk(KERN_INFO PFX "exit\n");
 	cpufreq_unregister_driver(&cpufreq_amd64_driver);
-	kfree(ppst);
 }
 
 MODULE_AUTHOR("Paul Devriendt <paul.devriendt@amd.com>");

Index: powernow-k8.h
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k8.h,v
retrieving revision 1.1
retrieving revision 1.1.2.1
diff -u -r1.1 -r1.1.2.1
--- powernow-k8.h	30 Sep 2003 09:26:27 -0000	1.1
+++ powernow-k8.h	2 Mar 2004 10:07:50 -0000	1.1.2.1
@@ -1,20 +1,15 @@
 /*
- *   (c) 2003 Advanced Micro Devices, Inc.
+ *   (c) 2003, 2004 Advanced Micro Devices, Inc.
  *  Your use of this code is subject to the terms and conditions of the
  *  GNU general public license version 2. See "../../../COPYING" or
  *  http://www.gnu.org/licenses/gpl.html
  */
 
 /* processor's cpuid instruction support */
-#define CPUID_PROCESSOR_SIGNATURE             1	/* function 1               */
-#define CPUID_F1_FAM                 0x00000f00	/* family mask              */
-#define CPUID_F1_XFAM                0x0ff00000	/* extended family mask     */
-#define CPUID_F1_MOD                 0x000000f0	/* model mask               */
-#define CPUID_F1_STEP                0x0000000f	/* stepping level mask      */
-#define CPUID_XFAM_MOD               0x0ff00ff0	/* xtended fam, fam + model */
-#define ATHLON64_XFAM_MOD            0x00000f40	/* xtended fam, fam + model */
-#define OPTERON_XFAM_MOD             0x00000f50	/* xtended fam, fam + model */
-#define ATHLON64_REV_C0                       8
+#define CPUID_PROCESSOR_SIGNATURE             1	/* function 1 */
+#define CPUID_XFAM_MOD               0x0ff00ff0	/* extended fam, fam + model */
+#define ATHLON64_XFAM_MOD            0x00000f40	/* extended fam, fam + model */
+#define OPTERON_XFAM_MOD             0x00000f50	/* extended fam, fam + model */
 #define CPUID_GET_MAX_CAPABILITIES   0x80000000
 #define CPUID_FREQ_VOLT_CAPABILITIES 0x80000007
 #define P_STATE_TRANSITION_CAPABLE            6
@@ -23,7 +18,6 @@
 /* writes (wrmsr - opcode 0f 30), the register number is placed in ecx, and   */
 /* the value to write is placed in edx:eax. For reads (rdmsr - opcode 0f 32), */
 /* the register number is placed in ecx, and the data is returned in edx:eax. */
-
 #define MSR_FIDVID_CTL      0xc0010041
 #define MSR_FIDVID_STATUS   0xc0010042
 
@@ -49,42 +43,33 @@
 #define MSR_S_HI_CURRENT_VID      0x0000001f
 
 /* fids (frequency identifiers) are arranged in 2 tables - lo and hi */
-#define LO_FID_TABLE_TOP     6
-#define HI_FID_TABLE_BOTTOM  8
-
+#define LO_FID_TABLE_TOP           6	/* fid values marking the boundary    */
+#define HI_FID_TABLE_BOTTOM        8	/* between the low and high tables    */
 #define LO_VCOFREQ_TABLE_TOP    1400	/* corresponding vco frequency values */
 #define HI_VCOFREQ_TABLE_BOTTOM 1600
 
 #define MIN_FREQ_RESOLUTION  200 /* fids jump by 2 matching freq jumps by 200 */
 
 #define MAX_FID 0x2a	/* Spec only gives FID values as far as 5 GHz */
-
 #define LEAST_VID 0x1e	/* Lowest (numerically highest) useful vid value */
-
 #define MIN_FREQ 800	/* Min and max freqs, per spec */
 #define MAX_FREQ 5000
 
-#define INVALID_FID_MASK 0xffffffc1  /* not a valid fid if these bits are set */
-
-#define INVALID_VID_MASK 0xffffffe0  /* not a valid vid if these bits are set */
+#define INVALID_FID_MASK 0xffffffc1 /* not a valid fid if these bits are set */
+#define INVALID_VID_MASK 0xffffffe0 /* not a valid vid if these bits are set */
 
 #define STOP_GRANT_5NS 1 /* min poss memory access latency for voltage change */
-
 #define PLL_LOCK_CONVERSION (1000/5) /* ms to ns, then divide by clock period */
-
 #define MAXIMUM_VID_STEPS 1  /* Current cpus only allow a single step of 25mV */
-
 #define VST_UNITS_20US 20   /* Voltage Stabalization Time is in units of 20us */
 
 /*
-Version 1.4 of the PSB table. This table is constructed by BIOS and is
-to tell the OS's power management driver which VIDs and FIDs are
-supported by this particular processor. This information is obtained from
-the data sheets for each processor model by the system vendor and
-incorporated into the BIOS.
-If the data in the PSB / PST is wrong, then this driver will program the
-wrong values into hardware, which is very likely to lead to a crash.
-*/
+ * Version 1.4 of the PSB table. This table is constructed by BIOS and is
+ * to tell the OS's power management driver which VIDs and FIDs are
+ * supported by this particular processor.
+ * If the data in the PSB / PST is wrong, then this driver will program the
+ * wrong values into hardware, which is very likely to lead to a crash.
+ */
 
 #define PSB_ID_STRING      "AMDK7PNOW!"
 #define PSB_ID_STRING_LEN  10
@@ -120,7 +105,3 @@
 static inline int core_voltage_pre_transition(u32 reqvid);
 static inline int core_voltage_post_transition(u32 reqvid);
 static inline int core_frequency_transition(u32 reqfid);
-static int drv_verify(struct cpufreq_policy *pol);
-static int drv_target(struct cpufreq_policy *pol, unsigned targfreq,
-		      unsigned relation);
-static int __init drv_cpu_init(struct cpufreq_policy *pol);
