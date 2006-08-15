From: Carlos Garcia Campos <carlosgc@gnome.org>
Subject: Re: cpufreq stops working after a while
Date: Tue, 15 Aug 2006 13:07:25 +0200
Message-ID: <1155640046.9205.12.camel@localhost.localdomain>
References: <44DCCB96.5080801@rtr.ca> <20060811114631.4a699667.akpm@osdl.org>
	<1155372733.7809.6.camel@skylla.slagter.name>
	<1155628140.4302.1079.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0967532660=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1155628140.4302.1079.camel@queen.suse.de>
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


--===============0967532660==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-RTb4r41XT0G0y40oLpnF"


--=-RTb4r41XT0G0y40oLpnF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El mar, 15-08-2006 a las 09:49 +0200, Thomas Renninger escribi=C3=B3:
> On Sat, 2006-08-12 at 10:52 +0200, Erik Slagter wrote:
> > On Fri, 11 Aug 2006 14:25:26 -0400 Mark Lord <lkml@rtr.ca> wrote:
> >=20
> > > One of my notebooks (Dell Latitude X1) has a 1.1GHz Pentium-M ULV pro=
cessor.
> > > This chip can change CPU speeds from 600 -> 800 -> 1100 Mhz.
> > >=20
> > > I use speedstep-centrino with it, and after boot all is usually okay.
> > > But after a few hours of operation, it stops shifting to the highest =
frequency
> > > even under continuous 100% load (or not).  Eventually it gets stuck a=
t 600Mhz
> > > and stays there until I reboot.

I have the same problem. My laptop is Dell Latitude D600 (Intel(R)
Pentium(R) M processor 1.60GHz). If I'm compiling something, for
example, that takes a long time, scaling_max_freq is set to 600000 (the
lowest). If I try to echo 1600000 to scaling_max_freq it do nothing.
Only after some time if the cpu load is not high I can echoing 1600000
again and it works without need to reboot.=20

> After a few hours, urgh.
>=20
> Dells limit their frequency to lowest after unplugging AC and allow all
> freqs after some time (some secs) again.
>=20
> There were two issues solved on the Dells some months ago:
>=20
> - The frequency after you unplug AC adapter is already reduced by BIOS,=20
>   that confused the cpufreq driver.
> - There was a race in sysfs writes. If you e.g. change governor or=20
>   possibly some other cpufreq related sysfs file while the frequency
>   got limited by BIOS, the real max freq value got overridden by the
>   temporarily limited max freq value and you are stuck to lowest freq
>   forever.
>=20
> Do you use any userspace daemon (cpuspeed, powersaved, ...) to control
> cpuspeed?

In my case I use conservative governor and kernel version is
2.6.18-rc4.=20

> If yes, you should first try without. It should be enough to:
> - load your hw cpufreq module
> - load the ondemand governor module
> - echo ondemand >/sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
>=20
> If it still happens we know at least it can't be some kind of sysfs race
> again or userspace tools do not remember the wrong max_freq value. Then
> some debug output or how to reproduce this a bit faster would be nice...

It happens to me every time I try to compile something that takes a long
time (evolution, mozilla, even kernel)

> Maybe with something like that:
> LOAD_FACTOR=3D40   # adjust this one to the power of your machine to let
>                  # cpufreq switch up and down, or if it does not switch=20
>                  # up and down in the beginning it should stay at
>                  # 800 (could be 5-20 on yours?),
>                  # check with (in separate console):
> # cd /sys/devices/system/cpu/cpu0/cpufreq/
> # watch -n1  cat scaling_cur_freq scaling_max_freq
>=20
> for ((x=3D200;x<1000;x+=3D5));do
>     # give load
>     for ((y=3D0;y<$LOAD_FACTOR;y++)); do
>         echo "10 k 2 v p" |dc >/dev/null
>     done;
>     # then sleep
>     usleep $((x*1000))   # maybe the right value here triggers the bug?
>     echo "sleep $x milli secs"
> done;
>=20
> Maybe it's triggered if you start some other process(es) while this is
> running?
>=20
>     Thomas
>=20
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq

--=20
Carlos Garcia Campos (KaL)
   elkalmail@yahoo.es
   carlosgc@gnome.org
   http://carlosgc.linups.org
PGP key: http://pgp.mit.edu:11371/pks/lookup?op=3Dget&search=3D0x523E6462

--=-RTb4r41XT0G0y40oLpnF
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Esta parte del mensaje =?ISO-8859-1?Q?est=E1?= firmada
	digitalmente

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBE4arsjxBOalI+ZGIRAsNMAJ4+Yz7a1m07EAhTFYRC6t0ekcDyfgCePlk7
Hqz1W+bLD+8fAd1B1KKiTls=
=JEc6
-----END PGP SIGNATURE-----

--=-RTb4r41XT0G0y40oLpnF--



--===============0967532660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0967532660==--


