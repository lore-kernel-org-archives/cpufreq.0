From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 10:26:04 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129092604.GB5591@dominikbrodowski.de>
References: <20040129051600.GA6087@visyz.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============88914933122003736=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040129051600.GA6087@visyz.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: visyz@visyz.net
Cc: cpufreq@www.linux.org.uk


--===============88914933122003736==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline


--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2004 at 12:16:00AM -0500, visyz@visyz.net wrote:
> So, I think I'm one of the 3 people in the world who have a Mobile
> Pentium III (Coppermine).

In contrast to your opinion Linux cpufreq support for Mobile Pentium III=20
Coppermines on 440BX/ZX/DX has received an enormeous amount of work,
especially from Bruno Ducrot and Hiroshi Miura. Also, one of the previous
cpufreq maintainers (me) owns a notebook which contains a Mobile Pentium III
Coppermine and a 440BX AGPset chipset...

> Heh. Yeah. anyways. I have an HP Omnibook 4150B, which amounts to the
> aforementioned coppermine (with speeds from 233-450mhz)

There is no SpeedStep-capable mobile Pentium III with a core frequency of 4=
50 MHz.
The "lowest" SpeedStep-capable is a 500MHz variant. See Intel Document
245306, revision 43, page 14.

However, it _might_ be that I miss something and this CPU is indeed
speedstep capable.

>, on a
> 440BX/ZX/DX bridge. I tried out the test program to see if it's usable,
> and while 1 bit did change, it was in GOP 0x0034, not 0x0038. Or maybe
> that's the other way around. Basically, the one that was supposed to
> change didn't, and the one that wasn't, did.

There is no one which is _supposed_ to change. It's just that GPO #0 is the
most _common_ to change. However, you really should try the speedstep-smi
module first.

> Are those in charge of the cpufreq development interested in getting the
> dump still, or have you moved on to bigger and better (tm) processors?

Even though I now own a wonderful centrino notebook, me and many others=20
still work on the various "earlier" speedstep drivers. So be a bit more=20
careful what you say, please.

	Dominik

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAGNGsZ8MDCHJbN8YRAg4nAJ9KwbN2+QY2ftufSp+KLGZTjfTd8gCgqvze
0vRll5ix8c66MIxrrqRYf0o=
=OFo9
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--


--===============88914933122003736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============88914933122003736==--

