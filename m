From: Carlos Garcia Campos <carlosgc@gnome.org>
Subject: RE: cpufreq stops working after a while
Date: Wed, 16 Aug 2006 12:10:50 +0200
Message-ID: <1155723051.13086.3.camel@localhost.localdomain>
References: <EB12A50964762B4D8111D55B764A84546F98E5@scsmsx413.amr.corp.intel.com>
	<1155664002.12437.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1097178964=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1155664002.12437.11.camel@localhost.localdomain>
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
To: cpufreq@lists.linux.org.uk


--===============1097178964==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-rxHQaEvILqnC9AAShr+U"


--=-rxHQaEvILqnC9AAShr+U
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El mar, 15-08-2006 a las 19:46 +0200, Carlos Garcia Campos escribi=C3=B3:
> El mar, 15-08-2006 a las 08:23 -0700, Pallipadi, Venkatesh escribi=C3=B3:
> > =20
> > >-----Original Message-----
> > >From: Carlos Garcia Campos [mailto:carlosgc@gnome.org]=20
> > >Sent: Tuesday, August 15, 2006 8:08 AM
> > >To: Pallipadi, Venkatesh
> > >Cc: cpufreq@lists.linux.org.uk
> > >Subject: RE: cpufreq stops working after a while
> > >
> > >El mar, 15-08-2006 a las 06:27 -0700, Pallipadi, Venkatesh escribi=C3=
=B3:
> > >> =20
> > >> >-----Original Message-----
> > >> >From: cpufreq-bounces@lists.linux.org.uk=20
> > >> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
> > >> >Carlos Garcia Campos
> > >> >Sent: Tuesday, August 15, 2006 4:07 AM
> > >> >To: cpufreq@lists.linux.org.uk
> > >> >Subject: Re: cpufreq stops working after a while
> > >> >
> > >> >
> > >> >I have the same problem. My laptop is Dell Latitude D600 (Intel(R)
> > >> >Pentium(R) M processor 1.60GHz). If I'm compiling something, for
> > >> >example, that takes a long time, scaling_max_freq is set to=20
> > >600000 (the
> > >> >lowest). If I try to echo 1600000 to scaling_max_freq it do nothing=
.
> > >> >Only after some time if the cpu load is not high I can=20
> > >echoing 1600000
> > >> >again and it works without need to reboot.=20
> > >> >
> > >>=20
> > >> Looks like you have the same problem that Mark had in this=20
> > >original thread. Thermal.
> > >
> > >It never happened with older kernels (< 2.6.17, I think)
> > >
> >=20
> > Can you confirm the latest version of the kernel where the problem was =
not there. That will help on narrowing this down.
>=20
> I'm not sure at all . . . I don't have any kernel < 2.6.17 compiled
> right now.
>=20
> > >> It is not a bug in cpufreq. Just that due to cpu load,=20
> > >system is getting heated up and platform decides to reduce the=20
> > >temperature using passive cooling and as a result reduces the=20
> > >frequency. Does your system have active cooling (fans) or does=20
> > >it allow only passive cooling? You can monitor the temperature=20
> > >by looking at stuff under /proc/acpi/termal_zone/*/*.
> > >
> > >Yes, my system has fans. Here is the contents of the files
> > >under /proc/acpi/termal_zone/*/*, if it helps:
> > >
> > >$ cat /proc/acpi/thermal_zone/THM/*
> > ><setting not supported>
> > >cooling mode:   critical
> > ><polling disabled>
> > >state:                   ok
> > >temperature:             47 C
> > >critical (S5):           102 C
> > >
> > >How can I solve the problem then? It's very annoying.=20
> >=20
> >=20
> > Can you watch the temperature as you see the frequency drop. Continuous=
ly (every second) cat cpufreq_max_freq in /sys and temperature in /proc as =
you run you load. My feeling is you will see the drop in max freq as your t=
emperature goes to around 60 degrees or so.
>=20
> Here are the results:
>=20
> ................
> 1600000 - 85 C
> 1600000 - 84 C
> 1600000 - 85 C
> 1600000 - 76 C
> 600000 - 76 C
> 600000 - 71 C
> 600000 - 70 C
> 600000 - 69 C
> ................
>=20
> It changed at 76 C.

I forgot to mention that if I boot from battery scaling_max_freq is set
to 600000 and I have to echo 1600000. At boot time temperature is not
high so I'm not sure it's a thermal problem, or at least not only a
thermal problem.=20

> >=20
> > Thanks,
> > Venki
> >=20

Thanks a lot for your help,
--=20
Carlos Garcia Campos (KaL)
   elkalmail@yahoo.es
   carlosgc@gnome.org
   http://carlosgc.linups.org
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0x523E6462

--=-rxHQaEvILqnC9AAShr+U
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBE4u8qjxBOalI+ZGIRAtH2AJ0dfd9xO5vuisu/e/8sCxNQKJqWLACePS5M
6sG+rVcKAscAvzPkxabKZrk=
=m/ql
-----END PGP SIGNATURE-----

--=-rxHQaEvILqnC9AAShr+U--



--===============1097178964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1097178964==--


