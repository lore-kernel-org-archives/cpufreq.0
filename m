From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq powernow-k7.c, 1.1.1.2,
	1.1.1.3
Date: Tue, 31 Aug 2004 10:36:16 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <E1C253o-00025A-6B@flint.arm.linux.org.uk>
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
In directory flint:/tmp/cvs-serv7967

Modified Files:
      Tag: LINUX_2_4
	powernow-k7.c 
Log Message:
backport from 2.6


Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.1.1.2
retrieving revision 1.1.1.3
diff -u -r1.1.1.2 -r1.1.1.3
--- powernow-k7.c	19 Sep 2003 16:47:43 -0000	1.1.1.2
+++ powernow-k7.c	31 Aug 2004 09:36:13 -0000	1.1.1.3
@@ -1,7 +1,7 @@
 /*
  *  AMD K7 Powernow driver.
  *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs.
- *  (C) 2003 Dave Jones <davej@redhat.com>
+ *  (C) 2003-2004 Dave Jones <davej@redhat.com>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
@@ -68,7 +68,7 @@
 /* divide by 10 to get FID. */
 static int fid_codes[32] = {
     110, 115, 120, 125, 50, 55, 60, 65,
-    70, 75, 80, 85, 90, 95, 100, 105, 
+    70, 75, 80, 85, 90, 95, 100, 105,
     30, 190, 40, 200, 130, 135, 140, 210,
     150, 225, 160, 165, 170, 180, -1, -1,
 };
@@ -85,23 +85,25 @@
 static char have_a0;
 
 
+static int check_fsb(unsigned int fsbspeed)
+{
+	int delta;
+	unsigned int f = fsb / 1000;
+
+	delta = (fsbspeed > f) ? fsbspeed - f : f - fsbspeed;
+	return (delta < 5);
+}
+
 static int check_powernow(void)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	unsigned int maxei, eax, ebx, ecx, edx;
 
-	if (c->x86_vendor != X86_VENDOR_AMD) {
+	if (c->x86_vendor != X86_VENDOR_AMD || (c->x86 != 6)) {
 		printk (KERN_INFO PFX "AMD processor not detected.\n");
 		return 0;
 	}
 
-	if (c->x86 !=6) {
-		printk (KERN_INFO PFX "This module only works with AMD K7 CPUs\n");
-		return 0;
-	}
-
-	printk (KERN_INFO PFX "AMD K7 CPU detected.\n");
-
 	if ((c->x86_model == 6) && (c->x86_mask == 0)) {
 		printk (KERN_INFO PFX "K7 660[A0] core detected, enabling errata workarounds\n");
 		have_a0 = 1;
@@ -142,7 +144,8 @@
 
 static int get_ranges (unsigned char *pst)
 {
-	unsigned int j, speed;
+	unsigned int j;
+	unsigned int speed;
 	u8 fid, vid;
 
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (number_scales + 1)), GFP_KERNEL);
@@ -153,20 +156,20 @@
 	for (j=0 ; j < number_scales; j++) {
 		fid = *pst++;
 
-		powernow_table[j].frequency = fsb * fid_codes[fid] * 100;
+		powernow_table[j].frequency = (fsb * fid_codes[fid]) / 10;
 		powernow_table[j].index = fid; /* lower 8 bits */
 
-		speed = fsb * (fid_codes[fid]/10);
+		speed = powernow_table[j].frequency;
+
 		if ((fid_codes[fid] % 10)==5) {
-			speed += fsb/2;
 #if defined(CONFIG_ACPI_PROCESSOR) || defined(CONFIG_ACPI_PROCESSOR_MODULE)
 			if (have_a0 == 1)
 				powernow_table[j].frequency = CPUFREQ_ENTRY_INVALID;
 #endif
 		}
 
-		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
-			fid_codes[fid] / 10, fid_codes[fid] % 10, speed);
+		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])  ", fid,
+			fid_codes[fid] / 10, fid_codes[fid] % 10, speed/1000);
 
 		if (speed < minimum_speed)
 			minimum_speed = speed;
@@ -178,7 +181,6 @@
 		dprintk ("VID: 0x%x (%d.%03dV)\n", vid,	mobile_vid_table[vid]/1000,
 			mobile_vid_table[vid]%1000);
 	}
-	dprintk ("\n");
 
 	powernow_table[number_scales].frequency = CPUFREQ_TABLE_END;
 	powernow_table[number_scales].index = 0;
@@ -236,7 +238,7 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 	cfid = fidvidstatus.bits.CFID;
-	freqs.old = fsb * fid_codes[cfid] * 100;
+	freqs.old = fsb * fid_codes[cfid] / 10;
 	freqs.new = powernow_table[index].frequency;
 
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -255,7 +257,6 @@
 		change_VID(vid);
 		change_FID(fid);
 	}
-	
 
 	if (have_a0 == 1)
 		local_irq_enable();
@@ -307,8 +308,6 @@
 			}
 			dprintk (KERN_INFO PFX "Settling Time: %d microseconds.\n", psb->settlingtime);
 			dprintk (KERN_INFO PFX "Has %d PST tables. (Only dumping ones relevant to this CPU).\n", psb->numpst);
-			latency *= 100;	/* SGTC needs to be in units of 10ns */
-
 			p += sizeof (struct psb_s);
 
 			pst = (struct pst_s *) p;
@@ -317,15 +316,15 @@
 				pst = (struct pst_s *) p;
 				number_scales = pst->numpstates;
 
-				if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))
+				if ((etuple == pst->cpuid) && check_fsb(pst->fsbspeed) &&
+				    (maxfid==pst->maxfid) && (startvid==pst->startvid))
 				{
 					dprintk (KERN_INFO PFX "PST:%d (@%p)\n", i, pst);
-					dprintk (KERN_INFO PFX " cpuid: 0x%x\t", pst->cpuid);
-					dprintk ("fsb: %d\t", pst->fsbspeed);
-					dprintk ("maxFID: 0x%x\t", pst->maxfid);
+					dprintk (KERN_INFO PFX " cpuid: 0x%x  ", pst->cpuid);
+					dprintk ("fsb: %d  ", pst->fsbspeed);
+					dprintk ("maxFID: 0x%x  ", pst->maxfid);
 					dprintk ("startvid: 0x%x\n", pst->startvid);
 
-					fsb = pst->fsbspeed;
 					ret = get_ranges ((char *) pst + sizeof (struct pst_s));
 					return ret;
 
@@ -336,7 +335,8 @@
 				}
 			}
 			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
-			printk ("This is indicative of a broken BIOS. Email davej@redhat.com\n");
+			printk ("This is indicative of a broken BIOS\n");
+
 			return -EINVAL;
 		}
 		p++;
@@ -366,6 +366,33 @@
 	return cpufreq_frequency_table_verify(policy, powernow_table);
 }
 
+/*
+ * We use the fact that the bus frequency is somehow
+ * a multiple of 100000/3 khz, then we compute sgtc according
+ * to this multiple.
+ * That way, we match more how AMD thinks all of that work.
+ * We will then get the same kind of behaviour already tested under
+ * the "well-known" other OS.
+ */
+static int __init fixup_sgtc(void)
+{
+	unsigned int sgtc;
+	unsigned int m;
+
+	m = fsb / 3333;
+	if ((m % 10) >= 5)
+		m += 5;
+
+	m /= 10;
+
+	sgtc = 100 * m * latency;
+	sgtc = sgtc / 3;
+	if (sgtc > 0xfffff) {
+		printk(KERN_WARNING PFX "SGTC too large %d\n", sgtc);
+		sgtc = 0xfffff;
+	}
+	return sgtc;
+}
 
 static int __init powernow_cpu_init (struct cpufreq_policy *policy)
 {
@@ -377,15 +404,27 @@
 
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 
+	/* A K7 with powernow technology is set to max frequency by BIOS */
+	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
+	if (!fsb) {
+		printk(KERN_WARNING PFX "can not determine bus frequency\n");
+		return -EINVAL;
+	}
+	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
+
 	result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
 	if (result)
 		return result;
 
+	/* SGTC use the bus clock as timer */
+	latency = fixup_sgtc();
+	printk(KERN_INFO PFX "SGTC: %d\n", latency);
+
 	printk (KERN_INFO PFX "Minimum speed %d MHz. Maximum speed %d MHz.\n",
-				minimum_speed, maximum_speed);
+				minimum_speed/1000, maximum_speed/1000);
 
 	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
-	policy->cpuinfo.transition_latency = latency;
+	policy->cpuinfo.transition_latency = 20 * latency / fsb;
 	policy->cur = maximum_speed;
 
 	return cpufreq_frequency_table_cpuinfo(policy, powernow_table);
