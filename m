From: Carlos Garcia Campos <carlosgc@gnome.org>
Subject: RE: cpufreq stops working after a while
Date: Wed, 16 Aug 2006 20:19:03 +0200
Message-ID: <1155752344.3554.4.camel@localhost.localdomain>
References: <EB12A50964762B4D8111D55B764A8454741E13@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1773246237=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454741E13@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk


--===============1773246237==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-gehp0zVW1V5OhO/9huJg"


--=-gehp0zVW1V5OhO/9huJg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El mi=C3=A9, 16-08-2006 a las 06:27 -0700, Pallipadi, Venkatesh escribi=C3=
=B3:
> =20
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk=20
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
> >Carlos Garcia Campos
> >Sent: Wednesday, August 16, 2006 3:11 AM
> >To: cpufreq@lists.linux.org.uk
> >Subject: RE: cpufreq stops working after a while
> >
> >El mar, 15-08-2006 a las 19:46 +0200, Carlos Garcia Campos escribi=C3=B3=
:
> >> El mar, 15-08-2006 a las 08:23 -0700, Pallipadi, Venkatesh escribi=C3=
=B3:
> >> > =20
> >> >=20
> >> > Can you confirm the latest version of the kernel where the=20
> >problem was not there. That will help on narrowing this down.
> >>=20
> >> I'm not sure at all . . . I don't have any kernel < 2.6.17 compiled
> >> right now.
> >>=20
> >> > >> It is not a bug in cpufreq. Just that due to cpu load,=20
> >> > >system is getting heated up and platform decides to reduce the=20
> >> > >temperature using passive cooling and as a result reduces the=20
> >> > >frequency. Does your system have active cooling (fans) or does=20
> >> > >it allow only passive cooling? You can monitor the temperature=20
> >> > >by looking at stuff under /proc/acpi/termal_zone/*/*.
> >> > >
> >> > >Yes, my system has fans. Here is the contents of the files
> >> > >under /proc/acpi/termal_zone/*/*, if it helps:
> >> > >
> >> > >$ cat /proc/acpi/thermal_zone/THM/*
> >> > ><setting not supported>
> >> > >cooling mode:   critical
> >> > ><polling disabled>
> >> > >state:                   ok
> >> > >temperature:             47 C
> >> > >critical (S5):           102 C
> >> > >
> >> > >How can I solve the problem then? It's very annoying.=20
> >> >=20
> >> >=20
> >> > Can you watch the temperature as you see the frequency=20
> >drop. Continuously (every second) cat cpufreq_max_freq in /sys=20
> >and temperature in /proc as you run you load. My feeling is=20
> >you will see the drop in max freq as your temperature goes to=20
> >around 60 degrees or so.
> >>=20
> >> Here are the results:
> >>=20
> >> ................
> >> 1600000 - 85 C
> >> 1600000 - 84 C
> >> 1600000 - 85 C
> >> 1600000 - 76 C
> >> 600000 - 76 C
> >> 600000 - 71 C
> >> 600000 - 70 C
> >> 600000 - 69 C
> >> ................
> >>=20
> >> It changed at 76 C.
> >
> >I forgot to mention that if I boot from battery scaling_max_freq is set
> >to 600000 and I have to echo 1600000. At boot time temperature is not
> >high so I'm not sure it's a thermal problem, or at least not only a
> >thermal problem.=20
> >
>=20
> That looks like a different problem. It may be a policy being set by some=
 userland daemon/startup script. Enable CPU_FREQ_DEBUG and boot with boot p=
arameter cpufreq.debug=3D7 you should see when and why max_freq is changing=
. Infact for the other problem as well, get the messages from debug.

I have a script in /etc/init.d to set conservative governor at startup.=20

> One other thing you can try is changing thermal_zone polling_frequency to=
 1 and see whether it change the behavior when you run the workload.

I tried it, but it didn't work.=20

Here is what I got from debug messages:=20

1.- scaling_max_freq is set to 600000

speedstep-centrino: target=3D1520000kHz old=3D1600000 new=3D1400000 msr=3D0=
e24
cpufreq-core: notification 0 of frequency transition to 1400000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1400000 kHz
cpufreq-core: notification 1 of frequency transition to 1400000 kHz
cpufreq-core: scaling loops_per_jiffy to 1395912 for frequency 1400000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1400000 kHz
cpufreq-core: target for CPU 0: 1440000 kHz, relation 1
printk: 42 messages suppressed.
cpufreq-core: updating policy for CPU 0
cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing core t=
hinks of 1600000, is 600000 kHz.
cpufreq-core: notification 0 of frequency transition to 600000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
cpufreq-core: notification 1 of frequency transition to 600000 kHz
cpufreq-core: scaling loops_per_jiffy to 598248 for frequency 600000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 600000 kHz
cpufreq-core: setting new policy for CPU 0: 600000 - 1600000 kHz
freq-table: request for verification of policy (600000 - 1600000 kHz) for c=
pu 0
freq-table: verification lead to (600000 - 1600000 kHz) for cpu 0
freq-table: request for verification of policy (600000 - 600000 kHz) for cp=
u 0
freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 600000 - 600000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 600000 kHz, relation 1
freq-table: request for target 600000 kHz (relation: 1) for cpu 0

2.- I can set 1600000 again and it works

cpufreq-core: updating policy for CPU 0
cpufreq-core: Warning: CPU frequency out of sync: cpufreq and timing core t=
hinks of 600000, is 1600000 kHz.
cpufreq-core: notification 0 of frequency transition to 1600000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1600000 kHz
cpufreq-core: scaling loops_per_jiffy to 1595328 for frequency 1600000 kHz
cpufreq-core: notification 1 of frequency transition to 1600000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1600000 kHz
cpufreq-core: setting new policy for CPU 0: 600000 - 600000 kHz
freq-table: request for verification of policy (600000 - 600000 kHz) for cp=
u 0
freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
freq-table: request for verification of policy (600000 - 600000 kHz) for cp=
u 0
freq-table: verification lead to (600000 - 600000 kHz) for cpu 0
cpufreq-core: new min and max freqs are 600000 - 600000 kHz
cpufreq-core: governor: change or update limits
cpufreq-core: __cpufreq_governor for CPU 0, event 3
cpufreq-core: target for CPU 0: 600000 kHz, relation 1
freq-table: request for target 600000 kHz (relation: 1) for cpu 0
freq-table: target is 7 (600000 kHz, 1554)
speedstep-centrino: target=3D600000kHz old=3D1600000 new=3D600000 msr=3D061=
2

I hope it helps to catch the problem.=20

> Thanks,
> Venki
>=20

Thanks,
--=20
Carlos Garcia Campos (KaL)
   elkalmail@yahoo.es
   carlosgc@gnome.org
   http://carlosgc.linups.org
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0x523E6462

--=-gehp0zVW1V5OhO/9huJg
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBE42GXjxBOalI+ZGIRAkDKAJ46QNkhPhGbPjHb0DSXwsRjNYTeGACdEQRv
f2bAvKGi1tUU+0xh0d6+knk=
=N318
-----END PGP SIGNATURE-----

--=-gehp0zVW1V5OhO/9huJg--



--===============1773246237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1773246237==--


