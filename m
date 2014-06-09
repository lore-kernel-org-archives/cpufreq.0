From: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH 1/2] longhaul: Mark it as dangerous in Kconfig
Date: Mon, 09 Jun 2014 01:30:51 +0100
Message-ID: <1402273851.23860.68.camel@deadeye.wl.decadent.org.uk>
References: <1402269642.23860.48.camel@deadeye.wl.decadent.org.uk>
	 <20140609000205.GA15035@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-UUW4jDMqXIdLr4hj3J8D"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20140609000205.GA15035@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org, =?UTF-8?Q?Rafa=C5=82?= Bilski <rafalbilski@interia.pl>


--=-UUW4jDMqXIdLr4hj3J8D
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2014-06-08 at 20:02 -0400, Dave Jones wrote:
> On Mon, Jun 09, 2014 at 12:20:42AM +0100, Ben Hutchings wrote:
>  > longhaul quickly caused hard lockups and possibly killed the memory
>  > module on my EPIA-PD board.  It is commented as:
>  >=20
>  > 'BIG FAT DISCLAIMER: Work in progress code. Possibly *dangerous*'
>=20
> that last part may have been overly dramatic. When I was originally
> writing this driver I was using pre-production cpu's which were
> marginal to begin with. Production hw should have been more tolerant.
> What didn't help was a lot of the EPIAs were made with *Really*
> shitty capacitors that would pop open and ooze over the boards. Might wan=
t
> to eyeball those, you can usually tell when they've gone bad.

I threw the board out last year, but didn't notice any such damage.  The
failure occurred *immediately* after I loaded the driver (when
auto-loading was enabled), while the board had been stable for several
years up to that point.  And the board started working again after I
replaced the memory module and prevented the driver from loading.  Of
course, it *could* just be coincidence that the memory went bad then.  I
didn't feel like testing that!

Activation of the driver is now guarded by a module parameter, so even
with auto-loading enabled it doesn't do any damage by default.

Ben.

>  > Let's put another warning where people are more likely to see it.
>=20
> That said, I'm not against itbeing marked BROKEN (I thought it
> already was), and certainly don't recommend distros enabling it.
>=20
> I'd also not stand in the way of someone throwing it out completely
> given the small amount of systems out there likely still running this.
>=20
> 	Dave
>=20

--=20
Ben Hutchings
One of the nice things about standards is that there are so many of them.

--=-UUW4jDMqXIdLr4hj3J8D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIVAwUAU5UAQOe/yOyVhhEJAQo2Pw/9Hveh+ghOPGGGXsstC4ZZS4TXKrkEHMHF
504xrVKlF9YUFNpdxUETnORDtl9ygwrbUm+/kJyRjEYVJDoP5h2SkpTc23jdwvbX
cYjiPulJfjNzzD9Quof8vrHAYNBKtbhZsyJ/B7njifux/pxP3Gv6vqdVmy2kkvLV
GfGxszc7dXd8NnlVTzz01g+8bhdj7XQf4ZeRK07q0NdVMGSg8D1S9TlYxaudZ5Hk
h8GXkrtr/daMKyT0+xLgZg+Oh++mhR2EVpFLXyVfCQbYUrA0M71TVWBK7FdCKhHb
ZyceB78aoSLIS4wyVGS/DfZozOjH10H6oSqzOUizXL9p80arsqPazgPP7ss5jr24
MRTn1HPaoysmlwgrdHQmBO9osP02oZkmixqKve0I7LdgBVOcNJDIGzG+aHpilqNR
glLX/5q5V1FBoVB1UrZrjQu3CD3xbPtbAwHcVp+O37oEx21ad9QMUHR/XWEUvL7w
g7t5Taw2t47aRcJCsAxsI+KhfzPNM67B3kASqRUa9mGTRvqFsHi9kU7aOejaaFS0
jiQgNccXF00Vky9wDaTBS3a6Dq7IlpFxnH8G6AtkL73cBlw2vVoyr880YwSH6g5m
oVCVA6dAWQRYbblRusOVhmdJ2/3h1DXE59G2BS/+9e485/DtdybI1ZztHWZHiWiJ
dj+USsqUtO8=
=LmBS
-----END PGP SIGNATURE-----

--=-UUW4jDMqXIdLr4hj3J8D--
