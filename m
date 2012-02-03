From: Petr =?utf-8?Q?=C5=A0abata?= <contyk@redhat.com>
Subject: Re: Bug entdeckt
Date: Fri, 3 Feb 2012 11:16:12 +0100
Message-ID: <20120203101612.GB27116@rincewind.brq.redhat.com>
References: <1753471.EGZtfceMdM@elabi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1753471.EGZtfceMdM@elabi>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Alexander Perschbacher <alexander.perschbacher@rub.de>
Cc: cpufreq@vger.kernel.org


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2012 at 10:59:11AM +0100, Alexander Perschbacher wrote:
> Hallo! Ich habe folgenden Fehler entdeckt:
>=20
> Es scheint einen Anzeige-Bug zu geben: Obwohl=20
> "cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq"
> 800000 anzeigt (also innerhalb der Grenzen, die ich in der=20
> cpufreqd.conf setzte), zeigt cpufreq-info best=C3=A4ndig 2,40GHz an.=20
> Auch "cat /proc/cpuinfo" best=C3=A4tigt mir, dass der Prozessor mit=20
> 800MHz l=C3=A4uft.
>=20
> Cpufreq-info scheint hier falsche Daten auszugeben.
>=20
> Mein System: Acer TimelineX 3830TG, Core i5, Treiber ist=20
> acpi_cpufreq  und mein Linux Gentoo.
>=20
>=20
> Liebe Gr=C3=BC=C3=9Fe,

I suggest you resend your email in English if you expect any help.

-P

> --
> To unsubscribe from this list: send the line "unsubscribe cpufreq" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iF4EAREIAAYFAk8rs+sACgkQT+hZYwG3Kb7xewEAuh1IHoCXQNTn450wWcUjaAbU
HkAPPwImdvnpj49hh2QBAM0TrYPI1mR9P/NroKugSkddEnhUEehbRVr0Ly50HN3/
=6g3h
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
