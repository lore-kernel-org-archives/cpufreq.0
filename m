From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH] [1/1] Integrate ACPI perflib with: "SGTC is a timer using
	the bus clock".
Date: Fri, 26 Mar 2004 12:03:40 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040326110340.GN19001@poupinou.org>
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
To: Dave Jones <davej@redhat.com>
Cc: ducrot@poupinou.org, cpufreq@www.linux.org.uk


Hi Dave,

* rediff the acpi perflib integration.

 arch/i386/kernel/cpu/cpufreq/powernow-k7.c |  166 +++++++++++++++++++++++++++--
 1 files changed, 160 insertions(+), 6 deletions(-)

--- linux-2.6.5-rc2/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/26 10:47:19	1.2
+++ linux-2.6.5-rc2/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/03/26 10:56:27
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
@@ -57,6 +62,17 @@
 	u8 numpstates;
 };
 
+#ifdef CONFIG_ACPI_PROCESSOR
+union powernow_acpi_control_t {
+	struct {
+		unsigned long fid:5,
+		vid:5,
+		latency:20,
+		res1:2;
+	} bits;
+	unsigned long val;
+};
+#endif
 
 /* divide by 1000 to get VID. */
 static int mobile_vid_table[32] = {
@@ -270,6 +286,131 @@
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
+			 pc.bits.latency);
+
+		vid = pc.bits.vid;
+		fid = pc.bits.fid;
+
+		powernow_table[i].frequency = (fsb * fid_codes[fid]) / 100;
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
+		if (latency < pc.bits.latency)
+			latency = pc.bits.latency;
+
+		if (speed < minimum_speed)
+			minimum_speed = speed;
+		if (speed > maximum_speed)
+			maximum_speed = speed;
+	}
+
+	latency /= 100;
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
@@ -279,6 +420,11 @@
 	unsigned int etuple;
 	unsigned int ret;
 
+	if (dmi_broken & BROKEN_CPUFREQ) {
+		printk (KERN_INFO PFX "PSB/PST known to be broken.  Trying ACPI instead\n");
+		return (powernow_acpi_init());
+	}
+
 	etuple = cpuid_eax(0x80000001);
 
 	for (i=0xC0000; i < 0xffff0 ; i+=16) {
@@ -339,8 +485,14 @@
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
@@ -459,10 +611,6 @@
 
 static int __init powernow_init (void)
 {
-	if (dmi_broken & BROKEN_CPUFREQ) {
-		printk (KERN_INFO PFX "Disabled at boot time by DMI,\n");
-		return -ENODEV;
-	}
 	if (check_powernow()==0)
 		return -ENODEV;
 	return cpufreq_register_driver(&powernow_driver);
@@ -471,6 +619,12 @@
 
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
