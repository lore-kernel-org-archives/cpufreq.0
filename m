From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <syrjala@sci.fi>
Subject: [PATCH] speedstep-smi: Use DMI to detect HP OmniBook 6000
Date: Sun, 16 Jan 2005 23:51:47 +0200
Message-ID: <20050116215147.GA15543@sci.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@zenII.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Hiroshi Miura <miura@da-cha.org>
Cc: cpufreq@lists.linux.org.uk

HP OmniBook 6000 has bogus ist_info so use DMI to detect the system=20
instead. Extensive use (eg. cpudynd) will hang the laptop after some time=
=20
but it is still useful for changing the frequency on AC (un)plug.

Signed-off-by: Ville Syrjala <syrjala@sci.fi>
---

 speedstep-smi.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+)

--- a/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2004-12-19 13:32:19.00=
0000000 +0200
+++ b/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2005-01-13 10:07:11.00=
0000000 +0200
@@ -20,6 +20,7 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <asm/ist.h>
=20
 #include "speedstep-lib.h"
@@ -341,6 +342,31 @@
 	.attr		=3D speedstep_attr,
 };
=20
+static int speedstep_dmi_callback(struct dmi_system_id *id)
+{
+	if (!smi_port)
+		smi_port =3D (long) id->driver_data & 0xff;
+	if (!smi_cmd)
+		smi_cmd =3D ((long) id->driver_data >> 16) & 0xff;
+	smi_sig =3D 1;
+
+	return 0;
+}
+
+static struct dmi_system_id __initdata speedstep_dmi_table[] =3D {
+	{
+		.callback =3D speedstep_dmi_callback,
+		.ident =3D "HP OmniBook 6000",
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP OmniBook PC"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "HP OmniBook 6000 EA"),
+		},
+		.driver_data =3D (void *) 0x008200b2,
+	},
+	{ }
+};
+
 /**
  * speedstep_init - initializes the SpeedStep CPUFreq driver
  *
@@ -369,6 +395,7 @@
 	dprintk("signature:0x%.8lx, command:0x%.8lx, event:0x%.8lx, perf_level:=
0x%.8lx.\n",=20
 		ist_info.signature, ist_info.command, ist_info.event, ist_info.perf_le=
vel);
=20
+	dmi_check_system(speedstep_dmi_table);
=20
 	/* Error if no IST-SMI BIOS or no PARM=20
 		 sig=3D 'ISGE' aka 'Intel Speedstep Gate E' */
--=20
Ville Syrj=E4l=E4
syrjala@sci.fi
http://www.sci.fi/~syrjala/
