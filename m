From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: [PATCHES] two more cpufreq updates for cpufreq-bk
Date: Mon, 29 Dec 2003 13:29:09 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031229122909.GA8488@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============16488748107506246=="
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
To: davej@redhat.com, cpufreq@www.linux.org.uk


--===============16488748107506246==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Content-Disposition: inline


--qcHopEYAB45HaUaB
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Dave, can you merge the following two patches on top of the previous patches
sent on December 19th, please? Thanks.

	Dominik

cpufreq-2.6.0-kconfig-doc-fix
	Typo fix in drivers/cpufreq/Kconfig

cpufreq-2.6.0-speedstep-smi-owner
	Missing .owner entry.

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-kconfig-doc-fix"
Content-Transfer-Encoding: quoted-printable

diff -ruN linux-original/drivers/cpufreq/Kconfig linux/drivers/cpufreq/Kcon=
fig
--- linux-original/drivers/cpufreq/Kconfig	2003-12-20 16:23:53.000000000 +0=
100
+++ linux/drivers/cpufreq/Kconfig	2003-12-29 13:04:36.851322136 +0100
@@ -74,7 +74,7 @@
 	help
 	  This enables the /proc/sys/cpu/ sysctl interface for controlling
 	  the CPUFreq,"userspace" governor. This is the same interface
-	  as known from the.4.-kernel patches for CPUFreq, and offers
+	  as known from the 2.4.-kernel patches for CPUFreq, and offers
 	  the same functionality as long as "userspace" is the
 	  selected governor for the specified CPU.
 =09

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-speedstep-smi-owner"
Content-Transfer-Encoding: quoted-printable

Set .owner field of cpufreq_driver in speedstep-smi driver.

 arch/i386/kernel/cpu/cpufreq/speedstep-smi.c |    1 +

diff -ruN linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c linux=
/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c
--- linux-original/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-29 =
13:20:48.655585432 +0100
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2003-12-29 13:20:32.=
851987944 +0100
@@ -306,6 +306,7 @@
 	.target 	=3D speedstep_target,
 	.init		=3D speedstep_cpu_init,
 	.resume		=3D speedstep_resume,
+	.owner		=3D THIS_MODULE,
 };
=20
 /**

--VbJkn9YxBvnuCH5J--

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQE/8B4VZ8MDCHJbN8YRAgWOAJ9dJ0UL1JfpX4ziTHwXy1BuToFi0gCggLrA
3Nml2ZMD9ebn5KQhldZkhEM=
=xTzz
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--


--===============16488748107506246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============16488748107506246==--

