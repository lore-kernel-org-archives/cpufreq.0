From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Mon, 15 Mar 2004 10:26:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040315092639.GD14911@dominikbrodowski.de>
References: <20040216213435.GA9680@dominikbrodowski.de>
	<20040225174326.GD1214@elf.ucw.cz>
	<20040216213435.GA9680@dominikbrodowski.de>
	<40313AA9.1060906@arenanetwork.com.br>
	<20040217090939.GA9935@dominikbrodowski.de>
	<403D4BD3.7050703@arenanetwork.com.br>
	<20040314144402.GA22268@dominikbrodowski.de>
	<20040314212303.GA1010@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1069461988=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040314212303.GA1010@elf.ucw.cz>
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


--===============1069461988==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 14, 2004 at 10:23:04PM +0100, Pavel Machek wrote:
> Hi!
>=20
> > > Hey, that's ugly. Values should be real.
> >=20
> > Indeed. But if they're not known (and cpu_khz _is_ unreliable), what sh=
ould
> > be done?
>=20
> Is it possible to measure cpu_khz with arbitrary precision if we make
> measurement slower? I think so; if cpu_khz is too unreliable, perhaps
> we can make measurement slower but more precise?

cpu_khz may be zero if the PIT is used as primary time source.

	Dominik

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVXbPZ8MDCHJbN8YRAlegAJ0WfJyA4IymgM0txdc4k9bKJOzvfACfd26q
JvUVbVbMRm6bPHAd+uUJGZ8=
=cRBR
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--


--===============1069461988==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1069461988==--

