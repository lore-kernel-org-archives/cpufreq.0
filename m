From: Pavel Machek <pavel@ucw.cz>
Subject: Small cleanups / docs improvements for powernow-k8
Date: Wed, 20 Oct 2004 20:07:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041020180703.GA10469@elf.ucw.cz>
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
To: paul.devriendt@amd.com, davej@codemonkey.org.uk, cpufreq@www.linux.org.uk
Cc: Rusty trivial patch monkey Russell <trivial@rustcorp.com.au>

Hi!

These are very small cleanups / documentation additions. It avoids
using different names for same fields in different structures. Please
apply,

								Pavel


--- foo/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	20 Oct 2004 01:26:30 -0000	1.16
+++ foo/arch/i386/kernel/cpu/cpufreq/powernow-k8.c	20 Oct 2004 18:01:03 -0000
@@ -18,6 +18,9 @@
  *  Processor information obtained from Chapter 9 (Power and Thermal Management)
  *  of the "BIOS and Kernel Developer's Guide for the AMD Athlon 64 and AMD
  *  Opteron Processors" available for download from www.amd.com
+ *
+ *  Tables for specific CPUs can be infrerred from
+ *	http://www.amd.com/us-en/assets/content_type/white_papers_and_tech_docs/30430.pdf
  */
 
 #include <linux/kernel.h>
@@ -65,7 +68,12 @@
 	return 1550-vid*25;
 }
 
-/* Return the vco fid for an input fid */
+/* Return the vco fid for an input fid
+ *
+ * Each "low" fid has corresponding "high" fid, and you can get to "low" fids
+ * only from corresponding high fids. This returns "high" fid corresponding to
+ * "low" one.
+ */
 static u32 convert_fid_to_vco_fid(u32 fid)
 {
 	if (fid < HI_FID_TABLE_BOTTOM) {
@@ -309,10 +317,7 @@
 /* Phase 2 - core frequency transition */
 static int core_frequency_transition(struct powernow_k8_data *data, u32 reqfid)
 {
-	u32 vcoreqfid;
-	u32 vcocurrfid;
-	u32 vcofiddiff;
-	u32 savevid = data->currvid;
+	u32 vcoreqfid, vcocurrfid, vcofiddiff, savevid = data->currvid;
 
 	if ((reqfid < HI_FID_TABLE_BOTTOM) && (data->currfid < HI_FID_TABLE_BOTTOM)) {
 		printk(KERN_ERR PFX "ph2: illegal lo-lo transition 0x%x 0x%x\n",
@@ -501,7 +495,7 @@
 		    || (pst[j].fid & 1)
 		    || (j && (pst[j].fid < HI_FID_TABLE_BOTTOM))) {
 			/* Only first fid is allowed to be in "low" range */
-			printk(KERN_ERR PFX "fid %d invalid : 0x%x\n", j, pst[j].fid);
+			printk(KERN_ERR PFX "two low fids - %d : 0x%x\n", j, pst[j].fid);
 			return -EINVAL;
 		}
 		if (pst[j].fid < lastfid)
@@ -621,7 +615,7 @@
 			return -ENODEV;
 		}
 
-		data->vstable = psb->voltagestabilizationtime;
+		data->vstable = psb->vstable;
 		dprintk(KERN_INFO PFX "voltage stabilization time: %d(*20us)\n", data->vstable);
 
 		dprintk(KERN_DEBUG PFX "flags2: 0x%x\n", psb->flags2);
@@ -654,7 +648,7 @@
 		dprintk(KERN_INFO PFX "maxvid: 0x%x\n", psb->maxvid);
 		maxvid = psb->maxvid;
 
-		data->numps = psb->numpstates;
+		data->numps = psb->numps;
 		dprintk(KERN_INFO PFX "numpstates: 0x%x\n", data->numps);
 		return fill_powernow_table(data, (struct pst_s *)(psb+1), maxvid);
 	}
--- foo/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	23 Aug 2004 02:11:54 -0000	1.8
+++ foo/arch/i386/kernel/cpu/cpufreq/powernow-k8.h	20 Oct 2004 17:53:40 -0000
@@ -21,8 +21,7 @@
 	u32 plllock; /* pll lock time, units 1 us */
 
 	/* keep track of the current fid / vid */
-	u32 currvid;
-	u32 currfid;
+	u32 currvid, currfid;
 
 	/* the powernow_table includes all frequency and vid/fid pairings:
 	 * fid are the lower 8 bits of the index, vid are the upper 8 bits.
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
