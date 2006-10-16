From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Cpufreq on kernel 2.6.18
Date: Mon, 16 Oct 2006 06:34:38 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454BA3D97@scsmsx413.amr.corp.intel.com>
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
To: Luca <morpheus@ferrara.linux.it>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Luca [mailto:morpheus@ferrara.linux.it]=20
>Sent: Sunday, October 08, 2006 10:37 AM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk
>Subject: Re: Cpufreq on kernel 2.6.18
>
>On Fri, 6 Oct 2006 16:08:22 -0700
>"Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com> wrote:
>
>> =20
>>=20
>> >-----Original Message-----
>> >From: cpufreq-bounces@lists.linux.org.uk=20
>> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Luca
>> >Sent: Friday, October 06, 2006 1:01 PM
>> >To: cpufreq@lists.linux.org.uk
>> >Subject: Cpufreq on kernel 2.6.18
>> >
>> >Hello,
>> >I just updated the kernel from 2.6.15.2 to 2.6.18 and the=20
>> >frequency scaling of my Centrinlo Laptop stopped working=20
>> >(keeping the same configuration).
>> >The dir /sys/devices/system/cpu/cpu0/ is empty and I don't=20
>> >know which other tests I could make.
>> >I also tried to move CONFIG_X86_ACPI_CPUFREQ from builtin to=20
>> >module: loading the module does not give any information=20
>nor any error.
>> >I need 2.6.18 for other drivers, so it would be really nice if=20
>> >I could solve this problem that seems to be the only driver=20
>> >that's not working properly (and my battery would be much=20
>happier :) )
>> >If you need more informations just tell me.
>> >
>>=20
>> Can you enable CPU_FREQ_DEBUG in your config and pass=20
>"cpufreq.debug=3D3"
>> in kernel parameter and send in the dmesg log.
>
>I found something, and maybe I have to ask excuse, because now=20
>it's working..
>Anyway something has changed and that's the reason that fooled=20
>me: on my old logs, with the old kernel I had:
> acpi-cpufreq: CPU0 - ACPI performance management activated.
>So I focused my attention on the module acpi-cpufreq.=20
>Inserting it, even with debug activated (cpufreq.debug=3D3=20
>forgot to pass it at boot, but now seems not so important...)=20
>doesn't tell anything at all (and doesn't work).
>I was playing with other modules, and I found that loading the=20
>module speedstep-centrino enables cpufreq (even if on kernel=20
>log doesn't print anything).
>So something has changed in the software support for my=20
>hardware. I'm sorry for not having understood earlyer. Since=20
>I'm writing here, can I kindly ask you a short explanation on=20
>this difference between two different kernels, on the same hardware.
>
>Thanks for the fast answer,
>				Luca.
>

Change from acpi-cpufreq to speedstep-centrino is a long story. You can
find some background here
http://bugme.osdl.org/show_bug.cgi?id=3D6005


Thanks,
Venki
