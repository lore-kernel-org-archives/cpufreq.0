From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Disable arbiter CLE266
Date: Wed, 27 Sep 2006 08:25:27 +0200
Message-ID: <451A1957.10903@interia.pl>
References: <45198341.4080202@interia.pl> <20060927050639.GC3571@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060927050639.GC3571@redhat.com>
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

[...]
>
> Argh, I already applied the second of the earlier diffs.
> Can you send an incremental diff to whats in cpufreq.git?
>=20
> Thanks,
>=20
> 	Dave=20
>=20
>=20

Here it is. It is removing duplicated code.

Thanks
Rafa=B3

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu=
/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -581,8 +581,8 @@ static int enable_arbiter_disable(void)
 	dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL=
);
 	/* Find CLE266 host bridge */
 	if (dev =3D=3D NULL) {
-		dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NUL=
L);
 		reg =3D 0x76;
+		dev =3D pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NUL=
L);
 	}
 	if (dev !=3D NULL) {
 		/* Enable access to port 0x22 */
@@ -693,25 +693,20 @@ static int __init longhaul_cpu_init(stru
 	if (longhaul_version =3D=3D TYPE_POWERSAVER) {
 		/* Check ACPI support for C3 state */
 		cx =3D &pr->power.states[ACPI_STATE_C3];
-		if (cx->address =3D=3D 0 ||
-		   (cx->latency > 1000 && ignore_latency =3D=3D 0) ) {
-			if (enable_arbiter_disable()) {
-				port22_en =3D 1;
-			} else {
-				goto err_acpi;
-			}
+		if (cx->address > 0 &&
+		   (cx->latency <=3D 1000 || ignore_latency !=3D 0) ) {
+			goto print_support_type;
 		}
-
-	} else {
-		/* Check ACPI support for bus master arbiter disable */
-		if (!pr->flags.bm_control) {
-			if (enable_arbiter_disable()) {
-				port22_en =3D 1;
-			} else {
-				goto err_acpi;
-			}
+	}
+	/* Check ACPI support for bus master arbiter disable */
+	if (!pr->flags.bm_control) {
+		if (enable_arbiter_disable()) {
+			port22_en =3D 1;
+		} else {
+			goto err_acpi;
 		}
 	}
+print_support_type:
 	if (!port22_en) {
 		printk (KERN_INFO PFX "Using ACPI support.\n");
 	} else {


----------------------------------------------------------------------
Jestes kierowca? To poczytaj! >>> http://link.interia.pl/f199e
