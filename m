From: =?UTF-8?b?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Subject: [PATCH] e_powersaver: Underclock checks
Date: Tue, 12 Jul 2011 00:15:16 +0100
Message-ID: <4E1B8404.1050909@interia.pl>
References: <1310114243.2940.3.camel@phoenix> <4E1B745A.5000802@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4E1B745A.5000802@interia.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org

Some systems are using 1.2GHz@844mV processors running at 600MHz@796mV.
Try to detect such systems and don't touch anything on it. If CPU=20
doesn't have
P-States in BIOS it will run on maximum frequency anyway.
Allow user to bypass checks by means of two new options.
Don't set frequency to maximum on module unloading to avoid bada boom.

Code totally untested as I have abadoned Centaur for Intel Atom two=20
years ago.

Signed-off-by: Rafa=C5=82 Bilski <rafalbilski@interia.pl>
---
  drivers/cpufreq/e_powersaver.c |   42=20
+++++++++++++++++++++++++++++----------
  1 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/e_powersaver.c b/drivers/cpufreq/e_powersa=
ver.c
index 7883ffa..2e28af2 100644
--- a/drivers/cpufreq/e_powersaver.c
+++ b/drivers/cpufreq/e_powersaver.c
@@ -32,6 +32,10 @@ struct eps_cpu_data {

  static struct eps_cpu_data *eps_cpu[NR_CPUS];

+/* Module parameters */
+static int freq_failsafe_off;
+static int voltage_failsafe_off;
+

  static unsigned int eps_get(unsigned int cpu)
  {
@@ -253,9 +257,28 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
          return -EINVAL;
      if (current_voltage > 0x1f || max_voltage > 0x1f)
          return -EINVAL;
-    if (max_voltage < min_voltage)
+    if (max_voltage < min_voltage || current_voltage < min_voltage)
          return -EINVAL;

+    /* Check for systems using underclocked CPU */
+    if (!freq_failsafe_off && max_multiplier !=3D current_multiplier) =
{
+        printk(KERN_INFO "eps: Your processor is running at different=20
then "
+            "its maximum frequency.\n");
+        printk(KERN_INFO "eps: Some systems use underclocked CPU's\n")=
;
+        printk(KERN_INFO "eps: Use of \"e_powersaver\" on them may cau=
se "
+            "irreperable damage.\n");
+        printk(KERN_INFO "eps: You can use freq_failsafe_off option to=
=20
disable "
+            "this check.\n");
+        return -EINVAL;
+    }
+    if (!voltage_failsafe_off && max_voltage !=3D current_voltage) {
+        printk(KERN_INFO "eps: Your processor is running at different=20
then "
+            "its maximum voltage.\n");
+        printk(KERN_INFO "eps: You can use voltage_failsafe_off option=
=20
to disable "
+            "this check.\n");
+        return -EINVAL;
+    }
+
      /* Calc FSB speed */
      fsb =3D cpu_khz / current_multiplier;
      /* Calc number of p-states supported */
@@ -312,17 +335,7 @@ static int eps_cpu_init(struct cpufreq_policy *pol=
icy)
  static int eps_cpu_exit(struct cpufreq_policy *policy)
  {
      unsigned int cpu =3D policy->cpu;
-    struct eps_cpu_data *centaur;
-    u32 lo, hi;
-
-    if (eps_cpu[cpu] =3D=3D NULL)
-        return -ENODEV;
-    centaur =3D eps_cpu[cpu];

-    /* Get max frequency */
-    rdmsr(MSR_IA32_PERF_STATUS, lo, hi);
-    /* Set max frequency */
-    eps_set_state(centaur, cpu, hi & 0xffff);
      /* Bye */
      cpufreq_frequency_table_put_attr(policy->cpu);
      kfree(eps_cpu[cpu]);
@@ -368,6 +381,13 @@ static void __exit eps_exit(void)
      cpufreq_unregister_driver(&eps_driver);
  }

+/* Allow user to overclock his machine or to change frequency to highe=
r=20
after
+ * unloading module */
+module_param(freq_failsafe_off, int, 0644);
+MODULE_PARM_DESC(freq_failsafe_off, "Disable current vs max frequency=20
check");
+module_param(voltage_failsafe_off, int, 0644);
+MODULE_PARM_DESC(voltage_failsafe_off, "Disable current vs max voltage=
=20
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
