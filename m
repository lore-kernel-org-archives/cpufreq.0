From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 6/8] acpi-cpufreq: use cpu_core_map on multicore
	processors
Date: Thu, 3 Aug 2006 14:05:41 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454566EB7@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Alexey Starikovskiy
>Sent: Monday, July 31, 2006 11:54 AM
>To: Brown, Len; Dave Jones
>Cc: cpufreq@lists.linux.org.uk
>Subject: [PATCH 6/8] acpi-cpufreq: use cpu_core_map on=20
>multicore processors
>
> acpi-cpufreq.c |   11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>on some new systems "shared_cpu_map" from ACPI is wrong, so  =20
>"cpu_core_map" structure is used to define right "policy->cpus" group.
>
>Signed-off: Denis Sadykov <denis.m.sadykov@intel.com>
>Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
>Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>
>
>Index: linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>---=20
>linux-2.6.17.orig/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=09
>2006-07-17 17:09:27.000000000 +0000
>+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=09
>2006-07-17 17:11:07.000000000 +0000
>@@ -542,7 +542,16 @@
> 		}
> 	}
>=20
>-	policy->cpus =3D data->acpi_data->shared_cpu_map;
>+/*	policy->cpus =3D data->acpi_data->shared_cpu_map; */
>+/* NOTE TODO:
>+	Actually we must use "shared_cpu_map" from acpi data to=20
>define policy->cpus,
>+	but on some new systems "shared_cpu_map" is wrong. So=20
>we use "cpu_core_map"
>+	sructure temporarily. Should be return back. */
>+#ifdef CONFIG_SMP
>+	policy->cpus =3D cpu_core_map[cpu];
>+#else
>+	policy->cpus =3D cpumask_of_cpu(cpu);
>+#endif /* CONFIG_SMP */
> 	for_each_cpu_mask(i, policy->cpus) {
> 		drv_data[i] =3D data;
> 	}
>

I don't think this should be done universally. We should try to limit it
to only for the platforms that has this issue, using OEMID or some such
thing. In any case, this patch should not be part of this patch set.
Should be a standalone bugfix-workaround patch with more details about
the bug.

Thanks,
Venki
