From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpu won't stay in powersave mode
Date: Fri, 19 Dec 2003 17:15:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031219161550.GA6909@dominikbrodowski.de>
References: <1071501484.21334.1.camel@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============46458378085722329=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <1071501484.21334.1.camel@localhost>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Tom Bruno <crweb@vwords.com>
Cc: cpufreq@www.linux.org.uk


--===============46458378085722329==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2003 at 03:18:04PM +0000, Tom Bruno wrote:
> Sorry, accendtly hit reply instead of send to list.
>=20
> On Mon, 2003-12-15 at 14:14, Thomas Renninger wrote:
> > Tom Bruno wrote:
> >=20
> > >Like i said above if I change it via hand using echo, /proc/cpuinfo
> is
> > >correct, and the cputest reports the correct speed constantly.
> > >
> > >performance mode: 2.4ghz
> > >powersave mode: 1.2ghz
> > >Intel P4-M 2.4ghz
> > >Dell Inspiron 8500 - Bios A05
> > >kernel-2.6.0-test11
> > > =20
> > >
> > /proc/cpu_info didn't work for me, too.
> > However it seems to work now(after I changed the governors to be=20
> > compiled as modules(or the way around?)).
> >=20
> I've now tried both as modules, and compiled in, /proc/cpuinfo works
> niether report correctly.
>=20
> > If you want to detemine the current real speed of your machine use the
> > procspeed prog I posted some days ago(04.12, 09.12).
>=20
> yes, that is the program i spoke of.  However, like i said, when
> /proc/cpuinfo is reporting wrong, my system works it's way back to full
> speed even though powersave is in the /sys scaling_governor.
>=20
> It will report the changed speed (clockdown to 1.2ghz) for about 10
> seconds, and then will start to report again at 2.4ghz even though the
> setting haddn't changed.

I think the BIOS is meddling with the speedstep setting [this is more
common for older systems, but obviously some vendors still think it's a good
idea] . If it were cpufreq, the value in /proc/cpuinfo would be updated as
well.

Do you run an ACPI-enabled kernel?=20

	Dominik

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/4yQ1Z8MDCHJbN8YRAkFkAKCFwEMBhAo99r1EWBu9Ha0gOA/FyQCgikHD
uZq5j3QuasNR8Kvz5o4UHBI=
=3+Pz
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--


--===============46458378085722329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============46458378085722329==--

