From: Toralf =?iso-8859-1?q?F=F6rster?= <toralf.foerster@gmx.de>
Subject: Re: cpu governor ondemand issue
Date: Mon, 29 Oct 2007 17:42:35 +0100
Message-ID: <200710291742.37654.toralf.foerster@gmx.de>
References: <200710211316.14955.toralf.foerster@gmx.de> <20071029000243.9101d363.akpm@linux-foundation.org> <20071029072129.653fe170@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1944123.y5LQddcG0I";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758615AbXJ2Qmu@vger.kernel.org>
In-Reply-To: <20071029072129.653fe170@laptopd505.fenrus.org>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
To: Arjan van de Ven <arjan@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, cpufreq@www.linux.org.uk

--nextPart1944123.y5LQddcG0I
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Montag, 29. Oktober 2007 schrieb Arjan van de Ven:
> On Mon, 29 Oct 2007 00:02:43 -0700
> Andrew Morton <akpm@linux-foundation.org> wrote:
>=20
> >=20
> > And 2.6.23 was OK?
> >=20
> > Is this problem still present in Linus's current tree?
>=20
> and did you enable the "ignore nice levels" switch in sysfs ondemand
> directory?
>=20

Oh no,
if you mean /sys/devices/system/cpu/cpu0/cpufreq/ondemand/ignore_nice_load
I didn't changed anything, instead I just used the same .config file, reboo=
ted
into the new kernel and ran the test again.

=2D-=20
MfG/Sincerely

Toralf F=F6rster
pgp finger print: 7B1A 07F4 EC82 0F90 D4C2 8936 872A E508 7DB6 9DA3

--nextPart1944123.y5LQddcG0I
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQBHJg17hyrlCH22naMRAo7jAKC5THouicQONQfSsYgO2yfzGDSxzgCcCmGC
2Gci6xEnDUNqd7a5GYHWA/w=
=xJuY
-----END PGP SIGNATURE-----

--nextPart1944123.y5LQddcG0I--
