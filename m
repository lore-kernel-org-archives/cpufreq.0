From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH] detect processor speed in p4-clockmod
Date: Tue, 4 Nov 2003 20:38:01 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104193801.GB4474@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
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
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk

[Note: probably too invasive for 2.6.0-testX]

Instead of relying on cpu_khz or user input, decode the appropriate MSR in
p4_clockmod to detect the maximum frequency of the CPU.

	Dominik

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c linux/a=
rch/i386/kernel/cpu/cpufreq/p4-clockmod.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-04 15=
:27:33.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/p4-clockmod.c	2003-11-04 20:23:07.38=
4393904 +0100
@@ -48,8 +48,7 @@
=20
=20
 static int has_N44_O17_errata[NR_CPUS];
-static int stock_freq;
-
+unsigned int stock_freq;
=20
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
@@ -175,6 +174,54 @@
 	return cpufreq_frequency_table_verify(policy, &p4clockmod_table[0]);
 }
=20
+/* copied from speedstep_lib, made SMP-compatible */
+static unsigned int cpufreq_p4_get_frequency(struct cpuinfo_x86 *c)
+{
+	u32 msr_lo, msr_hi, mult;
+	unsigned int fsb =3D 0;
+
+	if (c->x86 !=3D 0xF) {
+		printk(KERN_DEBUG PFX "Unknown P4. Please send an e-mail to <linux@brodo=
=2Ede>\n");
+		return 0;
+	}
+
+	rdmsr(0x2c, msr_lo, msr_hi);
+
+	/* printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo=
, msr_hi); */
+	/* decode the FSB: see IA-32 Intel (C) Architecture Software=20
+	 * Developer's Manual, Volume 3: System Prgramming Guide,
+	 * revision #12 in Table B-1: MSRs in the Pentium 4 and
+	 * Intel Xeon Processors, on page B-4 and B-5.
+	 */
+	if (c->x86_model < 2)
+		fsb =3D 100 * 1000;
+	else {
+		u8 fsb_code =3D (msr_lo >> 16) & 0x7;
+		switch (fsb_code) {
+		case 0:
+			fsb =3D 100 * 1000;
+			break;
+		case 1:
+			fsb =3D 13333 * 10;
+			break;
+		case 2:
+			fsb =3D 200 * 1000;
+			break;
+		}
+	}
+
+	if (!fsb) {
+		printk(KERN_DEBUG PFX "couldn't detect FSB speed. Please send an e-mail =
to <linux@brodo.de>\n");
+		printk(KERN_DEBUG PFX "P4 - MSR_EBC_FREQUENCY_ID: 0x%x 0x%x\n", msr_lo, =
msr_hi);
+	}
+
+	/* Multiplier. */
+	mult =3D msr_lo >> 24;
+
+	return (fsb * mult);
+}
+
+=20
=20
 static int cpufreq_p4_cpu_init(struct cpufreq_policy *policy)
 {
@@ -192,15 +239,10 @@
 		has_N44_O17_errata[policy->cpu] =3D 1;
 	}
 =09
-	/* get frequency */
-	if (!stock_freq) {
-		if (cpu_khz)
-			stock_freq =3D cpu_khz;
-		else {
-			printk(KERN_INFO PFX "unknown core frequency - please use module parame=
ter 'stock_freq'\n");
-			return -EINVAL;
-		}
-	}
+	/* get max frequency */
+	stock_freq =3D cpufreq_p4_get_frequency(c);
+	if (!stock_freq)
+		return -EINVAL;
=20
 	/* table init */
 	for (i=3D1; (p4clockmod_table[i].frequency !=3D CPUFREQ_TABLE_END); i++) {
@@ -269,8 +311,6 @@
 }
=20
=20
-MODULE_PARM(stock_freq, "i");
-
 MODULE_AUTHOR ("Zwane Mwaikambo <zwane@commfireservices.com>");
 MODULE_DESCRIPTION ("cpufreq driver for Pentium(TM) 4/Xeon(TM)");
 MODULE_LICENSE ("GPL");
