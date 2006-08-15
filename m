From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: [PATCH 1/2] Longhaul - Change format of voltage tables
Date: Tue, 15 Aug 2006 23:37:46 +0200
Message-ID: <44E23EAA.6090501@interia.pl>
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

In this way driver don't need to know which VRM=20
type is in use, because it is using "pos" which=20
is version independent.

Values in mobile VRM table changed to values from=20
C3-M datasheet.

Signed-off-by: Rafa=B3 Bilski <rafalbilski@interia.pl>

---

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
+    unsigned short mV;
+    unsigned short pos;
+};
+
+static struct mV_pos __initdata vrm85_mV[32] =3D {
+        {1250, 8},	{1200, 6},	{1150, 4},	{1100, 2},
+	{1050, 0},	{1800, 30},	{1750, 28},	{1700, 26},
+	{1650, 24},	{1600, 22},	{1550, 20},	{1500, 18},
+	{1450, 16},	{1400, 14},	{1350, 12},	{1300, 10},
+        {1275, 9},	{1225, 7},	{1175, 5},	{1125, 3},
+	{1075, 1},	{1825, 31},	{1775, 29},	{1725, 27},
+        {1675, 25},	{1625, 23},	{1575, 21},	{1525, 19},
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
