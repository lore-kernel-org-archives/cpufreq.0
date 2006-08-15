From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Add voltage scaling to driver
Date: Wed, 16 Aug 2006 01:07:33 +0200
Message-ID: <44E253B5.6030706@interia.pl>
References: <44E23ED0.4090607@interia.pl> <20060815220605.GW7612@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060815220605.GW7612@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Rename option "dont_scale_voltage" to "scale_voltage" because=20
don't will be default.
Use "pos" for calculating voltage. In this way driver don't need=20
to know mV value or low level value. Simply min U is one pos and=20
max U is second pos. All pos between these two are used.
Assume that min U is for min f and max U for max f. For frequency=20
between min and max calculate pos based on difference between=20
current frequency and min f.
Values in mobile VRM table changed to values from=20
C3-M datasheet.
=20
Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

> =3D0 is unneeded for static vars.

Fixed.

> Either keep them on one line, or prepend unsigned int to all of them.
> Doing it the way you did it is annoying when you're grepping for a type.

Fixed.

> There also seemed to be some whitespace (using spaces instead of tabs?)
> problems in the longhaul.h diff, so give that a quick doublecheck too.
>=20

I was using mcedit once. Looks like editor did it. Now this should be=20
fixed by Vim.

> What CPUs have you tested this on so far btw ?
>=20
> 		Dave

One only (mobile), thats why I'm setting "don't" as default. Other=20
VIA processors on all mainboards seems to have CPU voltage constant.
They are reporting Mobile VRM, max as 1.75V, min as 0.6V and bit 0=20
have clear. Value written to Longhaul MSR is left unchanged, but=20
don't have any effect.

Rafa=B3

---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -53,19 +53,26 @@ #define	CPU_EZRA_T	4
 #define	CPU_NEHEMIAH	5
=20
 static int cpu_model;
-static unsigned int numscales=3D16, numvscales;
+static unsigned int numscales=3D16;
 static unsigned int fsb;
-static int minvid, maxvid;
+
+static struct mV_pos *vrm_mV_table;
+static unsigned char *mV_vrm_table;
+struct f_msr {
+	unsigned char vrm;
+};
+static struct f_msr f_msr_table[32];
+
+static unsigned int highest_speed, lowest_speed; /* kHz */
 static unsigned int minmult, maxmult;
 static int can_scale_voltage;
-static int vrmrev;
 static struct acpi_processor *pr =3D NULL;
 static struct acpi_processor_cx *cx =3D NULL;
-static int port22_en =3D 0;
+static int port22_en;
=20
 /* Module parameters */
-static int dont_scale_voltage;
-static int ignore_latency =3D 0;
+static int scale_voltage;
+static int ignore_latency;
=20
 #define dprintk(msg...) cpufreq_debug_printk(CPUFREQ_DEBUG_DRIVER, "longha=
ul", msg)
=20
@@ -73,7 +80,6 @@ #define dprintk(msg...) cpufreq_debug_pr
 /* Clock ratios multiplied by 10 */
 static int clock_ratio[32];
 static int eblcr_table[32];
-static int voltage_table[32];
 static unsigned int highest_speed, lowest_speed; /* kHz */
 static int longhaul_version;
 static struct cpufreq_frequency_table *longhaul_table;
@@ -163,6 +169,11 @@ static void do_powersaver(int cx_address
 	longhaul.bits.SoftBusRatio4 =3D (clock_ratio_index & 0x10) >> 4;
 	longhaul.bits.EnableSoftBusRatio =3D 1;
=20
+	if (can_scale_voltage) {
+		longhaul.bits.SoftVID =3D f_msr_table[clock_ratio_index].vrm;
+		longhaul.bits.EnableSoftVID =3D 1;
+	}
+
 	/* Sync to timer tick */
 	safe_halt();
 	/* Change frequency on next halt or sleep */
@@ -454,53 +465,57 @@ static int __init longhaul_get_ranges(vo
 static void __init longhaul_setup_voltagescaling(void)
 {
 	union msr_longhaul longhaul;
+	struct mV_pos minvid, maxvid;
+	unsigned int j, speed, pos, kHz_step, numvscales;
=20
-	rdmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-	if (!(longhaul.bits.RevisionID & 1))
+	rdmsrl(MSR_VIA_LONGHAUL, longhaul.val);
+	if (!(longhaul.bits.RevisionID & 1)) {
+		printk(KERN_INFO PFX "Voltage scaling not supported by CPU.\n");
 		return;
+	}
+
+	if (!longhaul.bits.VRMRev) {
+		printk (KERN_INFO PFX "VRM 8.5\n");
+		vrm_mV_table =3D &vrm85_mV[0];
+		mV_vrm_table =3D &mV_vrm85[0];
+	} else {
+		printk (KERN_INFO PFX "Mobile VRM\n");
+		vrm_mV_table =3D &mobilevrm_mV[0];
+		mV_vrm_table =3D &mV_mobilevrm[0];
+	}
=20
-	minvid =3D longhaul.bits.MinimumVID;
-	maxvid =3D longhaul.bits.MaximumVID;
-	vrmrev =3D longhaul.bits.VRMRev;
+	minvid =3D vrm_mV_table[longhaul.bits.MinimumVID];
+	maxvid =3D vrm_mV_table[longhaul.bits.MaximumVID];
+	numvscales =3D maxvid.pos - minvid.pos + 1;
+	kHz_step =3D (highest_speed - lowest_speed) / numvscales;
=20
-	if (minvid =3D=3D 0 || maxvid =3D=3D 0) {
+	if (minvid.mV =3D=3D 0 || maxvid.mV =3D=3D 0 || minvid.mV > maxvid.mV) {
 		printk (KERN_INFO PFX "Bogus values Min:%d.%03d Max:%d.%03d. "
 					"Voltage scaling disabled.\n",
-					minvid/1000, minvid%1000, maxvid/1000, maxvid%1000);
+					minvid.mV/1000, minvid.mV%1000, maxvid.mV/1000, maxvid.mV%1000);
 		return;
 	}
=20
-	if (minvid =3D=3D maxvid) {
+	if (minvid.mV =3D=3D maxvid.mV) {
 		printk (KERN_INFO PFX "Claims to support voltage scaling but min & max a=
re "
 				"both %d.%03d. Voltage scaling disabled\n",
-				maxvid/1000, maxvid%1000);
+				maxvid.mV/1000, maxvid.mV%1000);
 		return;
 	}
=20
-	if (vrmrev=3D=3D0) {
-		dprintk ("VRM 8.5\n");
-		memcpy (voltage_table, vrm85scales, sizeof(voltage_table));
-		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/25;
-	} else {
-		dprintk ("Mobile VRM\n");
-		memcpy (voltage_table, mobilevrmscales, sizeof(voltage_table));
-		numvscales =3D (voltage_table[maxvid]-voltage_table[minvid])/5;
+	printk(KERN_INFO PFX "Max VID=3D%d.%03d  Min VID=3D%d.%03d, %d possible v=
oltage scales\n",
+		maxvid.mV/1000, maxvid.mV%1000,
+		minvid.mV/1000, minvid.mV%1000,
+		numvscales);
+=09
+	j =3D 0;
+	while (longhaul_table[j].frequency !=3D CPUFREQ_TABLE_END) {
+		speed =3D longhaul_table[j].frequency;
+		pos =3D (speed - lowest_speed) / kHz_step + minvid.pos;
+		f_msr_table[longhaul_table[j].index].vrm =3D mV_vrm_table[pos];
+		j++;
 	}
=20
-	/* Current voltage isn't readable at first, so we need to
-	   set it to a known value. The spec says to use maxvid */
-	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;	/* FIXME: This is=
 bad. */
-	longhaul.bits.EnableSoftVID =3D 1;
-	longhaul.bits.SoftVID =3D maxvid;
-	wrmsrl (MSR_VIA_LONGHAUL, longhaul.val);
-
-	minvid =3D voltage_table[minvid];
-	maxvid =3D voltage_table[maxvid];
-
-	dprintk ("Min VID=3D%d.%03d Max VID=3D%d.%03d, %d possible voltage scales=
\n",
-		maxvid/1000, maxvid%1000, minvid/1000, minvid%1000, numvscales);
-
 	can_scale_voltage =3D 1;
 }
=20
@@ -685,7 +700,7 @@ static int __init longhaul_cpu_init(stru
 		return ret;
=20
 	if ((longhaul_version=3D=3DTYPE_LONGHAUL_V2 || longhaul_version=3D=3DTYPE=
_POWERSAVER) &&
-		 (dont_scale_voltage=3D=3D0))
+		 (scale_voltage !=3D 0))
 		longhaul_setup_voltagescaling();
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;
@@ -773,8 +788,8 @@ static void __exit longhaul_exit(void)
 	kfree(longhaul_table);
 }
=20
-module_param (dont_scale_voltage, int, 0644);
-MODULE_PARM_DESC(dont_scale_voltage, "Don't scale voltage of processor");
+module_param (scale_voltage, int, 0644);
+MODULE_PARM_DESC(scale_voltage, "Scale voltage of processor");
 module_param(ignore_latency, int, 0644);
 MODULE_PARM_DESC(ignore_latency, "Skip ACPI C3 latency test");
=20
diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.h b/arch/i386/kernel/cpu=
/cpufreq/longhaul.h
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.h
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.h
@@ -450,17 +450,45 @@ static int __initdata nehemiah_c_eblcr[3
  * Voltage scales. Div/Mod by 1000 to get actual voltage.
  * Which scale to use depends on the VRM type in use.
  */
-static int __initdata vrm85scales[32] =3D {
-	1250, 1200, 1150, 1100, 1050, 1800, 1750, 1700,
-	1650, 1600, 1550, 1500, 1450, 1400, 1350, 1300,
-	1275, 1225, 1175, 1125, 1075, 1825, 1775, 1725,
-	1675, 1625, 1575, 1525, 1475, 1425, 1375, 1325,
+
+struct mV_pos {
+	unsigned short mV;
+	unsigned short pos;
+};
+
+static struct mV_pos __initdata vrm85_mV[32] =3D {
+	{1250, 8},	{1200, 6},	{1150, 4},	{1100, 2},
+	{1050, 0},	{1800, 30},	{1750, 28},	{1700, 26},
+	{1650, 24},	{1600, 22},	{1550, 20},	{1500, 18},
+	{1450, 16},	{1400, 14},	{1350, 12},	{1300, 10},
+	{1275, 9},	{1225, 7},	{1175, 5},	{1125, 3},
+	{1075, 1},	{1825, 31},	{1775, 29},	{1725, 27},
+	{1675, 25},	{1625, 23},	{1575, 21},	{1525, 19},
+	{1475, 17},	{1425, 15},	{1375, 13},	{1325, 11}
+};
+
+static unsigned char __initdata mV_vrm85[32] =3D {
+	0x04,	0x14,	0x03,	0x13,	0x02,	0x12,	0x01,	0x11,
+	0x00,	0x10,	0x0f,	0x1f,	0x0e,	0x1e,	0x0d,	0x1d,
+	0x0c,	0x1c,	0x0b,	0x1b,	0x0a,	0x1a,	0x09,	0x19,
+	0x08,	0x18,	0x07,	0x17,	0x06,	0x16,	0x05,	0x15
+};
+
+static struct mV_pos __initdata mobilevrm_mV[32] =3D {
+	{1750, 31},	{1700, 30},	{1650, 29},	{1600, 28},
+	{1550, 27},	{1500, 26},	{1450, 25},	{1400, 24},
+	{1350, 23},	{1300, 22},	{1250, 21},	{1200, 20},
+	{1150, 19},	{1100, 18},	{1050, 17},	{1000, 16},
+	{975, 15},	{950, 14},	{925, 13},	{900, 12},
+	{875, 11},	{850, 10},	{825, 9},	{800, 8},
+	{775, 7},	{750, 6},	{725, 5},	{700, 4},
+	{675, 3},	{650, 2},	{625, 1},	{600, 0}
 };
=20
-static int __initdata mobilevrmscales[32] =3D {
-	2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
-	1600, 1550, 1500, 1450, 1500, 1350, 1300, -1,
-	1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
-	1075, 1050, 1025, 1000, 975, 950, 925, -1,
+static unsigned char __initdata mV_mobilevrm[32] =3D {
+	0x1f,	0x1e,	0x1d,	0x1c,	0x1b,	0x1a,	0x19,	0x18,
+	0x17,	0x16,	0x15,	0x14,	0x13,	0x12,	0x11,	0x10,
+	0x0f,	0x0e,	0x0d,	0x0c,	0x0b,	0x0a,	0x09,	0x08,
+	0x07,	0x06,	0x05,	0x04,	0x03,	0x02,	0x01,	0x00
 };
