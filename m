From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Mobile Celeron with Speedstep ? - speedstep-centrino
	freezesmachine
Date: Tue, 21 Sep 2004 11:45:55 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB6002EDBFA5@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>, Thomas Renninger <mail@renninger.de>
Cc: cpufreq@www.linux.org.uk


This may be due to C-states and probably unrelated to frequency changes.
Check out - http://bugme.osdl.org/show_bug.cgi?id=3D3219=20

Modprobe of cpufreq driver is probably adding acpi/processor.ko.

Thanks,
Venki

>-----Original Message-----
>From: cpufreq-bounces@www.linux.org.uk=20
>[mailto:cpufreq-bounces@www.linux.org.uk] On Behalf Of Dominik=20
>Brodowski
>Sent: Tuesday, September 21, 2004 9:34 AM
>To: Thomas Renninger
>Cc: cpufreq@www.linux.org.uk
>Subject: Re: Mobile Celeron with Speedstep ? -=20
>speedstep-centrino freezesmachine
>
>On Tue, Sep 21, 2004 at 05:55:21PM +0200, Thomas Renninger wrote:
>> modprobe cpufreq_acpi_pdump
>> FATAL: Error inserting cpufreq_acpi_pdump=20
>>=20
>(/lib/modules/2.6.8-7-default/kernel/drivers/acpi/cpufreq-acpi_
>pdump.ko):=20
>> Input/output error
>> ibm9:/usr/src/linux/arch/i386/kernel/cpu/cpufreq #
>>=20
>> -> Freeze.
>> Anyone an idea what exactly could cause the freeze, or how=20
>to analyse it?
>
>Do I understand it correctly that the system freezes _after_ modprobing
>cpufreq_acpi_pdump fails??? The -EIO result itself isn't=20
>strange, it means
>the call to acpi_processor_register_performance() failed which=20
>happens on
>several systems.
>
>	Dominik
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@www.linux.org.uk
>http://www.linux.org.uk/mailman/listinfo/cpufreq
>
