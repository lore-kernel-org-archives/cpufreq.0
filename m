From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: [PATCH 6/8] acpi-cpufreq: use cpu_core_map on multicore processors
Date: Mon, 31 Jul 2006 22:53:45 +0400
Message-ID: <44CE51B9.3060906@linux.intel.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

 acpi-cpufreq.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

on some new systems =93shared_cpu_map=94 from ACPI is wrong, so   =93cpu_co=
re_map=94 structure is used to define right =93policy->cpus=94 group.

Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-1=
7 17:09:27.000000000 +0000
+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c	2006-07-17 17:=
11:07.000000000 +0000
@@ -542,7 +542,16 @@
 		}
 	}
=20
-	policy->cpus =3D data->acpi_data->shared_cpu_map;
+/*	policy->cpus =3D data->acpi_data->shared_cpu_map; */
+/* NOTE TODO:
+	Actually we must use "shared_cpu_map" from acpi data to define policy->cp=
us,
+	but on some new systems "shared_cpu_map" is wrong. So we use "cpu_core_ma=
p"
+	sructure temporarily. Should be return back. */
+#ifdef CONFIG_SMP
+	policy->cpus =3D cpu_core_map[cpu];
+#else
+	policy->cpus =3D cpumask_of_cpu(cpu);
+#endif /* CONFIG_SMP */
 	for_each_cpu_mask(i, policy->cpus) {
 		drv_data[i] =3D data;
 	}
