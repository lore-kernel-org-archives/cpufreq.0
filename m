From: Marijan Peh <marijan.peh@freenet.de>
Subject: Acer 1304xc powernowk7 patch & kernel 2.6.8-rc3-mm1
Date: Mon, 9 Aug 2004 19:47:39 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809174739.GA22196@kanta>
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
To: cpufreq_mail_list <cpufreq@www.linux.org.uk>

How to implement this patch in kernel 2.6.8-rc3-mm1.

[aspire_patch  text/x-diff (2606 bytes)]
--- a/arch/i386/kernel/powernow-k7.c    2003-06-30 13:40:16.000000000 +0200
+++ b/arch/i386/kernel/powernow-k7.c    2003-06-30 13:41:19.000000000 +0200
@@ -167,6 +167,29 @@
        unsigned int j, speed;
        u8 fid, vid;

+/* hardcoded modifies for mobile Athlon xp 1800+ on Acer Aspire 1300
with buggy bios */+
+       pst = kmalloc(10*sizeof(unsigned char), GFP_KERNEL);
+       if (!pst)
+               return -ENOMEM;
+
+       *pst++ = 4;  /*  666 MHz */
+       *pst++ = 19; /*   1.20 V */
+       *pst++ = 6;  /*  800 Mhz */
+       *pst++ = 19; /*   1.20 V */
+       *pst++ = 10; /* 1066 Mhz */
+       *pst++ = 19; /*   1.20 V */
+       *pst++ = 14; /* 1333 Mhz */
+       *pst++ = 11; /*   1.45 V */
+       *pst++ = 1;  /* 1533 Mhz */
+       *pst = 9;    /*   1.55 V */
+
+       pst -= 9;
+
+       fsb=133;
+
+/*************************************************/
+
        powernow_table = kmalloc((sizeof(struct cpufreq_frequency_table)
* (number_scales + 1)), GFP_KERNEL);    if (!powernow_table)
                return -ENOMEM;
@@ -187,7 +210,7 @@
 #endif
                }
 
-               dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
+               dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])  ", fid,
                        fid_codes[fid] / 10, fid_codes[fid] % 10, speed);
 
                if (speed < minimum_speed)
@@ -328,9 +351,11 @@
                                if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) &&
(startvid==pst->startvid))                              {
                                        dprintk (KERN_INFO PFX "PST:%d (@%p)\n", i,
pst);-                                  dprintk (KERN_INFO PFX " cpuid: 0x%x\t", pst->
cpuid);
-                                       dprintk ("fsb: %d\t", pst->fsbspeed);
-                                       dprintk ("maxFID: 0x%x\t", pst->maxfid);
+                                       dprintk (KERN_INFO PFX " cpuid: 0x%x  ", pst->
cpuid);
+                                       /* modified for mobile Athlon XP 1800+ */
+                                       dprintk ("fsb: %d  ", 133);
+                                       /***************************************/
+                                       dprintk ("maxFID: 0x%x  ", pst->maxfid);
                                        dprintk ("startvid: 0x%x\n", pst->startvid);
 
                                        fsb = pst->fsbspeed;
-- end --

I have no programming exp.
Patch was full functional in older cpufreq code.

Thnx

-- 
http://nymos.dyndns.org/
