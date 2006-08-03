From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 3/8] acpi-cpufreq: merge acpi functionality of
	cpufreqdrivers
Date: Thu, 3 Aug 2006 14:02:05 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454566EB0@scsmsx413.amr.corp.intel.com>
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
>Sent: Monday, July 31, 2006 11:44 AM
>To: Brown, Len; Dave Jones
>Cc: cpufreq@lists.linux.org.uk
>Subject: [PATCH 3/8] acpi-cpufreq: merge acpi functionality of=20
>cpufreqdrivers
>
> acpi-cpufreq.c |  157=20
>+++++++++++++++++++++++++++++++++++++++++++++++++++------
> 1 file changed, 141 insertions(+), 16 deletions(-)
>
>merge acpi functionality of cpufreq drivers
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
>2006-07-13 17:52:15.000000000 +0000
>+++ linux-2.6.17/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c=09
>2006-07-13 18:15:30.000000000 +0000
>@@ -49,9 +49,16 @@
> MODULE_DESCRIPTION("ACPI Processor P-States Driver");
> MODULE_LICENSE("GPL");
>=20
>+enum {
>+	UNDEFINED_CAPABLE =3D 0,
>+	SYSTEM_MSR_CAPABLE,
>+	SYSTEM_IO_CAPABLE,
>+};
>+
> struct acpi_cpufreq_data {
> 	struct acpi_processor_performance	*acpi_data;
> 	struct cpufreq_frequency_table		*freq_table;
>+	unsigned int				cpu_fet;
> };
>=20
> static struct acpi_cpufreq_data		=09
>*drv_data[NR_CPUS];
>@@ -59,7 +66,29 @@
>=20
> static struct cpufreq_driver			acpi_cpufreq_driver;
>=20
>-static unsigned extract_freq(u32 value, struct=20
>acpi_cpufreq_data *data)
>+static int check_speedstep_cpu(unsigned int cpuid)
>+{
>+	struct cpuinfo_x86 *cpu =3D &cpu_data[cpuid];
>+
>+	if (cpu->x86_vendor !=3D X86_VENDOR_INTEL ||
>+				!cpu_has(cpu, X86_FEATURE_EST))
>+		return (0);
>+	return (1);
>+}
>+
>+static unsigned extract_msr(u32 msr, struct acpi_cpufreq_data *data)
>+{
>+	int i;
>+
>+	msr &=3D 0xffff;
>+	for (i =3D 0; data->freq_table[i].frequency !=3D=20
>CPUFREQ_TABLE_END; i++) {
>+		if (msr =3D=3D data->freq_table[i].index)
>+			return data->freq_table[i].frequency;
>+	}
>+	return (0);
>+}

This has to change to return minimum or closest freq when msr value does
not match any index in the frequency table. There is a possibility of
having a MSR value not in frequency table into this routine, as we read
PERF_STATUS and it can contain some interim value due to Enhanced
C-state or TM2 reducing the CPU frequency and voltage. If we return zero
frequency in those cases, some of the functions that use this value can
get confused. I have seen earlier driver panic, as some notifier
callback function sees old or new frequency as zero and tries to use
that frequency value for some division.

Rest of the changes in the patch looks good.

Thanks,
Venki
