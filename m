From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 20:58:42 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414185842.GK8953@poupinou.org>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
	<20040414121857.GC8953@poupinou.org>
	<20040414174407.GL24970@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414174407.GL24970@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Wed, Apr 14, 2004 at 06:44:07PM +0100, Dave Jones wrote:
> On Wed, Apr 14, 2004 at 02:18:57PM +0200, Bruno Ducrot wrote:
> 
>  > I actually wanted to submit also the ACPI integration...
> 
> I just tried this out on my Compaq Evo 1015.  It has working
> PST, so just uses that.  I got curious though, and hardwired it
> to fall back to the ACPI method. This is what it comes out with on
> PST..
> 
> powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
> powernow: FSB: 132.525 MHz
> powernow: Found PSB header at 020f0800
> powernow: Table version: 0x12
> powernow: Flags: 0x0 (Mobile voltage regulator)
> powernow: Settling Time: 100 microseconds.
> powernow: Has 31 PST tables. (Only dumping ones relevant to this CPU).
> powernow: PST:26 (@020f09c2)
> powernow:  cpuid: 0x780 fsb: 133        maxFID: 0xf     startvid: 0x9
> powernow:    FID: 0x12 (4.0x [530MHz])  VID: 0x13 (1.200V)
> powernow:    FID: 0x4 (5.0x [662MHz])   VID: 0x13 (1.200V)
> powernow:    FID: 0x6 (6.0x [795MHz])   VID: 0x13 (1.200V)
> powernow:    FID: 0xa (8.0x [1060MHz])  VID: 0xd (1.350V)
> powernow:    FID: 0xf (10.5x [1391MHz]) VID: 0x9 (1.550V)
> powernow: SGTC: 13333
> powernow: Minimum speed 530 MHz. Maximum speed 1391 MHz.
> 
> And with the hardwired acpi fallback..
> 
> powernow: Trying ACPI perflib
> powernow: acpi:  P0: 1400 MHz, 35000 mW, 125 uS, control 009c412f, status 0000012f, vid: 09 fid: 0f SGTC: 10000
> powernow:    FID: 0xf (10.5x [13913MHz])        VID: 0x9 (1.550V)
> powernow: acpi:  P1: 1100 MHz, 15487 mW, 125 uS, control 009c41aa, status 000001aa, vid: 0d fid: 0a SGTC: 10000
> powernow:    FID: 0xa (8.0x [10600MHz]) VID: 0xd (1.350V)
> powernow: acpi:  P2: 800 MHz, 12310 mW, 125 uS, control 009c4266, status 00000266, vid: 13 fid: 06 SGTC: 10000
> powernow:    FID: 0x6 (6.0x [7950MHz])  VID: 0x13 (1.200V)
> powernow: acpi:  P3: 660 MHz, 12310 mW, 125 uS, control 009c4264, status 00000264, vid: 13 fid: 04 SGTC: 10000
> powernow:    FID: 0x4 (5.0x [6625MHz])  VID: 0x13 (1.200V)
> powernow: acpi:  P4: 530 MHz, 10258 mW, 125 uS, control 009c4272, status 00000272, vid: 13 fid: 12 SGTC: 10000
> powernow:    FID: 0x12 (4.0x [5300MHz]) VID: 0x13 (1.200V)
> powernow: Minimum speed 530 MHz. Maximum speed 13913 MHz.
> 
> Maximum speed seems off by a factor of 10.

Oh my...  I've tested that and for some strange reason, I have noticed
nothing..

> Formatting of that debug info could also probably be cleaned up a little,
> as its very wide.

Ok, I will remove some debug info.  Status is not needed, it's more to
make ACPI spec happy actually.  I need SGTC. I keep it.  It's stupid
to get fid and vid on the acpi line: I's redundant with the second debug
line.

That give that for me now:

powernow: PowerNOW! Technology present. Can scale: frequency and
voltage.
powernow: FSB: 132.720 MHz
powernow: PSB/PST known to be broken.  Trying ACPI instead
powernow: acpi:  P0: 1800 MHz 45000 mW 125 uS control 00d05975 SGTC
13334
powernow:    FID: 0x15 (13.5x [1791MHz])        VID: 0xb (1.450V)
powernow: acpi:  P1: 1200 MHz 22295 mW 125 uS control 00d05a2c SGTC
13334
powernow:    FID: 0xc (9.0x [1194MHz])  VID: 0x11 (1.250V)
powernow: acpi:  P2: 933 MHz 14671 mW 125 uS control 00d05aa8 SGTC 13334
powernow:    FID: 0x8 (7.0x [929MHz])   VID: 0x15 (1.150V)
powernow: acpi:  P3: 800 MHz 10487 mW 125 uS control 00d05b26 SGTC 13334
powernow:    FID: 0x6 (6.0x [796MHz])   VID: 0x19 (1.050V)
powernow: acpi:  P4: 667 MHz 8744 mW 125 uS control 00d05b24 SGTC 13334
powernow:    FID: 0x4 (5.0x [663MHz])   VID: 0x19 (1.050V)
powernow: Minimum speed 663 MHz. Maximum speed 1791 MHz.


> How do you feel about adding a module_param to force
> fallback, so we can get a few more people testing it too ?

Agreed.  Though I don't understand if you want ACPI enabled by default, or
legacy?


--- linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 18:10:27	1.5
+++ linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 18:49:02
@@ -17,6 +17,7 @@
 #include <linux/config.h>
 #include <linux/kernel.h>
 #include <linux/module.h> 
+#include <linux/moduleparam.h> 
 #include <linux/init.h>
 #include <linux/cpufreq.h>
 #include <linux/slab.h>
@@ -90,6 +91,12 @@ static int fid_codes[32] = {
     150, 225, 160, 165, 170, 180, -1, -1,
 };
 
+/* This parameter is used in order to force ACPI instead of legacy method for
+ * configuration purpose.
+ */
+
+static int powernow_acpi_force;
+
 static struct cpufreq_frequency_table *powernow_table;
 
 static unsigned int can_scale_bus;
@@ -349,21 +356,18 @@ static int powernow_acpi_init(void)
 		unsigned int speed;
 
 		pc.val = (unsigned long) acpi_processor_perf->states[i].control;
-		dprintk (KERN_INFO PFX "acpi:  P%d: %d MHz, %d mW, %d uS, control %08x, status %08x, vid: %02x fid: %02x SGTC: %d\n",
+		dprintk (KERN_INFO PFX "acpi:  P%d: %d MHz %d mW %d uS control %08x SGTC %d\n",
 			 i,
 			 (u32) acpi_processor_perf->states[i].core_frequency,
 			 (u32) acpi_processor_perf->states[i].power,
 			 (u32) acpi_processor_perf->states[i].transition_latency,
 			 (u32) acpi_processor_perf->states[i].control,
-			 (u32) acpi_processor_perf->states[i].status,
-			 pc.bits.vid,
-			 pc.bits.fid,
 			 pc.bits.sgtc);
 
 		vid = pc.bits.vid;
 		fid = pc.bits.fid;
 
-		powernow_table[i].frequency = (fsb * fid_codes[fid]);
+		powernow_table[i].frequency = fsb * fid_codes[fid] / 10;
 		powernow_table[i].index = fid; /* lower 8 bits */
 		powernow_table[i].index |= (vid << 8); /* upper 8 bits */
 
@@ -556,7 +560,7 @@ static int __init powernow_cpu_init (str
 	}
 	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
 
-	if (dmi_broken & BROKEN_CPUFREQ) {
+	if ((dmi_broken & BROKEN_CPUFREQ) || powernow_acpi_force) {
 		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
 		result = powernow_acpi_init();
 	} else {
@@ -633,6 +637,10 @@ static void __exit powernow_exit (void)
 		kfree(powernow_table);
 }
 
+module_param(powernow_acpi_force,  int, 0444);
+
+MODULE_PARM_DESC(powernow_acpi_force, "Force ACPI to be used");
+
 MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
