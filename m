From: Ducrot Bruno <ducrot@arm.linux.org.uk>
Subject: cpufreq/linux/arch/i386/kernel/cpufreq longhaul.h,NONE,1.1 Makefile,1.13,1.14 acpi.c,1.8,1.9 longhaul.c,1.92,1.93 longrun.c,1.28,1.29 p4-clockmod.c,1.42,1.43 powernow-k6.c,1.51,1.52 powernow-k7.c,1.43,1.44 powernow-k7.h,1.2,1.3 speedstep-centrino.c,1.2,1.3 speedstep-ich.c,1.4,1.5 speedstep-lib.c,1.1,1.2
Date: Tue, 19 Aug 2003 14:38:39 +0100
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <E19p6h5-0005kD-1l@flint.arm.linux.org.uk>
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cpufreq@lists.arm.linux.org.uk

Update of /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq
In directory flint:/tmp/cvs-serv22028/linux/arch/i386/kernel/cpufreq

Modified Files:
	Makefile acpi.c longhaul.c longrun.c p4-clockmod.c=20
	powernow-k6.c powernow-k7.c powernow-k7.h speedstep-centrino.c=20
	speedstep-ich.c speedstep-lib.c=20
Added Files:
	longhaul.h=20
Log Message:
sync with latest davej version

--- NEW FILE longhaul.h ---
/*
 *  longhaul.h
 *  (C) 2003 Dave Jones.
 *
 *  Licensed under the terms of the GNU GPL License version 2.
 *
 *  VIA-specific information
 */

union msr_bcr2 {
	struct {
		unsigned Reseved:19,	// 18:0
		ESOFTBF:1,		// 19
		Reserved2:3,		// 22:20
		CLOCKMUL:4,		// 26:23
		Reserved3:5;		// 31:27
	} bits;
	unsigned long val;
};

union msr_longhaul {
	struct {
		unsigned RevisionID:4,	// 3:0
		RevisionKey:4,		// 7:4
		EnableSoftBusRatio:1,	// 8
		EnableSoftVID:1,	// 9
		EnableSoftBSEL:1,	// 10
		Reserved:3,		// 11:13
		SoftBusRatio4:1,	// 14
		VRMRev:1,		// 15
		SoftBusRatio:4,		// 19:16
		SoftVID:5,		// 24:20
		Reserved2:3,		// 27:25
		SoftBSEL:2,		// 29:28
		Reserved3:2,		// 31:30
		MaxMHzBR:4,		// 35:32
		MaximumVID:5,		// 40:36
		MaxMHzFSB:2,		// 42:41
		MaxMHzBR4:1,		// 43
		Reserved4:4,		// 47:44
		MinMHzBR:4,		// 51:48
		MinimumVID:5,		// 56:52
		MinMHzFSB:2,		// 58:57
		MinMHzBR4:1,		// 59
		Reserved5:4;		// 63:60
	} bits;
	unsigned long long val;
};


Index: Makefile
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/Makefile,v
retrieving revision 1.13
retrieving revision 1.14
diff -u -r1.13 -r1.14
--- Makefile	11 Jul 2003 15:55:38 -0000	1.13
+++ Makefile	19 Aug 2003 13:38:32 -0000	1.14
@@ -4,12 +4,12 @@
 obj-$(CONFIG_X86_P4_CLOCKMOD)	+=3D p4-clockmod.o
 obj-$(CONFIG_ELAN_CPUFREQ)	+=3D elanfreq.o
 obj-$(CONFIG_X86_LONGRUN)	+=3D longrun.o =20
-obj-$(CONFIG_X86_GX_SUSPMOD)	+=3D gx-suspmod.o
+obj-$(CONFIG_X86_GX_SUSPMOD)    +=3D gx-suspmod.o
 obj-$(CONFIG_X86_ACPI_CPUFREQ)	+=3D acpi.o
-obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+=3D speedstep-piix4.o
 obj-$(CONFIG_X86_SPEEDSTEP_ICH)	+=3D speedstep-ich.o
+obj-$(CONFIG_X86_SPEEDSTEP_PIIX4)	+=3D speedstep-piix4.o
+obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO) +=3D speedstep-centrino.o
 obj-$(CONFIG_X86_SPEEDSTEP_LIB) +=3D speedstep-lib.o
-obj-$(CONFIG_X86_SPEEDSTEP_CENTRINO)	+=3D speedstep-centrino.o
=20
 ifdef CONFIG_X86_ACPI_CPUFREQ
   ifdef CONFIG_ACPI_DEBUG

Index: acpi.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/acpi.c,v
retrieving revision 1.8
retrieving revision 1.9
diff -u -r1.8 -r1.9
--- acpi.c	11 Jul 2003 15:55:38 -0000	1.8
+++ acpi.c	19 Aug 2003 13:38:32 -0000	1.9
@@ -380,7 +380,7 @@
 static int
 acpi_processor_write_performance (
         struct file		*file,
-        const char		*buffer,
+        const char		__user *buffer,
         size_t			count,
         loff_t			*data)
 {

Index: longhaul.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longhaul.=
c,v
retrieving revision 1.92
retrieving revision 1.93
diff -u -r1.92 -r1.93
--- longhaul.c	16 Jun 2003 20:39:11 -0000	1.92
+++ longhaul.c	19 Aug 2003 13:38:32 -0000	1.93
@@ -1,7 +1,5 @@
 /*
- *  $Id$
- *
- *  (C) 2001  Dave Jones. <davej@suse.de>
+ *  (C) 2001-2003  Dave Jones. <davej@codemonkey.org.uk>
  *  (C) 2002  Padraig Brady. <padraig@antefacto.com>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
@@ -32,6 +30,8 @@
 #include <asm/timex.h>
 #include <asm/io.h>
=20
+#include "longhaul.h"
+
 #define DEBUG
=20
 #ifdef DEBUG
@@ -40,6 +40,8 @@
 #define dprintk(msg...) do { } while(0)
 #endif
=20
+#define PFX "longhaul: "
+
 static unsigned int numscales=3D16, numvscales;
 static int minvid, maxvid;
 static int can_scale_voltage;
@@ -248,7 +250,7 @@
 static int eblcr_table[32];
 static int voltage_table[32];
 static unsigned int highest_speed, lowest_speed; /* kHz */
-static int longhaul; /* version. */
+static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
=20
=20
@@ -273,7 +275,7 @@
=20
 	rdmsr (MSR_IA32_EBL_CR_POWERON, lo, hi);
 	invalue =3D (lo & (1<<22|1<<23|1<<24|1<<25)) >>22;
-	if (longhaul=3D=3D3) {
+	if (longhaul_version=3D=3D3) {
 		if (lo & (1<<27))
 			invalue+=3D16;
 	}
@@ -283,19 +285,18 @@
=20
 /**
  * longhaul_set_cpu_frequency()
- * @clock_ratio_index : index of clock_ratio[] for new frequency
+ * @clock_ratio_index : bitpattern of the new multiplier.
  *
  * Sets a new clock ratio, and -if applicable- a new Front Side Bus
  */
=20
 static void longhaul_setstate (unsigned int clock_ratio_index)
 {
-	unsigned long lo, hi;
-	unsigned int bits;
-	int revkey;
 	int vidindex, i;
 	struct cpufreq_freqs freqs;
-=09
+	union msr_longhaul longhaul;
+	union msr_bcr2 bcr2;
+
 	if (clock_ratio[clock_ratio_index] =3D=3D -1)
 		return;
=20
@@ -309,39 +310,33 @@
 =09
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
=20
-	dprintk (KERN_INFO "longhaul: FSB:%d Mult(x10):%d\n",
+	dprintk (KERN_INFO PFX "FSB:%d Mult(x10):%d\n",
 				fsb * 100, clock_ratio[clock_ratio_index]);
=20
-	bits =3D clock_ratio_index;
-	/* "bits" contains the bitpattern of the new multiplier.
-	   we now need to transform it to the desired format. */
-
-	switch (longhaul) {
+	switch (longhaul_version) {
 	case 1:
-		rdmsr (MSR_VIA_BCR2, lo, hi);
-		revkey =3D (lo & 0xf)<<4; /* Rev key. */
-		lo &=3D ~(1<<23|1<<24|1<<25|1<<26);
-		lo |=3D (1<<19);		/* Enable software clock multiplier */
-		lo |=3D (bits<<23);	/* desired multiplier */
-		lo |=3D revkey;
-		wrmsr (MSR_VIA_BCR2, lo, hi);
+		rdmsrl (MSR_VIA_BCR2, bcr2.val);
+		/* Enable software clock multiplier */
+		bcr2.bits.ESOFTBF =3D 1;
+		bcr2.bits.CLOCKMUL =3D clock_ratio_index;
+		wrmsrl (MSR_VIA_BCR2, bcr2.val);
=20
 		__hlt();
=20
 		/* Disable software clock multiplier */
-		rdmsr (MSR_VIA_BCR2, lo, hi);
-		lo &=3D ~(1<<19);
-		lo |=3D revkey;
-		wrmsr (MSR_VIA_BCR2, lo, hi);
+		rdmsrl (MSR_VIA_BCR2, bcr2.val);
+		bcr2.bits.ESOFTBF =3D 0;
+		wrmsrl (MSR_VIA_BCR2, bcr2.val);
 		break;
=20
 	case 2:
-		rdmsr (MSR_VIA_LONGHAUL, lo, hi);
-		revkey =3D (lo & 0xf)<<4;	/* Rev key. */
-		lo &=3D 0xfff0bf0f;	/* reset [19:16,14](bus ratio) and [7:4](rev key) to=
 0 */
-		lo |=3D (bits<<16);
-		lo |=3D (1<<8);	/* EnableSoftBusRatio */
-		lo |=3D revkey;
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul.bits.SoftBusRatio =3D clock_ratio_index & 0xf;
+		longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
+		longhaul.bits.EnableSoftBusRatio =3D 1;
+		/* We must program the revision key only with values we
+		 * know about, not blindly copy it from 0:3 */
+		longhaul.bits.RevisionKey =3D 1;
=20
 		if (can_scale_voltage) {
 			/* PB: TODO fix this up */
@@ -356,41 +351,41 @@
 			if (i=3D=3D32)
 				goto bad_voltage;
=20
-			dprintk (KERN_INFO "longhaul: Desired vid index=3D%d\n", i);
+			dprintk (KERN_INFO PFX "Desired vid index=3D%d\n", i);
 #if 0
-			lo &=3D 0xfe0fffff;/* reset [24:20](voltage) to 0 */
-			lo |=3D (i<<20);   /* set voltage */
-			lo |=3D (1<<9);    /* EnableSoftVID */
+			longhaul.bits.SoftVID =3D i;
+			longhaul.bits.EnableSoftVID =3D 1;
 #endif
 		}
-
+/* FIXME: Do voltage and freq seperatly like we do in powernow-k7 */
 bad_voltage:
-		wrmsr (MSR_VIA_LONGHAUL, lo, hi);
+		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		__hlt();
=20
-		rdmsr (MSR_VIA_LONGHAUL, lo, hi);
-		lo &=3D ~(1<<8);
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul.bits.EnableSoftBusRatio =3D 0;
 		if (can_scale_voltage)
-			lo &=3D ~(1<<9);
-		lo |=3D revkey;
-		wrmsr (MSR_VIA_LONGHAUL, lo, hi);
+			longhaul.bits.EnableSoftVID =3D 0;
+		longhaul.bits.RevisionKey =3D 1;
+		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		break;
=20
 	case 3:
-		rdmsr (MSR_VIA_LONGHAUL, lo, hi);
-		revkey =3D (lo & 0xf)<<4;	/* Rev key. */
-		lo &=3D 0xfff0bf0f;	/* reset longhaul[19:16,14] to 0 */
-		lo |=3D (bits<<16);
-		lo |=3D (1<<8);	/* EnableSoftBusRatio */
-		lo |=3D revkey;
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul.bits.SoftBusRatio =3D clock_ratio_index & 0xf;
+		longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
+		longhaul.bits.EnableSoftBusRatio =3D 1;
+		/* We must program the revision key only with values we
+		 * know about, not blindly copy it from 0:3 */
+		longhaul.bits.RevisionKey =3D 3;	/* SoftVID & SoftBSEL */
=20
-		wrmsr (MSR_VIA_LONGHAUL, lo, hi);
+		wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
 		__hlt();
=20
-		rdmsr (MSR_VIA_LONGHAUL, lo, hi);
-		lo &=3D ~(1<<8);
-		lo |=3D revkey;
-		wrmsr (MSR_VIA_LONGHAUL, lo, hi);
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+		longhaul.bits.EnableSoftBusRatio =3D 0;
+		longhaul.bits.RevisionKey =3D 3;
+		wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
 		break;
 	}
=20
@@ -400,14 +395,15 @@
=20
 static int __init longhaul_get_ranges (void)
 {
-	unsigned long lo, hi, invalue;
+	unsigned long invalue;
 	unsigned int minmult=3D0, maxmult=3D0;
 	unsigned int multipliers[32]=3D {
 		50,30,40,100,55,35,45,95,90,70,80,60,120,75,85,65,
 		-1,110,120,-1,135,115,125,105,130,150,160,140,-1,155,-1,145 };
 	unsigned int j, k =3D 0;
+	union msr_longhaul longhaul;
=20
-	switch (longhaul) {
+	switch (longhaul_version) {
 	case 1:
 		/* Ugh, Longhaul v1 didn't have the min/max MSRs.
 		   Assume min=3D3.0x & max =3D whatever we booted at. */
@@ -416,17 +412,17 @@
 		break;
=20
 	case 2 ... 3:
-		rdmsr (MSR_VIA_LONGHAUL, lo, hi);
+		rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
=20
-		invalue =3D (hi & (1<<0|1<<1|1<<2|1<<3));
-		if (hi & (1<<11))
+		invalue =3D longhaul.bits.MaxMHzBR;
+		if (longhaul.bits.MaxMHzBR4)
 			invalue +=3D 16;
 		maxmult=3Dmultipliers[invalue];
=20
-#if 0	/* This is MaxMhz @ Min Voltage. Ignore for now */
-		invalue =3D (hi & (1<<16|1<<17|1<<18|1<<19)) >> 16;
-		if (hi & (1<<27))
-		invalue +=3D 16;
+#if 0
+		invalue =3D longhaul.bits.MinMHzBR;
+		if (longhaul.bits.MinMHzBR4);
+			invalue +=3D 16;
 		minmult =3D multipliers[invalue];
 #else
 		minmult =3D 30; /* as per spec */
@@ -436,9 +432,9 @@
=20
 	highest_speed =3D maxmult * fsb * 100;
 	lowest_speed =3D minmult * fsb * 100;
-	dprintk (KERN_INFO "longhaul: MinMult(x10)=3D%d MaxMult(x10)=3D%d\n",
+	dprintk (KERN_INFO PFX "MinMult(x10)=3D%d MaxMult(x10)=3D%d\n",
 		 minmult, maxmult);
-	dprintk (KERN_INFO "longhaul: Lowestspeed=3D%d Highestspeed=3D%d\n",
+	dprintk (KERN_INFO PFX "Lowestspeed=3D%d Highestspeed=3D%d\n",
 		 lowest_speed, highest_speed);
=20
 	longhaul_table =3D kmalloc((numscales + 1) * sizeof(struct cpufreq_freque=
ncy_table), GFP_KERNEL);
@@ -460,43 +456,62 @@
 		kfree (longhaul_table);
 		return -EINVAL;
 	}
-=09
+
 	return 0;
 }
=20
=20
-static void __init longhaul_setup_voltagescaling (unsigned long lo, unsign=
ed long hi)
+static void __init longhaul_setup_voltagescaling(void)
 {
-	int revkey;
+	union msr_longhaul longhaul;
=20
-	can_scale_voltage =3D 1;
+	rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
=20
-	minvid =3D (hi & (1<<20|1<<21|1<<22|1<<23|1<<24)) >> 20; /* 56:52 */
-	maxvid =3D (hi & (1<<4|1<<5|1<<6|1<<7|1<<8)) >> 4;       /* 40:36 */
-	vrmrev =3D (lo & (1<<15))>>15;
+	if (!(longhaul.bits.RevisionID & 1))
+		return;
+
+	minvid =3D longhaul.bits.MinimumVID;
+	maxvid =3D longhaul.bits.MaximumVID;
+	vrmrev =3D longhaul.bits.VRMRev;
+
+	if (minvid =3D=3D 0 || maxvid =3D=3D 0) {
+		printk (KERN_INFO PFX "Bogus values Min:%d.%03d Max:%d.%03d. "
+					"Voltage scaling disabled.\n",
+					minvid/1000, minvid%1000, maxvid/1000, maxvid%1000);
+		return;
+	}
+
+	if (minvid =3D=3D maxvid) {
+		printk (KERN_INFO PFX "Claims to support voltage scaling but min & max a=
re "
+				"both %d.%03d. Voltage scaling disabled\n",
+				maxvid/1000, maxvid%1000);
+		return;
+	}
=20
 	if (vrmrev=3D=3D0) {
-		dprintk (KERN_INFO "longhaul: VRM 8.5 : ");
+		dprintk (KERN_INFO PFX "VRM 8.5 : ");
 		memcpy (voltage_table, vrm85scales, sizeof(voltage_table));
 		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/25;
 	} else {
-		dprintk (KERN_INFO "longhaul: Mobile VRM : ");
+		dprintk (KERN_INFO PFX "Mobile VRM : ");
 		memcpy (voltage_table, mobilevrmscales, sizeof(voltage_table));
 		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/5;
 	}
=20
 	/* Current voltage isn't readable at first, so we need to
 	   set it to a known value. The spec says to use maxvid */
-	revkey =3D (lo & 0xf)<<4;	/* Rev key. */
-	lo &=3D 0xfe0fff0f;	/* Mask unneeded bits */
-	lo |=3D (1<<9);		/* EnableSoftVID */
-	lo |=3D revkey;		/* Reinsert key */
-	lo |=3D maxvid << 20;
-	wrmsr (MSR_VIA_LONGHAUL, lo, hi);
+	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;	/* FIXME: This is=
 bad. */
+	longhaul.bits.EnableSoftVID =3D 1;
+	longhaul.bits.SoftVID =3D maxvid;
+	wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
+
 	minvid =3D voltage_table[minvid];
 	maxvid =3D voltage_table[maxvid];
+
 	dprintk ("Min VID=3D%d.%03d Max VID=3D%d.%03d, %d possible voltage scales=
\n",
 		maxvid/1000, maxvid%1000, minvid/1000, minvid%1000, numvscales);
+
+	can_scale_voltage =3D 1;
 }
=20
=20
@@ -510,8 +525,8 @@
 			    unsigned int target_freq,
 			    unsigned int relation)
 {
-	unsigned int    table_index =3D 0;
- 	unsigned int    new_clock_ratio =3D 0;
+	unsigned int table_index =3D 0;
+ 	unsigned int new_clock_ratio =3D 0;
=20
 	if (cpufreq_frequency_table_target(policy, longhaul_table, target_freq, r=
elation, &table_index))
 		return -EINVAL;
@@ -530,7 +545,7 @@
=20
 	switch (c->x86_model) {
 	case 6:		/* VIA C3 Samuel C5A */
-		longhaul=3D1;
+		longhaul_version=3D1;
 		memcpy (clock_ratio, longhaul1_clock_ratio, sizeof(longhaul1_clock_ratio=
));
 		memcpy (eblcr_table, samuel1_eblcr, sizeof(samuel1_eblcr));
 		break;
@@ -538,12 +553,12 @@
 	case 7:		/* C5B / C5C */
 		switch (c->x86_mask) {
 		case 0:
-			longhaul=3D1;
+			longhaul_version=3D1;
 			memcpy (clock_ratio, longhaul1_clock_ratio, sizeof(longhaul1_clock_rati=
o));
 			memcpy (eblcr_table, samuel2_eblcr, sizeof(samuel2_eblcr));
 			break;
 		case 1 ... 15:
-			longhaul=3D2;
+			longhaul_version=3D2;
 			memcpy (clock_ratio, longhaul2_clock_ratio, sizeof(longhaul2_clock_rati=
o));
 			memcpy (eblcr_table, ezra_eblcr, sizeof(ezra_eblcr));
 			break;
@@ -552,21 +567,18 @@
=20
 	case 8:		/* C5M/C5N */
 		return -ENODEV; // Waiting on updated docs from VIA before this is usable
-		longhaul=3D3;
+		longhaul_version=3D3;
 		numscales=3D32;
 		memcpy (clock_ratio, longhaul3_clock_ratio, sizeof(longhaul3_clock_ratio=
));
 		memcpy (eblcr_table, c5m_eblcr, sizeof(c5m_eblcr));
 		break;
 	}
=20
-	printk (KERN_INFO "longhaul: VIA CPU detected. Longhaul version %d suppor=
ted\n", longhaul);
+	printk (KERN_INFO PFX "VIA CPU detected. Longhaul version %d supported\n",
+					longhaul_version);
=20
-	if (longhaul=3D=3D2 || longhaul=3D=3D3) {
-		unsigned long lo, hi;
-		rdmsr (MSR_VIA_LONGHAUL, lo, hi);
-		if ((lo & (1<<0)) && (dont_scale_voltage=3D=3D0))
-			longhaul_setup_voltagescaling (lo, hi);
-	}
+	if ((longhaul_version=3D=3D2 || longhaul_version=3D=3D3) && (dont_scale_v=
oltage=3D=3D0))
+		longhaul_setup_voltagescaling();
=20
 	ret =3D longhaul_get_ranges();
 	if (ret !=3D 0)
@@ -601,7 +613,7 @@
 	case 8:
 		return -ENODEV;
 	default:
-		printk (KERN_INFO "longhaul: Unknown VIA CPU. Contact davej@suse.de\n");
+		printk (KERN_INFO PFX "Unknown VIA CPU. Contact davej@codemonkey.org.uk\=
n");
 	}
=20
 	return -ENODEV;
@@ -615,7 +627,7 @@
=20
 MODULE_PARM (dont_scale_voltage, "i");
=20
-MODULE_AUTHOR ("Dave Jones <davej@suse.de>");
+MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Longhaul driver for VIA Cyrix processors.");
 MODULE_LICENSE ("GPL");
=20

Index: longrun.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/longrun.c=
,v
retrieving revision 1.28
retrieving revision 1.29
diff -u -r1.28 -r1.29
--- longrun.c	16 Jun 2003 20:39:11 -0000	1.28
+++ longrun.c	19 Aug 2003 13:38:32 -0000	1.29
@@ -1,6 +1,4 @@
 /*
- *  $Id$
- *
  * (C) 2002 - 2003  Dominik Brodowski <linux@brodo.de>
  *
  *  Licensed under the terms of the GNU GPL License version 2.
@@ -123,7 +121,7 @@
 		policy->cpuinfo.max_freq);
=20
 	if (policy->policy =3D=3D CPUFREQ_POLICY_GOVERNOR)
-		policy->policy =3D longrun_driver.policy[0].policy;
+		return -EINVAL;
=20
 	return 0;
 }

Index: p4-clockmod.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/p4-clockm=
od.c,v
retrieving revision 1.42
retrieving revision 1.43
diff -u -r1.42 -r1.43
--- p4-clockmod.c	16 Jun 2003 20:39:11 -0000	1.42
+++ p4-clockmod.c	19 Aug 2003 13:38:32 -0000	1.43
@@ -53,10 +53,9 @@
 static int cpufreq_p4_setdc(unsigned int cpu, unsigned int newstate)
 {
 	u32 l, h;
-	unsigned long cpus_allowed;
+	cpumask_t cpus_allowed, affected_cpu_map;
 	struct cpufreq_freqs freqs;
 	int hyperthreading =3D 0;
-	int affected_cpu_map =3D 0;
 	int sibling =3D 0;
=20
 	if (!cpu_online(cpu) || (newstate > DC_DISABLE) ||=20
@@ -67,16 +66,16 @@
 	cpus_allowed =3D current->cpus_allowed;
=20
 	/* only run on CPU to be set, or on its sibling */
-	affected_cpu_map =3D 1 << cpu;
+       affected_cpu_map =3D cpumask_of_cpu(cpu);
 #ifdef CONFIG_X86_HT
 	hyperthreading =3D ((cpu_has_ht) && (smp_num_siblings =3D=3D 2));
 	if (hyperthreading) {
 		sibling =3D cpu_sibling_map[cpu];
-		affected_cpu_map |=3D (1 << sibling);
+                cpu_set(sibling, affected_cpu_map);
 	}
 #endif
 	set_cpus_allowed(current, affected_cpu_map);
-	BUG_ON(!(affected_cpu_map & (1 << smp_processor_id())));
+        BUG_ON(!cpu_isset(smp_processor_id(), affected_cpu_map));
=20
 	/* get current state */
 	rdmsr(MSR_IA32_THERM_CONTROL, l, h);

Index: powernow-k6.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-=
k6.c,v
retrieving revision 1.51
retrieving revision 1.52
diff -u -r1.51 -r1.52
--- powernow-k6.c	16 Jun 2003 20:39:11 -0000	1.51
+++ powernow-k6.c	19 Aug 2003 13:38:32 -0000	1.52
@@ -1,8 +1,5 @@
 /*
- *  $Id$
- *  This file was part of Powertweak Linux (http://powertweak.sf.net)
- *  and is shared with the Linux Kernel module.
- *
+ *  This file was based upon code in Powertweak Linux (http://powertweak.s=
f.net)
  *  (C) 2000-2003  Dave Jones, Arjan van de Ven, Janne P=E4nk=E4l=E4, Domi=
nik Brodowski.
  *
  *  Licensed under the terms of the GNU GPL License version 2.
@@ -230,7 +227,7 @@
 }
=20
=20
-MODULE_AUTHOR ("Arjan van de Ven <arjanv@redhat.com>, Dave Jones <davej@su=
se.de>, Dominik Brodowski <linux@brodo.de>");
+MODULE_AUTHOR ("Arjan van de Ven <arjanv@redhat.com>, Dave Jones <davej@co=
demonkey.org.uk>, Dominik Brodowski <linux@brodo.de>");
 MODULE_DESCRIPTION ("PowerNow! driver for AMD K6-2+ / K6-3+ processors.");
 MODULE_LICENSE ("GPL");
=20

Index: powernow-k7.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-=
k7.c,v
retrieving revision 1.43
retrieving revision 1.44
diff -u -r1.43 -r1.44
--- powernow-k7.c	4 Jul 2003 15:18:55 -0000	1.43
+++ powernow-k7.c	19 Aug 2003 13:38:32 -0000	1.44
@@ -1,7 +1,6 @@
 /*
- *  $Id$
- *
- *  (C) 2003 Dave Jones <davej@suse.de>
+ *  AMD K7 Powernow driver.
+ *  (C) 2003 Dave Jones <davej@codemonkey.org.uk> on behalf of SuSE Labs.
  *
  *  Licensed under the terms of the GNU GPL License version 2.
  *  Based upon datasheets & sample CPUs kindly provided by AMD.
@@ -85,27 +84,6 @@
 static char have_a0;
=20
=20
-#ifndef rdmsrl
-#define rdmsrl(msr,val) do {unsigned long l__,h__; \
-	rdmsr (msr, l__, h__);	\
-	val =3D l__;	\
-	val |=3D ((u64)h__<<32);	\
-} while(0)
-#endif
-
-#ifndef wrmsrl
-static void wrmsrl (u32 msr, u64 val)
-{
-	u32 lo, hi;
-
-	lo =3D (u32) val;
-	hi =3D val >> 32;
-	wrmsr (msr, lo, hi);
-}
-#endif
-
-
-
 static int check_powernow(void)
 {
 	struct cpuinfo_x86 *c =3D cpu_data;
@@ -240,6 +218,7 @@
 	u8 fid, vid;
 	struct cpufreq_freqs freqs;
 	union msr_fidvidstatus fidvidstatus;
+	int cfid;
=20
 	/* fid are the lower 8 bits of the index we stored into
 	 * the cpufreq frequency table in powernow_decode_bios,
@@ -252,7 +231,8 @@
 	freqs.cpu =3D 0;
=20
 	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
-	freqs.old =3D fsb * fid_codes[fidvidstatus.bits.CFID] * 100;
+	cfid =3D fidvidstatus.bits.CFID;
+	freqs.old =3D fsb * fid_codes[cfid] * 100;
 	freqs.new =3D powernow_table[index].frequency;
=20
 	cpufreq_notify_transition(&freqs, CPUFREQ_PRECHANGE);
@@ -426,7 +406,7 @@
 		kfree(powernow_table);
 }
=20
-MODULE_AUTHOR ("Dave Jones <davej@suse.de>");
+MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>");
 MODULE_DESCRIPTION ("Powernow driver for AMD K7 processors.");
 MODULE_LICENSE ("GPL");
=20

Index: powernow-k7.h
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-=
k7.h,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- powernow-k7.h	10 Feb 2003 18:26:01 -0000	1.2
+++ powernow-k7.h	19 Aug 2003 13:38:32 -0000	1.3
@@ -8,14 +8,6 @@
  *
  */
=20
-#ifndef MSR_K7_FID_VID_CTL
-#define MSR_K7_FID_VID_CTL		0xc0010041
-#endif
-#ifndef MSR_K7_FID_VID_STATUS
-#define MSR_K7_FID_VID_STATUS	0xc0010042
-#endif
-
-
 union msr_fidvidctl {
 	struct {
 		unsigned FID:5,			// 4:0

Index: speedstep-centrino.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep=
-centrino.c,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- speedstep-centrino.c	24 Jun 2003 12:22:51 -0000	1.2
+++ speedstep-centrino.c	19 Aug 2003 13:38:32 -0000	1.3
@@ -29,7 +29,7 @@
 #define PFX		"speedstep-centrino: "
 #define MAINTAINER	"Jeremy Fitzhardinge <jeremy@goop.org>"
=20
-/* #define CENTRINO_DEBUG */
+/*#define CENTRINO_DEBUG*/
=20
 #ifdef CENTRINO_DEBUG
 #define dprintk(msg...) printk(msg)
@@ -156,14 +156,15 @@
 };
 #undef OP
=20
-#define CPU(max)	\
-	{ "Intel(R) Pentium(R) M processor " #max "MHz", (max)*1000, op_##max }
+#define _CPU(max, name)	\
+	{ "Intel(R) Pentium(R) M processor " name "MHz", (max)*1000, op_##max }
+#define CPU(max)	_CPU(max, #max)
=20
 /* CPU models, their operating frequency range, and freq/voltage
    operating points */
 static const struct cpu_model models[] =3D=20
 {
-	CPU( 900),
+       _CPU( 900, " 900"),
 	CPU(1100),
 	CPU(1200),
 	CPU(1300),

Index: speedstep-ich.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep=
-ich.c,v
retrieving revision 1.4
retrieving revision 1.5
diff -u -r1.4 -r1.5
--- speedstep-ich.c	18 Jun 2003 11:01:50 -0000	1.4
+++ speedstep-ich.c	19 Aug 2003 13:38:32 -0000	1.5
@@ -1,6 +1,4 @@
 /*
- *  $Id$
- *
  * (C) 2001  Dave Jones, Arjan van de ven.
  * (C) 2002 - 2003  Dominik Brodowski <linux@brodo.de>
  *
@@ -84,7 +82,7 @@
 		return;
=20
 	freqs.old =3D speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new =3D speedstep_freqs[SPEEDSTEP_LOW].frequency;
+	freqs.new =3D speedstep_freqs[state].frequency;
 	freqs.cpu =3D 0; /* speedstep.c is UP only driver */
 =09
 	if (notify)
@@ -139,7 +137,7 @@
 	dprintk(KERN_DEBUG "cpufreq: read at pmbase 0x%x + 0x50 returned 0x%x\n",=
 pmbase, value);
=20
 	if (state =3D=3D (value & 0x1)) {
-		dprintk (KERN_INFO "cpufreq: change to %u MHz succeeded\n", (freqs.new /=
 1000));
+		dprintk (KERN_INFO "cpufreq: change to %u MHz succeeded\n", (speedstep_g=
et_processor_frequency(speedstep_processor) / 1000));
 	} else {
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}
@@ -329,7 +327,7 @@
 static int __init speedstep_init(void)
 {
 	/* detect processor */
-	speedstep_processor =3D speedstep_detect_processor();=20
+	speedstep_processor =3D speedstep_detect_processor();
 	if (!speedstep_processor)
 		return -ENODEV;
=20
@@ -339,8 +337,6 @@
 		return -ENODEV;
 	}
=20
-	dprintk(KERN_INFO "cpufreq: Intel(R) SpeedStep(TM) support $Revision$\n");
-
 	/* activate speedstep support */
 	if (speedstep_activate())
 		return -EINVAL;
@@ -360,7 +356,7 @@
 }
=20
=20
-MODULE_AUTHOR ("Dave Jones <davej@suse.de>, Dominik Brodowski <linux@brodo=
.de>");
+MODULE_AUTHOR ("Dave Jones <davej@codemonkey.org.uk>, Dominik Brodowski <l=
inux@brodo.de>");
 MODULE_DESCRIPTION ("Speedstep driver for Intel mobile processors on chips=
ets with ICH-M southbridges.");
 MODULE_LICENSE ("GPL");
=20

Index: speedstep-lib.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep=
-lib.c,v
retrieving revision 1.1
retrieving revision 1.2
diff -u -r1.1 -r1.2
--- speedstep-lib.c	17 Jun 2003 13:21:21 -0000	1.1
+++ speedstep-lib.c	19 Aug 2003 13:38:33 -0000	1.2
@@ -148,11 +148,14 @@
 		return 0;
=20
 	if (c->x86 =3D=3D 0xF) {
-		/* Intel Pentium 4 Mobile P4-M */
+		/* Intel Mobile Pentium 4-M
+		 * or Intel Mobile Pentium 4 with 533 MHz FSB */
 		if (c->x86_model !=3D 2)
 			return 0;
=20
-		if ((c->x86_mask !=3D 4) && (c->x86_mask !=3D 7))
+		if ((c->x86_mask !=3D 4) && /* B-stepping [M-P4-M] */
+			(c->x86_mask !=3D 7) && /* C-stepping [M-P4-M] */
+			(c->x86_mask !=3D 9))   /* D-stepping [M-P4-M or M-P4/533] */
 			return 0;
=20
 		ebx =3D cpuid_ebx(0x00000001);
@@ -227,12 +230,12 @@
 	unsigned long flags;
=20
 	if ((!processor) || (!low_speed) || (!high_speed) || (!set_state))
-		return EINVAL;
+		return -EINVAL;
=20
 	/* get current speed */
 	prev_speed =3D speedstep_get_processor_frequency(processor);
 	if (!prev_speed)
-		return EIO;
+		return -EIO;
 =09
 	local_irq_save(flags);
=20
@@ -240,7 +243,7 @@
 	set_state(SPEEDSTEP_LOW, 0);
 	*low_speed =3D speedstep_get_processor_frequency(processor);
 	if (!*low_speed) {
-		ret =3D EIO;
+		ret =3D -EIO;
 		goto out;
 	}
=20
@@ -248,12 +251,12 @@
 	set_state(SPEEDSTEP_HIGH, 0);
 	*high_speed =3D speedstep_get_processor_frequency(processor);
 	if (!*high_speed) {
-		ret =3D EIO;
+		ret =3D -EIO;
 		goto out;
 	}
=20
 	if (*low_speed =3D=3D *high_speed) {
-		ret =3D ENODEV;
+		ret =3D -ENODEV;
 		goto out;
 	}
