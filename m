From: Arjan van de Ven <arjanv@redhat.com>
Subject: use of exit.text address in .data... missing __dev_exit_p ????
Date: Thu, 17 Jun 2004 15:28:11 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1087478695.2711.30.camel@laptop.fenrus.com>
Reply-To: arjanv@redhat.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0679299565=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Resent-Message-Id: <200406171328.i5HDSB0O006842@laptop.fenrus.com>
Resent-To: cpufreq@www.linux.org.uk
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@wwww.linux.org.uk


--===============0679299565==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-0AM6vjYNGEdjzT50cb2X"


--=-0AM6vjYNGEdjzT50cb2X
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

perl scripts/reference_discarded.pl
Error: ./arch/i386/kernel/cpu/cpufreq/powernow-k8.o .data refers to
0000000000000088 R_X86_64_64       .exit.text
Error: ./arch/x86_64/kernel/cpufreq/powernow-k8.o .data refers to
0000000000000088 R_X86_64_64       .exit.text
Error: ./arch/x86_64/kernel/cpufreq/built-in.o .data refers to
0000000000000088 R_X86_64_64       .exit.text


--=-0AM6vjYNGEdjzT50cb2X
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBA0ZunxULwo51rQBIRAi9ZAJ4o7g/7aM4shptVR4a6QzVsqjRE8ACfbLaT
1joYXW/zS4pGJoTCAMoW0WE=
=jxXU
-----END PGP SIGNATURE-----

--=-0AM6vjYNGEdjzT50cb2X--


--===============0679299565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0679299565==--

