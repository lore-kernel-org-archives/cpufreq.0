From: Pavel Machek <pavel@suse.cz>
Subject: Re: [patches] 2.6.2 to 2.6.3 regression: powernow-k8 doesn't work
	anymore
Date: Sat, 28 Feb 2004 14:15:38 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040228131538.GA19729@elf.ucw.cz>
References: <4038ED24.3080402@isg.de> <20040222231431.GA24835@elf.ucw.cz>
	<403E8248.2040902@isg.de> <20040228001649.GJ425@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040228001649.GJ425@elf.ucw.cz>
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
To: Lutz Vieweg <lkv@isg.de>
Cc: patches@x86-64.org, Andrew Morton <akpm@zip.com.au>, cpufreq@www.linux.org.uk

Hi!

> > (this looks similar to what the working version from 2.6.2 prints)
> > 
> > but...:
> > 
> > > cat /proc/cpufreq
> > 
> >           minimum CPU frequency  -  maximum CPU frequency  -  policy
> > CPU  0         2000 kHz (100 %)  -       2000 kHz (100 %)  -  powersave
> > 
> > Well... looks like a funny idea to run an Athlon64 at 2MHz, but it feels
> > much faster... but what is really a problem: No matter what I "echo" into
> > /proc/cpufreq, nothing changes.
> > 
> > A factor 1000 lost somewhere?
> 
> Yes.

Better patch follows. I do not have explanation why it is 2MHz -
2MHz. On my system I removed bug which prevented my system from being
reported as 0.8MHz - 1.8MHz. (And modulo cosmetic uglyness, it
worked).

This fixes cosmetic uglyness, adds proper copyrights, removes warning
"untested on PREEMPT" (someone tested it, and makes it easier to
override PST by user (eMachine users will need that one). Andrew,
please apply.

								Pavel

Index: arch/i386/kernel/cpu/cpufreq/powernow-k8.c
===================================================================
RCS file: /home/pavel/sf/bitbucket/bkcvs/linux-2.5/arch/i386/kernel/cpu/cpufreq/powernow-k8.c,v
retrieving revision 1.6
diff -u -u -r1.6 powernow-k8.c
--- arch/i386/kernel/cpu/cpufreq/powernow-k8.c	23 Feb 2004 07:07:45 -0000	1.6
+++ arch/i386/kernel/cpu/cpufreq/powernow-k8.c	28 Feb 2004 13:02:27 -0000
@@ -8,6 +8,8 @@
  *
  *  Based on the powernow-k7.c module written by Dave Jones.
  *  (C) 2003 Dave Jones <davej@codemonkey.ork.uk> on behalf of SuSE Labs
+ *  (C) 2004 Dominik Brodowski <linux@brodo.de>
+ *  (C) 2004 Pavel Machek <pavel@suse.cz>
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
  *
@@ -34,10 +36,6 @@
 #define VERSION "version 1.00.08a"
 #include "powernow-k8.h"
 
-#ifdef CONFIG_PREEMPT
-#warning this driver has not been tested on a preempt system
-#endif
-
 static u32 vstable;	/* voltage stabalization time, from PSB, units 20 us */
 static u32 plllock;	/* pll lock time, from PSB, units 1 us */
 static u32 numps;	/* number of p-states, from PSB */
@@ -636,13 +636,22 @@
 			return -ENOMEM;
 		}
 
-		for (j = 0; j < numps; j++) {
-			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz), vid 0x%x\n", j,
-			       pst[j].fid, find_freq_from_fid(pst[j].fid), pst[j].vid);
+		for (j = 0; j < psb->numpstates; j++) {
 			powernow_table[j].index = pst[j].fid; /* lower 8 bits */
 			powernow_table[j].index |= (pst[j].vid << 8); /* upper 8 bits */
-			powernow_table[j].frequency = find_freq_from_fid(pst[j].fid);
 		}
+
+		/* If you want to override your frequency tables, this
+		   is right place. */
+
+		for (j = 0; j < numps; j++) {
+			powernow_table[j].frequency = find_freq_from_fid(powernow_table[j].index & 0xff)*1000;
+			printk(KERN_INFO PFX "   %d : fid 0x%x (%d MHz), vid 0x%x\n", j,
+			       powernow_table[j].index & 0xff, 
+			       powernow_table[j].frequency/1000,
+			       powernow_table[j].index >> 8);
+		}
+
 		powernow_table[numps].frequency = CPUFREQ_TABLE_END;
 		powernow_table[numps].index = 0;
 
-- 
When do you have a heart between your knees?
[Johanka's followup: and *two* hearts?]
