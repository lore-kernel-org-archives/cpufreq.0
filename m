From: Wilfried Klaebe <wk+cpufreq@orion.toppoint.de>
Subject: cpufreq-LINUX-20030828.tar.bz2 and linux-2.4.22
Date: Thu, 28 Aug 2003 15:41:17 +0200
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20030828134117.GA11495@sigbjoernson.orion.toppoint.de>
Reply-To: Wilfried Klaebe <wk-reply@orion.toppoint.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============53326031620776826=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============53326031620776826==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

I got the following errors:

make[2]: Entering directory `/usr/src/kernel/linux-2.4.22/arch/i386/kernel'
make[2]: *** No rule to make target `speedstep-lib.c', needed by
        `/usr/src/kernel/linux-2.4.22/include/linux/modules/speedstep-lib.ver'.
        Stop.
make[2]: Leaving directory `/usr/src/kernel/linux-2.4.22/arch/i386/kernel'
make[1]: *** [_sfdep_arch/i386/kernel] Error 2
make[1]: Leaving directory `/usr/src/kernel/linux-2.4.22'
make: *** [dep-files] Error 2

I then did a

mv arch/i386/kernel/cpufreq/speedstep-ich.c
        arch/i386/kernel/cpufreq/speedstep-lib.[ch] arch/i386/kernel/

and it just worked.

Just wanted to tell...

Regards, Wilfried

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/TgZ96oPe9ZPf8vERAgfXAJ9G13G5bCpmTt/8wBao5gTZFHDU3gCeOKkK
RHgwUS53lXRDLJ9+lbuvWbo=
=Bdck
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--


--===============53326031620776826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============53326031620776826==--

