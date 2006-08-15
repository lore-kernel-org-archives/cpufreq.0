From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq stops working after a while
Date: Tue, 15 Aug 2006 08:23:27 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84546F98E5@scsmsx413.amr.corp.intel.com>
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
To: Carlos Garcia Campos <carlosgc@gnome.org>
Cc: cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Carlos Garcia Campos [mailto:carlosgc@gnome.org]=20
>Sent: Tuesday, August 15, 2006 8:08 AM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk
>Subject: RE: cpufreq stops working after a while
>
>El mar, 15-08-2006 a las 06:27 -0700, Pallipadi, Venkatesh escribi=F3:
>> =20
>> >-----Original Message-----
>> >From: cpufreq-bounces@lists.linux.org.uk=20
>> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>> >Carlos Garcia Campos
>> >Sent: Tuesday, August 15, 2006 4:07 AM
>> >To: cpufreq@lists.linux.org.uk
>> >Subject: Re: cpufreq stops working after a while
>> >
>> >
>> >I have the same problem. My laptop is Dell Latitude D600 (Intel(R)
>> >Pentium(R) M processor 1.60GHz). If I'm compiling something, for
>> >example, that takes a long time, scaling_max_freq is set to=20
>600000 (the
>> >lowest). If I try to echo 1600000 to scaling_max_freq it do nothing.
>> >Only after some time if the cpu load is not high I can=20
>echoing 1600000
>> >again and it works without need to reboot.=20
>> >
>>=20
>> Looks like you have the same problem that Mark had in this=20
>original thread. Thermal.
>
>It never happened with older kernels (< 2.6.17, I think)
>

Can you confirm the latest version of the kernel where the problem was =
not there. That will help on narrowing this down.

>> It is not a bug in cpufreq. Just that due to cpu load,=20
>system is getting heated up and platform decides to reduce the=20
>temperature using passive cooling and as a result reduces the=20
>frequency. Does your system have active cooling (fans) or does=20
>it allow only passive cooling? You can monitor the temperature=20
>by looking at stuff under /proc/acpi/termal_zone/*/*.
>
>Yes, my system has fans. Here is the contents of the files
>under /proc/acpi/termal_zone/*/*, if it helps:
>
>$ cat /proc/acpi/thermal_zone/THM/*
><setting not supported>
>cooling mode:   critical
><polling disabled>
>state:                   ok
>temperature:             47 C
>critical (S5):           102 C
>
>How can I solve the problem then? It's very annoying.=20


Can you watch the temperature as you see the frequency drop. =
Continuously (every second) cat cpufreq_max_freq in /sys and temperature =
in /proc as you run you load. My feeling is you will see the drop in max =
freq as your temperature goes to around 60 degrees or so.


Thanks,
Venki
