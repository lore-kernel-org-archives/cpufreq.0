From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: Interl XScale pxa cpufreq driver
Date: Mon, 22 Mar 2004 17:20:46 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040322162045.GA22806@dominikbrodowski.de>
References: <120c01c41017$712e04b0$76f02e93@rodin>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1294148684=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <120c01c41017$712e04b0$76f02e93@rodin>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: Young-Jin Kim <youngjk@davinci.snu.ac.kr>
Cc: cpufreq@www.linux.org.uk


--===============1294148684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 22, 2004 at 11:10:34PM +0900, Young-Jin Kim wrote:
> And, I want to know if there is a routine of changing the supply voltage in speedstep-ich for Intel Mobile Pentium 4.

It's done by the chipset, changing the relevant bit in the southbridge is
enough for speedstep-ich.

	Dominik


--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAXxJdZ8MDCHJbN8YRAgfIAJ0fiKLHVXrrNyW5So99RroNFC6+6wCglcqJ
VptVgeXpyazrXBCiyCyhhQI=
=lnty
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--


--===============1294148684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============1294148684==--

