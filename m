From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Sun, 14 Mar 2004 15:44:02 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040314144402.GA22268@dominikbrodowski.de>
References: <20040216213435.GA9680@dominikbrodowski.de>
	<20040225174326.GD1214@elf.ucw.cz>
	<20040216213435.GA9680@dominikbrodowski.de>
	<40313AA9.1060906@arenanetwork.com.br>
	<20040217090939.GA9935@dominikbrodowski.de>
	<403D4BD3.7050703@arenanetwork.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1132863196=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040225174326.GD1214@elf.ucw.cz>
	<403D4BD3.7050703@arenanetwork.com.br>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: dual_bereta_r0x <dual_bereta_r0x@arenanetwork.com.br>, Pavel Machek <pavel@ucw.cz>
Cc: cpufreq@www.linux.org.uk


--===============1132863196==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2004 at 01:28:51AM +0000, dual_bereta_r0x wrote:
> In x86 world, this info is wrong. The *multiplier* is locked inside=20
> processor (Intel P4) or by some "dips" on cpu core (AMD Athlon XP) --=20
> unless you have such as "enginering samples", with didn't have this lock=
=20
> --, but front-side-bus is changeable via MoBo BIOS.

Depends...

> Also, if you just=20
> add 0.5v in your CPU you can made it running faster than designed. The=20
> same applies to memory. That's why we bought DDR533 mems to run in=20
> DDR400 hardwares. We increase FSB and our mems could run with this new FS=
B.
>=20
> Again, showing *max* from manufacturer instead of *actual* speed is=20
> wrong. Even if the machine has or not capabilities to run with more/less=
=20
> power than it has designed for, is not up to the OS decide it. The OS=20
> should run or not,

The OS runs, the p4-clockmod driver runs, so that is besides the point here.

> but the user has chosen this path; it must only tell=20
> him what's *really* happening. "Your actual clock differs from=20
> manufacturer. Its *your* fault if any component fail or=20
> malfunctions/bugs arrives because of this."

The problem is that cpu_khz is partly unreliable, partly not available, so
there's no reliable way to detect _actual_ CPU speed for the p4-clockmod
driver. Also, there's the need to warn users about the lack of usefullness
of the p4-clockmod driver in the very most cases, and to avoid code
duplication the speedstep_detect function is used. Then we get the
_reliable_ detection of "specification speed", which is in most cases equal
to the "actual speed", almost for free.

On Wed, Feb 25, 2004 at 06:43:27PM +0100, Pavel Machek wrote:
> Hey, that's ugly. Values should be real.

Indeed. But if they're not known (and cpu_khz _is_ unreliable), what should
be done?

	Dominik

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVG+xZ8MDCHJbN8YRAu2zAJ41wUSU5pcVnrt8Bd5IDXSxSvloIwCeOTSq
oR6BTZcDtrYmP4AwJAtRjWU=
=+/mB
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--


--===============1132863196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1132863196==--

