From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Use information from Longhaul
Date: Sun, 09 Jul 2006 22:08:42 +0200
Message-ID: <44B1624A.2040000@interia.pl>
References: <44B0D22D.2030805@interia.pl> <20060709190027.GB10044@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060709190027.GB10044@redhat.com>
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

[...]=20
>  > Longhaul don't report minimum multiplier. It reports minimum frequency.
>  > So not always minimum multiplier at minimum FSB is really minimum.
>=20
> I don't follow your logic.  How can lowest mult * lowest fsb not be
> lowest frequency ?  The MSRs most definitly only report the multipliers.

I don't know how to explain this properly in English. I will use example.
This is from my Nehemiah:
min f =3D 433MHz =3D 6.5 * 66MHz
max f =3D 999MHz =3D 7.5 * 133MHz
but this is Nehemiah "C" and it is working downto 4.0 multiplier.

This is Ezra that I have found in Google (output from Your program):
min f =3D 300MHz =3D 3.0 * 100MHz
max f =3D 864MHz =3D 6.5 * 133MHz

>=20
>  > This is most important for Nehemiah witch allows FSB 66MHz, 100MHz and=
=20
>  > 133MHz. Ezra seems to support only 100MHz and 133MHz so in this case=20
>  > minimum multiplier at min FSB reported is in fact minimum PLL multipli=
er.
>=20
> Note, that we don't (and won't) do FSB scaling even the hardware in some
> variants of longhaul claim to support it. The reality is that there are
> very few boards out there that can do it, and it's impossible to detect
> at runtime which boards they are.  Given this, all boards should always b=
oot
> up at the fastest FSB, so the FSB we read at startup should remain consta=
nt.

I don't intend to do FSB scaling. I really don't belive that boards that do=
n't
have hardware necesary for voltage scaling are capable of scaling FSB.
And I have removed FSB scaling capability code from my patch. Unfortunatly
I have removed to much and I lost that line.
I'm trying to be more compatible with information from Longhaul MSR. Even i=
f=20
this register is broken for my CPU, using min frequency insteed of min=20
multiplier is fixing this.

>=20
>  > Looks like all VIA CPUs allow to read FSB frequency from EBL_CR_POWERO=
N.
>  > Only some have 66MHz reserved.
>=20
> ISTR there was at least one (Ezra maybe?) that didn't.
>=20

I don't have NDA protected information, but acording to this available to=20
public both Ezra and Ezra-T have bus frequency bits.

>  > More precise speed calculations. This is bad when kernel first reports=
=20
>  > 999MHz and we are saying later that max is 997MHz.
>=20
> I'd rather keep the code readable and lose a tiny bit of accuracy here.
> The tables match the descriptions in the datasheets exactly, which makes
> it easier to review.
>=20
> 		Dave
>=20
>=20

Come on. We are changing only two tables. Function "calc speed" must be cha=
nged
to support FSB anyway.

Rafa=B3


----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
