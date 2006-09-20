From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 11:07:06 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84549CD02D@scsmsx413.amr.corp.intel.com>
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
To: Bryan O'Sullivan <bos@serpentine.com>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

>-----Original Message-----
>From: Bryan O'Sullivan [mailto:bos@serpentine.com]=20
>Sent: Wednesday, September 20, 2006 11:00 AM
>To: Pallipadi, Venkatesh
>Cc: Dave Jones; cpufreq@lists.linux.org.uk
>Subject: RE: No life from acpi-cpufreq, Pentium D 930, x86_64
>
>On Wed, 2006-09-20 at 09:24 -0700, Pallipadi, Venkatesh wrote:
>
>> Yes. As Dave said your processor supports speedstep. Whether your
>> platform (BIOS) supports it or not is the next question.=20
>>=20
>> The patch will make acpi-cpufreq either succeed or fail=20
>cleanly rather
>> than hanging in there without doing anything.
>
>I built 2.6.18 and booted into it with cpufreq.debug=3D3, and got not a
>squeak out of it.  There's no cpufreq-related info in /var/log/messages
>at all.
>
>>  And again as Dave
>> mentioned, try both acpi-cpufreq and speedstep-centrino drivers.
>
>I'm using the Fedora kernel config, which builds acpi-cpufreq as a
>module and speedstep-centrino built-in, but no joy.
>
>I'll try building the lot as modules, and see how that goes.
>
>Here's what's in my .config with the setup that prints nothing at all:
>
>CONFIG_CPU_FREQ=3Dy
>CONFIG_CPU_FREQ_TABLE=3Dy
>CONFIG_CPU_FREQ_DEBUG=3Dy
>CONFIG_CPU_FREQ_STAT=3Dm
>CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
># CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
>CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
>CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
>CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
>CONFIG_X86_POWERNOW_K8=3Dy
>CONFIG_X86_POWERNOW_K8_ACPI=3Dy
>CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
>CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=3Dy
>CONFIG_X86_ACPI_CPUFREQ=3Dm
># CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
># CONFIG_X86_SPEEDSTEP_LIB is not set
>
>	<b

Dump out acpidump from this system and send it to me. With that we can
check what speedstep info BIOS is giving on this platform. You can find
acpidump in latest version of pmtools here.
http://www.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/

You can also open a bugzilla at bugme.osdl.org (ACPI->Processor/Power
category) and attach the information there. It will be easier to track
the issue that way.

Thanks,
Venki
