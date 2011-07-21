From: =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Subject: [PATCH] e_powersaver: Check BIOS limit for CPU frequency
Date: Thu, 21 Jul 2011 22:11:29 +0100
Message-ID: <1311282689-5447-1-git-send-email-rafalbilski@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>

Call ACPI function to get BIOS limit for CPU frequency.
=46ail if processor would like to run at higher frequency.
Allow user to ignore BIOS limit.

eps: Detected VIA Model D C7-M
eps: Current voltage =3D 1084mV
eps: Current multiplier =3D 16
eps: Highest voltage =3D 1084mV
eps: Highest multiplier =3D 16
eps: Lowest voltage =3D 844mV
eps: Lowest multiplier =3D 4
eps: ACPI limit 1.60GHz

Signed-off-by: Rafa=C5=82 Bilski <rafalbilski@interia.pl>
---
 drivers/cpufreq/e_powersaver.c |   76 ++++++++++++++++++++++++++++++++=
++++++++
 1 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersa=
ver.c
index cab543b..7638f5d 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -19,6 +19,11 @@
 #include <asm/msr.h>
 #include <asm/tsc.h>
=20
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+#include <linux/acpi.h>
+#include <acpi/processor.h>
+#endif
+
 #define EPS_BRAND_C7M	0
 #define EPS_BRAND_C7	1
 #define EPS_BRAND_EDEN	2
@@ -27,6 +32,9 @@
=20
 struct eps_cpu_data {
 	u32 fsb;
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+	u32 bios_limit;
+#endif
 	struct cpufreq_frequency_table freq_table[];
 };
=20
@@ -36,6 +44,46 @@ static struct eps_cpu_data *eps_cpu[NR_CPUS];
 static int freq_failsafe_off;
 static int voltage_failsafe_off;
=20
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+static int ignore_acpi_limit;
+
+static struct acpi_processor_performance *eps_acpi_cpu_perf;
+
+/* Minimum necessary to get acpi_processor_get_bios_limit() working */
+static int eps_acpi_init(void)
+{
+	eps_acpi_cpu_perf =3D kzalloc(sizeof(struct acpi_processor_performanc=
e),
+				      GFP_KERNEL);
+	if (!eps_acpi_cpu_perf)
+		return -ENOMEM;
+
+	if (!zalloc_cpumask_var(&eps_acpi_cpu_perf->shared_cpu_map,
+								GFP_KERNEL)) {
+		kfree(eps_acpi_cpu_perf);
+		eps_acpi_cpu_perf =3D NULL;
+		return -ENOMEM;
+	}
+
+	if (acpi_processor_register_performance(eps_acpi_cpu_perf, 0)) {
+		free_cpumask_var(eps_acpi_cpu_perf->shared_cpu_map);
+		kfree(eps_acpi_cpu_perf);
+		eps_acpi_cpu_perf =3D NULL;
+		return -EIO;
+	}
+	return 0;
+}
+
+static int eps_acpi_exit(struct cpufreq_policy *policy)
+{
+	if (eps_acpi_cpu_perf) {
+		acpi_processor_unregister_performance(eps_acpi_cpu_perf, 0);
+		free_cpumask_var(eps_acpi_cpu_perf->shared_cpu_map);
+		kfree(eps_acpi_cpu_perf);
+		eps_acpi_cpu_perf =3D NULL;
+	}
+	return 0;
+}
+#endif
=20
 static unsigned int eps_get(unsigned int cpu)
 {
@@ -168,6 +216,9 @@ static int eps_cpu_init(struct cpufreq_policy *poli=
cy)
 	int k, step, voltage;
 	int ret;
 	int states;
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+	unsigned int limit;
+#endif
=20
 	if (policy->cpu !=3D 0)
 		return -ENODEV;
@@ -280,6 +331,24 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
=20
 	/* Calc FSB speed */
 	fsb =3D cpu_khz / current_multiplier;
+
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+	/* Check for ACPI processor speed limit */
+	if (!ignore_acpi_limit && !eps_acpi_init()) {
+		if (!acpi_processor_get_bios_limit(policy->cpu, &limit)) {
+			printk(KERN_INFO "eps: ACPI limit %u.%uGHz\n",
+				limit/1000000,
+				(limit%1000000)/10000);
+			eps_acpi_exit(policy);
+			/* Check if max_multiplier is in BIOS limits */
+			if (limit && max_multiplier * fsb > limit) {
+				printk(KERN_INFO "eps: Aborting.\n");
+				return -EINVAL;
+			}
+		}
+	}
+#endif
+
 	/* Calc number of p-states supported */
 	if (brand =3D=3D EPS_BRAND_C7M)
 		states =3D max_multiplier - min_multiplier + 1;
@@ -296,6 +365,9 @@ static int eps_cpu_init(struct cpufreq_policy *poli=
cy)
=20
 	/* Copy basic values */
 	centaur->fsb =3D fsb;
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+	centaur->bios_limit =3D limit;
+#endif
=20
 	/* Fill frequency and MSR value table */
 	f_table =3D &centaur->freq_table[0];
@@ -386,6 +458,10 @@ module_param(freq_failsafe_off, int, 0644);
 MODULE_PARM_DESC(freq_failsafe_off, "Disable current vs max frequency =
check");
 module_param(voltage_failsafe_off, int, 0644);
 MODULE_PARM_DESC(voltage_failsafe_off, "Disable current vs max voltage=
 check");
+#if defined CONFIG_ACPI_PROCESSOR || defined CONFIG_ACPI_PROCESSOR_MOD=
ULE
+module_param(ignore_acpi_limit, int, 0644);
+MODULE_PARM_DESC(ignore_acpi_limit, "Don't check ACPI's processor spee=
d limit");
+#endif
=20
 MODULE_AUTHOR("Rafal Bilski <rafalbilski@interia.pl>");
 MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");
--=20
1.7.6


----------------------------------------------------------------
Najwieksza baza samochodow nowych i uzywanych
Sprawdz >> http://linkint.pl/f29e3
