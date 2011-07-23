From: =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Subject: [PATCH] e_powersaver: Allow user to lower maximum voltage
Date: Sat, 23 Jul 2011 23:35:28 +0100
Message-ID: <1311460528-1094-1-git-send-email-rafalbilski@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>

Add new module option "set_max_voltage".
One of the lessons learned from Adaptive Powersaver is that voltage val=
ues
returned by processor are for worst case scenario. But required voltage
is changing with CPU temperature. And even processors produced in the s=
ame
batch can have different minimum voltage necessary for stable work at
specified frequency.
On Elonex Webbook, once system starts, temperature never drops below
48 deg. C. Loading module after systems start allows user to lower CPU
voltage and still have stable system.
Sadly C7 doesn't allow code to set frequency or voltage from outside li=
mits.
If you ask it to set voltage lower then minimum it will ignore you. Tha=
ts
why it isn't possible to change minimum voltage for minimum frequency t=
oo.
Changing maximum voltage on Elonex Webbook leads to very good results. =
Looks
like VIA C7 1.6GHz 1084mV can safetly run at 892mV. This means 83% of
orginal value. If same percentage applies to power generated it means 1=
2.5W
in the place of 15W. Not much, but it is better then nothing.
Only C7-M makes it possible.
If voltage is too low by 16mV or more you will experience kernel panic.
If voltage is too low by 32mV or more you will experience system freeze=
=2E

Signed-off-by: Rafa=C5=82 Bilski <rafalbilski@interia.pl>
---
 drivers/cpufreq/e_powersaver.c |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersa=
ver.c
index 8efe31f..eecab5f 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -43,6 +43,7 @@ static struct eps_cpu_data *eps_cpu[NR_CPUS];
 /* Module parameters */
 static int freq_failsafe_off;
 static int voltage_failsafe_off;
+static int set_max_voltage;
=20
 #if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
 static int ignore_acpi_limit;
@@ -345,6 +346,21 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
 	}
 #endif
=20
+	/* Allow user to set lower maximum voltage then that reported
+	 * by processor */
+	if (brand =3D=3D EPS_BRAND_C7M && set_max_voltage) {
+		u32 v;
+
+		/* Change mV to something hardware can use */
+		v =3D (set_max_voltage - 700) / 16;
+		/* Check if voltage is within limits */
+		if (v >=3D min_voltage && v <=3D max_voltage) {
+			printk(KERN_INFO "eps: Setting %dmV as maximum.\n",
+				v * 16 + 700);
+			max_voltage =3D v;
+		}
+	}
+
 	/* Calc number of p-states supported */
 	if (brand =3D=3D EPS_BRAND_C7M)
 		states =3D max_multiplier - min_multiplier + 1;
@@ -459,6 +475,8 @@ MODULE_PARM_DESC(voltage_failsafe_off, "Disable cur=
rent vs max voltage check");
 module_param(ignore_acpi_limit, int, 0644);
 MODULE_PARM_DESC(ignore_acpi_limit, "Don't check ACPI's processor spee=
d limit");
 #endif
+module_param(set_max_voltage, int, 0644);
+MODULE_PARM_DESC(set_max_voltage, "Set maximum CPU voltage (mV) C7-M o=
nly");
=20
 MODULE_AUTHOR("Rafal Bilski <rafalbilski@interia.pl>");
 MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");
--=20
1.7.6


----------------------------------------------------------------
Znajdz samochod idealny dla siebie!
Szukaj >> http://linkint.pl/f29e2
