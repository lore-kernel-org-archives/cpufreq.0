From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Disable arbiter
Date: Tue, 08 Aug 2006 22:57:37 +0200
Message-ID: <44D8FAC1.4050007@interia.pl>
References: <44D8C5F4.4050406@interia.pl> <20060808195858.GC17618@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060808195858.GC17618@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-9"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

> The only part about this I don't like is that we now need to add
> code to do similar things on every possible VIA chipset that
> could take a C3, and there's quite a few of them, and until
> we have good coverage...
>=20

Would be nice, but I have datasheet only for PLE133.
Older non VIA chipsets have this port enabled and its address is=20
returned by BIOS as PM2 address, or maybe BIOS is enabling.

Coverage is big enough because mainboards with newer chipsets seems=20
to have new, C3 capable, CPU's on board.

>=20
> We're going to -ENODEV, possibly breaking some setups that it might actua=
lly
> already work on (even if only by chance).
>=20
> 		Dave
>=20

It isn't working for BCR2. Cpufreq is saying that it is, but cpuinfo_cur_fr=
eq=20
returns max f all the time.

Rafa=B3


----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
