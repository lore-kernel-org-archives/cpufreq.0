From: Andrea Ferrari <and_ferrari@virgilio.it>
Subject: Re: Problem with Powernow-k8 - 2.6.13.3
Date: Mon, 10 Oct 2005 19:16:31 +0200
Message-ID: <200510101916.41365.and_ferrari@virgilio.it>
References: <84EA05E2CA77634C82730353CBE3A84303218846@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1817442837=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84303218846@SAUSEXMB1.amd.com>
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
To: cpufreq@lists.linux.org.uk

--===============1817442837==
Content-Type: multipart/signed; boundary="nextPart10459574.NA2pKmYrRA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart10459574.NA2pKmYrRA
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Alle 16:52, luned=EC 10 ottobre 2005, Langsdorf, Mark ha scritto:

> If you're willing to try an experiment, could you copy the
> arch/i386/kernel/cpu/cpufreq/powernow-k8.c file from your
> 2.6.12.4 directory into the same 2.6.13.3 directory?  Then
> recompile and reboot.  If it still doesn't work, it's an ACPI
> or BIOS problem.  If it does work, it's a problem with the
> driver.  Either way, tell me and I'll look into it more.

I try it, but when i recompile 2.6.13.3, i have this error:

arch/i386/kernel/cpu/cpufreq/powernow-k8.c: In function `check_supported_cp=
u':
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:470: error: `CPUID_XMOD_REV_E'=20
undeclared (first use in this function)
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:470: error: (Each undeclared=20
identifier is reported only once
arch/i386/kernel/cpu/cpufreq/powernow-k8.c:470: error: for each function it=
=20
appears in.)
make[3]: *** [arch/i386/kernel/cpu/cpufreq/powernow-k8.o] Error 1
make[2]: *** [arch/i386/kernel/cpu/cpufreq] Error 2
make[1]: *** [arch/i386/kernel/cpu] Error 2
make: *** [arch/i386/kernel] Error 2

:-(

Andrea

=2D-=20

MOgWai46 - ICQ #203981367
GPG Key:
# Keyserver: blackhole.pca.dfn.de
# KeyID: 0687D717


"She puts the weights into my little heart,
And she gets in my room and she takes it apart.
She puts the weights into my little heart,
I said she puts the weights into my little heart."

--nextPart10459574.NA2pKmYrRA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.7 (GNU/Linux)

iD8DBQBDSqH5hIDJNwaH1xcRAhECAKCOOySYdnTZpjt+C93ND3hMs6+jagCfXIsO
mtuWLnSn3Dtn6+x3450Taa0=
=R8Ef
-----END PGP SIGNATURE-----

--nextPart10459574.NA2pKmYrRA--


--===============1817442837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1817442837==--

