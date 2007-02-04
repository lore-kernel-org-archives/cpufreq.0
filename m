From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH] Longhaul - Add VT8235 support
Date: Sun, 04 Feb 2007 18:43:12 +0100
Message-ID: <45C61B30.6020209@interia.pl>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@codemonkey.org.uk>
Cc: cpufreq@lists.linux.org.uk


I don't know why it is working and how, but it is working. On my=20
Epia transition time is by default set to 100us. I'm changing it to=20
200us. After that I can change frequency from min (x4.0) to max (x7.5)=20
without lockup. Many times.
There is a paranoid check at a beginning of a patch. Probably dead=20
code, but I don't have better ideas for CL10000 case at the moment.=20
Only way to to detect broken chip seems to be looking in log for=20
spurious interrupts.

Signed-off-by: Rafal Bilski <rafalbilski@interia.pl>
---
 arch/i386/kernel/cpu/cpufreq/longhaul.c |   62 +++++++++++++++++++++++++--=
----
 1 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -56,6 +56,7 @@
 /* Flags */
 #define USE_ACPI_C3		(1 << 1)
 #define USE_NORTHBRIDGE		(1 << 2)
+#define USE_VT8235		(1 << 3)
=20
 static int cpu_model;
 static unsigned int numscales=3D16;
@@ -544,20 +545,50 @@ static int enable_arbiter_disable(void)
 	if (dev !=3D NULL) {
 		/* Enable access to port 0x22 */
 		pci_read_config_byte(dev, reg, &pci_cmd);
-		if ( !(pci_cmd & 1<<7) ) {
+		if (!(pci_cmd & 1<<7)) {
 			pci_cmd |=3D 1<<7;
 			pci_write_config_byte(dev, reg, pci_cmd);
+			pci_read_config_byte(dev, reg, &pci_cmd);
+			if (!(pci_cmd & 1<<7)) {
+				printk(KERN_ERR PFX
+					"Can't enable access to port 0x22.\n");
+				return 0;
+			}
 		}
 		return 1;
 	}
 	return 0;
 }
=20
+static int longhaul_setup_vt8235(void)
+{
+	struct pci_dev *dev;
+	u8 pci_cmd;
+
+	/* Find VT8235 southbridge */
+	dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8235, NULL);
+	if (dev !=3D NULL) {
+		/* Set transition time to max */
+		pci_read_config_byte(dev, 0xec, &pci_cmd);
+		pci_cmd &=3D ~(1 << 2);
+		pci_write_config_byte(dev, 0xec, pci_cmd);
+		pci_read_config_byte(dev, 0xe4, &pci_cmd);
+		pci_cmd &=3D ~(1 << 7);
+		pci_write_config_byte(dev, 0xe4, pci_cmd);
+		pci_read_config_byte(dev, 0xe5, &pci_cmd);
+		pci_cmd |=3D 1 << 7;
+		pci_write_config_byte(dev, 0xe5, pci_cmd);
+		return 1;
+	}
+	return 0;
+}
+
 static int __init longhaul_cpu_init(struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c =3D cpu_data;
 	char *cpuname=3DNULL;
 	int ret;
+	int vt8235_present;
=20
 	/* Check what we have on this motherboard */
 	switch (c->x86_model) {
@@ -641,12 +672,16 @@ static int __init longhaul_cpu_init(struct cpufreq_po=
licy *policy)
 		break;
 	};
=20
+	/* Doesn't hurt */
+	vt8235_present =3D longhaul_setup_vt8235();
+
 	/* Find ACPI data for processor */
-	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT, ACPI_UINT32_MA=
X,
-			    &longhaul_walk_callback, NULL, (void *)&pr);
+	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
+				ACPI_UINT32_MAX, &longhaul_walk_callback,
+				NULL, (void *)&pr);
=20
 	/* Check ACPI support for C3 state */
-	if ((pr !=3D NULL) && (longhaul_version =3D=3D TYPE_POWERSAVER)) {
+	if (pr !=3D NULL && longhaul_version =3D=3D TYPE_POWERSAVER) {
 		cx =3D &pr->power.states[ACPI_STATE_C3];
 		if (cx->address > 0 && cx->latency <=3D 1000) {
 			longhaul_flags |=3D USE_ACPI_C3;
@@ -658,8 +693,11 @@ static int __init longhaul_cpu_init(struct cpufreq_pol=
icy *policy)
 		longhaul_flags |=3D USE_NORTHBRIDGE;
 		goto print_support_type;
 	}
-
-	/* No ACPI C3 or we can't use it */
+	/* Use VT8235 southbridge if present */
+	if (longhaul_version =3D=3D TYPE_POWERSAVER && vt8235_present) {
+		longhaul_flags |=3D USE_VT8235;
+		goto print_support_type;
+	}
 	/* Check ACPI support for bus master arbiter disable */
 	if ((pr =3D=3D NULL) || !(pr->flags.bm_control)) {
 		printk(KERN_ERR PFX
@@ -668,18 +706,18 @@ static int __init longhaul_cpu_init(struct cpufreq_po=
licy *policy)
 	}
=20
 print_support_type:
-	if (!(longhaul_flags & USE_NORTHBRIDGE)) {
-		printk (KERN_INFO PFX "Using ACPI support.\n");
-	} else {
+	if (longhaul_flags & USE_NORTHBRIDGE)
 		printk (KERN_INFO PFX "Using northbridge support.\n");
-	}
+	else if (longhaul_flags & USE_VT8235)
+		printk (KERN_INFO PFX "Using VT8235 support.\n");
+	else
+		printk (KERN_INFO PFX "Using ACPI support.\n");
=20
 	ret =3D longhaul_get_ranges();
 	if (ret !=3D 0)
 		return ret;
=20
-	if ((longhaul_version=3D=3DTYPE_LONGHAUL_V2 || longhaul_version=3D=3DTYPE=
_POWERSAVER) &&
-		 (scale_voltage !=3D 0))
+	if ((longhaul_version !=3D TYPE_LONGHAUL_V1) && (scale_voltage !=3D 0))
 		longhaul_setup_voltagescaling();
=20
 	policy->governor =3D CPUFREQ_DEFAULT_GOVERNOR;

--------------------------------------------------------------------
Telefonia internetowa bez w=B3=B1czonego komputera. Do tego 1000 minut w=20
promocji! >> http://link.interia.pl/f1a08
