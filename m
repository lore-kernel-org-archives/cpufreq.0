From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: [PATCH] Longhaul - Use information from Longhaul
Date: Mon, 10 Jul 2006 07:45:08 +0200
Message-ID: <44B1E964.3020001@interia.pl>
References: <44B0D22D.2030805@interia.pl> <20060709190027.GB10044@redhat.com>
	<44B1624A.2040000@interia.pl> <20060709210027.GC10044@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060709210027.GC10044@redhat.com>
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

>  > I don't know how to explain this properly in English. I will use examp=
le.
>  > This is from my Nehemiah:
>  > min f =3D 433MHz =3D 6.5 * 66MHz
>  > max f =3D 999MHz =3D 7.5 * 133MHz
>  > but this is Nehemiah "C" and it is working downto 4.0 multiplier.
>  >=20
>  > This is Ezra that I have found in Google (output from Your program):
>  > min f =3D 300MHz =3D 3.0 * 100MHz
>  > max f =3D 864MHz =3D 6.5 * 133MHz
>=20
> But this is only true IFF we scale the FSB, which we don't.
> The above scenarios will not happen for as long as that is true.
>=20

I'm starting to thinking that printing this information to user
isn't good idea. Probably will cause confusion. What are You thinking
about printing min( longhaul_table[].frequency )? This would print=20
motherboard, not processor, limit.

Rafa=B3



----------------------------------------------------------------------
PS. Fajny portal... >>> http://link.interia.pl/f196a
