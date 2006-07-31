From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 5/8] acpi-cpufreq: add strict mode to acpi-cpufreq driver
Date: Mon, 31 Jul 2006 22:49:09 +0400
Message-ID: <44CE50A5.20002@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

 acpi-cpufreq.c |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

strict mode is added to =93acpi-cpufreq.c=94, that allows to switch to =93s=
trict mode=94, when after each attempt to set new processor performance the=
 driver checks that frequency has been changed.

Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-1=
7 17:06:46.000000000 +0000
+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-17 17:=
09:27.000000000 +0000
@@ -66,6 +66,9 @@
=20
 static struct cpufreq_driver			acpi_cpufreq_driver;
=20
+/* module params */
+static unsigned int	use_acpi_strict;
+
 static int check_speedstep_cpu(unsigned int cpuid)
 {
 	struct cpuinfo_x86 *cpu =3D &cpu_data[cpuid];
@@ -273,6 +276,20 @@
 	return (freq);
 }
=20
+static unsigned int check_freqs(cpumask_t mask, unsigned int freq,
+				struct acpi_cpufreq_data *data)
+{
+	unsigned int		cur_freq;
+	unsigned int		i;
+
+	for (i =3D 0; i < 100; i++) {
+		cur_freq =3D extract_freq(get_cur_val(mask), data);
+		if (cur_freq =3D=3D freq)
+			return (1);
+		udelay(10);
+	}
+	return (0);
+}
=20
 static int acpi_cpufreq_target(struct cpufreq_policy *policy,
 				unsigned int target_freq,
@@ -349,6 +366,13 @@
=20
 	drv_write(&cmd);
=20
+	if (use_acpi_strict) {=09
+		if (!check_freqs(cmd.mask, freqs.new, data)) {
+			dprintk("acpi_cpufreq_target failed (%d)\n", policy->cpu);
+			return -EAGAIN;
+		}
+	}
+
 	for_each_cpu_mask(i, cmd.mask) {
 		freqs.cpu =3D i;
 		cpufreq_notify_transition(&freqs, CPUFREQ_POSTCHANGE);
@@ -620,6 +644,9 @@
 	return;
 }
=20
+module_param(use_acpi_strict, uint, 0644);
+MODULE_PARM_DESC(use_acpi_strict, "value 0 or non-zero.");
+
 late_initcall(acpi_cpufreq_init);
 module_exit(acpi_cpufreq_exit);
