From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 18:50:00 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209175000.GE13262@poupinou.org>
References: <20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040209150519.GA6531@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk


How about that one?  By now, I'm a little puzzled with the fsb stuff,
though.  A first idea may be to look into what say ACPI about the
frequency, and deduce the fsb from, but I don't like it.

--- powernow-k7.c	2004-02-09 18:48:22.000000000 +0100
+++ linux-2.6.3-bk-acpi/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-02-09 18:37:17.000000000 +0100
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
+		sgtc:20,
+		res1:2;
+	} bits;
+	unsigned long val;
+};
+#endif
 
 /* divide by 1000 to get VID. */
 static int mobile_vid_table[32] = {
@@ -308,6 +325,132 @@
 	return 0;
 }
 
+#ifdef CONFIG_ACPI_PROCESSOR
+
+struct acpi_processor_performance *acpi_processor_perf;
+
+static int powernow_acpi_init(void)
+{
+	int i;
+	int retval = 0;
+
+	if (acpi_processor_perf != NULL)
+		return -EINVAL;
+
+	if (powernow_table != NULL)
+		return -EINVAL;
+
+	acpi_processor_perf = kmalloc(sizeof(struct acpi_processor_performance),
+				      GFP_KERNEL);
+
+	if (!acpi_processor_perf)
+		return -ENOMEM;
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
+	fsb = 100;	/* XXX fix me */
+	latency = 0;
+
+	for (i = 0; i < number_scales; i++) {
+		u8 fid, vid;
+		union powernow_acpi_control_t pc;
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
+		powernow_table[i].frequency = fsb * fid_codes[fid] * 100;
+		powernow_table[i].index = fid; /* lower 8 bits */
+		powernow_table[i].index |= (vid << 8); /* upper 8 bits */
+
+		speed = fsb * (fid_codes[fid]/10);
+		if ((fid_codes[fid] % 10)==5) {
+			speed += fsb/2;
+			if (have_a0 == 1)
+				powernow_table[i].frequency = CPUFREQ_ENTRY_INVALID;
+		}
+
+		dprintk (KERN_INFO PFX "   FID: 0x%x (%d.%dx [%dMHz])\t", fid,
+			fid_codes[fid] / 10, fid_codes[fid] % 10, speed);
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
+	/* Validate latency.  The latency should be at least
+	 * 10000 and must fit in a 20 bit register.
+	 */
+	if ((latency & ((~((~0u) << 20)))) < 10000) {
+		printk(KERN_WARNING PFX "broken latency in ACPI table.\n");
+		printk(KERN_INFO PFX "ACPI set settling time to %d.%02d microseconds.  "
+			"Should be at least 100. Correcting.\n",
+			latency/100,
+			latency%100);
+		latency = 10000;
+	}
+	powernow_table[i].frequency = CPUFREQ_TABLE_END;
+	powernow_table[i].index = 0;
+
+	return 0;
+
+err2:
+	acpi_processor_unregister_performance(acpi_processor_perf, 0);
+err1:
+	kfree(acpi_processor_perf);
+	acpi_processor_perf = NULL;
+	return retval;
+}
+#endif
+
 static int powernow_decode_bios (int maxfid, int startvid)
 {
 	struct psb_s *psb;
@@ -640,6 +804,10 @@
 
 static void __exit powernow_exit (void)
 {
+	if (acpi_processor_perf) {
+		acpi_processor_unregister_performance(acpi_processor_perf, 0);
+		kfree(acpi_processor_perf);
+	}
 	cpufreq_unregister_driver(&powernow_driver);
 	if (powernow_table)
 		kfree(powernow_table);


-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
