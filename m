From: Tom Bruno <crweb@vwords.com>
Subject: Re: cpu won't stay in powersave mode
Date: Sat, 20 Dec 2003 17:21:13 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1071940873.15296.7.camel@localhost>
References: <1071501484.21334.1.camel@localhost>
	<20031219161550.GA6909@dominikbrodowski.de>
Reply-To: crweb@vwords.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============23997723308262842=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20031219161550.GA6909@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@www.linux.org.uk


--===============23997723308262842==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-d3hQSgfKXcERbXxsSLDq"


--=-d3hQSgfKXcERbXxsSLDq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-12-19 at 16:15, Dominik Brodowski wrote:
> On Mon, Dec 15, 2003 at 03:18:04PM +0000, Tom Bruno wrote:
> > Sorry, accendtly hit reply instead of send to list.
> >=20
> > On Mon, 2003-12-15 at 14:14, Thomas Renninger wrote:
> > > Tom Bruno wrote:
> > >=20
> > > >Like i said above if I change it via hand using echo, /proc/cpuinfo
> > is
> > > >correct, and the cputest reports the correct speed constantly.
> > > >
> > > >performance mode: 2.4ghz
> > > >powersave mode: 1.2ghz
> > > >Intel P4-M 2.4ghz
> > > >Dell Inspiron 8500 - Bios A05
> > > >kernel-2.6.0-test11
> > > > =20
> > > >
> > > /proc/cpu_info didn't work for me, too.
> > > However it seems to work now(after I changed the governors to be=20
> > > compiled as modules(or the way around?)).
> > >=20
> > I've now tried both as modules, and compiled in, /proc/cpuinfo works
> > niether report correctly.
> >=20
> > > If you want to detemine the current real speed of your machine use th=
e
> > > procspeed prog I posted some days ago(04.12, 09.12).
> >=20
> > yes, that is the program i spoke of.  However, like i said, when
> > /proc/cpuinfo is reporting wrong, my system works it's way back to full
> > speed even though powersave is in the /sys scaling_governor.
> >=20
> > It will report the changed speed (clockdown to 1.2ghz) for about 10
> > seconds, and then will start to report again at 2.4ghz even though the
> > setting haddn't changed.
>=20
> I think the BIOS is meddling with the speedstep setting [this is more
> common for older systems, but obviously some vendors still think it's a g=
ood
> idea] . If it were cpufreq, the value in /proc/cpuinfo would be updated a=
s
> well.
>=20
> Do you run an ACPI-enabled kernel?=20
>=20
> 	Dominik

  Yes, I have acpi enabled, and to the best of my knowledge, it is
functioning correclty, at least "externally"  /proc/acpi/events works
and returns events and stuff.  Don't know about non visiable internals
though.

New stats:
Dell Inspiron 8500
Bios: A05
Cpu:  Pentium-M 2.4ghz
Gentoo Linux
Kernel: 2.4.23, 2.6.0=20


--=-d3hQSgfKXcERbXxsSLDq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/5IUICVsg1UpxmOwRAt9SAJ4mDABxKdPLptcPA7tlHi7e0yok/ACfdDy7
ZP2zIKFh0jjWMGOT1vWd208=
=gCi+
-----END PGP SIGNATURE-----

--=-d3hQSgfKXcERbXxsSLDq--



--===============23997723308262842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============23997723308262842==--


