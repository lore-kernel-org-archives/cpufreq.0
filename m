From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: speedstep capability checks
Date: Tue, 16 Mar 2004 16:58:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040316155839.GA7322@dominikbrodowski.de>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315210950.GC15243@redhat.com>
	<20040316073847.GA7597@dominikbrodowski.de>
	<20040316130114.GA13713@redhat.com>
	<20040316150148.GG28592@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0074032640=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040316150148.GG28592@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: Dave Jones <davej@redhat.com>, Arjan van de Ven <arjanv@redhat.com>, aeriksson@fastmail.fm, cpufreq@www.linux.org.uk


--===============0074032640==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2004 at 04:01:48PM +0100, Bruno Ducrot wrote:
> On Tue, Mar 16, 2004 at 01:01:14PM +0000, Dave Jones wrote:
> > On Tue, Mar 16, 2004 at 08:38:47AM +0100, Dominik Brodowski wrote:
> >=20
> >  > So, Anders' CPU reports itself to be non-SpeedStep-capable. However,
> >  > SpeedStep runs fine on his CPU. We can't enable SpeedStep on all CPU=
s [even
> >  > of the same stepping (model/brand are the same anyway)] as we don't =
know if
> >  > all of them work fine if running SpeedStep on them -- or if it causes
> >  > (permanent) hardware failure! Some, who know it works from running a
> >  > different OS, and possibly a specific vendor-provided driver on their
> >  > notebook, might want to skip this test and try out their luck. But t=
hen they
> >  > know what they're doing, and that they're risking their own hardware.
> >=20
> > We've already seen quite a few confused users who thought that throttli=
ng =3D=3D speedstep.
> > This sounds like handing someone a gun and saying 'point it at your hea=
d,
> > pull the trigger, it might miss'.
> >=20
> >  > A few SpeedStep-capable systems don't perform according to specifica=
tion: the
> >  > CPUID and/or some MSRs don't tell us the CPU is SpeedStep capable ev=
en though
> >  > it definitely is.
> >=20
> > Is there nothing in the errata documents about this ?
>=20
> There is nothing in any data sheets for the check anyway, other than
> it's not possible to distinguish a PIII (coppermine) with Speedstep
> technology from one without Speedstep technology.  There is nothing
> in any spec update I'm aware.
>=20
> There is only one solution from technical support from intel at
> http://www.intel.com/support/processors/cs-003779-prd24.html

This should read

http://www.intel.com/support/processors/sb/cs-003779-prd24.htm

AFAIK.

	Dominik

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVyQvZ8MDCHJbN8YRAoclAJ9U+yunrviL6E8CmlLI8BCZU30SxACfUndO
5q1eejngjRCIyyuxw6/T6ZU=
=skgm
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--


--===============0074032640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0074032640==--

