From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [PATCH 2.6] powernow-k7 acpi support.
Date: Mon, 9 Feb 2004 14:26:59 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040209132659.GY13262@poupinou.org>
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
To: davej@redhat.com
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

Hi Dave, Dominik, list,

Since now linux-2.6 bk tree do have necessary patches from Dominik for,
this is a possible version in order to get the powernow table from ACPI,
if the legacy method fail, or if the laptop is blacklisted.  The following
patch do only include the static function powernow_acpi_init() that have
to be called in order to get the config stuff from acpi.


By now, there are different ways to use it.  The present patch do not
include any of them.

1- Include the powernow_acpi_init() as the first call in
powernow_decode_bios(), so that ACPI is used first, then if it failed,
the legacy method is used,
or
2- Include the powernow_acpi_init() at powernow_decode_bios() just
before the 3 printk's stating to write that you should see
http://www.codemonkey.org.uk/projects/cpufreq/...

I guess 2- is 'better', but I would like to get some thought, though.


--- linux-2.6.2-rc3-mm1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/02/03 19:05:44	1.4
+++ linux-2.6.2-rc3-mm1/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/02/04 16:03:28
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
@@ -309,6 +325,110 @@
 	return 0;
 }
 
+#ifdef CONFIG_ACPI_PROCESSOR
+
+static int powernow_acpi_init(void)
+{
+	int i;
+	int retval = 0;
+	struct acpi_pct_register *r;
+	struct acpi_processor_performance p;
+
+	memset(&p, 0, sizeof (p));
+
+	if (powernow_table != NULL)
+		return -EINVAL;
+
+	printk("1\n");
+	if (acpi_processor_register_performance(&p, 0))
+		return -EIO;
+	printk("2\n");
+
+	r = &p.control_register;
+	if (r->space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
+		retval = -ENODEV;
+		goto out;
+	}
+	r = &p.status_register;
+	if (r->space_id != ACPI_ADR_SPACE_FIXED_HARDWARE) {
+		retval = -ENODEV;
+		goto out;
+	}
+
+	number_scales = p.state_count;
+
+	if (number_scales < 2) {
+		retval = -ENODEV;
+		goto out;
+	}
+
+	powernow_table = kmalloc((number_scales + 1) * (sizeof(struct cpufreq_frequency_table)), GFP_KERNEL);
+	if (!powernow_table) {
+		retval = -ENOMEM;
+		goto out;
+	}
+
+	memset(powernow_table, 0, ((number_scales + 1) * sizeof(struct cpufreq_frequency_table)));
+
+	fsb = 100;	/* XXX fix me */
+	latency = 10000;	/* XXX don't trust bios writers.. */
+
+	for (i = 0; i < number_scales; i++) {
+		union powernow_acpi_control_t pc;
+		u8 fid, vid;
+		unsigned int speed;
+
+		pc.val = (unsigned long) p.states[i].control;
+		dprintk (KERN_INFO PFX "acpi:  P%d: %d MHz, %d mW, %d uS, control %08x, status %08x, vid: %02x fid: %02x SGTC: %d\n",
+			 i,
+			 (u32) p.states[i].core_frequency,
+			 (u32) p.states[i].power,
+			 (u32) p.states[i].transition_latency,
+			 (u32) p.states[i].control,
+			 (u32) p.states[i].status,
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
+		if (speed < minimum_speed)
+			minimum_speed = speed;
+		if (speed > maximum_speed)
+			maximum_speed = speed;
+	}
+	powernow_table[i].frequency = CPUFREQ_TABLE_END;
+	powernow_table[i].index = 0;
+
+	/*
+	 * We don't need no more acpi.
+	 * XXX is that true?
+	 */
+
+out:
+	acpi_processor_unregister_performance(&p, 0);
+
+	return retval;
+}
+#endif
+
 static int powernow_decode_bios (int maxfid, int startvid)
 {
 	struct psb_s *psb;

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
