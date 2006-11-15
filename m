From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: 2.6.19-rc5-mm2
Date: Wed, 15 Nov 2006 10:06:23 -0800
Message-ID: <EB12A50964762B4D8111D55B764A8454E4128E@scsmsx413.amr.corp.intel.com>
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
To: Mattia Dongili <malattia@linux.it>
Cc: Andrew Morton <akpm@osdl.org>, "Sadykov,
	Denis M" <denis.m.sadykov@intel.com>, ego@in.ibm.com, CPUFreq Mailing List <cpufreq@lists.linux.org.uk>, Reuben Farrelly <reuben-linuxkernel@reub.net>, linux-kernel@vger.kernel.org, davej@redhat.com

=20

>-----Original Message-----
>From: Mattia Dongili [mailto:malattia@linux.it]=20
>Sent: Wednesday, November 15, 2006 9:47 AM
>To: Pallipadi, Venkatesh
>Cc: ego@in.ibm.com; Reuben Farrelly; Andrew Morton;=20
>davej@redhat.com; linux-kernel@vger.kernel.org; CPUFreq=20
>Mailing List; Sadykov, Denis M
>Subject: Re: 2.6.19-rc5-mm2
>
>On Wed, Nov 15, 2006 at 06:09:47AM -0800, Pallipadi, Venkatesh wrote:
>[...]
>> >data->cpu_feature =3D=3D ACPI_ADR_SPACE_FIXED_HARDWARE.
>>=20
>> Yes. Patch from Mattia is indeed required for acpi-cpufreq.=20
>> Mattia: Can you please send the patch towards Andrew (With signed off
>> etc) for inclusion.
>
>Venki, I'm a little worried about the switch/case in question (line
>702): the data->cpu_feature is set either to SYSTEM_IO_CAPABLE or
>SYSTEM_INTEL_MSR_CAPABLE just a few lines above so it seems the switch
>variable is wrong and none of the 2 cases will ever get a chance to
>execute.
>

The variable is set few lines before. So, it should be OK to switch on
that=20
variable set and one of the two cases will execute. isn't it? Or am=20
I missing something?

>Unfortunately I don't have enough knowledge to tell if it's simply
>necessary to fix the switch variable as=20

Get_cur_freq_on_cpu will not work on SYSTEM_IO space as ACPI does not
have an interface to get the current frequency. It only has a interface
to say whether the last transitions tried was successful or not.
So, if indeed a change in switch is required, first option should be
good...

Thanks,
Venki
