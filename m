From: Dominik Brodowski <linux@brodo.de>
Subject: [PATCH][BUGFIX] speedstep-smi: fail on failure to aquire "ownership"
Date: Tue, 4 Nov 2003 17:07:28 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031104160728.GA7617@brodo.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============84077044119758559=="
Return-path: <cpufreq-bounces@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: davej@codemonkey.org.uk, cpufreq@www.linux.org.uk


--===============84077044119758559==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Abort if there is a failure in aquiring "ownership" of the SMI speedstep=20
interface.

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-04 =
15:27:33.000000000 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-11-04 16:03:11.=
247987328 +0100
@@ -226,8 +226,10 @@
=20
 	result =3D speedstep_smi_ownership();
=20
-	if (result)
+	if (result) {
 		dprintk(KERN_INFO "cpufreq: fails an aquiring ownership of a SMI interfa=
ce.\n");
+		return -EINVAL;
+	}
=20
 	/* detect low and high frequency */
 	result =3D speedstep_smi_get_freqs(&speedstep_freqs[SPEEDSTEP_LOW].freque=
ncy,

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/p86/Z8MDCHJbN8YRAsXOAJ0U/8453ClNshuUUz8MppInvPLnIQCfQ9yO
66DOYJtBtlXnWaj+L+f8Xbo=
=Jvye
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============84077044119758559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============84077044119758559==--

