From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sun, 11 Jan 2004 21:06:18 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111200617.GA25713@dominikbrodowski.de>
References: <20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
	<20040111173547.GB5485@dominikbrodowski.de>
	<20040111195619.GA25048@grep.be>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============44678247972321161=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <20040111195619.GA25048@grep.be>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: Wouter Verhelst <wouter@grep.be>
Cc: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk


--===============44678247972321161==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2004 at 08:56:19PM +0100, Wouter Verhelst wrote:
> On Sun, Jan 11, 2004 at 06:35:47PM +0100, Dominik Brodowski wrote:
> > On Sat, Jan 10, 2004 at 08:35:26PM +0100, Wouter Verhelst wrote:
> > > That happens both when it's in P0 or P1.
> >=20
> > So ACPI works to set the processor in P0 and P1?
>=20
> Yes.

Excellent.
>=20
> > If so, you really really should use the ACPI cpufreq driver instead of
> > the p4-clockmod driver. The former will offer you true "SpeedStep"
> > support, the latter only some clock modulation which won't save you
> > much energy as ACPI supports the C2 idle state anyway.=20
>=20
> Ah, so what p4-clockmod does is not SpeedStep?
>=20
> Hm. That sucks.

No. p4-clockmod stops the CPU for certain short periods of time, it
"modulates" the CPU frequency.=20

------------------> time  axis

x x x x x x x x x   normal clock ticks
x x x x - - - - x   50 % frequency modulation [ACPI T-States or P4-clockmod]
x  x  x  x  x  x    frequency scaling     [ACPI P-States]

Only if the frequency is scaled, the voltage can be scaled also. So only
that offers the best reduction of energy usage. For details, check the
cpufreq archives for a lengthy thread with many calculations...

> > > Not that it matters -- p4-clockmod seems to do it right :)
> >=20
> > It's not as noisy, indeed. But it's not right -- as long as acpi.ko wor=
ks.
>=20
> It mostly does, although I've had lockups when using the /proc interface
> to switch CPU frequencies -- yes, should've reported that, but I only
> now remember :)

The /proc/ interface is deprecated, and the acpi module is full of errors
[I'm working on it, though...]. You should use the /sys-fs interface with
the acpi.ko module as well.

> That does not change.

Very strange... I'm out of ideas for the moment being.

	Dominik

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAAay5Z8MDCHJbN8YRAho5AKCDDZh8RdJts9Cab4d3DHu+GiO+bgCfULwD
4/5LqBZHowP/jwiRRTLq3/s=
=gbkE
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--


--===============44678247972321161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============44678247972321161==--

