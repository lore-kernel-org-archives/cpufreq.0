From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq doesn't work with my Intel Pentium M processor in 2.6.17
Date: Sat, 24 Jun 2006 07:33:10 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84541D4975@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: CIJOML <cijoml@volny.cz>, linux-kernel@vger.kernel.org, "Brodowski, Dominik" <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk



Can you send me the acpidump output from this system using the latest =
pmtools from here.
http://www.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/

Better still, if you can open a bugzilla at http://bugme.osdl.org=20
That will help tracking this one better.

Thanks,
Venki =20

>-----Original Message-----
>From: CIJOML [mailto:cijoml@volny.cz]=20
>Sent: Wednesday, June 21, 2006 11:34 PM
>To: Pallipadi, Venkatesh; linux-kernel@vger.kernel.org;=20
>Brodowski, Dominik; cpufreq@lists.linux.org.uk
>Subject: Re: cpufreq doesn't work with my Intel Pentium M=20
>processor in 2.6.17
>
>Hi Pallipadi,
>
>no change:
>
>#find /sys -name *freq*
>/sys/module/acpi_cpufreq
>
>no tuning options as you can see
>module is compiled into kernel
>
>Michal
>
>Dne st=F8eda 21 =E8erven 2006 21:27 jste napsal(a):
>> >-----Original Message-----
>> >From: linux-kernel-owner@vger.kernel.org
>> >[mailto:linux-kernel-owner@vger.kernel.org] On Behalf Of CIJOML
>> >Sent: Sunday, June 18, 2006 11:06 PM
>> >To: linux-kernel@vger.kernel.org
>> >Subject: cpufreq doesn't work with my Intel Pentium M
>> >processor in 2.6.17
>> >
>> >Hello team,
>> >
>> >I compiled 2.6.17 and now I see, that cpufreq doesn't work
>> >with 2.6.17 (2.6.16
>> >was fine).
>> >
>> >My cpu:
>> >Intel(R) Pentium(R) M processor 1.70GHz
>> >cpu family 6
>> >model 13
>> >stepping 6
>> >
>> >Cpufreq doesn't start and also /sys files are not present/created
>> >
>> >My config:
>> >[*] CPU Frequency scaling
>> ><*> CPU frequency translation statistics
>> >[*] CPU frequency translation statistics details
>> >governors: <*> performance, powersave, ondemand, conservative
>> ><*> Intel Enhanced SpeedStep
>> >[*] Use ACPI tables to decode valid frequency/voltage pairs
>> >[*] Built-in tables for Banias CPUs
>>
>> Can you also try
>> [*] ACPI Processor P-states driver
>>
>> In the same config menu.
>>
>> Thanks,
>> Venki
>
