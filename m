From: Ashley Pittman <ashley@quadrics.com>
Subject: Patch to stop i386 longhaul from deadlocking the kernel
Date: Wed, 05 Nov 2003 15:19:30 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1068045570.23318.34.camel@ashley>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq <cpufreq@www.linux.org.uk>


Hi,

I've had some problems with the 'longhaul' driver deadlocking my kernel
when the module is inserted.  I tracked this down to the module failing
to discover the fsb speed.

This patch stops the deadlock in the case where the speed of the fsb is
undetected.  I've also made the guess function more vague so it can
detect the correct speed for my cpu, it might need to be even more vague
for other cpu's.

I am still unable to change the CPU speed even with this patch however. 

The problem arrived in about the -test6 timeframe and still exists in
the latest test9 I've tested.  The motherboard is a mini-itx from via
running at 800.261 Mhz.

The relevent kernel output is:

Before:

longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v1 supported.
longhaul: MinMult=3.0x MaxMult=6.0x
longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz

At this point the whole system would lock solid.

After:

longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v1 supported.
longhaul: MinMult=3.0x MaxMult=6.0x
longhaul: FSB: 133MHz Lowestspeed=399MHz Highestspeed=798MHz

The module is now inserted and appears in '/proc/modules'

Ashley,


diff -u linux-2.6.0-test9-dist/arch/i386/kernel/cpu/cpufreq/longhaul.c linux-2.6.0-test9/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- linux-2.6.0-test9-dist/arch/i386/kernel/cpu/cpufreq/longhaul.c      2003-10-29 18:50:54.000000000 +0000
+++ linux-2.6.0-test9/arch/i386/kernel/cpu/cpufreq/longhaul.c   2003-11-04 11:36:43.000000000 +0000
@@ -30,6 +30,9 @@
 
 #include "longhaul.h"
 
+#define SPEEDKLUDGE 0xbf
+
+
 #define DEBUG
 
 #ifdef DEBUG
@@ -177,13 +180,13 @@
        target = ((maxmult/10)*guess);
        if (maxmult%10 != 0)
                target += (guess/2);
-       target &= ~0xf;
+       target &= ~SPEEDKLUDGE;
        return target;
 }
 
 static int guess_fsb(int maxmult)
 {
-       int speed = (cpu_khz/1000) & ~0xf;
+       int speed = (cpu_khz/1000) & ~SPEEDKLUDGE;
        int i;
        int speeds[3] = { 66, 100, 133 };
 
@@ -248,6 +251,10 @@
        dprintk (KERN_INFO PFX "FSB: %dMHz Lowestspeed=%dMHz Highestspeed=%dMHz\n",
                 fsb, lowest_speed, highest_speed);
 
+       if ( fsb == 0 ) {
+               return -EINVAL;
+       }
+
        longhaul_table = kmalloc((numscales + 1) * sizeof(struct cpufreq_frequency_table), GFP_KERNEL);
        if(!longhaul_table)
                return -ENOMEM;



-- 
Ashley Pittman <ashley@quadrics.com>
