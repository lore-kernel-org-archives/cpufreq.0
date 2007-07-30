From: markus reichelt <ml@mareichelt.de>
Subject: voltage tables
Date: Tue, 31 Jul 2007 01:04:40 +0200
Message-ID: <20070730230439.GB6949@tatooine.rebelbase.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2108305855=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk


--===============2108305855==
Content-type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-disposition: inline


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

just a thought.... with more and more people wondering why cpufreq
doesn't work on their over/underclocked systems, what about offering
the possibility to use static (and thus easily tweakable) voltage
tables instead of/parallel to the ACPI-approach?=20

I don't know about the effort this would take to implement / the
stress it would put on maintenance, but it would be my choice.=20

I'm thinking along the lines of using the ACPI values by default but
providing the means to use custom tables instead, for "experts".

Given the slim chances (yes, I'm brainstorming) of success, what
about documentation -- if one would like to look into the matter and
try to implement the above? Anything apart from reading the source
code?

--=20
left blank, right bald

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFGrm6HLMyTO8Kj/uQRAi9YAKCLOJqEbYZ2IaGQZLbq0A9QOP7mawCfZ2Yu
SeVJRPwRdCQa4uvMtJDmviI=
=LOxT
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--


--===============2108305855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============2108305855==--

