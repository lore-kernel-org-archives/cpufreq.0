From: Harald Milz <milz@seneca.muc.de>
Subject: [PATCH] powernow-k7: Userspace PST for Athlon XP-M on desktop boards
Date: Mon, 14 Jun 2004 23:17:26 +0200 (CEST)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040614211726.905A94BAAB@nathan.muc.de>
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

Hi,

I finally managed to check all possible FIDs with my userspace PST patch. 

To recollect, the goal is to enable FID switching for Athlon mobile CPUs
on desktop boards with the powernow-k7 module. Most desktop boards don't
support XP-M cpus and don't provide the appropriate PSTs. With this patch,
you can set the appropriate values on the module command line, like: 

insmod powernow-k7.o \
      mycpuid=0x7a0 myfsbspeed=133 mymaxfid=0x15 mystartvid=0xb mynumpstates=6
      myfids=0x15,0x00,0x0a,0x06,0x04,0x12 \
      myvids=0x0b,0x0d,0x13,0x13,0x13,0x13 

(The last line is useless on desktop boards because they don't support VID
switching but you can use it on notebooks that do but have broken PSTs.)

Observations: 

1. On my machine (Asus A7V8X w/ Athlon XP-M 2400+) the following
multipliers can be toggled around just fine: 9.5 - 13.5. Lower multipliers
will freeze the machine hard. I suspect it's because the voltage isn't
appropriate for the lower multipliers - can somebody please deny or
confirm this? (According to the BIOS, the actual core voltage is 1.58V or
so.)

2. Higher multipliers up to 22.5 will not crash the machine but it appears
that the actual multiplier stays at 13.5 which is the default for 1800 MHz.
That's probably because the CPU tells us the maxfid in powernow_cpu_init().
So - no overclocking this way. 

3. mymaxfid > 0x15 will prevent the module from loading - I'd have to dig
into it to find out why. Since we can't overclock anyway this parameter is
probably useless. 

This is less than I expected but at least I can lower the core frequency to
70% of the maximum (1266 MHz nominal). Anything less will freeze the machine. 

The ORIG file is from a SuSE 9.1 2.6.4 kernel. 

Please have a look at it - flames and beer to me :-) 


--- powernow-k7.c.ORIG	2004-05-07 15:45:27.000000000 +0200
+++ powernow-k7.c	2004-05-29 18:32:53.321736603 +0200
@@ -85,6 +85,42 @@
 static unsigned int latency;
 static char have_a0;
 
+/*
+	PST hacking ... - hm
+*/
+static u32 mycpuid;
+static u8 myfsbspeed;
+static u8 mymaxfid;
+static u8 mystartvid;
+static u8 mynumpstates; /* max. 8 */
+static int myfids[8];
+static int myvids[8];
+
+MODULE_PARM (mycpuid, "i");
+MODULE_PARM (myfsbspeed, "i");
+MODULE_PARM (mymaxfid, "i");
+MODULE_PARM (mystartvid, "i");
+MODULE_PARM (mynumpstates, "i");
+/* 	
+	and an array of FID/VID  
+	for desktop boards, the VIDs will do nothing so if there's a
+	desktop voltage regulator we'll set them to startvid.
+	
+	module command line example: 
+
+	mycpuid=0x7a0 myfsbspeed=133 mymaxfid=0x15 mystartvid=0xb mynumpstates=6
+		myfids=0x15,0x00,0x0a,0x06,0x04,0x12
+		myvids=0x0b,0x0d,0x13,0x13,0x13,0x13
+
+	(see sample numbers from http://emeitner.f2o.org/nx9005/files/dmesg.txt)
+
+	Make sure the fid/vid pairs correspond! 
+*/
+MODULE_PARM (myfids, "1-8i");
+MODULE_PARM (myvids, "1-8i");
+
+
+
 
 static int check_powernow(void)
 {
@@ -269,6 +305,7 @@
 	unsigned char *p;
 	unsigned int etuple;
 	unsigned int ret;
+	u8 *t;
 
 	etuple = cpuid_eax(0x80000001);
 	etuple &= 0xf00;
@@ -309,8 +346,41 @@
 
 			pst = (struct pst_s *) p;
 
+/* 
+	here we can fake a PST according to our actual CPU ... 
+	best to take everything from the module command line instead of 
+	hardcoding everything.
+
+	Since we don't know the numpst of the faulty BIOS entry
+	we need to kmalloc a new PST entry with the required 
+	number of FID/VID pairs, and discard / disregard the rest. 
+	-> numpst = 1
+	and we will give him this one entry. 
+*/
+
+			if (mycpuid != 0) {
+				pst = kmalloc ((sizeof (struct pst_s) + (2 * mynumpstates)), GFP_KERNEL);
+				/* FIXME: associated kfree() missing */
+
+				dprintk (KERN_INFO PFX "using USER PST at %p\n", (unsigned char *)pst);
+
+				pst->cpuid = mycpuid;
+				pst->fsbspeed = myfsbspeed;
+				pst->maxfid = mymaxfid;
+				pst->startvid = mystartvid;
+				pst->numpstates = mynumpstates;
+				t = (u8 *) pst + sizeof (struct pst_s);
+				for (i=0; i<mynumpstates; i++) {
+					*t = myfids[i]; t++;
+					*t = myvids[i] == 0 ? mystartvid : myvids[i] ; t++;
+					dprintk (KERN_INFO PFX "fid: 0x%x; vid: 0x%x; t: %p\n", myfids[i], myvids[i], t);
+				}				
+				psb->numpst = 1;
+			}
+
 			for (i = 0 ; i <psb->numpst; i++) {
-				pst = (struct pst_s *) p;
+				if (mycpuid == 0) 
+					pst = (struct pst_s *) p;
 				number_scales = pst->numpstates;
 
 				if ((etuple == pst->cpuid) && (maxfid==pst->maxfid) && (startvid==pst->startvid))


-- 
TAURUS (Apr 20 - May 20)
	You are practical and persistent.  You have a dogged
	determination and work like hell.  Most people think you are
	stubborn and bull headed.  You are a Communist.
