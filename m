From: Rafal Bilski <rafalbilski@interia.pl>
Subject: [PATCH] e_powersaver: Additional checks
Date: Wed, 20 Jul 2011 20:42:23 +0100
Message-ID: <1311190943-6660-1-git-send-email-rafalbilski@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>

=46rom: Rafa=C5=82 Bilski <rafalbilski@interia.pl>

Some systems are using 1,2Ghz@844mV processors running at 600MHz@796mV.
Try to detect such systems and don't touch anything on it. If CPU doesn=
't have
P-States in BIOS it should run at maximum frequency.
Allow user to bypass checks by means of two new options.
Don't set frequency to maximum on module unloading to avoid bada boom.
It is also possible that some processors may have incorrect values in m=
in/max
registers caused by error in manufacturing process. Probably it would b=
e BIOS
job to set them to right frequency and P-States tables would have corre=
ct
values inside.
Two additional sanity checks for voltage.

Signed-off-by: Rafa=C5=82 Bilski <rafalbilski@interia.pl>
---
 drivers/cpufreq/e_powersaver.c |   41 +++++++++++++++++++++++++++++---=
-------
 1 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersa=
ver.c
index 7883ffa..cab543b 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -32,6 +32,10 @@ struct eps_cpu_data {
=20
 static struct eps_cpu_data *eps_cpu[NR_CPUS];
=20
+/* Module parameters */
+static int freq_failsafe_off;
+static int voltage_failsafe_off;
+
=20
 static unsigned int eps_get(unsigned int cpu)
 {
@@ -253,9 +257,27 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
 		return -EINVAL;
 	if (current_voltage > 0x1f || max_voltage > 0x1f)
 		return -EINVAL;
-	if (max_voltage < min_voltage)
+	if (max_voltage < min_voltage
+	    || current_voltage < min_voltage
+	    || current_voltage > max_voltage)
 		return -EINVAL;
=20
+	/* Check for systems using underclocked CPU */
+	if (!freq_failsafe_off && max_multiplier !=3D current_multiplier) {
+		printk(KERN_INFO "eps: Your processor is running at different "
+			"frequency then its maximum. Aborting.\n");
+		printk(KERN_INFO "eps: You can use freq_failsafe_off option "
+			"to disable this check.\n");
+		return -EINVAL;
+	}
+	if (!voltage_failsafe_off && max_voltage !=3D current_voltage) {
+		printk(KERN_INFO "eps: Your processor is running at different "
+			"voltage then its maximum. Aborting.\n");
+		printk(KERN_INFO "eps: You can use voltage_failsafe_off "
+			"option to disable this check.\n");
+		return -EINVAL;
+	}
+
 	/* Calc FSB speed */
 	fsb =3D cpu_khz / current_multiplier;
 	/* Calc number of p-states supported */
@@ -312,17 +334,7 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
 static int eps_cpu_exit(struct cpufreq_policy *policy)
 {
 	unsigned int cpu =3D policy->cpu;
-	struct eps_cpu_data *centaur;
-	u32 lo, hi;
-
-	if (eps_cpu[cpu] =3D=3D NULL)
-		return -ENODEV;
-	centaur =3D eps_cpu[cpu];
=20
-	/* Get max frequency */
-	rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
-	/* Set max frequency */
-	eps_set_state(centaur, cpu, hi & 0xffff);
 	/* Bye */
 	cpufreq_frequency_table_put_attr(policy->cpu);
 	kfree(eps_cpu[cpu]);
@@ -368,6 +380,13 @@ static void __exit eps_exit(void)
 	cpufreq_unregister_driver(&eps_driver);
 }
=20
+/* Allow user to overclock his machine or to change frequency to highe=
r after
+ * unloading module */
+module_param(freq_failsafe_off, int, 0644);
+MODULE_PARM_DESC(freq_failsafe_off, "Disable current vs max frequency =
check");
+module_param(voltage_failsafe_off, int, 0644);
+MODULE_PARM_DESC(voltage_failsafe_off, "Disable current vs max voltage=
 check");
+
 MODULE_AUTHOR("Rafal Bilski <rafalbilski@interia.pl>");
 MODULE_DESCRIPTION("Enhanced PowerSaver driver for VIA C7 CPU's.");
 MODULE_LICENSE("GPL");
--=20
1.7.6


----------------------------------------------------------------
Znajdz samochod idealny dla siebie!
Szukaj >> http://linkint.pl/f29e2
