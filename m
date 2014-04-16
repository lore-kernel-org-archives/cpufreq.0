From: Ben Hutchings <ben@decadent.org.uk>
Subject: Another powernow-k6 bug
Date: Wed, 16 Apr 2014 20:23:26 +0100
Message-ID: <1397676206.5717.7.camel@deadeye.wl.decadent.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jrrwUWj17ssAUUTLnA+V"
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: cpufreq@vger.kernel.org


--=-jrrwUWj17ssAUUTLnA+V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

While looking at your recent powernow-k6 fixes (thanks for those), I
noticed that powernow_k6_cpu_exit() doesn't work properly:

static int powernow_k6_cpu_exit(struct cpufreq_policy *policy)
{
	unsigned int i;
	for (i =3D 0; i < 8; i++) {
		if (i =3D=3D max_multiplier)
			powernow_k6_set_state(i);
	}
	cpufreq_frequency_table_put_attr(policy->cpu);
	return 0;
}

As max_multiplier is the actual multiplier * 10, this will never change
the state.  I'm guessing this should be something like:

	for (i =3D 0; (clock_ratio[i].frequency !=3D CPUFREQ_TABLE_END); i++)
		if (clock_ratio[i].driver_data =3D=3D max_multiplier)

Ben.

--=20
Ben Hutchings
Kids!  Bringing about Armageddon can be dangerous.  Do not attempt it in
your own home. - Terry Pratchett and Neil Gaiman, `Good Omens'

--=-jrrwUWj17ssAUUTLnA+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUAU07Yrue/yOyVhhEJAQopOQ/7BT/fs6gzr4Pt2hb0e1MnP5h2Ogt8LhRe
sIqS2Xy25VM84m+9Er0o//GrixieNlcM0+MYDVasMfUnpSMmCiI2ZZnRTbJAsmrE
BjibTb86nsfxoToMaVEubcgN3TuROEZIBzUnNe7Ws/pXSeScgiZinsAIdCb565UN
wHTQmaRv9JBnd+XC9T2rvJRS0ErGabpHh1kxwHB0y0Ha5fg3x6dq5HKpWWLeSEXD
7L968C3lfjPBTL+Im0UrUb7s6BK6BW19x+sEBGmUcdPo7fhuk7Lts5DS1WaLQ2UH
gQOo5tJ3ErxjtK51t74TSvjgQGA7dG3beYJfF67V7VA2m0oEu+hKBXW2IsAZXw3v
cZpu5HJasYlIFEMP0kj76/E2ESRaJMHKSJME7UDXkuMEo6EDilCaJ/6CELbxTmtj
bhTSgEdI3UJ2PGnUxyX5Eo5ELs4DjpTGbBvcTMAivjyPkecIXDgC7oEx0UUfhdrN
wNDhEY3IelXI2kijGh9yz2pnhMEdiSbuE06foA1jjbrWI6kfxdJhp6svC+Y6tzeo
WFrK6MvaC4sCgejK2/fVC+GgpuqivI5Ml3HFPUjJmxvfbxjTiQErI4wCQYB+iRLZ
OGLJfqJDTRt/tJHHVjijy2Nuxr+qmKsdejFY7/Fe6c9/sp4X/kBxmGRXgQw515mH
2lnkjuxe558=
=UtbT
-----END PGP SIGNATURE-----

--=-jrrwUWj17ssAUUTLnA+V--
