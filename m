From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH][powernow-k7] correcting SGTC. Timer is based upon FSB.
Date: Wed, 14 Apr 2004 14:18:57 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040414121857.GC8953@poupinou.org>
References: <20040414103646.GB8953@poupinou.org>
	<20040414104148.GC24970@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040414104148.GC24970@redhat.com>
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

On Wed, Apr 14, 2004 at 11:41:48AM +0100, Dave Jones wrote:
> On Wed, Apr 14, 2004 at 12:36:46PM +0200, Bruno Ducrot wrote:
>  > Hi Dave,
>  > 
>  > I think this patch is needed especially if the FSB is around 166MHz or
>  > 200MHz, or else I believe we get instabilities on some K7's motherboard
>  > powernow capable (it's called Cool'n Quiet IIRC).
> 
> Looks good, applied.  It'll turn up in the next -mm.
> 

Already?  Thanks!
I actually wanted to submit also the ACPI integration...

Warning: it will only half work on the ACER Aspire, though: there is
no pstate in the DSDT corresponding to the max frequency...
I'm looking how to handle that correctly, probably at the init stage,
if the max frequency is not given, then add it to powernow_table.  It's
really ugly, but I don't know how to make that OK.
Suggestion is of course welcome..


* Integrate acpi perflib from Dominik.
* Use acpi if the PST tables are known to be broken (ASUS Aspire match one PST,
  but give brain damaged values), or use ACPI if no PST found.

 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |  180 +++++++++++++++++++++++++++--
 1 files changed, 168 insertions(+), 12 deletions(-)

--- linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 11:49:44	1.3
+++ linux-dj-cpufreq/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/04/14 12:11:24
@@ -27,6 +27,11 @@
 #include <asm/io.h>
 #include <asm/system.h>
 
+#ifdef CONFIG_ACPI_PROCESSOR
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+#endif
+
 #include "powernow-k7.h"
 
 #define DEBUG
@@ -57,6 +62,17 @@ struct pst_s {
 	u8 numpstates;
 };
 
+#ifdef CONFIG_ACPI_PROCESSOR
+union powernow_acpi_control_t {
+	struct {
+		unsigned long fid:5,
+		vid:5,
+		sgtc:20,
+		res1:2;
+	} bits;
+	unsigned long val;
+};
+#endif
 
 /* divide by 1000 to get VID. */
 static int mobile_vid_table[32] = {
@@ -272,6 +288,129 @@ static void change_speed (unsigned int i
 }
 
 
+#ifdef CONFIG_ACPI_PROCESSOR
+
+struct acpi_processor_performance *acpi_processor_perf;
+
+static int powernow_acpi_init(void)
+{
+	int i;
+	int retval = 0;
+	union powernow_acpi_control_t pc;
+
+	if (acpi_processor_perf != NULL && powernow_table != NULL) {
+		retval = -EINVAL;
+		goto err0;
+	}
+
+	acpi_processor_perf = kmalloc(sizeof(struct acpi_processor_performance),
+				      GFP_KERNEL);
+
+	if (!acpi_processor_perf) {
+		retval = -ENOMEM;
+		goto err0;
+	}
+
+	memset(acpi_processor_perf, 0, sizeof(struct acpi_processor_performance));
+
+	if (acpi_processor_register_performance(acpi_processor_perf, 0)) {
+		retval = -EIO;
+		goto err1;
+	}
+
+	if (acpi_processor_perf->control_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
+		retval = -ENODEV;
+		goto err2;
+	}
+
+	if (acpi_processor_perf->status_register.space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
+		retval = -ENODEV;
+		goto err2;
+	}
+
+	number_scales = acpi_processor_perf->state_count;
+
+	if (number_scales < 2) {
+		retval = -ENODEV;
+		goto err2;
+	}
+
+	powernow_table = kmalloc((number_scales + 1) * (sizeof(struct cpufreq_frequency_table)), GFP_KERNEL);
+	if (!powernow_table) {
+		retval = -ENOMEM;
+		goto err2;
+	}
+
+	memset(powernow_table, 0, ((number_scales + 1) * sizeof(struct cpufreq_frequency_table)));
+
+	pc.val = (unsigned long) acpi_processor_perf->states[0].control;
+	for (i = 0; i < number_scales; i++) {
+		u8 fid, vid;
+		unsigned int speed;
+
+		pc.val = (unsigned long) acpi_processor_perf->states[i].control;
+		dprintk (KERN_INFO PFX "acpi:  P%d: %d MHz, %d mW, %d uS, control %08x, status %08x, vid: %02x fid: %02x SGTC: %d\n",
+			 i,
+			 (u32) acpi_processor_perf->states[i].core_frequency,
+			 (u32) acpi_processor_perf->states[i].power,
+			 (u32) acpi_processor_perf->states[i].transition_latency,
+			 (u32) acpi_processor_perf->states[i].control,
+			 (u32) acpi_processor_perf->states[i].status,
+			 pc.bits.vid,
+			 pc.bits.fid,
+			 pc.bits.sgtc);
+
+		vid = pc.bits.vid;
+		fid = pc.bits.fid;
+
+		powernow_table[i].frequency = (fsb * fid_codes[fid]);
+		powernow_table[i].index = fid; /* lower 8 bits */
+		powernow_table[i].index |= (vid << 8); /* upper 8 bits */
+
+		speed = powernow_table[i].frequency;
+
+		if ((fid_codes[fid] % 10)==5) {
+			if (have_a0 == 1)
+				powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
+		}
+
+		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
+			fid_codes[fid] / 10, fid_codes[fid] % 10, speed/1000);
+		dprintk ("VID: 0x%x (%d.%03dV)\n", vid,	mobile_vid_table[vid]/1000,
+			mobile_vid_table[vid]%1000);
+
+		if (latency < pc.bits.sgtc)
+			latency = pc.bits.sgtc;
+
+		if (speed < minimum_speed)
+			minimum_speed = speed;
+		if (speed > maximum_speed)
+			maximum_speed = speed;
+	}
+
+	powernow_table[i].frequency = CPUFREQ_TABLE_END;
+	powernow_table[i].index = 0;
+
+	return 0;
+
+err2:
+	acpi_processor_unregister_performance(acpi_processor_perf, 0);
+err1:
+	kfree(acpi_processor_perf);
+err0:
+	printk(KERN_WARNING PFX "ACPI perflib can not be used in this platform\n");
+	acpi_processor_perf = NULL;
+	return retval;
+}
+#else
+static int powernow_acpi_init(void)
+{
+	printk(KERN_INFO PFX "no support for ACPI processor found."
+	       "  Please recompile your kernel with ACPI processor\n");
+	return -EINVAL;
+}
+#endif
+
 static int powernow_decode_bios (int maxfid, int startvid)
 {
 	struct psb_s *psb;
@@ -341,8 +480,14 @@ static int powernow_decode_bios (int max
 			}
 			printk (KERN_INFO PFX "No PST tables match this cpuid (0x%x)\n", etuple);
 			printk (KERN_INFO PFX "This is indicative of a broken BIOS.\n");
-			printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
-			return -EINVAL;
+
+			printk (KERN_INFO PFX "Trying ACPI perflib\n");
+			ret = powernow_acpi_init();
+			if (ret) {
+				printk (KERN_INFO PFX "ACPI and legacy methods failed\n");
+				printk (KERN_INFO PFX "See http://www.codemonkey.org.uk/projects/cpufreq/powernow-k7.shtml\n");
+			}
+			return ret;
 		}
 		p++;
 	}
@@ -417,7 +562,20 @@ static int __init powernow_cpu_init (str
 	}
 	dprintk(KERN_INFO PFX "FSB: %3d.%03d MHz\n", fsb/1000, fsb%1000);
 
-	result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
+	if (dmi_broken & BROKEN_CPUFREQ) {
+		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
+		result = powernow_acpi_init();
+	} else {
+		result = powernow_decode_bios(fidvidstatus.bits.MFID, fidvidstatus.bits.SVID);
+		if (result) {
+			result = powernow_acpi_init();
+		} else {
+			/* SGTC use the bus clock as timer */
+			latency = fixup_sgtc();
+			printk(KERN_INFO PFX "SGTC: %d\n", latency);
+		}
+	}
+
 	if (result)
 		return result;
 
@@ -426,11 +584,7 @@ static int __init powernow_cpu_init (str
 
 	policy->governor = CPUFREQ_DEFAULT_GOVERNOR;
 
-	policy->cpuinfo.transition_latency = latency * 2;
-
-	/* SGTC use the bus clock as timer */
-	latency = fixup_sgtc();
-	printk(KERN_INFO PFX "SGTC: %d\n", latency);
+	policy->cpuinfo.transition_latency = 20 * latency / fsb;
 
 	policy->cur = maximum_speed;
 
@@ -461,10 +615,6 @@ static struct cpufreq_driver powernow_dr
 
 static int __init powernow_init (void)
 {
-	if (dmi_broken & BROKEN_CPUFREQ) {
-		printk (KERN_INFO PFX "Disabled at boot time by DMI,\n");
-		return -ENODEV;
-	}
 	if (check_powernow()==0)
 		return -ENODEV;
 	return cpufreq_register_driver(&powernow_driver);
@@ -473,6 +623,12 @@ static int __init powernow_init (void)
 
 static void __exit powernow_exit (void)
 {
+#ifdef CONFIG_ACPI_PROCESSOR
+	if (acpi_processor_perf) {
+		acpi_processor_unregister_performance(acpi_processor_perf, 0);
+		kfree(acpi_processor_perf);
+	}
+#endif
 	cpufreq_unregister_driver(&powernow_driver);
 	if (powernow_table)
 		kfree(powernow_table);



-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
