From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Mon, 15 Mar 2004 14:59:27 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315135927.GA10259@dominikbrodowski.de>
References: <20040216213435.GA9680@dominikbrodowski.de>
	<20040225174326.GD1214@elf.ucw.cz>
	<20040216213435.GA9680@dominikbrodowski.de>
	<40313AA9.1060906@arenanetwork.com.br>
	<20040217090939.GA9935@dominikbrodowski.de>
	<403D4BD3.7050703@arenanetwork.com.br>
	<20040314144402.GA22268@dominikbrodowski.de>
	<20040314212303.GA1010@elf.ucw.cz>
	<20040315092639.GD14911@dominikbrodowski.de>
	<20040315124406.GB29260@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1506559860=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040315124406.GB29260@atrey.karlin.mff.cuni.cz>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Pavel Machek <pavel@ucw.cz>
Cc: dual_bereta_r0x <dual_bereta_r0x@arenanetwork.com.br>, cpufreq@www.linux.org.uk


--===============1506559860==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2004 at 01:44:06PM +0100, Pavel Machek wrote:
> > On Sun, Mar 14, 2004 at 10:23:04PM +0100, Pavel Machek wrote:
> > > Hi!
> > >=20
> > > > > Hey, that's ugly. Values should be real.
> > > >=20
> > > > Indeed. But if they're not known (and cpu_khz _is_ unreliable), wha=
t should
> > > > be done?
> > >=20
> > > Is it possible to measure cpu_khz with arbitrary precision if we make
> > > measurement slower? I think so; if cpu_khz is too unreliable, perhaps
> > > we can make measurement slower but more precise?
> >=20
> > cpu_khz may be zero if the PIT is used as primary time source.
>=20
> But that's a bug to be fixed, right?

Not necessarily: if the PIT is used and the TSC is disabled [there are some=
 such
systems, even modern ones...], you can't use the current cpu_khz detection
routine. And please don't try to deduce it from BogoMIPS...

	Dominik

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVba/Z8MDCHJbN8YRAuhLAJ92OIbZ2gNUeX+Z8Ms9QuFXvLH4rQCfWsJX
VNMsFQbI1t+EiJEoOJEVS8s=
=etat
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--


--===============1506559860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1506559860==--

