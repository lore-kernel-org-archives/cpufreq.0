From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: VIA C3 M10k Nehemiah longhaul support in 2.6.x ?
Date: Mon, 1 Mar 2004 16:16:12 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040301151612.GS2869@poupinou.org>
References: <EFEF4C473088B847B64CD953D2A6A104FE8228@sdso14a.par.siemens.fr>
	<5.1.0.14.2.20040227203914.00a86e20@pop.cogeco.ca>
	<20040301130019.GQ2869@poupinou.org>
	<20040301140750.GR2869@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040301140750.GR2869@poupinou.org>
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
To: Doug Sutherland <wearable@cogeco.ca>
Cc: BARRE Francois <francois.barre@siemens.com>, cpufreq@www.linux.org.uk

> The 2.4 version should be OK today or in worst case tomorrow.
> 

I just commited that change, but only for 2.4.  Could you report if that
is ok, please ?

Index: longhaul.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.c,v
retrieving revision 1.93.2.3
retrieving revision 1.93.2.6
diff -u -r1.93.2.3 -r1.93.2.6
--- longhaul.c	9 Dec 2003 08:58:33 -0000	1.93.2.3
+++ longhaul.c	1 Mar 2004 15:13:14 -0000	1.93.2.6
@@ -1,5 +1,5 @@
 /*
- *  (C) 2001-2003  Dave Jones. <davej@codemonkey.org.uk>
+ *  (C) 2001-2004  Dave Jones. <davej@codemonkey.org.uk>
  *  (C) 2002  Padraig Brady. <padraig@antefacto.com>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
@@ -63,11 +63,12 @@
 
 static unsigned int calc_speed (int mult, int fsb)
 {
-	int mhz;
-	mhz = (mult/10)*fsb;
+	int khz;
+	khz = (mult/10)*fsb;
 	if (mult%10)
-		mhz += fsb/2;
-	return mhz;
+		khz += fsb/2;
+	khz *= 1000;
+	return khz;
 }
 
 
@@ -185,6 +186,7 @@
 	return target;
 }
 
+
 static int guess_fsb(int maxmult)
 {
 	int speed = (cpu_khz/1000);
@@ -202,7 +204,6 @@
 }
 
 
-
 static int __init longhaul_get_ranges (void)
 {
 	struct cpuinfo_x86 *c = cpu_data;
@@ -233,6 +234,8 @@
 	case 2:
 		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 
+		//TODO: Nehemiah may have borken MaxMHzBR.
+		// need to extrapolate from FSB.
 		invalue = longhaul.bits.MaxMHzBR;
 		if (longhaul.bits.MaxMHzBR4)
 			invalue += 16;
@@ -244,7 +247,16 @@
 		else
 			minmult = multipliers[invalue];
 
-		fsb = guess_fsb(maxmult);
+		switch (longhaul.bits.MaxMHzFSB) {
+		case 0x0:	fsb=133;
+				break;
+		case 0x1:	fsb=100;
+				break;
+		case 0x2:	printk (KERN_INFO PFX "Invalid (reserved) FSB!\n");
+			return -EINVAL;
+		case 0x3:	fsb=66;
+				break;
+		}
 		break;
 	}
 
@@ -253,7 +265,17 @@
 	highest_speed = calc_speed (maxmult, fsb);
 	lowest_speed = calc_speed (minmult,fsb);
 	dprintk (KERN_INFO PFX "FSB: %dMHz Lowestspeed=%dMHz Highestspeed=%dMHz\n",
-		 fsb, lowest_speed, highest_speed);
+		 fsb, lowest_speed/1000, highest_speed/1000);
+
+	if (lowest_speed == highest_speed) {
+		printk (KERN_INFO PFX "highestspeed == lowest, aborting.\n");
+		return -EINVAL;
+	}
+	if (lowest_speed > highest_speed) {
+		printk (KERN_INFO PFX "nonsense! lowest (%d > %d) !\n",
+			lowest_speed, highest_speed);
+		return -EINVAL;
+	}
 
 	longhaul_table = kmalloc((numscales + 1) * sizeof(struct cpufreq_frequency_table), GFP_KERNEL);
 	if(!longhaul_table)
@@ -267,7 +289,7 @@
 		if (ratio > maxmult || ratio < minmult)
 			continue;
 		longhaul_table[k].frequency = calc_speed (ratio, fsb);
-		longhaul_table[k].index	= (j << 8);
+		longhaul_table[k].index	= j;
 		k++;
 	}
 
@@ -416,14 +438,14 @@
 	printk (KERN_INFO PFX "VIA %s CPU detected. Longhaul v%d supported.\n",
 					cpuname, longhaul_version);
 
-	if ((longhaul_version==2) && (dont_scale_voltage==0))
-		longhaul_setup_voltagescaling();
-
 	ret = longhaul_get_ranges();
 	if (ret != 0)
 		return ret;
 
- 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
+	if ((longhaul_version==2) && (dont_scale_voltage==0))
+		longhaul_setup_voltagescaling();
+
+ 	policy->policy = CPUFREQ_POLICY_PERFORMANCE;
  	policy->cpuinfo.transition_latency = CPUFREQ_ETERNAL;
 	policy->cur = calc_speed (longhaul_get_cpu_mult(), fsb);
 
@@ -445,12 +467,8 @@
 		return -ENODEV;
 
 	switch (c->x86_model) {
-	case 6 ... 8:
+	case 6 ... 9:
 		return cpufreq_register_driver(&longhaul_driver);
-	case 9:
-		printk (KERN_INFO PFX "Nehemiah unsupported: Waiting on working silicon "
-						"from VIA before this is usable.\n");
-		break;
 	default:
 		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\n");
 	}

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
