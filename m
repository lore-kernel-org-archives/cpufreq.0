From: Pavel Machek <pavel@ucw.cz>
Subject: Simple cleanups for powernow-k8
Date: Tue, 16 Nov 2004 13:57:24 +0100
Message-ID: <20041116125724.GA8105@elf.ucw.cz>
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
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk, paul.devriendt@amd.com

Hi!

This adds some comments where to get more data, puts in same name for
same variable (numps vs. numpstates, vstable
vs. voltagestabilizationtime). Please apply,
								Pavel

--- a/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	14 Nov 2004 04:46:00 -0000	1.18
+++ b/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	16 Nov 2004 12:54:30 -0000
@@ -18,6 +18,9 @@
  *  Processor information obtained from Chapter 9 (Power and Thermal Management)
  *  of the "BIOS and Kernel Developer's Guide for the AMD Athlon 64 and AMD
  *  Opteron Processors" available for download from www.amd.com
+ *
+ *  Tables for specific CPUs can be infrerred from
+ *	http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/30430.pdf
  */
 
 #include <linux/kernel.h>
@@ -618,7 +612,7 @@
 			return -ENODEV;
 		}
 
-		data->vstable = psb->voltagestabilizationtime;
+		data->vstable = psb->vstable;
 		dprintk("voltage stabilization time: %d(*20us)\n", data->vstable);
 
 		dprintk("flags2: 0x%x\n", psb->flags2);
@@ -632,9 +626,9 @@
 		dprintk("isochronous relief time: %d\n", data->irt);
 		dprintk("maximum voltage step: %d - 0x%x\n", mvs, data->vidmvs);
 
-		dprintk("numpst: 0x%x\n", psb->numpst);
-		cpst = psb->numpst;
-		if ((psb->cpuid == 0x00000fc0) || (psb->cpuid == 0x00000fe0) ){
+		dprintk("numpst: 0x%x\n", psb->num_tables);
+		cpst = psb->num_tables;
+		if ((psb->cpuid == 0x00000fc0) || (psb->cpuid == 0x00000fe0)) {
 			thiscpuid = cpuid_eax(CPUID_PROCESSOR_SIGNATURE);
 			if ((thiscpuid == 0x00000fc0) || (thiscpuid == 0x00000fe0) ) {
 				cpst = 1;
@@ -651,7 +645,7 @@
 		dprintk("maxvid: 0x%x\n", psb->maxvid);
 		maxvid = psb->maxvid;
 
-		data->numps = psb->numpstates;
+		data->numps = psb->numps;
 		dprintk("numpstates: 0x%x\n", data->numps);
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
--- a/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	14 Nov 2004 04:46:00 -0000	1.9
+++ b/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	16 Nov 2004 12:00:44 -0000
@@ -152,14 +151,14 @@
 	u8 signature[10];
 	u8 tableversion;
 	u8 flags1;
-	u16 voltagestabilizationtime;
+	u16 vstable;
 	u8 flags2;
-	u8 numpst;
+	u8 num_tables;
 	u32 cpuid;
 	u8 plllocktime;
 	u8 maxfid;
 	u8 maxvid;
-	u8 numpstates;
+	u8 numps;
 };
 
 /* Pairs of fid/vid values are appended to the version 1.4 PSB table. */

-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!
