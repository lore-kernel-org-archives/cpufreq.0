From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code to make MSR
	support addition easier
Date: Mon, 2 Oct 2006 16:04:25 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454ABC262@scsmsx413.amr.corp.intel.com>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>


>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Sunday, October 01, 2006 5:41 PM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq; Starikovskiy, Alexey Y
>Subject: Re: [PATCH 2/8]cpufreq: acpi-cpufreq: reorganize code=20
>to make MSR support addition easier
>
>Hi,
>
>On Sun, Oct 01, 2006 at 07:09:29AM -0700, Venkatesh Pallipadi wrote:
>> +static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
>> +{
>> +	struct acpi_cpufreq_data		*data =3D drv_data[cpu];
>> +	unsigned int				freq;
>> +
>> +	dprintk("get_cur_freq_on_cpu (%d)\n", cpu);
>> +
>> +	if (unlikely(data =3D=3D NULL ||
>> +	             data->acpi_data =3D=3D NULL ||
>> +	             data->freq_table =3D=3D NULL)) {
>> +		return 0;
>>  	}
>> =20
>> -	dprintk("Transition successful after %d=20
>microseconds\n", i * 10);
>> +	freq =3D extract_freq(get_cur_val(cpumask_of_cpu(cpu)), data);
>
>Does this _finally_ work according to ACPI spec? That you can=20
>determine the
>current frequency this way?
>
>

Nope. ACPI spec only goes to say you can check whether transitions was
successful or not by looking at the status.=20

Thanks,
Venki
