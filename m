From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: 2.6.2: P4 ClockMod speed
Date: Mon, 16 Feb 2004 22:34:35 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040216213435.GA9680@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============89564230222142527=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: dual_bereta_r0x@arenanetwork.com.br
Cc: linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk


--===============89564230222142527==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline


--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I have a P4 2.4 running @ 3.12GHz.

So you overclock your CPU but then throttle it down... strange, but well...

> In 2.6.0, i could change it frequency=20
> via speedfreqd(8) up to its actual speed. Since 2.6.1, its max speed is=
=20
> locked on cpu *real* speed.

It's just a change of appearance -- the cpufreq driver uses the theoretical
speed of the CPU for its calculations; the actual CPU speed isn't
affected. You can verify this by looking at /proc/cpuinfo which still tells
3124.376 MHz.

By doing so it becomes easier to enter different frequencies e.g. into
/sys/devices/system/cpu/cpufreq/scaling_setspeed -- on my desktop, typing in
1200000 is easier than 12121224... [*]

	Dominik

[*] The _actual_ CPU speed should be used on all cpufreq drivers where this
specific CPU frequency has implications to external components, e.g. LCD,
memory or pcmcia devices. Where only the _frequency ratio_ is of importance
[for loops_per_jiffy and friends] such "rounding" is acceptable, as long as
the ratio is constant.

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAMTdrZ8MDCHJbN8YRAjj5AJwNSM9VrxY/PzeLmaO3k0DSs2vFsgCcDapC
rjFI9+GTF0Q6c3ug+ZhwBvg=
=YIjZ
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--


--===============89564230222142527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============89564230222142527==--

