From: Carlos Garcia Campos <carlosgc@gnome.org>
Subject: RE: cpufreq stops working after a while
Date: Tue, 15 Aug 2006 17:07:42 +0200
Message-ID: <1155654463.12437.6.camel@localhost.localdomain>
References: <EB12A50964762B4D8111D55B764A84546F986C@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0996641216=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84546F986C@scsmsx413.amr.corp.intel.com>
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


--===============0996641216==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-4GLoBZfFDEKleCPXDLsU"


--=-4GLoBZfFDEKleCPXDLsU
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El mar, 15-08-2006 a las 06:27 -0700, Pallipadi, Venkatesh escribi=C3=B3:
> =20
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk=20
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
> >Carlos Garcia Campos
> >Sent: Tuesday, August 15, 2006 4:07 AM
> >To: cpufreq@lists.linux.org.uk
> >Subject: Re: cpufreq stops working after a while
> >
> >El mar, 15-08-2006 a las 09:49 +0200, Thomas Renninger escribi=C3=B3:
> >> On Sat, 2006-08-12 at 10:52 +0200, Erik Slagter wrote:
> >> > On Fri, 11 Aug 2006 14:25:26 -0400 Mark Lord <lkml@rtr.ca> wrote:
> >> >=20
> >> > > One of my notebooks (Dell Latitude X1) has a 1.1GHz=20
> >Pentium-M ULV processor.
> >> > > This chip can change CPU speeds from 600 -> 800 -> 1100 Mhz.
> >> > >=20
> >> > > I use speedstep-centrino with it, and after boot all is=20
> >usually okay.
> >> > > But after a few hours of operation, it stops shifting to=20
> >the highest frequency
> >> > > even under continuous 100% load (or not).  Eventually it=20
> >gets stuck at 600Mhz
> >> > > and stays there until I reboot.
> >
> >I have the same problem. My laptop is Dell Latitude D600 (Intel(R)
> >Pentium(R) M processor 1.60GHz). If I'm compiling something, for
> >example, that takes a long time, scaling_max_freq is set to 600000 (the
> >lowest). If I try to echo 1600000 to scaling_max_freq it do nothing.
> >Only after some time if the cpu load is not high I can echoing 1600000
> >again and it works without need to reboot.=20
> >
>=20
> Looks like you have the same problem that Mark had in this original threa=
d. Thermal.

It never happened with older kernels (< 2.6.17, I think)

> It is not a bug in cpufreq. Just that due to cpu load, system is getting =
heated up and platform decides to reduce the temperature using passive cool=
ing and as a result reduces the frequency. Does your system have active coo=
ling (fans) or does it allow only passive cooling? You can monitor the temp=
erature by looking at stuff under /proc/acpi/termal_zone/*/*.

Yes, my system has fans. Here is the contents of the files
under /proc/acpi/termal_zone/*/*, if it helps:

$ cat /proc/acpi/thermal_zone/THM/*
<setting not supported>
cooling mode:   critical
<polling disabled>
state:                   ok
temperature:             47 C
critical (S5):           102 C

How can I solve the problem then? It's very annoying.=20

> Thanks,
> Venki
>=20

Thanks a lot,=20
--=20
Carlos Garcia Campos (KaL)
   elkalmail@yahoo.es
   carlosgc@gnome.org
   http://carlosgc.linups.org
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0x523E6462

--=-4GLoBZfFDEKleCPXDLsU
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBE4eM+jxBOalI+ZGIRAuwfAKCFTg4ZLUF2iwVeRWmJyD/ssNuEfwCfZqlf
mZ+P9kCompf0Uz66q4oFvg8=
=qOR+
-----END PGP SIGNATURE-----

--=-4GLoBZfFDEKleCPXDLsU--



--===============0996641216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0996641216==--


