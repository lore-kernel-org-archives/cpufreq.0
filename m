From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Pentium-M minimum clock-freq
Date: Fri, 2 Apr 2004 18:44:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040402164459.GB7034@dominikbrodowski.de>
References: <200404021824.10912.steffen-hein@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1883912095=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200404021824.10912.steffen-hein@gmx.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Steffen Hein <steffen-hein@gmx.de>
Cc: cpufreq@www.linux.org.uk


--===============1883912095==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2004 at 06:24:10PM +0200, Steffen Hein wrote:
> I'm currently using Kernel 2.6.4 with a 1.5ghz Pentium-M and the lowest=
=20
> frequency supported seems to be around 500mhz. However, under Win$ with=
=20
> current speedstep-drivers installed, it goes as low as 98mhz (with some s=
teps=20
> in-between).
>=20
> Is there any reason, why these frequencies aren't supported by the curren=
t=20
> speedstep-driver?

'cause the other OS's behaviour is broken, IMHO. It (also) "sells" you=20
throttling as "speedstep": Throttling means the processor is stopped for=20
short times. As long as your processor supports at least the C2 idle state,=
=20
the system will even consume more energy for any given task if you throttle=
=20
the CPU. So I think it's a bad idea. Actual speedstep states for the 1.5ghz=
=20
Pentium-M are 600, 800, 1000, 1200, 1400 and 1500 MHz.

> Will they be supported in future?

Maybe -- if multiple cpufreq drivers can be loaded and be running at the
same time, it'd be possible. I'm not yet sure whether this is a good idea,
though.

	Dominik

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAbZiLZ8MDCHJbN8YRArjWAKCfB1eFKsH3hbIQxEvE9VMpskYD2gCdE2VQ
ddKFPfgFDnsMoeo3IZnNnRA=
=Jx3M
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--


--===============1883912095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1883912095==--

