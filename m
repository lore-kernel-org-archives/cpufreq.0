From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Fix hole
Date: Fri, 29 Dec 2006 21:32:29 +0100
Message-ID: <45957B5D.7070901@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk

ACPI PM2 register was fallback for "Longhaul ver. 1" CPU's.=20
My assumption that this register isn't present at=20
"PowerSaver" motherboards is so far true, but current code=20
will not work correctly in other case. There are three possible=20
supports: ACPI C3, PM2 and northbridge. That was my assumption=20
that ACPI C3 and northbridge is for PS and northbridge and PM2=20
is for V1. In current code we can only check if it is ACPI=20
support or not by port22_en. So remove port22_en and add=20
longhaul_flags. If USE_ACPI_C3 and USE_NORTHBRIDGE are both=20
clear then it means ACPI PM2 support. Also change order of=20
support probe from ACPI C3, PM2, northbridge to ACPI C3,=20
northbridge, ACPI PM2. Paranoid protection against port 0x22=20
cast as ACPI PM2 register. Bit 1 clear in such case - lockup=20
on AGP DMA. And obvious (now) fixup for do_powersaver. Use=20
cx->address only for ACPI C3 ("PowerSaver" processor using=20
PM2 support).

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---=20

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -52,6 +52,10 @@
#define	CPU_EZRA_T	4
#define	CPU_NEHEMIAH	5

+/* Flags */
+#define USE_ACPI_C3		(1 << 1)
+#define USE_NORTHBRIDGE		(1 << 2)
+
static int cpu_model;
static unsigned int numscales=3D16;
static unsigned int fsb;
@@ -68,7 +72,7 @@ static unsigned int minmult, maxmult;
static int can_scale_voltage;
static struct acpi_processor *pr =3D NULL;
static struct acpi_processor_cx *cx =3D NULL;
-static int port22_en;
+static u8 longhaul_flags;

/* Module parameters */
static int scale_voltage;
@@ -80,7 +84,6 @@ static int ignore_latency;
/* Clock ratios multiplied by 10 */
static int clock_ratio[32];
static int eblcr_table[32];
-static unsigned int highest_speed, lowest_speed; /* kHz */
static int longhaul_version;
static struct cpufreq_frequency_table *longhaul_table;

@@ -178,7 +181,7 @@ static void do_powersaver(int cx_address, unsigned int =
clock_ratio_index)
	safe_halt();
	/* Change frequency on next halt or sleep */
	wrmsrl(MSR_VIA_LONGHAUL, longhaul.val);
-	if (port22_en) {
+	if (!cx_address) {
		ACPI_FLUSH_CPU_CACHE();
		/* Invoke C1 */
		halt();
@@ -189,7 +192,6 @@ static void do_powersaver(int cx_address, unsigned int =
clock_ratio_index)
		/* Dummy op - must do something useless after P_LVL3 read */
		t =3D inl(acpi_fadt.xpm_tmr_blk.address);
	}
-
	/* Disable bus ratio bit */
	local_irq_disable();
	longhaul.bits.RevisionKey =3D longhaul.bits.RevisionID;
@@ -243,15 +245,14 @@ static void longhaul_setstate(unsigned int clock_rati=
o_index)
	outb(0xFF,0xA1);	/* Overkill */
	outb(0xFE,0x21);	/* TMR0 only */

-	if (pr->flags.bm_control) {
+	if (longhaul_flags & USE_NORTHBRIDGE) {
+		/* Disable AGP and PCI arbiters */
+		outb(3, 0x22);
+	} else if ((pr !=3D NULL) && pr->flags.bm_control) {
 		/* Disable bus master arbitration */
		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 1,
				  ACPI_MTX_DO_NOT_LOCK);
-	} else if (port22_en) {
-		/* Disable AGP and PCI arbiters */
-		outb(3, 0x22);
	}
-
	switch (longhaul_version) {

	/*
@@ -278,22 +279,25 @@ static void longhaul_setstate(unsigned int clock_rati=
o_index)
	 * to work in practice.
	 */
	case TYPE_POWERSAVER:
-		/* Don't allow wakeup */
-		acpi_set_register(ACPI_BITREG_BUS_MASTER_RLD, 0,
-				  ACPI_MTX_DO_NOT_LOCK);
-		do_powersaver(cx->address, clock_ratio_index);
+		if (longhaul_flags & USE_ACPI_C3) {
+			/* Don't allow wakeup */
+			acpi_set_register(ACPI_BITREG_BUS_MASTER_RLD, 0,
+					  ACPI_MTX_DO_NOT_LOCK);
+			do_powersaver(cx->address, clock_ratio_index);
+		} else {
+			do_powersaver(0, clock_ratio_index);
+		}
		break;
	}

-	if (pr->flags.bm_control) {
+	if (longhaul_flags & USE_NORTHBRIDGE) {
+		/* Enable arbiters */
+		outb(0, 0x22);
+	} else if ((pr !=3D NULL) && pr->flags.bm_control) {
		/* Enable bus master arbitration */
		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 0,
				  ACPI_MTX_DO_NOT_LOCK);
-	} else if (port22_en) {
-		/* Enable arbiters */
-		outb(0, 0x22);
	}
-
	outb(pic2_mask,0xA1);	/* restore mask */
	outb(pic1_mask,0x21);

@@ -691,27 +695,32 @@ static int __init longhaul_cpu_init(struct cpufreq_po=
licy *policy)
	/* Find ACPI data for processor */
	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32_MAX,
			    &longhaul_walk_callback, NULL, (void *)&pr);
-	if (pr =3D=3D NULL)
-		goto err_acpi;

-	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
-		/* Check ACPI support for C3 state */
+	/* Check ACPI support for C3 state */
+	if ((pr !=3D NULL) && (longhaul_version =3D=3D TYPE_POWERSAVER)) {
		cx =3D &pr->power.states[ACPI_STATE_C3];
		if (cx->address > 0 &&
		   (cx->latency <=3D 1000 || ignore_latency !=3D 0) ) {
+			longhaul_flags |=3D USE_ACPI_C3;
			goto print_support_type;
		}
	}
+	/* Check if northbridge is friendly */
+	if (enable_arbiter_disable()) {
+		longhaul_flags |=3D USE_NORTHBRIDGE;
+		goto print_support_type;
+	}
+
+	/* No ACPI C3 or we can't use it */
	/* Check ACPI support for bus master arbiter disable */
-	if (!pr->flags.bm_control) {
-		if (enable_arbiter_disable()) {
-			port22_en =3D 1;
-		} else {
-			goto err_acpi;
-		}
+	if ((pr =3D=3D NULL) || !(pr->flags.bm_control)) {
+		printk(KERN_ERR PFX=20
+			"No ACPI support. Unsupported northbridge.\n");
+		return -ENODEV;
	}
+
print_support_type:
-	if (!port22_en) {
+	if (!(longhaul_flags & USE_NORTHBRIDGE)) {
		printk (KERN_INFO PFX "Using ACPI support.\n");
	} else {
		printk (KERN_INFO PFX "Using northbridge support.\n");
@@ -736,10 +745,6 @@ print_support_type:
	cpufreq_frequency_table_get_attr(longhaul_table, policy->cpu);

	return 0;
-
-err_acpi:
-	printk(KERN_ERR PFX "No ACPI support. Unsupported northbridge. Aborting.\=
n");
-	return -ENODEV;
}

static int __devexit longhaul_cpu_exit(struct cpufreq_policy *policy)


----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
