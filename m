From: Luigi Belli <lbelli@crema.unimi.it>
Subject: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Mon, 30 Jun 2003 14:36:29 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200306301436.29188.lbelli@crema.unimi.it>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_N7CA/fR6xvVXKBf"
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
To: cpufreq@www.linux.org.uk


--Boundary-00=_N7CA/fR6xvVXKBf
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm one of the owners of an Acer Aspire 1300 series with a buggy BIOS, so I 
decided to hardcode a patch with the correct PST table for my mobile Athlon 
XP 1800+.
I know very little of kernel internals, I only opened powernow-k7.c and tried 
to guess what had to be changed...
For me it works and I decided to post it here for those in my conditions 
waiting for a new bios or a newer cpufreq release.
It's a patch against kernel 2.4.21-ac4.

--Boundary-00=_N7CA/fR6xvVXKBf
Content-Type: text/x-diff;
  charset="us-ascii";
  name="patch-aspire1300-1800+"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="patch-aspire1300-1800+"

--- a/arch/i386/kernel/powernow-k7.c	2003-06-30 13:40:16.000000000 +0200
+++ b/arch/i386/kernel/powernow-k7.c	2003-06-30 13:41:19.000000000 +0200
@@ -167,6 +167,29 @@
 	unsigned int j, speed;
 	u8 fid, vid;

+/* hardcoded modifies for mobile Athlon xp 1800+ on Acer Aspire 1300 with buggy bios */
+
+	pst = kmalloc(10*sizeof(unsigned char), GFP_KERNEL);
+	if (!pst)
+		return -ENOMEM;
+
+	*pst++ = 4;  /*  666 MHz */
+	*pst++ = 19; /*   1.20 V */
+	*pst++ = 6;  /*  800 Mhz */
+	*pst++ = 19; /*   1.20 V */
+	*pst++ = 10; /* 1066 Mhz */
+	*pst++ = 19; /*   1.20 V */
+	*pst++ = 14; /* 1333 Mhz */
+	*pst++ = 11; /*   1.45 V */
+	*pst++ = 1;  /* 1533 Mhz */
+	*pst = 9;    /*   1.55 V */
+
+	pst -= 9;
+
+	fsb=133;
+
+/*************************************************/
+
 	powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table) * (number_scales + 1)), GFP_KERNEL);
 	if (!powernow_table)
 		return -ENOMEM;
@@ -187,7 +210,7 @@
 #endif
 		}
 
-		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
+		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])  ", fid,
 			fid_codes[fid] / 10, fid_codes[fid] % 10, speed);
 
 		if (speed < minimum_speed)
@@ -328,9 +351,11 @@
 				if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))
 				{
 					dprintk (KERN_INFO PFX "PST:%d (@%p)\n", i, pst);
-					dprintk (KERN_INFO PFX " cpuid: 0x%x\t", pst->cpuid);
-					dprintk ("fsb: %d\t", pst->fsbspeed);
-					dprintk ("maxFID: 0x%x\t", pst->maxfid);
+					dprintk (KERN_INFO PFX " cpuid: 0x%x  ", pst->cpuid);
+					/* modified for mobile Athlon XP 1800+ */
+					dprintk ("fsb: %d  ", 133);
+					/***************************************/
+					dprintk ("maxFID: 0x%x  ", pst->maxfid);
 					dprintk ("startvid: 0x%x\n", pst->startvid);
 
 					fsb = pst->fsbspeed;

--Boundary-00=_N7CA/fR6xvVXKBf--
