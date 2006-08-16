From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: cpufreq stops working after a while
Date: Wed, 16 Aug 2006 06:27:25 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454741E13@scsmsx413.amr.corp.intel.com>
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
To: Carlos Garcia Campos <carlosgc@gnome.org>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Carlos Garcia Campos
>Sent: Wednesday, August 16, 2006 3:11 AM
>To: cpufreq@lists.linux.org.uk
>Subject: RE: cpufreq stops working after a while
>
>El mar, 15-08-2006 a las 19:46 +0200, Carlos Garcia Campos escribi=F3:
>> El mar, 15-08-2006 a las 08:23 -0700, Pallipadi, Venkatesh =
escribi=F3:
>> > =20
>> >=20
>> > Can you confirm the latest version of the kernel where the=20
>problem was not there. That will help on narrowing this down.
>>=20
>> I'm not sure at all . . . I don't have any kernel < 2.6.17 compiled
>> right now.
>>=20
>> > >> It is not a bug in cpufreq. Just that due to cpu load,=20
>> > >system is getting heated up and platform decides to reduce the=20
>> > >temperature using passive cooling and as a result reduces the=20
>> > >frequency. Does your system have active cooling (fans) or does=20
>> > >it allow only passive cooling? You can monitor the temperature=20
>> > >by looking at stuff under /proc/acpi/termal_zone/*/*.
>> > >
>> > >Yes, my system has fans. Here is the contents of the files
>> > >under /proc/acpi/termal_zone/*/*, if it helps:
>> > >
>> > >$ cat /proc/acpi/thermal_zone/THM/*
>> > ><setting not supported>
>> > >cooling mode:   critical
>> > ><polling disabled>
>> > >state:                   ok
>> > >temperature:             47 C
>> > >critical (S5):           102 C
>> > >
>> > >How can I solve the problem then? It's very annoying.=20
>> >=20
>> >=20
>> > Can you watch the temperature as you see the frequency=20
>drop. Continuously (every second) cat cpufreq_max_freq in /sys=20
>and temperature in /proc as you run you load. My feeling is=20
>you will see the drop in max freq as your temperature goes to=20
>around 60 degrees or so.
>>=20
>> Here are the results:
>>=20
>> ................
>> 1600000 - 85 C
>> 1600000 - 84 C
>> 1600000 - 85 C
>> 1600000 - 76 C
>> 600000 - 76 C
>> 600000 - 71 C
>> 600000 - 70 C
>> 600000 - 69 C
>> ................
>>=20
>> It changed at 76 C.
>
>I forgot to mention that if I boot from battery scaling_max_freq is set
>to 600000 and I have to echo 1600000. At boot time temperature is not
>high so I'm not sure it's a thermal problem, or at least not only a
>thermal problem.=20
>

That looks like a different problem. It may be a policy being set by =
some userland daemon/startup script. Enable CPU_FREQ_DEBUG and boot with =
boot parameter cpufreq.debug=3D7 you should see when and why max_freq is =
changing. Infact for the other problem as well, get the messages from =
debug.

One other thing you can try is changing thermal_zone polling_frequency =
to 1 and see whether it change the behavior when you run the workload.

Thanks,
Venki
